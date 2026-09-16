/* Synthetic credentials; structures transcribed from maintainer stock captures. */
#include "lock_app.h"
#include "lock_profile.h"
#include <assert.h>
#include <stdio.h>
#include <string.h>
static uint8_t tx[512]; static size_t txlen; static unsigned writes, reports;
static void uart(const uint8_t *p,size_t n,void *u){(void)u; assert(n<=sizeof tx); memcpy(tx,p,n);txlen=n;writes++;}
static uint32_t now(void *u){(void)u;return 1700000000u;}
static void report(uint8_t d,uint8_t t,const uint8_t *v,uint16_t n,uint32_t ts,void *u){(void)t;(void)v;(void)ts;(void)u;if(d==54)assert(n==9);reports++;}
static void feed(lock_app_t *a,uint8_t cmd,const uint8_t *d,size_t n){
 uint8_t f[256]={0x55,0xAA,3,0x12,0x34,0,0,0};uint8_t sum=0;
 assert(n+9<=sizeof f);f[5]=cmd;f[6]=(uint8_t)(n>>8);f[7]=(uint8_t)n;
 if(n)memcpy(f+8,d,n);
 for(size_t i=0;i<n+8;i++)sum=(uint8_t)(sum+f[i]);
 f[n+8]=sum;lock_app_uart_rx(a,f,n+9);
}
static void info(lock_app_t *a,const char *json){uint8_t b[200];size_t n=strlen(json);assert(n<sizeof b);memcpy(b,json,n);b[n]=1;feed(a,1,b,n+1);}
static void send21(lock_app_t *a){const uint8_t b[]={0,1,21,0,0,6,'1','2','3','4','5','6'};lock_app_ef00_rx(a,0,b,sizeof b);}
int main(void){
 uint8_t ext[27]={0,1,0,2,0,0,0x65,0x53,0xF1,0,0x65,0x53,0xFF,0,2,0x1F,0,0,23,0,0,'1','2','3','4','5','6'};
 tls_temp_password_extended_t parsed;uint8_t rebuilt[27];
 assert(tls_parse_temp_password_extended(ext,27,&parsed));assert(parsed.schedule_type==2 && parsed.weekday_bitmap==0x1F);
 assert(tls_build_temp_password_extended(rebuilt,sizeof rebuilt,&parsed)==27);assert(memcmp(ext,rebuilt,27)==0);
 for(uint8_t d=25;d<=28;d++){if(d==26)continue;tls_temp_password_ref_t r;assert(tls_parse_temp_password_ref(d,ext,6,&r));assert(!tls_parse_temp_password_ref(d,ext,7,&r));}
 uint8_t dp49[]={1,0,1,'1','2','3','4','5','6','7','8',0,1};tls_no_password_unlock_t np;
 assert(tls_parse_no_password_unlock(dp49,sizeof dp49,&np));assert(np.unlock_method==1);assert(!tls_parse_no_password_unlock(dp49,12,&np));
 uint8_t dyn[]={0x65,0x53,0xF1,0,'1','2','3','4','5','6','7','8',1,8,'6','5','4','3','2','1',0,0};tls_dynamic_password_t dr;
 assert(tls_parse_dynamic_password(dyn,sizeof dyn,&dr));dyn[16]=0;assert(!tls_parse_dynamic_password(dyn,sizeof dyn,&dr));dyn[16]='4';
 uint8_t quirk[]={54,0,0,7,1,0,1,0,1,0,14,0,0};tls_dp_t dp[4];size_t count;
 assert(!tls_parse_dps_exact(quirk,sizeof quirk,dp,4,&count));
 assert(tls_parse_report_dps(5,LOCK_QUIRK_DP54_STAGE0_DECLARED_7_ACTUAL_9,quirk,sizeof quirk,dp,4,&count));assert(count==1 && dp[0].len==9);
 assert(!tls_parse_report_dps(5,0,quirk,sizeof quirk,dp,4,&count));assert(!tls_parse_report_dps(0x23,1,quirk,sizeof quirk,dp,4,&count));
 for(unsigned i=0;i<4;i++){uint8_t save=quirk[i];quirk[i]^=1;assert(!tls_parse_report_dps(5,1,quirk,sizeof quirk,dp,4,&count));quirk[i]=save;}
 uint8_t trail[14];memcpy(trail,quirk,13);trail[13]=0;assert(!tls_parse_report_dps(5,1,trail,14,dp,4,&count));
 for(uint8_t t=1;t<=4;t++){uint8_t add[]={t,0,1,0,1,0,14,0,0};uint8_t del[]={t,0,1,0,1,0,14,1,0};tls_credential_add_t ar;tls_credential_delete_t dd;
 assert(tls_parse_credential_add(54,add,7,&ar));assert(tls_parse_credential_add(54,add,9,&ar));assert(tls_parse_credential_delete(55,del,8,&dd));assert(tls_parse_credential_delete(55,del,9,&dd));}
 const lock_profile_t *p5=&lock_profile_srptwvak,*p3=&lock_profile_ujcjk46o;
 assert(lock_profile_dp_allowed(p5,27));assert(!lock_profile_dp_allowed(p3,27));assert(p5->quirks==0 && p3->quirks==1);
 for(unsigned d=0;d<256;d++){bool expected=d==21||d==24||d==25||d==26||d==27||d==28||d==48||d==49||d==54||d==55;
 assert(lock_profile_dp_allowed(p5,(uint8_t)d)==expected);assert(lock_profile_dp_allowed(p3,(uint8_t)d)==(d==21||d==54||d==55));}
 lock_app_t a;lock_app_hal_t h={0};h.uart_write=uart;h.gmt_now=now;h.zb_ef00_report=report;lock_app_init(&a,&h);
 feed(&a,0x24,NULL,0);assert(txlen==17 && tx[0]==0x55 && tx[1]==0xAA && tx[2]==3 && tx[3]==0x12 && tx[4]==0x34);
 uint32_t utc=((uint32_t)tx[8]<<24)|((uint32_t)tx[9]<<16)|((uint32_t)tx[10]<<8)|tx[11];
 uint32_t local=((uint32_t)tx[12]<<24)|((uint32_t)tx[13]<<16)|((uint32_t)tx[14]<<8)|tx[15];assert(utc==1700000000u && local-utc==28800);
 feed(&a,7,dyn,sizeof dyn);assert(tx[8]==2);dyn[16]=0;feed(&a,7,dyn,sizeof dyn);assert(tx[8]==3);
 reports=0;feed(&a,5,quirk,sizeof quirk);assert(reports==(a.profile->quirks?1u:0u));
 writes=0;send21(&a);assert(writes>0);
 lock_app_init(&a,&h);info(&a,"{\"p\":\"wrongpid\",\"v\":\"1.0.0\"}");assert(a.pid_mismatch);assert(strcmp(a.observed_pid,"wrongpid")==0);assert(a.observed_ota);
 writes=0;send21(&a);assert(writes==0);reports=0;const uint8_t battery[]={10,2,0,4,0,0,0,80};feed(&a,5,battery,sizeof battery);assert(reports==1);
 lock_app_init(&a,&h);char json[100];snprintf(json,sizeof json,"{\"p\":\"%s\",\"v\":\"1.0.0\"}",a.profile->expected_pid);info(&a,json);assert(!a.pid_mismatch);assert(strcmp(a.mcu_version,"1.0.0")==0);writes=0;send21(&a);assert(writes>0);
 info(&a,"{\"p\":\"wrongpid\",\"v\":\"1\"}");info(&a,json);assert(a.pid_mismatch); /* mismatch latches until reboot */
 lock_app_init(&a,&h);info(&a,"{broken");assert(a.observed_pid[0]==0);info(&a,"{\"p\":\"this-pid-is-too-long-for-the-bounded-store\"}");assert(a.pid_mismatch);
 puts("T3 common core: ALL PASS");return 0;
}
