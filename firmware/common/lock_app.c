/* lock_app.c -- see lock_app.h. Portable, no hardware/SDK deps. */
#include "lock_app.h"
#include "kagel_control_gate.h"
#include <string.h>

/* The nicki_ek serial core's uart_write/on_dp_report callbacks carry no user
 * pointer, so they resolve the owning app through this single-instance pointer.
 * Firmware runs exactly one lock_app; host tests use one per test. It is set at
 * init and re-asserted on every entry point below, so it is always current. */
static lock_app_t *g_active_app;

static lock_app_t *app_of(void *user) { return (lock_app_t *)user; }

static uint32_t rd32(const uint8_t *p) {
    return ((uint32_t)p[0] << 24) | ((uint32_t)p[1] << 16) |
           ((uint32_t)p[2] << 8)  |  (uint32_t)p[3];
}

/* ---- serial-core HAL shims ------------------------------------------------ */
static void core_uart_write(const uint8_t *buf, size_t n) {
    lock_app_t *a = g_active_app;
    if (a && a->hal.uart_write) a->hal.uart_write(buf, n, a->hal.user);
}
static void core_on_dp(const tls_dp_t *dp, uint32_t ts) {
    lock_app_t *a = g_active_app;
    if (a && a->hal.zb_ef00_report)
        a->hal.zb_ef00_report(dp->id, dp->type, dp->value, dp->len, ts, a->hal.user);
}
static uint32_t core_gmt(void) {
    lock_app_t *a = g_active_app;
    return (a && a->hal.gmt_now) ? a->hal.gmt_now(a->hal.user) : 0;
}
static void core_on_frame(uint8_t cmd, const uint8_t *data, uint16_t dlen, void *user) {
    lock_app_t *a = app_of(user);
    if (a) a->mcu_seen = true; /* no TX while the serial frame is dispatching */
    if (a && a->hal.on_frame) a->hal.on_frame(cmd, data, dlen, a->hal.user);
}
static void core_on_unhandled(uint8_t cmd, void *user) {
    lock_app_t *a = app_of(user);
    if (a && a->hal.on_unhandled) a->hal.on_unhandled(cmd, a->hal.user);
}
static void core_on_config(uint8_t sub, void *user) {
    lock_app_t *a = app_of(user);
    if (a && a->hal.on_config) a->hal.on_config(sub, a->hal.user);
}
/* TARGET_SRPTWVAK deployment: mainland China, UTC+8, no DST. */
static int32_t core_tz(void) { return g_active_app->profile->timezone_offset_seconds; }

/* ANTI-CLONE REMOVED 2026-07-15 (Nicki): the lock is an OPEN, standard Zigbee
 * device. Kagel flashes the firmware itself, so there is no Kagel-claim gate --
 * the lock works on ANY coordinator (z2m / ZHA / deCONZ). "online" (told to the
 * lock MCU so it completes pairing + streams) now simply means the module is
 * JOINED to a coordinator, reported via the is_joined HAL hook. The claim/auth
 * and FC00 handshake machinery below is now INERT (kept to avoid churn; safe to
 * strip in a follow-up to reclaim flash). */
volatile int g_dbg_force_online;   /* retained (unused) for existing SWD/tooling refs */
static bool core_is_online(void *user) {
    lock_app_t *a = app_of(user);
    if (a && a->hal.is_joined) return a->hal.is_joined(a->hal.user) != 0;
    return true;   /* no join hook (host tests) -> always online */
}

/* ---- writable-DP allowlist -------------------------------------------------
 * From the AUTHORITATIVE per-PID Nicki_EK shadow (2026-07-15, 38 DPs). Hub-side
 * remote control may only push these DPs with these exact types; anything else
 * (read-only DPs like door/battery/unlock events, DPs this PID doesn't have,
 * wrong types) is DROPPED before it reaches the lock MCU. Defense-in-depth on
 * top of the auth gate: even an authed hub session can't poke arbitrary DPs. */
static bool identity_allows_writes(const lock_app_t *a) {
    return a && !a->pid_mismatch &&
        (!a->profile->require_pid_match_for_writes || a->pid_verified);
}
static int validate_control_dp(uint8_t dp, uint8_t type, const uint8_t *v, size_t n) {
    if (!identity_allows_writes(g_active_app) || type != TLS_DP_RAW ||
        !kagel_control_dp_allowed(dp)) return 0;
    /* Face uses the same reviewed structure, permitted only on its profile. */
    if ((dp == 54u || dp == 55u) && v && n && v[0] == 4u &&
        g_active_app->profile->face_credentials) {
        uint8_t copy[8];
        if (n != (dp == 54u ? 7u : 8u)) return 0;
        memcpy(copy, v, n); copy[0] = 3u;
        return dp == 54u ? kagel_validate_dp54(copy,n) : kagel_validate_dp55(copy,n);
    }
    if (dp == 21u) return kagel_validate_dp21(v,n);
    if (dp == 48u) return kagel_validate_dp48(v,n);
    if (dp == 49u) return kagel_validate_dp49(v,n);
    if (dp == 54u) return kagel_validate_dp54(v,n);
    if (dp == 55u) return kagel_validate_dp55(v,n);
    if (dp >= 24u && dp <= 28u) return kagel_validate_temp_password_dp(dp,v,n);
    return 0;
}


