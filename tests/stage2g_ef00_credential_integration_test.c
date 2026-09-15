/*
 * Stage 2G reviewer-supplied EF00 + UART report integration test.
 * Do not modify this file to obtain PASS.
 *
 * Final writable controls:
 *   21,24,25,26,27,28,48,49,54,55
 *
 * DP39 forbidden.
 * DP58/59/60 are read-only MCU->hub sync reports.
 */

#include "lock_app.h"
#include <stdint.h>
#include <stdio.h>
#include <string.h>

static uint8_t txbuf[16384];
static size_t txlen;

typedef struct {
    int called;
    uint8_t dp;
    uint8_t type;
    uint16_t len;
    uint8_t value[256];
    uint32_t ts;
} report_t;

static report_t rep;

static void uart_write(const uint8_t *p,size_t n,void *u){
    (void)u;
    if(txlen+n<=sizeof txbuf){memcpy(txbuf+txlen,p,n);txlen+=n;}
}
static uint32_t gmt_now(void *u){(void)u;return 0x6AA14285u;}
static int is_joined(void *u){(void)u;return 1;}

static void zb_report(uint8_t dp,uint8_t type,const uint8_t *v,
                      uint16_t len,uint32_t ts,void *u){
    (void)u;
    rep.called++;
    rep.dp=dp; rep.type=type; rep.len=len; rep.ts=ts;
    if(len<=sizeof rep.value) memcpy(rep.value,v,len);
}

static void init_app(lock_app_t *a){
    lock_app_hal_t h;
    memset(&h,0,sizeof h);
    h.uart_write=uart_write;
    h.gmt_now=gmt_now;
    h.is_joined=is_joined;
    h.zb_ef00_report=zb_report;
    txlen=0; memset(txbuf,0,sizeof txbuf);
    memset(&rep,0,sizeof rep);
    lock_app_init(a,&h);
}

static int fail(const char*n,const char*w){
    fprintf(stderr,"FAIL %-38s %s\n",n,w);return 1;
}

static int no_uart(const char*n,const uint8_t*p,size_t z){
    lock_app_t a; init_app(&a); lock_app_ef00_rx(&a,0x00,p,z);
    if(txlen){
        char m[64]; snprintf(m,sizeof m,"%zu UART bytes",txlen);
        return fail(n,m);
    }
    printf("PASS %-38s no UART\n",n);
    return 0;
}

static int send_one(const char*n,const uint8_t*p,size_t z,
                    uint8_t dp,const uint8_t*v,size_t vn){
    lock_app_t a; init_app(&a); lock_app_ef00_rx(&a,0x00,p,z);

    if(txlen!=48)return fail(n,"expected 3 wake writes");

    const uint8_t ack[]={0x55,0xAA,0x03,0x55,0xAA,0x00,0x00,0x00,0x01};
    lock_app_uart_rx(&a,ack,sizeof ack);

    size_t flen=9+4+vn;
    if(txlen!=48+flen)return fail(n,"expected exactly one app frame");

    const uint8_t *f=txbuf+48;
    if(f[0]!=0x55||f[1]!=0xAA||f[2]!=0x03||f[5]!=0x04)
        return fail(n,"bad UART frame");
    if(f[8]!=dp||f[9]!=0||f[10]!=(uint8_t)(vn>>8)||f[11]!=(uint8_t)vn)
        return fail(n,"bad DP header");
    if(memcmp(f+12,v,vn))
        return fail(n,"value mismatch");

    uint8_t sum=0;
    for(size_t i=0;i<flen-1;i++)sum=(uint8_t)(sum+f[i]);
    if(sum!=f[flen-1])return fail(n,"bad checksum");

    printf("PASS %-38s one DP%u command\n",n,(unsigned)dp);
    return 0;
}


static int legacy_no_uart(const char*n,const uint8_t*p,size_t z){
    lock_app_t a; init_app(&a); lock_app_zb_rx(&a,LOCK_MSG_REMOTE_DP,p,z);
    if(txlen){
        char m[64]; snprintf(m,sizeof m,"%zu UART bytes",txlen);
        return fail(n,m);
    }
    printf("PASS %-38s no UART\n",n);
    return 0;
}

