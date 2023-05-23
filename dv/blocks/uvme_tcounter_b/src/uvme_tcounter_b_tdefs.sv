// Copyright 2023 Acme Enterprises
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

// Add enums and structs here
// Ex: typedef bit [(`UVME_TCOUNTER_B_ABC_MAX_WIDTH-1):0]  uvme_tcounter_b_abc_b_t; ///< Describe me!
// Ex: /*
//      * Describe me!
//      */
//     typedef enum {
//        UVME_TCOUNTER_B_EX_ABC
//     } uvme_tcounter_b_ex_enum;
// Ex: /*
//      * Describe me!
//      */
//     typedef struct {
//        bit [2:0]  abc;
//        logic      xyz;
//     } uvme_tcounter_b_ex_struct;


/**
 * Scoreboard specialization for Data Plane Output Monitor Transactions.
 */
typedef uvml_sb_simplex_c #(
   .T_ACT_TRN(uvma_tcounter_b_mon_trn_c)
) uvme_tcounter_b_sb_c;


`endif // __UVME_TCOUNTER_B_TDEFS_SV__