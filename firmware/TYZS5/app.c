/***************************************************************************//**
 * @file app.c
 * @brief Callbacks implementation and application specific code.
 *******************************************************************************
 * # License
 * <b>Copyright 2021 Silicon Laboratories Inc. www.silabs.com</b>
 *******************************************************************************
 *
 * The licensor of this software is Silicon Laboratories Inc. Your use of this
 * software is governed by the terms of Silicon Labs Master Software License
 * Agreement (MSLA) available at
 * www.silabs.com/about-us/legal/master-software-license-agreement. This
 * software is distributed to you in Source Code format and is governed by the
 * sections of the MSLA applicable to Source Code.
 *
 ******************************************************************************/

#include "app/framework/include/af.h"
#include "app/framework/plugin/network-steering/network-steering.h"

/* Kagel hub-lock control channel + EF00 remote-DP control (efr32_app.c). */
extern void app_zb_fc00_rx(uint8_t cmd, const uint8_t *payload, uint16_t len);
extern void app_zb_ef00_rx(uint8_t cmd, const uint8_t *payload, uint16_t len);
extern void app_zb_ota_rx(uint8_t cmd, const uint8_t *payload, uint16_t len);   /* OTA cluster 0x0019 responses */
/* Coordinator time (Zigbee Time cluster) -> lock MCU clock (efr32_app.c). */
extern void app_on_gentime(uint32_t zigbee_utc);

#define ZCL_TIME_CLUSTER 0x000A

/** @brief Parse the coordinator's Time-cluster read reply and set the clock.
 * Record layout: attrId(2 LE) | status(1) | [type(1) | value...]. genTime is
 * attr 0x0000, type 0xE2 (UTCTime), 4-byte value LE (secs since 2000). */
volatile uint32_t g_dbg_readresp_rx;
bool emberAfReadAttributesResponseCallback(EmberAfClusterId clusterId,
                                           uint8_t *buffer, uint16_t bufLen)
{
  g_dbg_readresp_rx++;
  if (clusterId == ZCL_TIME_CLUSTER && bufLen >= 8
      && buffer[0] == 0x00 && buffer[1] == 0x00   /* attr 0x0000 */
      && buffer[2] == 0x00) {                      /* status SUCCESS */
    uint32_t z = (uint32_t)buffer[4] | ((uint32_t)buffer[5] << 8)
               | ((uint32_t)buffer[6] << 16) | ((uint32_t)buffer[7] << 24);
    app_on_gentime(z);
  }
  return false;
}

#define KAGEL_CLUSTER_FC00 0xFC00
#define KAGEL_CLUSTER_EF00 0xEF00

/* Debug: count/inspect EVERY incoming ZCL command (read over SWD). Distinguishes
 * "reads never arrive" (stays 0) from "arrive but unanswered" (increments). */
volatile uint32_t g_dbg_zcl_rx;
volatile uint16_t g_dbg_zcl_last_cluster = 0xFFFF;
volatile uint8_t  g_dbg_zcl_last_cmd = 0xFF;
volatile uint8_t  g_dbg_zcl_last_spec = 0xFF;   /* 1=cluster-specific, 0=global (e.g. ReadAttr) */

/* Debug: count AF-originated sends (ZCL responses) + last status/cluster. Tells
 * "AF never responds" (tx stays 0) from "responds but lost/failed" (tx climbs;
 * txstatus 0x00=delivered, else the send failed e.g. no route). */
volatile uint32_t g_dbg_af_tx;
volatile uint8_t  g_dbg_af_txstatus = 0xEE;
volatile uint16_t g_dbg_af_txcluster = 0xFFFF;

/* Confirmed LIVE two-way contact with the coordinator THIS session. Cleared on
 * boot (bss) and on NETWORK_DOWN; set on a successful send, any incoming command,
 * or a fresh steer success. The module reports "online" to its lock MCU ONLY when
 * this is set -> stale NVM creds (silently removed from the coordinator) can no
 * longer produce a false "pairing successful"; the orphan-detector in efr32_app.c
 * then leaves + re-steers so it rejoins cleanly. */
