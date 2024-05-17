// Copyright 2024 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMT_APB_TIMER_SS_DUT_WRAP_SV__
`define __UVMT_APB_TIMER_SS_DUT_WRAP_SV__


/**
 * Module wrapper for APB simple timer unit Sub-System DUT.  All ports are SV interfaces.
 * @ingroup uvmt_apb_timer_ss_tb
 */
module uvmt_apb_timer_ss_dut_wrap (
   uvma_apb_if  proc_if, ///< Processor interface agent interface
   uvma_irq_if  irq_events_if, ///< Events IRQ agent interface
   uvma_tcounter_b_if  counter_lo_if, ///< Counter block 0 block interface
   uvma_tcounter_b_if  counter_hi_if, ///< Counter block 1 block interface
   uvma_tprescaler_b_if  prescaler_lo_if, ///< Prescaler block 0 block interface
   uvma_tprescaler_b_if  prescaler_hi_if, ///< Prescaler block 1 block interface
   uvme_apb_timer_ss_probe_if  probe_if, ///< Misc. signals interface
   uvma_clk_if    sys_clk_if, ///< Processor clock interface
   uvma_clk_if    ref_clk_if, ///< Reference clock interface
   uvma_reset_if  sys_reset_if ///< System reset interface
);

   /**
    * APB simple timer unit Sub-System Device Under Test from '/fsoc/core-v-mcu#sim'.
    */
   apb_timer_unit  dut (
      .PSEL(proc_if.psel),
      .PENABLE(proc_if.penable),
      .PWRITE(proc_if.pwrite),
      .PADDR(proc_if.paddr),
      .PWDATA(proc_if.pwdata),
      .PREADY(proc_if.pready),
      .PRDATA(proc_if.prdata),
      .PSLVERR(proc_if.pslverr),
      .stoptimer_i(probe_if.stoptimer_i),
      .event_lo_i(probe_if.event_lo_i),
      .event_hi_i(probe_if.event_hi_i),
      .busy_o(probe_if.busy_o),
      .HCLK(sys_clk_if.clk),
      .ref_clk_i(ref_clk_if.clk),
      .HRESETn(sys_reset_if.reset_n)
   );

   /// @name IRQ Lines
   /// @{
   assign irq_events_if.lines[0] = dut.irq_lo_o;
   assign irq_events_if.lines[1] = dut.irq_hi_o;
   /// @}

   /// @name counter_lo block
   /// @{
   assign counter_lo_if.clk_i = dut.counter_lo_i.clk_i;
   assign counter_lo_if.rst_ni = dut.counter_lo_i.rst_ni;
   assign counter_lo_if.reset_count_i = dut.counter_lo_i.reset_count_i;
   assign counter_lo_if.enable_count_i = dut.counter_lo_i.enable_count_i;
   assign counter_lo_if.compare_value_i = dut.counter_lo_i.compare_value_i;
   assign counter_lo_if.write_counter_i = dut.counter_lo_i.write_counter_i;
   assign counter_lo_if.counter_value_i = dut.counter_lo_i.counter_value_i;
   assign counter_lo_if.counter_value_o = dut.counter_lo_i.counter_value_o;
   assign counter_lo_if.target_reached_o = dut.counter_lo_i.target_reached_o;
   assign counter_lo_if.target_greater_o = dut.counter_lo_i.target_greater_o;
   /// @}

   /// @name counter_hi block
   /// @{
   assign counter_hi_if.clk_i = dut.counter_hi_i.clk_i;
   assign counter_hi_if.rst_ni = dut.counter_hi_i.rst_ni;
   assign counter_hi_if.reset_count_i = dut.counter_hi_i.reset_count_i;
   assign counter_hi_if.enable_count_i = dut.counter_hi_i.enable_count_i;
   assign counter_hi_if.compare_value_i = dut.counter_hi_i.compare_value_i;
   assign counter_hi_if.write_counter_i = dut.counter_hi_i.write_counter_i;
   assign counter_hi_if.counter_value_i = dut.counter_hi_i.counter_value_i;
   assign counter_hi_if.counter_value_o = dut.counter_hi_i.counter_value_o;
   assign counter_hi_if.target_reached_o = dut.counter_hi_i.target_reached_o;
   assign counter_hi_if.target_greater_o = dut.counter_hi_i.target_greater_o;
   /// @}

   /// @name prescaler_lo block
   /// @{
   assign prescaler_lo_if.clk_i = dut.prescaler_lo_i.clk_i;
   assign prescaler_lo_if.rst_ni = dut.prescaler_lo_i.rst_ni;
   assign prescaler_lo_if.reset_count_i = dut.prescaler_lo_i.reset_count_i;
   assign prescaler_lo_if.enable_count_i = dut.prescaler_lo_i.enable_count_i;
   assign prescaler_lo_if.compare_value_i = dut.prescaler_lo_i.compare_value_i;
   assign prescaler_lo_if.write_counter_i = dut.prescaler_lo_i.write_counter_i;
   assign prescaler_lo_if.counter_value_i = dut.prescaler_lo_i.counter_value_i;
   assign prescaler_lo_if.counter_value_o = dut.prescaler_lo_i.counter_value_o;
   assign prescaler_lo_if.target_reached_o = dut.prescaler_lo_i.target_reached_o;
   /// @}

   /// @name prescaler_hi block
   /// @{
   assign prescaler_hi_if.clk_i = dut.prescaler_hi_i.clk_i;
   assign prescaler_hi_if.rst_ni = dut.prescaler_hi_i.rst_ni;
   assign prescaler_hi_if.reset_count_i = dut.prescaler_hi_i.reset_count_i;
   assign prescaler_hi_if.enable_count_i = dut.prescaler_hi_i.enable_count_i;
   assign prescaler_hi_if.compare_value_i = dut.prescaler_hi_i.compare_value_i;
   assign prescaler_hi_if.write_counter_i = dut.prescaler_hi_i.write_counter_i;
   assign prescaler_hi_if.counter_value_i = dut.prescaler_hi_i.counter_value_i;
   assign prescaler_hi_if.counter_value_o = dut.prescaler_hi_i.counter_value_o;
   assign prescaler_hi_if.target_reached_o = dut.prescaler_hi_i.target_reached_o;
   /// @}

endmodule


`endif // __UVMT_APB_TIMER_SS_DUT_WRAP_SV__