/* Small bounded flat-JSON reader for product info. No heap, no NUL assumptions.
 * Unknown string fields are tolerated; malformed/duplicate identity keys fail
 * closed for writes. No observed OTA flag can change the compiled OTA policy. */
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
static void core_product_info(const char *s,size_t n,bool ota) {
    lock_app_t *a=g_active_app;
    size_t i=0, ps=0, pn=0, vs=0, vn=0; bool hasp=false,hasv=false;
    if (!a || !s) return;
    json_space(s,n,&i);
    if (i>=n || s[i++]!='{') goto invalid;
    json_space(s,n,&i);
    if (i<n && s[i]=='}') {i++;goto done;}
    for (;;) {
        size_t ks,kn,bs,bn;
        if (!json_string(s,n,&i,&ks,&kn)) goto invalid;
        json_space(s,n,&i);
        if (i>=n || s[i++]!=':') goto invalid;
        json_space(s,n,&i);
        if (!json_string(s,n,&i,&bs,&bn)) goto invalid;
        if(kn==1 && s[ks]=='p') {if(hasp || !bn)goto invalid;hasp=true;ps=bs;pn=bn;}
        if(kn==1 && s[ks]=='v') {if(hasv)goto invalid;hasv=true;vs=bs;vn=bn;}
        json_space(s,n,&i);
        if(i>=n)goto invalid;
        if(s[i]=='}'){i++;break;}
        if(s[i++]!=',')goto invalid;
        json_space(s,n,&i);
    }
done:
    json_space(s,n,&i); if(i!=n || !hasp)goto invalid;
    a->product_info_seen=true;
    if(hasp) {
        size_t expected=strlen(a->profile->expected_pid);
        if(pn!=expected || memcmp(s+ps,a->profile->expected_pid,pn)!=0) a->pid_mismatch=true;
        size_t copy=pn<sizeof a->observed_pid-1?pn:sizeof a->observed_pid-1;
        memcpy(a->observed_pid,s+ps,copy);a->observed_pid[copy]=0;
    }
    if(hasv) {
        size_t copy=vn<sizeof a->mcu_version-1?vn:sizeof a->mcu_version-1;
        memcpy(a->mcu_version,s+vs,copy);a->mcu_version[copy]=0;
    }
    a->observed_ota=ota;
    a->pid_verified=!a->pid_mismatch;
    if (a->pid_mismatch) {a->tls.pend_active=0; a->tls.pend_len=0;}
    return;
invalid:
    a->pid_mismatch=true;
    a->pid_verified=false;
    a->tls.pend_active=0; a->tls.pend_len=0;
}

void lock_app_init(lock_app_t *a, const lock_app_hal_t *hal) {
    memset(a, 0, sizeof(*a));
    a->hal = *hal;
    a->profile = lock_profile_default();
    g_active_app = a;

    tls_hal_t th;
    memset(&th, 0, sizeof th);
    th.uart_write   = core_uart_write;
    th.gmt_now      = core_gmt;
    th.tz_offset    = core_tz;
    th.on_dp_report = core_on_dp;
    th.on_product_info = core_product_info;
    th.is_online    = core_is_online;
    th.on_frame     = core_on_frame;
    th.on_unhandled = core_on_unhandled;
    th.on_config    = core_on_config;
    th.user         = a;
    tls_init(&a->tls, &th);
    a->tls.quirks = a->profile->quirks;
}

void lock_app_start(lock_app_t *a) {
    g_active_app = a;
    a->product_query_started = true;
    tls_request_product_info(&a->tls);   /* stock module's first move; gate stays closed */
}

void lock_app_uart_rx(lock_app_t *a, const uint8_t *bytes, size_t n) {
    g_active_app = a;
    tls_rx_feed(&a->tls, bytes, n);
    if (a->product_query_started && a->mcu_seen && !a->product_info_seen &&
        !a->product_info_retry_sent) {
        a->product_info_retry_sent = true;
        tls_request_product_info(&a->tls);
    }
}

void lock_app_announce_online(lock_app_t *a) {
    g_active_app = a;
    /* tls_announce_online() reports GW_AND_SERVER unconditionally, so this guard is
     * what stops an unjoined module telling the MCU it is provisioned -- the false
     * "pairing successful" bug. Online == joined to a coordinator. */
    if (core_is_online(a)) tls_announce_online(&a->tls);
}