volatile uint8_t g_link_ok;
/* Consecutive failed radio sends to the coordinator. A genuinely-joined lock's
 * sends succeed (resets to 0); a force-removed one's sends fail (climbs). Used to
 * detect a stale binding at RUNTIME (unlike the old blind timer that tore down
 * real joins) -> gate "online" off after a few fails, then leave + re-steer. */
volatile uint32_t g_tx_fail;
bool emberAfMessageSentCallback(EmberOutgoingMessageType type,
                                uint16_t indexOrDestination,
                                EmberApsFrame* apsFrame,
                                uint16_t msgLen,
                                uint8_t* message,
                                EmberStatus status)
{
  (void)type; (void)indexOrDestination; (void)msgLen; (void)message;
  g_dbg_af_tx++;
  g_dbg_af_txstatus = (uint8_t)status;
  if (status == EMBER_SUCCESS) { g_link_ok = 1; g_tx_fail = 0; }  /* delivered = real contact */
  else if (g_tx_fail < 0xFFFF) g_tx_fail++;                       /* no route/no ack = link dead */
  if (apsFrame != NULL) g_dbg_af_txcluster = apsFrame->clusterId;
  return false;
}

/** @brief Route incoming Kagel FC00 control commands to the lock app.
 * Returning true marks the command handled (no default ZCL processing). */
bool emberAfPreCommandReceivedCallback(EmberAfClusterCommand *cmd)
{
  if (cmd != NULL && cmd->apsFrame != NULL) {
    g_dbg_zcl_rx++;
    g_link_ok = 1;   /* incoming from the coordinator = real contact */
    g_dbg_zcl_last_cluster = cmd->apsFrame->clusterId;
    g_dbg_zcl_last_cmd     = cmd->commandId;
    g_dbg_zcl_last_spec    = cmd->clusterSpecific ? 1 : 0;
  }
  if (cmd != NULL && cmd->apsFrame != NULL
      && cmd->apsFrame->clusterId == KAGEL_CLUSTER_FC00
      && cmd->clusterSpecific) {
    uint16_t plen = (cmd->bufLen > cmd->payloadStartIndex)
                    ? (uint16_t)(cmd->bufLen - cmd->payloadStartIndex) : 0;
    app_zb_fc00_rx(cmd->commandId, cmd->buffer + cmd->payloadStartIndex, plen);
    return true;
  }
  /* EF00 remote-DP control from the hub (z2m dataRequest/sendData -> MCU). */
  if (cmd != NULL && cmd->apsFrame != NULL
      && cmd->apsFrame->clusterId == KAGEL_CLUSTER_EF00
      && cmd->clusterSpecific) {
    uint16_t plen = (cmd->bufLen > cmd->payloadStartIndex)
                    ? (uint16_t)(cmd->bufLen - cmd->payloadStartIndex) : 0;
    app_zb_ef00_rx(cmd->commandId, cmd->buffer + cmd->payloadStartIndex, plen);
    return true;
  }
  /* OTA Upgrade cluster (0x0019) responses from z2m (the OTA server) → hand-rolled client. */
  if (cmd != NULL && cmd->apsFrame != NULL
      && cmd->apsFrame->clusterId == 0x0019
      && cmd->clusterSpecific) {
    uint16_t plen = (cmd->bufLen > cmd->payloadStartIndex)
                    ? (uint16_t)(cmd->bufLen - cmd->payloadStartIndex) : 0;
    app_zb_ota_rx(cmd->commandId, cmd->buffer + cmd->payloadStartIndex, plen);
    return true;
  }
  return false;
}

