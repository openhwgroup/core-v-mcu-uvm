// Copyright 2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMA_ADV_TIMER_B_IF_SV__
`define __UVMA_ADV_TIMER_B_IF_SV__


/**
 * Encapsulates all signals and clocking of Advanced timer counter Block interface.
 * Assertions must be captured within uvma_adv_timer_b_if_chkr.
 * @ingroup uvma_adv_timer_b_pkg
 */
interface uvma_adv_timer_b_if #(
   parameter NUM_BITS  = `UVMA_ADV_TIMER_B_NUM_BITS_MAX, ///< 
   parameter N_EXTSIG  = `UVMA_ADV_TIMER_B_N_EXTSIG_MAX  ///< 
)
(
   input  clk_i   , ///< 
   input  ls_clk_i, ///< 
   input  rstn_i    ///< 
);

   /// @name Control Plane signals
   /// @{
   wire                   cfg_start_i      ; ///< 
   wire                   cfg_stop_i       ; ///< 
   wire                   cfg_rst_i        ; ///< 
   wire                   cfg_update_i     ; ///< 
   wire                   cfg_arm_i        ; ///< 
   wire            [7:0]  cfg_sel_i        ; ///< 
   wire                   cfg_sel_clk_i    ; ///< 
   wire            [2:0]  cfg_mode_i       ; ///< 
   wire            [7:0]  cfg_presc_i      ; ///< 
   wire                   cfg_sawtooth_i   ; ///< 
   wire [(NUM_BITS-1):0]  cfg_cnt_start_i  ; ///< 
   wire [(NUM_BITS-1):0]  cfg_cnt_end_i    ; ///< 
   wire [(NUM_BITS-1):0]  cfg_comp_ch0_i   ; ///< 
   wire            [2:0]  cfg_comp_op_ch0_i; ///< 
   wire [(NUM_BITS-1):0]  cfg_comp_ch1_i   ; ///< 
   wire            [2:0]  cfg_comp_op_ch1_i; ///< 
   wire [(NUM_BITS-1):0]  cfg_comp_ch2_i   ; ///< 
   wire            [2:0]  cfg_comp_op_ch2_i; ///< 
   wire [(NUM_BITS-1):0]  cfg_comp_ch3_i   ; ///< 
   wire            [2:0]  cfg_comp_op_ch3_i; ///< 
   /// @}

   /// @name Data Plane Input signals
   /// @{
   wire [(N_EXTSIG-1):0]  signal_i; ///< 
   /// @}

   /// @name Data Plane Output signals
   /// @{
   wire [(NUM_BITS-1):0]  counter_o; ///< 
   wire            [3:0]  pwm_o    ; ///< 
   wire            [7:0]  status_o ; ///< 
   /// @}


   /**
    * Used by uvma_adv_timer_b_cp_drv_c.
    */
   clocking cp_drv_cb @(posedge clk_i);
      output cfg_start_i, cfg_stop_i, cfg_rst_i, cfg_update_i, cfg_arm_i, cfg_sel_i, cfg_sel_clk_i, cfg_mode_i, cfg_presc_i, cfg_sawtooth_i, cfg_cnt_start_i, cfg_cnt_end_i, cfg_comp_ch0_i, cfg_comp_op_ch0_i, cfg_comp_ch1_i, cfg_comp_op_ch1_i, cfg_comp_ch2_i, cfg_comp_op_ch2_i, cfg_comp_ch3_i, cfg_comp_op_ch3_i;
   endclocking

   /**
    * Used by uvma_adv_timer_b_cp_mon_c.
    */
   clocking cp_mon_cb @(posedge clk_i);
      input cfg_start_i, cfg_stop_i, cfg_rst_i, cfg_update_i, cfg_arm_i, cfg_sel_i, cfg_sel_clk_i, cfg_mode_i, cfg_presc_i, cfg_sawtooth_i, cfg_cnt_start_i, cfg_cnt_end_i, cfg_comp_ch0_i, cfg_comp_op_ch0_i, cfg_comp_ch1_i, cfg_comp_op_ch1_i, cfg_comp_ch2_i, cfg_comp_op_ch2_i, cfg_comp_ch3_i, cfg_comp_op_ch3_i;
   endclocking

   /**
    * Used by uvma_adv_timer_b_dpi_drv_c.
    */
   clocking dpi_drv_cb @(posedge ls_clk_i);
      output signal_i;
   endclocking

   /**
    * Used by uvma_adv_timer_b_dpi_mon_c.
    */
   clocking dpi_mon_cb @(posedge ls_clk_i);
      input signal_i;
   endclocking

   /**
    * Used by uvma_adv_timer_b_dpo_drv_c.
    */
   clocking dpo_drv_cb @(posedge clk_i);
      input counter_o, pwm_o, status_o;
   endclocking

   /**
    * Used by uvma_adv_timer_b_dpo_mon_c.
    */
   clocking dpo_mon_cb @(posedge clk_i);
      input counter_o, pwm_o, status_o;
   endclocking


   /**
    * Used by uvma_adv_timer_b_cp_drv_c.
    */
   modport cp_drv_mp (
      clocking cp_drv_cb,
      input    clk_i,
      input    rstn_i
   );

   /**
    * Used by uvma_adv_timer_b_dpi_drv_c.
    */
   modport dpi_drv_mp (
      clocking dpi_drv_cb,
      input    ls_clk_i,
      input    rstn_i
   );

   /**
    * Used by uvma_adv_timer_b_dpo_drv_c.
    */
   modport dpo_drv_mp (
      clocking dpo_drv_cb,
      input    clk_i,
      input    rstn_i
   );

   /**
    * Used by uvma_adv_timer_b_cp_mon_c.
    */
   modport cp_mon_mp (
      clocking cp_mon_cb,
      input    clk_i,
      input    rstn_i
   );

   /**
    * Used by uvma_adv_timer_b_dpi_mon_c.
    */
   modport dpi_mon_mp (
      clocking dpi_mon_cb,
      input    ls_clk_i,
      input    rstn_i
   );

   /**
    * Used by uvma_adv_timer_b_dpo_mon_c.
    */
   modport dpo_mon_mp (
      clocking dpo_mon_cb,
      input    clk_i,
      input    rstn_i
   );

endinterface : uvma_adv_timer_b_if


`endif // __UVMA_ADV_TIMER_B_IF_SV__