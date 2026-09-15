/*
 * Reviewer-supplied Stage 2F-R EF00 integration test.
 * Do not modify this file to obtain PASS.
 *
 * Allowed controls:
 * 21,24,25,26,27,28,48,49
 *
 * DP39 is deliberately forbidden.
 */

#include "lock_app.h"
#include <stdint.h>
#include <stdio.h>
#include <string.h>

static uint8_t txbuf[8192];
static size_t txlen;

static void uart_write(const uint8_t *p,size_t n,void *u){
    (void)u;
    if(txlen+n<=sizeof txbuf){memcpy(txbuf+txlen,p,n);txlen+=n;}
}
static uint32_t gmt_now(void *u){(void)u;return 0x6AA14285u;}
static int is_joined(void *u){(void)u;return 1;}

static void init_app(lock_app_t *a){
    lock_app_hal_t h;
    memset(&h,0,sizeof h);
    h.uart_write=uart_write;
    h.gmt_now=gmt_now;
    h.is_joined=is_joined;
    txlen=0;
    memset(txbuf,0,sizeof txbuf);
    lock_app_init(a,&h);
}
static int fail(const char*n,const char*w){
    fprintf(stderr,"FAIL %-34s %s\n",n,w);return 1;
}

static int no_uart(const char*n,const uint8_t*p,size_t z){
    lock_app_t a;
    init_app(&a);
    lock_app_ef00_rx(&a,0x00,p,z);
    if(txlen){
        char m[64];
        snprintf(m,sizeof m,"%zu UART bytes",txlen);
        return fail(n,m);
    }
    printf("PASS %-34s no UART\n",n);
    return 0;
}

static int send_one(const char*n,const uint8_t*p,size_t z,
                    uint8_t dp,const uint8_t*v,size_t vn){
    lock_app_t a;
    init_app(&a);
    lock_app_ef00_rx(&a,0x00,p,z);

    if(txlen!=48)return fail(n,"expected 3 wake writes");

    const uint8_t ack[]={0x55,0xAA,0x03,0x55,0xAA,0x00,0x00,0x00,0x01};
    lock_app_uart_rx(&a,ack,sizeof ack);

    size_t flen=9+4+vn;
    if(txlen!=48+flen)return fail(n,"expected one application frame");

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

    printf("PASS %-34s one DP%u command\n",n,(unsigned)dp);
    return 0;
}

int main(void){
    int f=0;

    /* TARGET DP24 one-time ID998 / 017817 */
    const uint8_t v24[]={
      0x03,0xE6,0x00,0x01,0x00,0x00,
      0x6A,0xA3,0x6E,0x1E,0x6A,0xA4,0xBF,0x9E,
      0,0,0,0,0,0,1,'0','1','7','8','1','7'};
    uint8_t p24[2+4+sizeof v24]={0,1,24,0,0,sizeof v24};
    memcpy(p24+6,v24,sizeof v24);
    f+=send_one("target DP24 create",p24,sizeof p24,24,v24,sizeof v24);

    /* TARGET DP26 modify ID999 / 656965 */
    const uint8_t v26[]={
      0x03,0xE7,0x00,0x01,0x00,0x00,
      0x6A,0xA3,0x6B,0xFA,0x6A,0xA6,0x0E,0xFC,
      0,0,0,0,0,0,0,'6','5','6','9','6','5'};
    uint8_t p26[2+4+sizeof v26]={0,2,26,0,0,sizeof v26};
    memcpy(p26+6,v26,sizeof v26);
    f+=send_one("target DP26 modify",p26,sizeof p26,26,v26,sizeof v26);

    /* TARGET verified reference6: delete/freeze/unfreeze ID999 */
    const uint8_t ref6[]={0x03,0xE7,0x00,0x01,0x00,0x00};
    const uint8_t refs[]={25,27,28};
    for(size_t i=0;i<sizeof refs;i++){
        uint8_t p[12]={0,3,0,0,0,6};
        p[2]=refs[i];
        memcpy(p+6,ref6,6);
        char n[24];
        snprintf(n,sizeof n,"target DP%u",(unsigned)refs[i]);
        f+=send_one(n,p,sizeof p,refs[i],ref6,6);
    }

    /* DP39 remains disabled */
    uint8_t p39[12]={0,4,39,0,0,6};
    memcpy(p39+6,ref6,6);
    f+=no_uart("DP39 remains forbidden",p39,sizeof p39);

    /* DP54 still forbidden */
    const uint8_t p54[]={0,5,54,0,0,1,0};
    f+=no_uart("DP54 remains forbidden",p54,sizeof p54);

    /* Old generic 21-byte DP26 must be rejected */
    const uint8_t old26v[]={
      0x03,0xE7,0x00,0x01,0x00,0x00,
      0x6A,0xA3,0x6B,0xFA,0x6A,0xA6,0x0E,0xFC,
      0,'6','5','6','9','6','5'};
    uint8_t old26[2+4+sizeof old26v]={0,6,26,0,0,sizeof old26v};
    memcpy(old26+6,old26v,sizeof old26v);
    f+=no_uart("old 21-byte DP26 rejected",old26,sizeof old26);

    /* Atomic malformed tail */
    uint8_t compound[sizeof p24+3];
    memcpy(compound,p24,sizeof p24);
    compound[sizeof p24]=55;
    compound[sizeof p24+1]=0;
    compound[sizeof p24+2]=0;
    f+=no_uart("DP24 + malformed tail",compound,sizeof compound);

    printf("\n%s (%d failure%s)\n",
           f?"FAILURES":"ALL PASS",f,f==1?"":"s");
    return f?1:0;
}
