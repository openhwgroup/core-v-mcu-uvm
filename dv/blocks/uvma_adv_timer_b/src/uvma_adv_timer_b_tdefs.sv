// Copyright 2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMA_ADV_TIMER_B_TDEFS_SV__
`define __UVMA_ADV_TIMER_B_TDEFS_SV__


// Add enums and structs here
// Ex: typedef bit [(`UVMA_ADV_TIMER_B_ABC_MAX_WIDTH-1):0]  uvma_adv_timer_b_abc_b_t; ///< Describe me!
// Ex: /*
//      * Describe me!
//      */
//     typedef enum {
//        UVMA_ADV_TIMER_B_EX_ABC
//     } uvma_adv_timer_b_ex_enum;
// Ex: /*
//      * Describe me!
//      */
//     typedef struct {
//        bit [2:0]  abc;
//        logic      xyz;
//     } uvma_adv_timer_b_ex_struct;


/// @name Logic vectors
/// @{
typedef logic [7:0]  uvma_adv_timer_b_cfg_sel_i_l_t; ///<  logic vector
typedef logic [2:0]  uvma_adv_timer_b_cfg_mode_i_l_t; ///<  logic vector
typedef logic [7:0]  uvma_adv_timer_b_cfg_presc_i_l_t; ///<  logic vector
typedef logic [(`UVMA_ADV_TIMER_B_NUM_BITS_MAX-1):0]  uvma_adv_timer_b_num_bits_l_t; ///<  logic vector
typedef logic [2:0]  uvma_adv_timer_b_cfg_comp_op_ch0_i_l_t; ///<  logic vector
typedef logic [2:0]  uvma_adv_timer_b_cfg_comp_op_ch1_i_l_t; ///<  logic vector
typedef logic [2:0]  uvma_adv_timer_b_cfg_comp_op_ch2_i_l_t; ///<  logic vector
typedef logic [2:0]  uvma_adv_timer_b_cfg_comp_op_ch3_i_l_t; ///<  logic vector
typedef logic [(`UVMA_ADV_TIMER_B_N_EXTSIG_MAX-1):0]  uvma_adv_timer_b_n_extsig_l_t; ///<  logic vector
typedef logic [3:0]  uvma_adv_timer_b_pwm_o_l_t; ///<  logic vector
typedef logic [7:0]  uvma_adv_timer_b_status_o_l_t; ///<  logic vector
/// @}

/// @name Bit vectors
/// @{
typedef bit [7:0]  uvma_adv_timer_b_cfg_sel_i_b_t; ///<  bit vector
typedef bit [2:0]  uvma_adv_timer_b_cfg_mode_i_b_t; ///<  bit vector
typedef bit [7:0]  uvma_adv_timer_b_cfg_presc_i_b_t; ///<  bit vector
typedef bit [(`UVMA_ADV_TIMER_B_NUM_BITS_MAX-1):0]  uvma_adv_timer_b_num_bits_b_t; ///<  bit vector
typedef bit [2:0]  uvma_adv_timer_b_cfg_comp_op_ch0_i_b_t; ///<  bit vector
typedef bit [2:0]  uvma_adv_timer_b_cfg_comp_op_ch1_i_b_t; ///<  bit vector
typedef bit [2:0]  uvma_adv_timer_b_cfg_comp_op_ch2_i_b_t; ///<  bit vector
typedef bit [2:0]  uvma_adv_timer_b_cfg_comp_op_ch3_i_b_t; ///<  bit vector
typedef bit [(`UVMA_ADV_TIMER_B_N_EXTSIG_MAX-1):0]  uvma_adv_timer_b_n_extsig_b_t; ///<  bit vector
typedef bit [3:0]  uvma_adv_timer_b_pwm_o_b_t; ///<  bit vector
typedef bit [7:0]  uvma_adv_timer_b_status_o_b_t; ///<  bit vector
/// @}


/// @name Forward Type Declarations
/// @{
typedef class uvma_adv_timer_b_cfg_c         ;
typedef class uvma_adv_timer_b_cntxt_c       ;
typedef class uvma_adv_timer_b_seq_item_c    ;
typedef class uvma_adv_timer_b_cp_seq_item_c ;
typedef class uvma_adv_timer_b_dpi_seq_item_c;
typedef class uvma_adv_timer_b_dpo_seq_item_c;
typedef class uvma_adv_timer_b_mon_vseq_c    ;
typedef class uvma_adv_timer_b_idle_vseq_c   ;
typedef class uvma_adv_timer_b_in_drv_vseq_c ;
typedef class uvma_adv_timer_b_out_drv_vseq_c;
/// @}


`endif // __UVMA_ADV_TIMER_B_TDEFS_SV__