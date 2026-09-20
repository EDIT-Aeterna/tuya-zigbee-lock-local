#include "lock_app.h"
#include <assert.h>
#include <stdio.h>
#include <string.h>
static unsigned reports;
static void report(uint8_t d,uint8_t t,const uint8_t *v,uint16_t n,uint32_t ts,void *u) {
    (void)t;(void)v;(void)ts;(void)u;assert(d==54 && n==9);reports++;
}
static void feed(lock_app_t *a,uint8_t cmd,const uint8_t *p,size_t n) {
    uint8_t f[128]={0x55,0xAA,3,0,1,0,0,0};uint8_t sum=0;
    assert(n+9<=sizeof f);f[5]=cmd;f[7]=(uint8_t)n;memcpy(f+8,p,n);
    for(size_t i=0;i<n+8;i++)sum=(uint8_t)(sum+f[i]);
    f[n+8]=sum;lock_app_uart_rx(a,f,n+9);
}
int main(void) {
    const lock_product_binding_t *b3=&lock_binding_ujcjk46o,*b5=&lock_binding_srptwvak;
    assert(b3->capability_profile==&TUYA_LOCK_CAP_CORE_V1);
    assert(b5->capability_profile==&TUYA_LOCK_CAP_EXTENDED_V1);
    assert(strcmp(b3->tested_mcu_version,"1.0.0")==0);
    assert(lock_binding_requires_pid_match(b3) && !lock_binding_requires_pid_match(b5));
    assert(!lock_binding_pid_matches(b3,"srptwvak",8));
    for(unsigned d=0;d<=65535;d++) {
        assert(lock_capability_dp_writable(b3->capability_profile,(uint16_t)d)==(d==21||d==54||d==55));
        assert(lock_capability_dp_writable(b5->capability_profile,(uint16_t)d)==
               (d==21||d==54||d==55||(d>=24&&d<=28)||d==48||d==49));
    }
    lock_capability_profile_t no_permissions={"flags-only",UINT64_MAX,NULL,0};
    assert(lock_capability_has(&no_permissions,LOCK_CAP_TEMPORARY_PASSWORDS));
    assert(!lock_capability_dp_writable(&no_permissions,24));
    const uint16_t allowed[]={21};
    lock_capability_profile_t no_flags={"explicit-only",0,allowed,1};
    assert(lock_capability_dp_writable(&no_flags,21));
    assert(!lock_capability_has(&no_flags,LOCK_CAP_TEMPORARY_PASSWORDS));
    assert(!lock_capability_dp_writable(NULL,21));

    /* Same capabilities, different product quirks: real report dispatch. */
    lock_product_binding_t a=*b3,b=*b3;b.name="synthetic-strict";b.pid="synthetic";b.quirks=0;
    assert(a.capability_profile==b.capability_profile);
    assert(lock_binding_has_quirk(&a,LOCK_QUIRK_DP54_STAGE0_DECLARED_7_ACTUAL_9));
    assert(!lock_binding_has_quirk(&b,LOCK_QUIRK_DP54_STAGE0_DECLARED_7_ACTUAL_9));
    lock_app_hal_t h={0};h.zb_ef00_report=report;
    const uint8_t quirk[]={54,0,0,7,1,0,1,0,1,0,14,0,0};
    const lock_product_binding_t *bindings[]={&a,&b};
    for(unsigned i=0;i<2;i++) {
        lock_app_t app;lock_app_init(&app,&h);app.binding=bindings[i];app.tls.quirks=app.binding->quirks;
        reports=0;feed(&app,5,quirk,sizeof quirk);assert(reports==(i==0?1u:0u));
    }
    lock_app_t app;lock_app_init(&app,&h);const lock_product_binding_t *expected=app.binding;
    assert(!app.observation.received && !app.observation.valid);
    char json[80];snprintf(json,sizeof json,"{\"p\":\"%s\",\"v\":\"different\"}",expected->pid);
    for(int form=-1;form<=1;form++) {
        lock_app_init(&app,&h);uint8_t payload[81];size_t n=strlen(json);memcpy(payload,json,n);
        if(form>=0)payload[n++]=(uint8_t)form;
        feed(&app,1,payload,n);
        assert(app.observation.received && app.observation.valid && app.pid_verified);
        assert(app.observation.ota_flag_present==(form>=0));assert(app.observation.ota_capable==(form==1));
        assert(app.binding==expected); /* MCU version remains evidence, not a new gate */
        assert(strcmp(app.observation.mcu_version,"different")==0);
    }
    const char wrong[]="{\"p\":\"unknown\"}";feed(&app,1,(const uint8_t *)wrong,strlen(wrong));
    assert(app.observation.valid && app.pid_mismatch && !app.pid_verified && app.binding==expected);
    const char bad[]="{}";feed(&app,1,(const uint8_t *)bad,strlen(bad));
    assert(app.observation.received && !app.observation.valid && app.pid_mismatch && app.product_info_seen);
    puts("Binding/capability ownership, explicit policy and runtime observation: ALL PASS");
    return 0;
}
