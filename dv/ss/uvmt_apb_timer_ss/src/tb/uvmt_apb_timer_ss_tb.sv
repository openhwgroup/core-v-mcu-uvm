// Copyright 2023 Acme Enterprises
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMT_APB_TIMER_SS_TB_SV__
`define __UVMT_APB_TIMER_SS_TB_SV__


/**
 * Module encapsulating the APB simple timer unit Sub-System DUT wrapper, agents and clock/reset generating interfaces.
 * @ingroup uvmt_apb_timer_ss_tb
 */
module uvmt_apb_timer_ss_tb;

   import uvm_pkg ::*;
   import uvmx_pkg::*;
   import uvmt_apb_timer_ss_pkg::*;

   /// @name Clock & Reset
   /// @{
   logic  HCLK; ///< Processor clock signal
   logic  ref_clk_i; ///< Reference clock signal
   logic  HRESETn; ///< System reset signal
   uvma_clk_if    sys_clk_if(); ///< Processor clock interface
   uvma_clk_if    ref_clk_if(); ///< Reference clock interface
   uvma_reset_if  sys_reset_if(.clk()); ///< System reset interface
   assign HCLK = sys_clk_if.clk;
   assign ref_clk_i = ref_clk_if.clk;
   assign HRESETn = sys_reset_if.reset_n;
   /// @}

   /// @name APB simple timer unit sub-system
   /// @{
   uvma_apb_if  proc_if(.clk(HCLK), .reset_n(HRESETn)); ///< Processor interface agent interface
   uvme_apb_timer_ss_probe_if  probe_if(.*); ///< Misc. signals interface
   uvmt_apb_timer_ss_dut_wrap  dut_wrap(.*); ///< DUT instance with interface ports
   bind uvmt_apb_timer_ss_dut_wrap : dut_wrap  uvme_apb_timer_ss_chkr chkr(.*); ///< Checker instantiation and binding
   /// @}

   /// @name Blocks
   /// @{
   uvma_tcounter_b_if  counter_lo_b_if(); ///< Counter block 0 agent interface
   uvma_tcounter_b_if  counter_hi_b_if(); ///< Counter block 1 agent interface
   uvma_tprescaler_b_if  prescaler_lo_b_if(); ///< Prescaler block 0 agent interface
   uvma_tprescaler_b_if  prescaler_hi_b_if(); ///< Prescaler block 1 agent interface
   /// @}

   /**
    * Test bench entry point.
    */
   initial begin
      // APB simple timer unit sub-system interfaces
      uvm_config_db#(virtual uvma_apb_if)::set(null, "uvm_test_top.env.proc_agent", "vif", proc_if);
      uvm_config_db#(virtual uvma_clk_if)::set(null, "uvm_test_top.sys_clk_agent", "vif", sys_clk_if);
      uvm_config_db#(virtual uvma_clk_if)::set(null, "uvm_test_top.ref_clk_agent", "vif", ref_clk_if);
      uvm_config_db#(virtual uvma_reset_if)::set(null, "uvm_test_top.sys_reset_agent", "vif", sys_reset_if);
      uvm_config_db#(virtual uvme_apb_timer_ss_probe_if)::set(null, "uvm_test_top.env", "vif", probe_if);
      // Block agent interfaces
      uvm_config_db#(virtual uvma_tcounter_b_if)::set(null, "uvm_test_top.env.counter_lo_b_env.agent", "vif", counter_lo_b_if);
      uvm_config_db#(virtual uvma_tcounter_b_if)::set(null, "uvm_test_top.env.counter_hi_b_env.agent", "vif", counter_hi_b_if);
      uvm_config_db#(virtual uvma_tprescaler_b_if)::set(null, "uvm_test_top.env.prescaler_lo_b_env.agent", "vif", prescaler_lo_b_if);
      uvm_config_db#(virtual uvma_tprescaler_b_if)::set(null, "uvm_test_top.env.prescaler_hi_b_env.agent", "vif", prescaler_hi_b_if);
      // Test entry point
      uvmx_top.run_test();
   end

endmodule : uvmt_apb_timer_ss_tb


`endif // __UVMT_APB_TIMER_SS_TB_SV__