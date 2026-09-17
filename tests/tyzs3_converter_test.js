'use strict';
const fs=require('fs'), path=require('path'), vm=require('vm'), assert=require('assert');
const source=fs.readFileSync(path.join(__dirname,'../zigbee2mqtt/TYZS3/tuya_ty0a01_tyzs3.js'),'utf8');
const sends=[];
const expose=(name,access)=>{const x={name,access};for(const m of ['withLabel','withDescription','withCategory'])x[m]=()=>x;return x;};
const ctx={Buffer,Map,Set,Date,console,module:{exports:{}},setTimeout:()=>1,clearTimeout:()=>{},require:(name)=>{
 if(name.endsWith('/tuya'))return {fz:{datapoints:{}},sendDataPointRaw:async(entity,dp,value)=>{assert([21,54,55].includes(dp));sends.push({dp,hex:Buffer.from(value).toString('hex')});}};
 if(name.endsWith('/exposes'))return {access:{STATE:1,SET:2,STATE_SET:3},presets:{text:expose,numeric:expose,enum:expose,action:()=>expose('action',1),battery:()=>expose('battery',1)}};
 throw Error(name);
}};
vm.runInNewContext(source,ctx);
const d=ctx.module.exports[0];
assert.strictEqual(JSON.stringify(d.fingerprint),JSON.stringify([{manufacturerName:'Tuya',modelID:'TY0A01-TYZS3'}]));
assert.strictEqual(d.toZigbee.length,2);assert(!d.ota);
assert(d.meta.tuyaDatapoints.every((v)=>!v[2].to));
const allowedKeys=['remote_unlock_password','remote_unlock_execute','credential_enroll_type','credential_enroll_execute','credential_enroll_cancel','credential_delete_type','credential_delete_id','credential_delete_execute'];
assert.deepStrictEqual(Array.from(d.toZigbee.flatMap((v)=>Array.from(v.key))).sort(),allowedKeys.sort());
assert(d.exposes.filter((e)=>e.access===2||e.access===3).every((e)=>allowedKeys.includes(e.name)));
const meta={device:{ieeeAddr:'test-device'},state:{}};
async function set(key,value){const w=d.toZigbee.find((w)=>w.key.includes(key));assert(w,'No writer for '+key);return w.convertSet({},key,value,meta);}
(async()=>{
 await assert.rejects(()=>set('remote_unlock_password','12345'));
 await set('remote_unlock_password','123456');assert.strictEqual(sends.length,0);
 await set('remote_unlock_execute','执行');assert.deepStrictEqual(sends.pop(),{dp:21,hex:'313233343536'});
 await assert.rejects(()=>set('remote_unlock_execute','执行'));assert.strictEqual(sends.length,0);
 for(const [type,id] of [['长期密码',1],['门卡',2],['指纹',3],['人脸',4]]){
   await set('credential_enroll_type',type);assert.strictEqual(sends.length,0);
   await set('credential_enroll_execute','开始');assert.deepStrictEqual(sends.pop(),{dp:54,hex:Buffer.from([id,0,1,0,1,3,231]).toString('hex')});
   await set('credential_enroll_cancel','取消');assert.strictEqual(sends.pop().hex,Buffer.from([id,254,1,0,1,3,231]).toString('hex'));
   await set('credential_delete_type',type);await set('credential_delete_id',17);assert.strictEqual(sends.length,0);
   await set('credential_delete_execute','删除');assert.deepStrictEqual(sends.pop(),{dp:55,hex:Buffer.from([id,0,1,0,1,0,17,1]).toString('hex')});
 }
 await assert.rejects(()=>set('credential_delete_id',0));await assert.rejects(()=>set('credential_delete_id',1000));
 await assert.rejects(()=>set('credential_enroll_type','unknown'));
 const report=d.fromZigbee[2];
 for(const [dp,kind] of [[58,'fingerprint'],[59,'password'],[60,'card'],[93,'face']]){
   const result=report.convert(null,{device:{ieeeAddr:'test'},data:{dpValues:[{dp,data:Buffer.from('010a0302','hex')}]}},null,null,{state:{}});
   assert.strictEqual(result[kind+'_id_list'],'1, 3, 17');assert.strictEqual(result[kind+'_id_count'],3);
 }
 for(const dp of [24,25,26,27,28,39,48,49,68,69,70,200,202,205])assert(!d.meta.tuyaDatapoints.some((v)=>v[0]===dp));
 for(const [dp,kind,hex,list] of [[58,'fingerprint','0104026c','2, 10, 11, 13, 14'],[59,'password','01010280','0, 15'],[60,'card','02100301','12, 16'],[93,'face','0240','14']]){
   for(const value of [hex,Buffer.from(hex,'hex'),Array.from(Buffer.from(hex,'hex')),new Uint8Array(Buffer.from(hex,'hex'))]){
     const result=report.convert(null,{device:{ieeeAddr:'vector-'+dp},data:{dpValues:[{dp,data:value}]}},null,null,{state:{}});
     assert.strictEqual(result[kind+'_id_list'],list);
     assert.strictEqual(result[kind+'_id_count'],list.split(',').length);
   }
   const empty=report.convert(null,{device:{ieeeAddr:'empty-'+dp},data:{dpValues:[{dp,data:Buffer.from('0000','hex')}]}},null,null,{state:{[kind+'_id_list']:list,[kind+'_id_count']:5}});
   assert.strictEqual(empty[kind+'_id_list'],'无');assert.strictEqual(empty[kind+'_id_count'],0);
   for(const bad of ['0001','00000101','01010000','00','zz']){
     const rejected=report.convert(null,{device:{ieeeAddr:'bad-'+dp},data:{dpValues:[{dp,data:bad}]}},null,null,{state:{}});
     assert(rejected[kind+'_id_list'].startsWith('格式异常'));
   }
 }
 // Freeze all structured writers and the rest of the tested converter during promotion.
 const {execFileSync}=require('child_process');
 const old=execFileSync('git',['show','3ba36fe:zigbee2mqtt/TYZS3/tuya_ty0a01_tyzs3_candidate.js'],{cwd:path.join(__dirname,'..'),encoding:'utf8'});
 const normalize=(s)=>s.replace(/\r\n/g,'\n').split('\n').filter((l)=>!l.startsWith('//')&&!l.includes('description:')&&!l.includes('Exact empty-list sentinel')&&!l.includes('b.length === 2 && b[0] === 0 && b[1] === 0')).join('\n');
 assert.strictEqual(normalize(source),normalize(old),'Unexpected behavior change during promotion');
 console.log('TYZS3 v0.1.0: exact fingerprint, empty/captured lists, unchanged DP21/54/55 writers: ALL PASS');
})().catch((e)=>{console.error(e);process.exitCode=1;});
