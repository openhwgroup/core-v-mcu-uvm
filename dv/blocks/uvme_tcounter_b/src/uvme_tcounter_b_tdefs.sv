// Copyright 2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVME_TCOUNTER_B_TDEFS_SV__
`define __UVME_TCOUNTER_B_TDEFS_SV__


/**
 * FSM state space for DUT.
 */
typedef enum {
   UVME_TCOUNTER_B_FSM_INIT ///< State out of reset
} uvme_tcounter_b_fsm_enum;



/**
 * Scoreboard specialization for Data Plane Output Monitor Transactions.
 */
typedef uvmx_sb_simplex_c #(
   .T_ACT_TRN(uvma_tcounter_b_mon_trn_c)
) uvme_tcounter_b_sb_c;


`endif // __UVME_TCOUNTER_B_TDEFS_SV__