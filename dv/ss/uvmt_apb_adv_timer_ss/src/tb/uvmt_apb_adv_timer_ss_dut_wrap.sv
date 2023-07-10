// Copyright 2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMT_APB_ADV_TIMER_SS_DUT_WRAP_SV__
`define __UVMT_APB_ADV_TIMER_SS_DUT_WRAP_SV__


/**
 * Module wrapper for APB Advanced Timer Sub-System DUT.  All ports are SV interfaces.
 * @ingroup uvmt_apb_adv_timer_ss_tb
 */
module uvmt_apb_adv_timer_ss_dut_wrap (
   uvma_apb_if  proc_if, ///< Processor access agent interface
   uvma_irq_if  irq_events_if, ///< Events IRQ agent interface
   uvme_apb_adv_timer_ss_probe_if  probe_if, ///< Misc. signals interface
   uvma_clk_if    sys_clk_if, ///< System clock interface
   uvma_clk_if    low_speed_clk_if, ///< Low speed clock interface
   uvma_reset_if  sys_reset_if ///< System reset interface
);

   /**
    * APB Advanced Timer Sub-System Device Under Test from '/fsoc/core-v-mcu#sim'.
    */
   apb_adv_timer  dut (
      .PSEL(proc_if.psel),
      .PENABLE(proc_if.penable),
      .PWRITE(proc_if.pwrite),
      .PADDR(proc_if.paddr),
      .PWDATA(proc_if.pwdata),
      .PREADY(proc_if.pready),
      .PRDATA(proc_if.prdata),
      .PSLVERR(proc_if.pslverr),
      .dft_cg_enable_i(probe_if.dft_cg_enable_i),
      .ext_sig_i(probe_if.ext_sig_i),
      .HCLK(sys_clk_if.clk),
      .low_speed_clk_i(low_speed_clk_if.clk),
      .HRESETn(sys_reset_if.reset_n)
   );

   /// @name IRQ Lines
   /// @{
   assign irq_events_if.lines = dut.events_o;
   /// @}

   /// @name adv_timer0 block
   /// @{
   assign adv_timer0_if.clk_i = dut.u_tim0.clk_i;
   assign adv_timer0_if.rstn_i = dut.u_tim0.rstn_i;
   assign adv_timer0_if.cfg_start_i = dut.u_tim0.cfg_start_i;
   assign adv_timer0_if.cfg_stop_i = dut.u_tim0.cfg_stop_i;
   assign adv_timer0_if.cfg_rst_i = dut.u_tim0.cfg_rst_i;
   assign adv_timer0_if.cfg_update_i = dut.u_tim0.cfg_update_i;
   assign adv_timer0_if.cfg_arm_i = dut.u_tim0.cfg_arm_i;
   assign adv_timer0_if.cfg_sel_i = dut.u_tim0.cfg_sel_i;
   assign adv_timer0_if.cfg_sel_clk_i = dut.u_tim0.cfg_sel_clk_i;
   assign adv_timer0_if.cfg_mode_i = dut.u_tim0.cfg_mode_i;
   assign adv_timer0_if.cfg_presc_i = dut.u_tim0.cfg_presc_i;
   assign adv_timer0_if.cfg_sawtooth_i = dut.u_tim0.cfg_sawtooth_i;
   assign adv_timer0_if.cfg_cnt_start_i = dut.u_tim0.cfg_cnt_start_i;
   assign adv_timer0_if.cfg_cnt_end_i = dut.u_tim0.cfg_cnt_end_i;
   assign adv_timer0_if.cfg_comp_ch0_i = dut.u_tim0.cfg_comp_ch0_i;
   assign adv_timer0_if.cfg_comp_op_ch0_i = dut.u_tim0.cfg_comp_op_ch0_i;
   assign adv_timer0_if.cfg_comp_ch1_i = dut.u_tim0.cfg_comp_ch1_i;
   assign adv_timer0_if.cfg_comp_op_ch1_i = dut.u_tim0.cfg_comp_op_ch1_i;
   assign adv_timer0_if.cfg_comp_ch2_i = dut.u_tim0.cfg_comp_ch2_i;
   assign adv_timer0_if.cfg_comp_op_ch2_i = dut.u_tim0.cfg_comp_op_ch2_i;
   assign adv_timer0_if.cfg_comp_ch3_i = dut.u_tim0.cfg_comp_ch3_i;
   assign adv_timer0_if.cfg_comp_op_ch3_i = dut.u_tim0.cfg_comp_op_ch3_i;
   assign adv_timer0_if.signal_i = dut.u_tim0.signal_i;
   assign adv_timer0_if.counter_o = dut.u_tim0.counter_o;
   assign adv_timer0_if.pwm_o = dut.u_tim0.pwm_o;
   assign adv_timer0_if.status_o = dut.u_tim0.status_o;
   /// @}

   /// @name adv_timer1 block
   /// @{
   assign adv_timer1_if.clk_i = dut.u_tim1.clk_i;
   assign adv_timer1_if.rstn_i = dut.u_tim1.rstn_i;
   assign adv_timer1_if.cfg_start_i = dut.u_tim1.cfg_start_i;
   assign adv_timer1_if.cfg_stop_i = dut.u_tim1.cfg_stop_i;
   assign adv_timer1_if.cfg_rst_i = dut.u_tim1.cfg_rst_i;
   assign adv_timer1_if.cfg_update_i = dut.u_tim1.cfg_update_i;
   assign adv_timer1_if.cfg_arm_i = dut.u_tim1.cfg_arm_i;
   assign adv_timer1_if.cfg_sel_i = dut.u_tim1.cfg_sel_i;
   assign adv_timer1_if.cfg_sel_clk_i = dut.u_tim1.cfg_sel_clk_i;
   assign adv_timer1_if.cfg_mode_i = dut.u_tim1.cfg_mode_i;
   assign adv_timer1_if.cfg_presc_i = dut.u_tim1.cfg_presc_i;
   assign adv_timer1_if.cfg_sawtooth_i = dut.u_tim1.cfg_sawtooth_i;
   assign adv_timer1_if.cfg_cnt_start_i = dut.u_tim1.cfg_cnt_start_i;
   assign adv_timer1_if.cfg_cnt_end_i = dut.u_tim1.cfg_cnt_end_i;
   assign adv_timer1_if.cfg_comp_ch0_i = dut.u_tim1.cfg_comp_ch0_i;
   assign adv_timer1_if.cfg_comp_op_ch0_i = dut.u_tim1.cfg_comp_op_ch0_i;
   assign adv_timer1_if.cfg_comp_ch1_i = dut.u_tim1.cfg_comp_ch1_i;
   assign adv_timer1_if.cfg_comp_op_ch1_i = dut.u_tim1.cfg_comp_op_ch1_i;
   assign adv_timer1_if.cfg_comp_ch2_i = dut.u_tim1.cfg_comp_ch2_i;
   assign adv_timer1_if.cfg_comp_op_ch2_i = dut.u_tim1.cfg_comp_op_ch2_i;
   assign adv_timer1_if.cfg_comp_ch3_i = dut.u_tim1.cfg_comp_ch3_i;
   assign adv_timer1_if.cfg_comp_op_ch3_i = dut.u_tim1.cfg_comp_op_ch3_i;
   assign adv_timer1_if.signal_i = dut.u_tim1.signal_i;
   assign adv_timer1_if.counter_o = dut.u_tim1.counter_o;
   assign adv_timer1_if.pwm_o = dut.u_tim1.pwm_o;
   assign adv_timer1_if.status_o = dut.u_tim1.status_o;
   /// @}

   /// @name adv_timer2 block
   /// @{
   assign adv_timer2_if.clk_i = dut.u_tim2.clk_i;
   assign adv_timer2_if.rstn_i = dut.u_tim2.rstn_i;
   assign adv_timer2_if.cfg_start_i = dut.u_tim2.cfg_start_i;
   assign adv_timer2_if.cfg_stop_i = dut.u_tim2.cfg_stop_i;
   assign adv_timer2_if.cfg_rst_i = dut.u_tim2.cfg_rst_i;
   assign adv_timer2_if.cfg_update_i = dut.u_tim2.cfg_update_i;
   assign adv_timer2_if.cfg_arm_i = dut.u_tim2.cfg_arm_i;
   assign adv_timer2_if.cfg_sel_i = dut.u_tim2.cfg_sel_i;
   assign adv_timer2_if.cfg_sel_clk_i = dut.u_tim2.cfg_sel_clk_i;
   assign adv_timer2_if.cfg_mode_i = dut.u_tim2.cfg_mode_i;
   assign adv_timer2_if.cfg_presc_i = dut.u_tim2.cfg_presc_i;
   assign adv_timer2_if.cfg_sawtooth_i = dut.u_tim2.cfg_sawtooth_i;
   assign adv_timer2_if.cfg_cnt_start_i = dut.u_tim2.cfg_cnt_start_i;
   assign adv_timer2_if.cfg_cnt_end_i = dut.u_tim2.cfg_cnt_end_i;
   assign adv_timer2_if.cfg_comp_ch0_i = dut.u_tim2.cfg_comp_ch0_i;
   assign adv_timer2_if.cfg_comp_op_ch0_i = dut.u_tim2.cfg_comp_op_ch0_i;
   assign adv_timer2_if.cfg_comp_ch1_i = dut.u_tim2.cfg_comp_ch1_i;
   assign adv_timer2_if.cfg_comp_op_ch1_i = dut.u_tim2.cfg_comp_op_ch1_i;
   assign adv_timer2_if.cfg_comp_ch2_i = dut.u_tim2.cfg_comp_ch2_i;
   assign adv_timer2_if.cfg_comp_op_ch2_i = dut.u_tim2.cfg_comp_op_ch2_i;
   assign adv_timer2_if.cfg_comp_ch3_i = dut.u_tim2.cfg_comp_ch3_i;
   assign adv_timer2_if.cfg_comp_op_ch3_i = dut.u_tim2.cfg_comp_op_ch3_i;
   assign adv_timer2_if.signal_i = dut.u_tim2.signal_i;
   assign adv_timer2_if.counter_o = dut.u_tim2.counter_o;
   assign adv_timer2_if.pwm_o = dut.u_tim2.pwm_o;
   assign adv_timer2_if.status_o = dut.u_tim2.status_o;
   /// @}

   /// @name adv_timer3 block
   /// @{
   assign adv_timer3_if.clk_i = dut.u_tim3.clk_i;
   assign adv_timer3_if.rstn_i = dut.u_tim3.rstn_i;
   assign adv_timer3_if.cfg_start_i = dut.u_tim3.cfg_start_i;
   assign adv_timer3_if.cfg_stop_i = dut.u_tim3.cfg_stop_i;
   assign adv_timer3_if.cfg_rst_i = dut.u_tim3.cfg_rst_i;
   assign adv_timer3_if.cfg_update_i = dut.u_tim3.cfg_update_i;
   assign adv_timer3_if.cfg_arm_i = dut.u_tim3.cfg_arm_i;
   assign adv_timer3_if.cfg_sel_i = dut.u_tim3.cfg_sel_i;
   assign adv_timer3_if.cfg_sel_clk_i = dut.u_tim3.cfg_sel_clk_i;
   assign adv_timer3_if.cfg_mode_i = dut.u_tim3.cfg_mode_i;
   assign adv_timer3_if.cfg_presc_i = dut.u_tim3.cfg_presc_i;
   assign adv_timer3_if.cfg_sawtooth_i = dut.u_tim3.cfg_sawtooth_i;
   assign adv_timer3_if.cfg_cnt_start_i = dut.u_tim3.cfg_cnt_start_i;
   assign adv_timer3_if.cfg_cnt_end_i = dut.u_tim3.cfg_cnt_end_i;
   assign adv_timer3_if.cfg_comp_ch0_i = dut.u_tim3.cfg_comp_ch0_i;
   assign adv_timer3_if.cfg_comp_op_ch0_i = dut.u_tim3.cfg_comp_op_ch0_i;
   assign adv_timer3_if.cfg_comp_ch1_i = dut.u_tim3.cfg_comp_ch1_i;
   assign adv_timer3_if.cfg_comp_op_ch1_i = dut.u_tim3.cfg_comp_op_ch1_i;
   assign adv_timer3_if.cfg_comp_ch2_i = dut.u_tim3.cfg_comp_ch2_i;
   assign adv_timer3_if.cfg_comp_op_ch2_i = dut.u_tim3.cfg_comp_op_ch2_i;
   assign adv_timer3_if.cfg_comp_ch3_i = dut.u_tim3.cfg_comp_ch3_i;
   assign adv_timer3_if.cfg_comp_op_ch3_i = dut.u_tim3.cfg_comp_op_ch3_i;
   assign adv_timer3_if.signal_i = dut.u_tim3.signal_i;
   assign adv_timer3_if.counter_o = dut.u_tim3.counter_o;
   assign adv_timer3_if.pwm_o = dut.u_tim3.pwm_o;
   assign adv_timer3_if.status_o = dut.u_tim3.status_o;
   /// @}

endmodule : uvmt_apb_adv_timer_ss_dut_wrap


`endif // __UVMT_APB_ADV_TIMER_SS_DUT_WRAP_SV__