/** @brief Network went down: steer ONLY if the user actually asked us to pair.
 *
 * This used to steer unconditionally on any NETWORK_DOWN. Steering joins whatever
 * coordinator is permitting, using the default TC link key -- so a lock that merely
 * lost its hub would hand itself to whoever opened a permit window next. Pairing is
 * now bounded by the network-configuration window in efr32_app.c (Nicki_EK §6.4 gives no
 * "exit pairing" command, so the module must time itself out); the tick re-arms the
 * steer while that window is open and rejoins its own network otherwise. */
extern volatile uint8_t g_retry_join;
int  kagel_pair_window_open(void);                  /* efr32_app.c */
void kagel_pair_window_close(void);                 /* efr32_app.c */
void emberAfStackStatusCallback(EmberStatus status)
{
  if (status == EMBER_NETWORK_DOWN) g_link_ok = 0;   /* lost/left -> unconfirmed */
  if (status == EMBER_NETWORK_DOWN
      && emberAfNetworkState() == EMBER_NO_NETWORK
      && kagel_pair_window_open()) {
    g_retry_join = 1;                                /* tick starts it, window-gated */
  }
  /* Belt and braces: the network coming UP means we are paired, so pairing mode must
   * be shut regardless of which path got us here (steering success, or a rejoin). */
  if (status == EMBER_NETWORK_UP) {
    g_link_ok = 1;
    kagel_pair_window_close();
  }
}

/** @brief Complete network steering.
 *
 * This callback is fired when the Network Steering plugin is complete.
 *
 * @param status On success this will be set to EMBER_SUCCESS to indicate a
 * network was joined successfully. On failure this will be the status code of
 * the last join or scan attempt. Ver.: always
 *
 * @param totalBeacons The total number of 802.15.4 beacons that were heard,
 * including beacons from different devices with the same PAN ID. Ver.: always
 * @param joinAttempts The number of join attempts that were made to get onto
 * an open Zigbee network. Ver.: always
 *
 * @param finalState The finishing state of the network steering process. From
 * this, one is able to tell on which channel mask and with which key the
 * process was complete. Ver.: always
 */
/* Debug: capture WHY steering finished (read over SWD). */
volatile uint32_t g_dbg_done_count;
volatile uint8_t  g_dbg_done_status = 0xEE;
volatile uint8_t  g_dbg_done_beacons;
volatile uint8_t  g_dbg_done_attempts;
volatile uint8_t  g_dbg_done_final;

void emberAfPluginNetworkSteeringCompleteCallback(EmberStatus status,
                                                  uint8_t totalBeacons,
                                                  uint8_t joinAttempts,
                                                  uint8_t finalState)
{
  g_dbg_done_count++;
  g_dbg_done_status   = (uint8_t)status;   /* 0x00=joined; else why it failed */
  g_dbg_done_beacons  = totalBeacons;      /* 0 = heard no networks at all */
  g_dbg_done_attempts = joinAttempts;
  g_dbg_done_final    = finalState;
  sl_zigbee_app_debug_println("%s network %s: 0x%02X", "Join", "complete", status);

  /* Retry ONLY after a full steer finished without joining. kagel_app_tick picks
   * this up and starts a fresh steer -> never interrupts an in-progress join. */
  if (status != EMBER_SUCCESS) {
    extern volatile uint8_t g_retry_join;
    g_retry_join = 1;
  } else {
    g_link_ok = 1;   /* fresh join = confirmed coordinator contact */
    /* JOINED -> pairing is OVER, right now. Closing network configuration is the
     * JOIN's job, not the timer's: the 180s window exists only to bound a FAILED
     * pairing. Leaving it open after a successful join meant we stayed nominally in
     * pairing mode for up to 3 more minutes, and any link blip in that period would
     * re-steer us onto whichever coordinator was permitting. Success closes it. */
    kagel_pair_window_close();
  }
}

/** @brief
 *
 * Application framework equivalent of ::emberRadioNeedsCalibratingHandler
 */
void emberAfRadioNeedsCalibratingCallback(void)
{
  sl_mac_calibrate_current_channel();
}
