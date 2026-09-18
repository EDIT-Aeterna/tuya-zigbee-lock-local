/* Public-path characterization: identical source is run before/after T3-3. */
#include "lock_app.h"
#include "kagel_control_gate.h"
#include <assert.h>
#include <stdio.h>
#include <string.h>
static unsigned writes, reports;
static uint32_t trace = 2166136261u;
static void hash(const uint8_t *p, size_t n) { for(size_t i=0;i<n;i++) trace=(trace^p[i])*16777619u; }
static void uart(const uint8_t *p,size_t n,void *u) {(void)u;writes++;hash(p,n);}
static void report(uint8_t d,uint8_t t,const uint8_t *p,uint16_t n,uint32_t ts,void *u) {
    (void)u;(void)ts;reports++;hash(&d,1);hash(&t,1);hash(p,n);
}
static uint32_t now(void *u) {(void)u;return 1700000000u;}
static void feed(lock_app_t *a,uint8_t cmd,const uint8_t *p,size_t n) {
    uint8_t f[256]={0x55,0xAA,3,0x12,0x34,0,0,0};uint8_t sum=0;
    assert(n+9<=sizeof f);f[5]=cmd;f[6]=(uint8_t)(n>>8);f[7]=(uint8_t)n;
    if(n)memcpy(f+8,p,n);
    for(size_t i=0;i<n+8;i++)sum=(uint8_t)(sum+f[i]);
    f[n+8]=sum;lock_app_uart_rx(a,f,n+9);
}
static void info(lock_app_t *a,const char *json,int trailer) {
    uint8_t b[160];size_t n=strlen(json);assert(n+1<sizeof b);memcpy(b,json,n);
    if(trailer>=0)b[n++]=(uint8_t)trailer;
    feed(a,1,b,n);
}
int main(void) {
#if defined(LOCK_PROFILE_UJCJK46O) && LOCK_PROFILE_UJCJK46O
    const int core=1;const char *pid="ujcjk46o";
#else
    const int core=0;const char *pid="srptwvak";
#endif
    for(unsigned d=0;d<256;d++) {
        bool expected=d==21||d==54||d==55||(!core&&((d>=24&&d<=28)||d==48||d==49));
        assert(kagel_control_dp_allowed((uint8_t)d)==expected);
    }
    lock_app_hal_t h={0};h.uart_write=uart;h.zb_ef00_report=report;h.gmt_now=now;
    char good[80];snprintf(good,sizeof good,"{\"p\":\"%s\",\"v\":\"1.0.0\"}",pid);
    const char *states[]={NULL,good,"{\"p\":\"wrong\"}","{}","{broken",""};
    const uint8_t dp21[]={0,1,21,0,0,6,'1','2','3','4','5','6'};
    const uint8_t battery[]={10,2,0,4,0,0,0,80};
    const uint8_t quirk[]={54,0,0,7,1,0,1,0,1,0,14,0,0};
    for(int form=-1;form<=1;form++)for(size_t state=0;state<6;state++) {
        lock_app_t a;lock_app_init(&a,&h);lock_app_start(&a);
        if(states[state])info(&a,states[state],form);
        writes=0;lock_app_ef00_rx(&a,0,dp21,sizeof dp21);
        assert((writes>0)==(state==1||(!core&&state==0)));
        /* Complete the queued command with the ordinary wake response. */
        feed(&a,0,NULL,0);
        reports=0;feed(&a,5,battery,sizeof battery);assert(reports==1);
        reports=0;feed(&a,5,quirk,sizeof quirk);assert(reports==(unsigned)core);
        feed(&a,0x24,NULL,0);feed(&a,0x24,NULL,0);
        if(state>=2){info(&a,good,form);writes=0;lock_app_ef00_rx(&a,0,dp21,sizeof dp21);assert(writes==0);}
    }
    printf("%s public UART/report trace: %08lx ALL PASS\n",pid,(unsigned long)trace);
    return 0;
}
