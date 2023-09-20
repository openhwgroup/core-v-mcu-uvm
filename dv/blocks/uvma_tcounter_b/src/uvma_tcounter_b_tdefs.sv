// Copyright 2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMA_TCOUNTER_B_TDEFS_SV__
`define __UVMA_TCOUNTER_B_TDEFS_SV__


// Add enums and structs here
// Ex: typedef bit [(`UVMA_TCOUNTER_B_ABC_MAX_WIDTH-1):0]  uvma_tcounter_b_abc_b_t; ///< Describe me!
// Ex: /*
//      * Describe me!
//      */
//     typedef enum {
//        UVMA_TCOUNTER_B_EX_ABC
//     } uvma_tcounter_b_ex_enum;
// Ex: /*
//      * Describe me!
//      */
//     typedef struct {
//        bit [2:0]  abc;
//        logic      xyz;
//     } uvma_tcounter_b_ex_struct;


/// @name Logic vectors
/// @{
typedef logic [31:0]  uvma_tcounter_b_compare_value_i_l_t; ///< Comparator value logic vector
typedef logic [31:0]  uvma_tcounter_b_counter_value_i_l_t; ///< Counter value to be loaded logic vector
typedef logic [31:0]  uvma_tcounter_b_counter_value_o_l_t; ///< Output counter value logic vector
/// @}

/// @name Bit vectors
/// @{
typedef bit [31:0]  uvma_tcounter_b_compare_value_i_b_t; ///< Comparator value bit vector
typedef bit [31:0]  uvma_tcounter_b_counter_value_i_b_t; ///< Counter value to be loaded bit vector
typedef bit [31:0]  uvma_tcounter_b_counter_value_o_b_t; ///< Output counter value bit vector
/// @}


/// @name Forward Type Declarations
/// @{
typedef class uvma_tcounter_b_cfg_c         ;
typedef class uvma_tcounter_b_cntxt_c       ;
typedef class uvma_tcounter_b_seq_item_c    ;
typedef class uvma_tcounter_b_cp_seq_item_c ;
typedef class uvma_tcounter_b_dpi_seq_item_c;
typedef class uvma_tcounter_b_dpo_seq_item_c;
typedef class uvma_tcounter_b_mon_vseq_c    ;
typedef class uvma_tcounter_b_idle_vseq_c   ;
typedef class uvma_tcounter_b_in_drv_vseq_c ;
typedef class uvma_tcounter_b_out_drv_vseq_c;
/// @}


`endif // __UVMA_TCOUNTER_B_TDEFS_SV__