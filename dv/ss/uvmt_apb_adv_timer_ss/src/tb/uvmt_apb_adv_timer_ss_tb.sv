// Copyright 2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMT_APB_ADV_TIMER_SS_TB_SV__
`define __UVMT_APB_ADV_TIMER_SS_TB_SV__


/**
 * Module encapsulating the APB Advanced Timer Sub-System DUT wrapper, agents and clock/reset generating interfaces.
 * @ingroup uvmt_apb_adv_timer_ss_tb
 */
module uvmt_apb_adv_timer_ss_tb;

   import uvm_pkg ::*;
   import uvmx_pkg::*;
   import uvmt_apb_adv_timer_ss_pkg::*;

   /// @name Clock & Reset
   /// @{
   logic  HCLK; ///< System clock signal
   logic  low_speed_clk_i; ///< Low speed clock signal
   logic  HRESETn; ///< System reset signal
   uvma_clk_if    sys_clk_if(); ///< System clock interface
   uvma_clk_if    low_speed_clk_if(); ///< Low speed clock interface
   uvma_reset_if  sys_reset_if(.clk(HCLK)); ///< System reset interface
   assign HCLK = sys_clk_if.clk;
   assign low_speed_clk_i = low_speed_clk_if.clk;
   assign HRESETn = sys_reset_if.reset_n;
   /// @}

   /// @name APB Advanced Timer sub-system
   /// @{
   uvma_apb_if  proc_if(.clk(HCLK), .reset_n(HRESETn)); ///< Processor access agent interface
   uvma_irq_if  irq_events_if(.clk(HCLK), .reset_n(HRESETn)); ///< Events IRQ agent interface
   uvme_apb_adv_timer_ss_probe_if  probe_if(.*); ///< Misc. signals interface
   /// @}

   /// @name Blocks
   /// @{
   uvma_adv_timer_b_if  adv_timer0_if(); ///< Advanced timer 0 block agent interface
   uvma_adv_timer_b_if  adv_timer1_if(); ///< Advanced timer 1 block agent interface
   uvma_adv_timer_b_if  adv_timer2_if(); ///< Advanced timer 2 block agent interface
   uvma_adv_timer_b_if  adv_timer3_if(); ///< Advanced timer 3 block agent interface
   /// @}

   /// @name Checker instantiation and binding
   /// @{
   bind uvmt_apb_adv_timer_ss_dut_wrap : dut_wrap  uvme_apb_adv_timer_ss_chkr chkr(.*); ///< APB Advanced Timer sub-system
   bind uvmt_apb_adv_timer_ss_dut_wrap : dut_wrap  uvma_adv_timer_b_if_chkr adv_timer0_if_chkr( ///< Advanced timer 0 block
      .agent_if(adv_timer0_if)
   );
   bind uvmt_apb_adv_timer_ss_dut_wrap : dut_wrap  uvma_adv_timer_b_if_chkr adv_timer1_if_chkr( ///< Advanced timer 1 block
      .agent_if(adv_timer1_if)
   );
   bind uvmt_apb_adv_timer_ss_dut_wrap : dut_wrap  uvma_adv_timer_b_if_chkr adv_timer2_if_chkr( ///< Advanced timer 2 block
      .agent_if(adv_timer2_if)
   );
   bind uvmt_apb_adv_timer_ss_dut_wrap : dut_wrap  uvma_adv_timer_b_if_chkr adv_timer3_if_chkr( ///< Advanced timer 3 block
      .agent_if(adv_timer3_if)
   );
   /// @}

   /**
    * DUT instance wrapper.
    */
   uvmt_apb_adv_timer_ss_dut_wrap  dut_wrap(.*);

   /**
    * Test bench entry point.
    */
   initial begin
      // APB Advanced Timer sub-system interfaces
      uvm_config_db#(virtual uvma_clk_if)::set(null, "uvm_test_top.sys_clk_agent", "vif", sys_clk_if);
      uvm_config_db#(virtual uvma_clk_if)::set(null, "uvm_test_top.low_speed_clk_agent", "vif", low_speed_clk_if);
      uvm_config_db#(virtual uvma_reset_if)::set(null, "uvm_test_top.sys_reset_agent", "vif", sys_reset_if);
      uvm_config_db#(virtual uvma_apb_if)::set(null, "uvm_test_top.env.proc_agent", "vif", proc_if);
      uvm_config_db#(virtual uvma_irq_if)::set(null, "uvm_test_top.env.irq_events_agent", "vif", irq_events_if);
      uvm_config_db#(virtual uvme_apb_adv_timer_ss_probe_if)::set(null, "uvm_test_top.env", "vif", probe_if);
      // Block agent interfaces
      uvm_config_db#(virtual uvma_adv_timer_b_if)::set(null, "uvm_test_top.env.adv_timer0_b_env.agent", "vif", adv_timer0_if);
      uvm_config_db#(virtual uvma_adv_timer_b_if)::set(null, "uvm_test_top.env.adv_timer1_b_env.agent", "vif", adv_timer1_if);
      uvm_config_db#(virtual uvma_adv_timer_b_if)::set(null, "uvm_test_top.env.adv_timer2_b_env.agent", "vif", adv_timer2_if);
      uvm_config_db#(virtual uvma_adv_timer_b_if)::set(null, "uvm_test_top.env.adv_timer3_b_env.agent", "vif", adv_timer3_if);
      // Test entry point
      uvmx_top.run_test();
   end

endmodule : uvmt_apb_adv_timer_ss_tb


`endif // __UVMT_APB_ADV_TIMER_SS_TB_SV__