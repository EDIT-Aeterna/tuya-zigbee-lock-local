#include "lock_product_binding.h"
#include <string.h>

const lock_product_binding_t lock_binding_srptwvak = {
    "srptwvak", "srptwvak", "1.0.8", &TUYA_LOCK_CAP_EXTENDED_V1, 0, false, 28800
};
const lock_product_binding_t lock_binding_ujcjk46o = {
    "ujcjk46o", "ujcjk46o", "1.0.0", &TUYA_LOCK_CAP_CORE_V1,
    LOCK_QUIRK_DP54_STAGE0_DECLARED_7_ACTUAL_9, true, 28800
};
const lock_product_binding_t *lock_binding_default(void) {
    /* Retained build selector spelling; selects binding only, not module/identity. */
#if defined(LOCK_PROFILE_UJCJK46O) && LOCK_PROFILE_UJCJK46O
    return &lock_binding_ujcjk46o;
#else
    return &lock_binding_srptwvak;
#endif
}
bool lock_binding_has_quirk(const lock_product_binding_t *b, uint32_t quirk) {
    return b && quirk && (b->quirks & quirk) == quirk;
}
bool lock_binding_requires_pid_match(const lock_product_binding_t *b) {
    return !b || b->require_pid_match_for_writes;
}
bool lock_binding_pid_matches(const lock_product_binding_t *b, const char *pid, size_t n) {
    return b && b->pid && pid && strlen(b->pid)==n && memcmp(pid,b->pid,n)==0;
}

/* Existing strict bounded flat-JSON grammar, extracted without widening it. */
static void json_space(const char *s, size_t n, size_t *i) {
    while (*i<n && (s[*i]==' ' || s[*i]=='\t' || s[*i]=='\r' || s[*i]=='\n')) (*i)++;
}
static bool json_string(const char *s,size_t n,size_t *i,size_t *start,size_t *len) {
    if (*i>=n || s[(*i)++]!='"') return false;
    *start=*i;
    while (*i<n && s[*i]!='"') {
        if ((unsigned char)s[*i]<32 || s[*i]=='\\') return false;
        (*i)++;
    }
    if (*i>=n) return false;
    *len=*i-*start; (*i)++; return true;
}
bool lock_product_observe(lock_product_observation_t *o,const char *s,size_t n,
                          bool present,bool ota) {
    size_t i=0, ps=0, pn=0, vs=0, vn=0; bool hasp=false,hasv=false;
    if (!o || !s) return false;
    o->received=true; o->valid=false;
    o->ota_flag_present=present; o->ota_capable=ota;
    json_space(s,n,&i);
    if (i>=n || s[i++]!='{') return false;
    json_space(s,n,&i);
    if (i<n && s[i]=='}') {i++;goto done;}
    for (;;) {
        size_t ks,kn,bs,bn;
        if (!json_string(s,n,&i,&ks,&kn)) return false;
        json_space(s,n,&i);
        if (i>=n || s[i++]!=':') return false;
        json_space(s,n,&i);
        if (!json_string(s,n,&i,&bs,&bn)) return false;
        if(kn==1 && s[ks]=='p') {if(hasp || !bn)return false;hasp=true;ps=bs;pn=bn;}
        if(kn==1 && s[ks]=='v') {if(hasv)return false;hasv=true;vs=bs;vn=bn;}
        json_space(s,n,&i);
        if(i>=n)return false;
        if(s[i]=='}'){i++;break;}
        if(s[i++]!=',')return false;
        json_space(s,n,&i);
    }
done:
    json_space(s,n,&i); if(i!=n || !hasp)return false;
    size_t copy=pn<sizeof o->pid-1?pn:sizeof o->pid-1;
    o->pid_length=pn;
    memcpy(o->pid,s+ps,copy);o->pid[copy]=0;
    if(hasv) {
        copy=vn<sizeof o->mcu_version-1?vn:sizeof o->mcu_version-1;
        memcpy(o->mcu_version,s+vs,copy);o->mcu_version[copy]=0;
    }
    o->valid=true;
    return true;
}