static int legacy_send_one(const char*n,const uint8_t*p,size_t z,
                           uint8_t dp,const uint8_t*v,size_t vn){
    lock_app_t a; init_app(&a); lock_app_zb_rx(&a,LOCK_MSG_REMOTE_DP,p,z);

    if(txlen!=48)return fail(n,"expected 3 wake writes");

    const uint8_t ack[]={0x55,0xAA,0x03,0x55,0xAA,0x00,0x00,0x00,0x01};
    lock_app_uart_rx(&a,ack,sizeof ack);

    size_t flen=9+4+vn;
    if(txlen!=48+flen)return fail(n,"expected exactly one app frame");

    const uint8_t *f=txbuf+48;
    if(f[0]!=0x55||f[1]!=0xAA||f[2]!=0x03||f[5]!=0x04)
        return fail(n,"bad UART frame");
    if(f[8]!=dp||f[9]!=0||f[10]!=(uint8_t)(vn>>8)||f[11]!=(uint8_t)vn)
        return fail(n,"bad DP header");
    if(memcmp(f+12,v,vn))
        return fail(n,"value mismatch");
    printf("PASS %-38s one DP%u command\n",n,(unsigned)dp);
    return 0;
}

static size_t make_uart_report(uint8_t *out,uint16_t seq,uint8_t dp,uint8_t type,
                               const uint8_t *v,uint16_t vn){
    uint16_t dn=(uint16_t)(4+vn);
    size_t flen=9+dn;
    out[0]=0x55;out[1]=0xAA;out[2]=0x03;
    out[3]=(uint8_t)(seq>>8);out[4]=(uint8_t)seq;
    out[5]=0x05;
    out[6]=(uint8_t)(dn>>8);out[7]=(uint8_t)dn;
    out[8]=dp;out[9]=type;
    out[10]=(uint8_t)(vn>>8);out[11]=(uint8_t)vn;
    memcpy(out+12,v,vn);
    uint8_t s=0; for(size_t i=0;i<flen-1;i++)s=(uint8_t)(s+out[i]);
    out[flen-1]=s;
    return flen;
}

static int report_passthrough(const char*n,uint8_t dp,const uint8_t *v,size_t vn){
    lock_app_t a; init_app(&a);
    uint8_t frame[300];
    size_t fn=make_uart_report(frame,0x1234,dp,0,v,(uint16_t)vn);
    lock_app_uart_rx(&a,frame,fn);

    if(rep.called!=1)return fail(n,"expected exactly one EF00 report");
    if(rep.dp!=dp||rep.type!=0||rep.len!=vn)return fail(n,"wrong report metadata");
    if(memcmp(rep.value,v,vn))return fail(n,"wrong report value");

    /* Serial core must ACK valid MCU report with cmd05 data=0x10. */
    if(txlen!=10)return fail(n,"expected cmd05 transfer-ok ACK");
    if(txbuf[0]!=0x55||txbuf[1]!=0xAA||txbuf[5]!=0x05||
       txbuf[6]!=0||txbuf[7]!=1||txbuf[8]!=0x10)
        return fail(n,"bad report ACK");

    printf("PASS %-38s forwarded + ACKed\n",n);
    return 0;
}

