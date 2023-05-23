// Copyright 2023 Acme Enterprises
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMA_TPRESCALER_B_TDEFS_SV__
`define __UVMA_TPRESCALER_B_TDEFS_SV__


// Add enums and structs here
// Ex: typedef bit [(`UVMA_TPRESCALER_B_ABC_MAX_WIDTH-1):0]  uvma_tprescaler_b_abc_b_t; ///< Describe me!
// Ex: /*
//      * Describe me!
//      */
//     typedef enum {
//        UVMA_TPRESCALER_B_EX_ABC
//     } uvma_tprescaler_b_ex_enum;
// Ex: /*
//      * Describe me!
//      */
//     typedef struct {
//        bit [2:0]  abc;
//        logic      xyz;
//     } uvma_tprescaler_b_ex_struct;


/// @name Logic vectors
/// @{
typedef logic [31:0]  uvma_tprescaler_b_compare_value_i_l_t; ///<  logic vector
typedef logic [31:0]  uvma_tprescaler_b_counter_value_i_l_t; ///<  logic vector
typedef logic [31:0]  uvma_tprescaler_b_counter_value_o_l_t; ///<  logic vector
/// @}

/// @name Bit vectors
/// @{
typedef bit [31:0]  uvma_tprescaler_b_compare_value_i_b_t; ///<  bit vector
typedef bit [31:0]  uvma_tprescaler_b_counter_value_i_b_t; ///<  bit vector
typedef bit [31:0]  uvma_tprescaler_b_counter_value_o_b_t; ///<  bit vector
/// @}


/// @name Forward Type Declarations
/// @{
typedef class uvma_tprescaler_b_cfg_c         ;
typedef class uvma_tprescaler_b_cntxt_c       ;
typedef class uvma_tprescaler_b_seq_item_c    ;
typedef class uvma_tprescaler_b_cp_seq_item_c ;
typedef class uvma_tprescaler_b_dpi_seq_item_c;
typedef class uvma_tprescaler_b_dpo_seq_item_c;
typedef class uvma_tprescaler_b_mon_vseq_c    ;
typedef class uvma_tprescaler_b_idle_vseq_c   ;
typedef class uvma_tprescaler_b_in_drv_vseq_c ;
typedef class uvma_tprescaler_b_out_drv_vseq_c;
/// @}


/**
 * Empty coverage model.
 * @ingroup uvma_tprescaler_b_comps
 */
typedef uvmx_agent_cov_model_c #(
   .T_CFG     (uvma_tprescaler_b_cfg_c     ),
   .T_CNTXT   (uvma_tprescaler_b_cntxt_c   ),
   .T_SEQ_ITEM(uvma_tprescaler_b_seq_item_c)
) uvma_tprescaler_b_cov_model_c;


`endif // __UVMA_TPRESCALER_B_TDEFS_SV__