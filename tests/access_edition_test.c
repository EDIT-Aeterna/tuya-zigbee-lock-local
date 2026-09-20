#include "lock_app.h"
#include "tzll_access_policy.h"
#include "kagel_profile.h"
#include <assert.h>
#include <stdio.h>
#include <string.h>
static unsigned writes,reports;
static uint32_t trace=2166136261u;
static uint8_t last[256];static size_t lastlen;
static void hash(const uint8_t *p,size_t n){for(size_t i=0;i<n;i++)trace=(trace^p[i])*16777619u;}
static void uart(const uint8_t *p,size_t n,void *u){(void)u;assert(n<=sizeof last);memcpy(last,p,n);lastlen=n;writes++;hash(p,n);}
static uint32_t now(void *u){(void)u;return 1700000000u;}
static void report(uint8_t dp,uint8_t t,const uint8_t *v,uint16_t n,uint32_t ts,void *u){(void)ts;(void)u;reports++;hash(&dp,1);hash(&t,1);hash(v,n);}
static const lock_app_hal_t hal={.uart_write=uart,.gmt_now=now,.zb_ef00_report=report};
static void feed(lock_app_t *a,uint8_t cmd,const uint8_t *p,size_t n){
    uint8_t f[256]={0x55,0xAA,3,0x12,0x34,0,0,0};uint8_t sum=0;assert(n+9<=sizeof f);
    f[5]=cmd;f[6]=(uint8_t)(n>>8);f[7]=(uint8_t)n;if(n)memcpy(f+8,p,n);
    for(size_t i=0;i<n+8;i++)sum=(uint8_t)(sum+f[i]);
    f[n+8]=sum;lock_app_uart_rx(a,f,n+9);
}
static void info(lock_app_t *a,const char *pid,int trailer){
    char json[100];snprintf(json,sizeof json,"{\"p\":\"%s\",\"v\":\"1.0.0\"}",pid);
    size_t n=strlen(json);if(trailer>=0)json[n++]=(char)trailer;feed(a,1,(const uint8_t *)json,n);
}
static void send(lock_app_t *a,uint8_t dp,const uint8_t *v,size_t n,int legacy){
    uint8_t b[100]={0,1,0,0,0,0};assert(n+6<=sizeof b);b[2]=dp;b[5]=(uint8_t)n;memcpy(b+6,v,n);
    if(legacy)lock_app_zb_rx(a,LOCK_MSG_REMOTE_DP,b+2,n+4);else lock_app_ef00_rx(a,0,b,n+6);
}
int main(void){
    const bool monitor=TZLL_ACCESS_EDITION==TZLL_EDITION_MONITOR;
    assert(tzll_access_mode()==(monitor?TZLL_ACCESS_MONITOR:TZLL_ACCESS_CONTROL));
    const lock_product_binding_t *bindings[]={&lock_binding_srptwvak,&lock_binding_ujcjk46o};
    for(unsigned b=0;b<2;b++)for(unsigned dp=0;dp<=65535;dp++){
        const bool allowed=dp==21||dp==54||dp==55||(b==0&&((dp>=24&&dp<=28)||dp==48||dp==49));
        assert(tzll_access_external_dp_writable(bindings[b],(uint16_t)dp)==(!monitor&&allowed));
    }
    assert(!tzll_access_external_dp_writable(NULL,21));
    assert(strlen(KAGEL_BASIC_MODEL)==(monitor?16u:12u));assert(strlen(KAGEL_FW_VERSION)<=32);
    assert((strstr(KAGEL_BASIC_MODEL,"-MON")!=NULL)==monitor);
    /* Normal protocol-only trace must match the other edition for this binding. */
    lock_app_t a;lock_app_init(&a,&hal);lock_app_start(&a);assert(last[5]==1);
    const uint8_t partial[]={0x55,0xAA,3};lock_app_uart_rx(&a,partial,sizeof partial);assert(!a.product_info_retry_sent);
    /* Discard the partial frame by reinitializing, then exercise the retry. */
    lock_app_init(&a,&hal);lock_app_start(&a);feed(&a,0x24,NULL,0);assert(a.product_info_retry_sent && last[5]==1);
    unsigned before=writes;feed(&a,0x24,NULL,0);assert(writes==before+1 && last[5]==0x24 && lastlen==17);
    assert(last[8]==0x65 && last[9]==0x53 && last[10]==0xF1 && last[11]==0);
    uint32_t local=((uint32_t)last[12]<<24)|((uint32_t)last[13]<<16)|((uint32_t)last[14]<<8)|last[15];assert(local-1700000000u==28800u);
    for(int form=-1;form<=1;form++){
        info(&a,a.binding->pid,form);assert(a.pid_verified && a.observation.valid);
        assert(a.observation.ota_flag_present==(form>=0));assert(a.observation.ota_capable==(form==1));
    }
    lock_app_announce_online(&a);assert(last[5]==TLS_CMD_NET_NOTIFY);
    const uint8_t ids[]={1,4,2,0x6C};
    for(unsigned dp=0;dp<256;dp++){
        if(dp!=1&&dp!=2&&dp!=5&&dp!=6&&dp!=8&&dp!=9&&dp!=10&&dp!=58&&dp!=59&&dp!=60&&dp!=93)continue;
        uint8_t unit[8]={(uint8_t)dp,0,0,4,0,0,0,0};memcpy(unit+4,ids,4);
        before=reports;feed(&a,5,unit,sizeof unit);assert(reports==before+1 && last[5]==5 && last[8]==0x10);
    }
    const uint8_t quirk[]={54,0,0,7,1,0,1,0,1,0,14,0,0};
    before=reports;feed(&a,5,quirk,sizeof quirk);assert(reports==before+(a.binding->quirks?1u:0u));
    const uint8_t np[]={1,0,1,'1','2','3','4','5','6','7','8',0,1};tls_no_password_unlock_t parsed;
    assert(tls_parse_no_password_unlock(np,sizeof np,&parsed));assert(!tls_parse_no_password_unlock(np,12,&parsed));
    uint8_t schedule[27]={0,1,0,2,0,0,0x65,0x53,0xF1,0,0x65,0x53,0xFF,0,2,0x1F,0,0,23,0,0,'1','2','3','4','5','6'};
    tls_temp_password_extended_t ext;assert(tls_parse_temp_password_extended(schedule,27,&ext));
    printf("INTERNAL %s %08lx\n",a.binding->pid,(unsigned long)trace);
    const uint8_t pw[]={'1','2','3','4','5','6'};
    const uint8_t add[]={3,0,1,0,1,3,0xE7},del[]={3,0,1,0,1,0,14,1};
    for(unsigned state=0;state<5;state++)for(int legacy=0;legacy<2;legacy++){
        lock_app_init(&a,&hal);
        if(state==1)info(&a,a.binding->pid,-1);
        if(state==2)info(&a,"wrong",-1);
        if(state==3){const uint8_t missing[]={'{','}'};feed(&a,1,missing,sizeof missing);}
        if(state==4){const uint8_t bad[]={'{'};feed(&a,1,bad,sizeof bad);}
        if(state>=2){assert(a.pid_mismatch);info(&a,a.binding->pid,1);assert(a.pid_mismatch&&!a.pid_verified);}
        bool permit=!monitor&&(state==1||(state==0&&!lock_binding_requires_pid_match(a.binding)));
        writes=0;send(&a,21,pw,sizeof pw,legacy);assert((writes>0)==permit);
        if(monitor){
            send(&a,54,add,sizeof add,legacy);send(&a,55,del,sizeof del,legacy);
            for(unsigned dp=0;dp<256;dp++)send(&a,(uint8_t)dp,pw,sizeof pw,legacy);
            assert(!writes&&!a.tls.pend_active);
            assert(!lock_app_create_temp_pw(&a,1,0,3600,0,pw,6));
            uint8_t temp[18]={0,1,0,0,0,0,0,0,0x0E,0x10,0,6,'1','2','3','4','5','6'};
            lock_app_zb_rx(&a,LOCK_MSG_CREATE_TEMP_PW,temp,sizeof temp);assert(!writes&&!a.tls.pend_active);
            feed(&a,0,NULL,0);assert(!a.tls.pend_active); /* never queued an application command */
            const uint8_t battery[]={10,2,0,4,0,0,0,80};
            before=reports;feed(&a,5,battery,sizeof battery);
            assert(reports==before+1 && last[5]==5 && last[8]==0x10);
            feed(&a,0x24,NULL,0);assert(last[5]==0x24 && lastlen==17);
        }
    }
    puts("Access exact/exhaustive policy, external paths, PID and internal traffic: ALL PASS");return 0;
}
