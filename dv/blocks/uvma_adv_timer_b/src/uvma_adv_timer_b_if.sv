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


   /// @name Used by uvma_adv_timer_b_cp_mon_c
   /// @{
   clocking cp_mon_cb @(posedge clk_i);
      input cfg_start_i, cfg_stop_i, cfg_rst_i, cfg_update_i, cfg_arm_i, cfg_sel_i, cfg_sel_clk_i, cfg_mode_i, cfg_presc_i, cfg_sawtooth_i, cfg_cnt_start_i, cfg_cnt_end_i, cfg_comp_ch0_i, cfg_comp_op_ch0_i, cfg_comp_ch1_i, cfg_comp_op_ch1_i, cfg_comp_ch2_i, cfg_comp_op_ch2_i, cfg_comp_ch3_i, cfg_comp_op_ch3_i;
   endclocking
   modport cp_mon_mp (clocking cp_mon_cb);
   /// @}

   /// @name Used by uvma_adv_timer_b_cp_drv_c
   /// @{
   clocking cp_drv_cb @(posedge clk_i);
      output cfg_start_i, cfg_stop_i, cfg_rst_i, cfg_update_i, cfg_arm_i, cfg_sel_i, cfg_sel_clk_i, cfg_mode_i, cfg_presc_i, cfg_sawtooth_i, cfg_cnt_start_i, cfg_cnt_end_i, cfg_comp_ch0_i, cfg_comp_op_ch0_i, cfg_comp_ch1_i, cfg_comp_op_ch1_i, cfg_comp_ch2_i, cfg_comp_op_ch2_i, cfg_comp_ch3_i, cfg_comp_op_ch3_i;
   endclocking
   modport cp_drv_mp (clocking cp_drv_cb);
   /// @}

   /// @name Used by uvma_adv_timer_b_dpi_mon_c
   /// @{
   clocking dpi_mon_cb @(posedge ls_clk_i);
      input signal_i;
   endclocking
   modport dpi_mon_mp (clocking dpi_mon_cb);
   /// @}

   /// @name Used by uvma_adv_timer_b_dpi_drv_c
   /// @{
   clocking dpi_drv_cb @(posedge ls_clk_i);
      output signal_i;
   endclocking
   modport dpi_drv_mp (clocking dpi_drv_cb);
   /// @}

   /// @name Used by uvma_adv_timer_b_dpo_mon_c
   /// @{
   clocking dpo_mon_cb @(posedge clk_i);
      input counter_o, pwm_o, status_o;
   endclocking
   modport dpo_mon_mp (clocking dpo_mon_cb);
   /// @}

   /// @name Used by uvma_adv_timer_b_dpo_drv_c
   /// @{
   clocking dpo_drv_cb @(posedge clk_i);
      input counter_o, pwm_o, status_o;
   endclocking
   modport dpo_drv_mp (clocking dpo_drv_cb);
   /// @}


   /// @name Accessors
   /// @{
   `uvmx_if_reset(rstn_i)
   `uvmx_if_cb(cp_mon_mp , cp_mon_cb )
   `uvmx_if_cb(cp_drv_mp , cp_drv_cb )
   `uvmx_if_cb(dpi_mon_mp, dpi_mon_cb)
   `uvmx_if_cb(dpi_drv_mp, dpi_drv_cb)
   `uvmx_if_cb(dpo_mon_mp, dpo_mon_cb)
   `uvmx_if_cb(dpo_drv_mp, dpo_drv_cb)
   `uvmx_if_signal_out(cfg_start_i, , cp_mon_mp.cp_mon_cb, cp_drv_mp.cp_drv_cb)
   `uvmx_if_signal_out(cfg_stop_i, , cp_mon_mp.cp_mon_cb, cp_drv_mp.cp_drv_cb)
   `uvmx_if_signal_out(cfg_rst_i, , cp_mon_mp.cp_mon_cb, cp_drv_mp.cp_drv_cb)
   `uvmx_if_signal_out(cfg_update_i, , cp_mon_mp.cp_mon_cb, cp_drv_mp.cp_drv_cb)
   `uvmx_if_signal_out(cfg_arm_i, , cp_mon_mp.cp_mon_cb, cp_drv_mp.cp_drv_cb)
   `uvmx_if_signal_out(cfg_sel_i, [7:0], cp_mon_mp.cp_mon_cb, cp_drv_mp.cp_drv_cb)
   `uvmx_if_signal_out(cfg_sel_clk_i, , cp_mon_mp.cp_mon_cb, cp_drv_mp.cp_drv_cb)
   `uvmx_if_signal_out(cfg_mode_i, [2:0], cp_mon_mp.cp_mon_cb, cp_drv_mp.cp_drv_cb)
   `uvmx_if_signal_out(cfg_presc_i, [7:0], cp_mon_mp.cp_mon_cb, cp_drv_mp.cp_drv_cb)
   `uvmx_if_signal_out(cfg_sawtooth_i, , cp_mon_mp.cp_mon_cb, cp_drv_mp.cp_drv_cb)
   `uvmx_if_signal_out(cfg_cnt_start_i, [(NUM_BITS-1):0], cp_mon_mp.cp_mon_cb, cp_drv_mp.cp_drv_cb)
   `uvmx_if_signal_out(cfg_cnt_end_i, [(NUM_BITS-1):0], cp_mon_mp.cp_mon_cb, cp_drv_mp.cp_drv_cb)
   `uvmx_if_signal_out(cfg_comp_ch0_i, [(NUM_BITS-1):0], cp_mon_mp.cp_mon_cb, cp_drv_mp.cp_drv_cb)
   `uvmx_if_signal_out(cfg_comp_op_ch0_i, [2:0], cp_mon_mp.cp_mon_cb, cp_drv_mp.cp_drv_cb)
   `uvmx_if_signal_out(cfg_comp_ch1_i, [(NUM_BITS-1):0], cp_mon_mp.cp_mon_cb, cp_drv_mp.cp_drv_cb)
   `uvmx_if_signal_out(cfg_comp_op_ch1_i, [2:0], cp_mon_mp.cp_mon_cb, cp_drv_mp.cp_drv_cb)
   `uvmx_if_signal_out(cfg_comp_ch2_i, [(NUM_BITS-1):0], cp_mon_mp.cp_mon_cb, cp_drv_mp.cp_drv_cb)
   `uvmx_if_signal_out(cfg_comp_op_ch2_i, [2:0], cp_mon_mp.cp_mon_cb, cp_drv_mp.cp_drv_cb)
   `uvmx_if_signal_out(cfg_comp_ch3_i, [(NUM_BITS-1):0], cp_mon_mp.cp_mon_cb, cp_drv_mp.cp_drv_cb)
   `uvmx_if_signal_out(cfg_comp_op_ch3_i, [2:0], cp_mon_mp.cp_mon_cb, cp_drv_mp.cp_drv_cb)
   `uvmx_if_signal_out(signal_i, [(N_EXTSIG-1):0], dpi_mon_mp.dpi_mon_cb, dpi_drv_mp.dpi_drv_cb)
   `uvmx_if_signal_in(counter_o, [(NUM_BITS-1):0], dpo_mon_mp.dpo_mon_cb)
   `uvmx_if_signal_in(pwm_o, [3:0], dpo_mon_mp.dpo_mon_cb)
   `uvmx_if_signal_in(status_o, [7:0], dpo_mon_mp.dpo_mon_cb)
   /// @}

endinterface : uvma_adv_timer_b_if


`endif // __UVMA_ADV_TIMER_B_IF_SV__