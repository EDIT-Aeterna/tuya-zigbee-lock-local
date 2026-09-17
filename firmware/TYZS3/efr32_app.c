/* TYZS3 candidate adapter. Same measured MG13 USART0 PA0/PA1 115200 8N1
 * as the hardened TYZS5 integration. Reuse that adapter, never upstream logic.
 * Module safety identity is selected by KAGEL_PROFILE; lock policy separately
 * by LOCK_PROFILE_UJCJK46O in the Studio project. */
#include "../TYZS5/efr32_app.c"