void lock_app_resync_time(lock_app_t *a) {
    g_active_app = a;
    /* Bounce net-status offline->online so the lock MCU re-runs its post-connect
     * sync -- which includes a fresh 0x24 time request. Used when the module's
     * clock has just been set (e.g. genTime arrived after the MCU already cached
     * an old/zero time): without this the MCU keeps the stale clock until its
     * slow periodic poll, and time-bounded credentials (temp/guest/one-time
     * passwords, remote-unlock validity) stay broken. No-op while offline. */
    if (!core_is_online(a)) return;
    tls_report_net_status(&a->tls, TLS_NET_NO_GW);
    tls_report_net_status(&a->tls, TLS_NET_GW_AND_SERVER);
}

void lock_app_zb_rx(lock_app_t *a, lock_msg_t type, const uint8_t *buf, size_t len) {
    g_active_app = a;
    switch (type) {

    case LOCK_MSG_REMOTE_DP: {
        if (!core_is_online(a)) return;                   /* only when joined */
        if (len < 4) return;
        uint8_t dp_id = buf[0], t = buf[1];
        uint16_t vlen = (uint16_t)((buf[2] << 8) | buf[3]);
        if (4 + (size_t)vlen != len || !validate_control_dp(dp_id,t,buf+4,vlen)) return;
        tls_send_dp(&a->tls, dp_id, (tls_dp_type_t)t, buf + 4, vlen);
        break;
    }

    case LOCK_MSG_CREATE_TEMP_PW: {
        if (!core_is_online(a)) return;                   /* only when joined */
        if (len < 12) return;
        uint16_t pw_id   = (uint16_t)((buf[0] << 8) | buf[1]);
        uint32_t vfrom   = rd32(buf + 2);
        uint32_t vsecs   = rd32(buf + 6);
        uint8_t  onetime = buf[10];
        uint8_t  pwlen   = buf[11];
        if (12 + (size_t)pwlen > len) return;
        lock_app_create_temp_pw(a, pw_id, vfrom, vsecs, onetime, buf + 12, pwlen);
        break;
    }

    default:
        break;   /* retired claim/auth values (1..6) and anything unknown */
    }
}

/* Hub remote control over EF00 (z2m's datapoint converters -> dataRequest 0x00 /
 * sendData 0x04). Payload = seq(2 BE) followed by one or more DP units
 * [dp(1) | type(1) | len(2 BE) | value]. Forward each to the MCU via 0x04, but
 * ONLY when the module is online (joined to a coordinator). */
void lock_app_ef00_rx(lock_app_t *a, uint8_t cmd, const uint8_t *buf, size_t len) {
    g_active_app = a;
    if (cmd != 0x00 && cmd != 0x04) return;
    if (!core_is_online(a)) return;
    if (len < 2) return;
    /* Phase 1: validate the complete EF00 envelope without touching UART state.
     * Stage 2D-R accepts exactly one DP unit; a valid prefix cannot authorize a
     * send when a trailing unit is truncated, forbidden, or otherwise malformed. */
    const uint8_t *p = buf + 2;
    size_t rem = len - 2;
    if (rem < 4) return;
    uint8_t dp = p[0], type = p[1];
    uint16_t vlen = (uint16_t)((p[2] << 8) | p[3]);
    if ((size_t)4 + vlen != rem) return;
    if (!validate_control_dp(dp, type, p + 4, vlen)) return;

    /* Phase 2: exactly one fully validated application command. */
    tls_send_dp(&a->tls, dp, TLS_DP_RAW, p + 4, vlen);
}

int lock_app_create_temp_pw(lock_app_t *a, uint16_t pw_id, uint32_t valid_from,
                            uint32_t valid_secs, uint8_t onetime,
                            const uint8_t *pw, uint8_t pwlen) {
    g_active_app = a;
    if (!core_is_online(a)) return 0;                 /* only when joined */
    if (!identity_allows_writes(a) || !lock_profile_dp_allowed(a->profile,24)) return 0;
    /* Stamp the window against the lock's OWN clock (== the 0x24 time we serve). */
    uint32_t now   = core_gmt();
    uint32_t start = now + valid_from;
    uint32_t end   = start + valid_secs;
    uint8_t  val[27];
    uint16_t n = tls_build_temp_pw(val, pw_id, a->txn, start, end, onetime, pw, pwlen);
    if (!n) return 0;                                 /* pwlen out of range */
    a->txn++;                                         /* matches capture 0000->0001 */
    tls_send_dp(&a->tls, 24, TLS_DP_RAW, val, n);
    return 1;
}

int lock_app_is_online(const lock_app_t *a) {
    return a->hal.is_joined ? (a->hal.is_joined(a->hal.user) != 0) : 1;  /* joined = online */
}
