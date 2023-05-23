// Copyright 2023 Acme Enterprises
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVME_CVMCU_EVENT_ST_TDEFS_SV__
`define __UVME_CVMCU_EVENT_ST_TDEFS_SV__


// Add enums and structs here
// Ex: typedef bit [(`UVME__ST_ABC_MAX_WIDTH-1):0]  uvme_cvmcu_event_st_abc_b_t; ///< Describe me!
// Ex: /*
//      * Describe me!
//      */
//     typedef enum {
//        UVME__ST_EX_ABC
//     } uvme_cvmcu_event_st_ex_enum;
// Ex: /*
//      * Describe me!
//      */
//     typedef struct {
//        bit [2:0]  abc;
//        logic      xyz;
//     } uvme_cvmcu_event_st_ex_struct;


/**
 * Scoreboard specialization.
 */
typedef uvml_sb_simplex_c #(
   .T_ACT_TRN(uvma_cvmcu_event_mon_trn_c)
) uvme_cvmcu_event_st_sb_simplex_c;


// Forward type declarations
typedef class uvme_cvmcu_event_st_cfg_c  ;
typedef class uvme_cvmcu_event_st_cntxt_c;

/**
 * Empty coverage model.
 */
typedef uvmx_env_cov_model_c #(
   .T_CFG  (uvme_cvmcu_event_st_cfg_c  ),
   .T_CNTXT(uvme_cvmcu_event_st_cntxt_c)
) uvme_cvmcu_event_st_mock_cov_model_c;


`endif // __UVME_CVMCU_EVENT_ST_TDEFS_SV__