int main(void){
    int f=0;

    /* Existing control regression. */
    const uint8_t v21[]={'5','7','5','7','5','7'};
    uint8_t p21[12]={0,1,21,0,0,6};
    memcpy(p21+6,v21,6);
    f+=send_one("DP21 regression",p21,sizeof p21,21,v21,6);

    const uint8_t v49[]={1,0,1,'7','8','7','8','7','8','7','8',0,1};
    uint8_t p49[2+4+sizeof v49]={0,2,49,0,0,sizeof v49};
    memcpy(p49+6,v49,sizeof v49);
    f+=send_one("DP49 regression",p49,sizeof p49,49,v49,sizeof v49);

    /* TARGET DP54 start for all three credential classes. */
    const uint8_t p54v[]={1,0,1,0,1,0x03,0xE7};
    const uint8_t c54v[]={2,0,1,0,1,0x03,0xE7};
    const uint8_t f54v[]={3,0,1,0,1,0x03,0xE7};
    const uint8_t *starts[]={p54v,c54v,f54v};
    const char *snames[]={"DP54 password start","DP54 card start","DP54 fingerprint start"};
    for(size_t i=0;i<3;i++){
        uint8_t p[13]={0,3,54,0,0,7};
        memcpy(p+6,starts[i],7);
        f+=send_one(snames[i],p,sizeof p,54,starts[i],7);
    }

    /* TARGET explicit cancel. */
    const uint8_t cancelv[]={2,0xFE,1,0,1,0x03,0xE7};
    uint8_t pcancel[13]={0,4,54,0,0,7};
    memcpy(pcancel+6,cancelv,7);
    f+=send_one("DP54 explicit cancel",pcancel,sizeof pcancel,54,cancelv,7);

    /* TARGET DP55 single deletes. */
    const uint8_t p55v[]={1,0,1,0,1,0,18,1};
    const uint8_t c55v[]={2,0,1,0,1,0,18,1};
    const uint8_t f55v[]={3,0,1,0,1,0,14,1};
    const uint8_t *dels[]={p55v,c55v,f55v};
    const char *dnames[]={"DP55 password delete","DP55 card delete","DP55 fingerprint delete"};
    for(size_t i=0;i<3;i++){
        uint8_t p[14]={0,5,55,0,0,8};
        memcpy(p+6,dels[i],8);
        f+=send_one(dnames[i],p,sizeof p,55,dels[i],8);
    }

    /* Safety rejects. */
    uint8_t bad54[13]={0,6,54,0,0,7,1,0,0,0,1,0x03,0xE7};
    f+=no_uart("DP54 fixed flag != 01",bad54,sizeof bad54);

    uint8_t delall[14]={0,7,55,0,0,8,1,0,1,0,1,0,18,0};
    f+=no_uart("DP55 delete-all method 00",delall,sizeof delall);

    const uint8_t ref6[]={0x03,0xE7,0,1,0,0};
    uint8_t p39[12]={0,8,39,0,0,6};
    memcpy(p39+6,ref6,6);
    f+=no_uart("DP39 still forbidden",p39,sizeof p39);

    uint8_t p58[10]={0,9,58,0,0,4,2,0x80,3,1};
    f+=no_uart("DP58 not writable",p58,sizeof p58);

    uint8_t compound[sizeof pcancel+3];
    memcpy(compound,pcancel,sizeof pcancel);
    compound[sizeof pcancel]=55;compound[sizeof pcancel+1]=0;compound[sizeof pcancel+2]=0;
    f+=no_uart("valid DP54 + malformed tail",compound,sizeof compound);


    /* Legacy LOCK_MSG_REMOTE_DP path must NOT bypass Stage2G validators. */
    uint8_t legacy54[4+7]={54,0,0,7,2,0,1,0,1,0x03,0xE7};
    f+=legacy_send_one("legacy path valid DP54",legacy54,sizeof legacy54,54,c54v,7);

    uint8_t legacy39[4+6]={39,0,0,6,0x03,0xE7,0,1,0,0};
    f+=legacy_no_uart("legacy path DP39 forbidden",legacy39,sizeof legacy39);

    uint8_t legacy58[4+4]={58,0,0,4,2,0x80,3,1};
    f+=legacy_no_uart("legacy path DP58 not writable",legacy58,sizeof legacy58);

    uint8_t legacy_delall[4+8]={55,0,0,8,1,0,1,0,1,0,18,0};
    f+=legacy_no_uart("legacy path delete-all rejected",legacy_delall,sizeof legacy_delall);

    uint8_t legacy_tail[sizeof legacy54+1];
    memcpy(legacy_tail,legacy54,sizeof legacy54);
    legacy_tail[sizeof legacy54]=0xAA;
    f+=legacy_no_uart("legacy path trailing byte rejected",legacy_tail,sizeof legacy_tail);

    /* MCU->hub reports: report byte0 is preserved opaque. */
    const uint8_t r54[]={3,0xFF,1,0,1,0,18,1,0};
    f+=report_passthrough("DP54 report byte0 stays raw",54,r54,sizeof r54);

    const uint8_t r55[]={2,0,1,0,1,0,18,1,0xFF};
    f+=report_passthrough("DP55 success report",55,r55,sizeof r55);

    const uint8_t r58[]={0x02,0x80,0x03,0x01};
    const uint8_t r59[]={0x02,0x80,0x03,0x01};
    const uint8_t r60[]={0x03,0x04};
    f+=report_passthrough("DP58 sync read-only report",58,r58,sizeof r58);
    f+=report_passthrough("DP59 sync read-only report",59,r59,sizeof r59);
    f+=report_passthrough("DP60 sync read-only report",60,r60,sizeof r60);

    printf("\n%s (%d failure%s)\n",f?"FAILURES":"ALL PASS",f,f==1?"":"s");
    return f?1:0;
}
