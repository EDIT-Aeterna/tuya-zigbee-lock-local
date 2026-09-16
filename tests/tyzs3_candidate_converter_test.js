'use strict';
const fs=require('fs'), path=require('path'), vm=require('vm'), assert=require('assert');
const source=fs.readFileSync(path.join(__dirname,'../zigbee2mqtt/TYZS3/tuya_ty0a01_tyzs3_candidate.js'),'utf8');
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
 console.log('TYZS3 diagnostic converter: fingerprint, report lists, guarded DP21/54/55, no other writers: ALL PASS');
})().catch((e)=>{console.error(e);process.exitCode=1;});
