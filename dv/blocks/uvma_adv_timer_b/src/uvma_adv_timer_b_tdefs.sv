// Copyright 2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMA_ADV_TIMER_B_TDEFS_SV__
`define __UVMA_ADV_TIMER_B_TDEFS_SV__



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


`endif // __UVMA_ADV_TIMER_B_TDEFS_SV__