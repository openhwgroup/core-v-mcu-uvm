// Copyright 2022 Datum Technology Corporation
// Copyright 2022 Low Power Futures
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMT_APB_TIMER_TB_SV__
`define __UVMT_APB_TIMER_TB_SV__


/**
 * Module encapsulating the APB Timer Sub-System DUT wrapper, agents and clock generating interfaces.
 */
module uvmt_apb_timer_tb;

   import uvm_pkg::*;
   import uvmt_apb_timer_pkg::*;

   uvma_clk_if  sys_clk_if(); ///< Clock generating interface
   uvma_reset_if  sys_reset_if(.clk(sys_clk_if.clk)); ///< Reset assertion interface
   uvma_apb_if  apb_if(.clk(sys_clk_if.clk), .reset_n(sys_reset_if.reset_n)); ///< apb interface
   uvmt_apb_timer_probe_if  probe_if(); ///< Misc. signals interface
   uvmt_apb_timer_dut_wrap  dut_wrap(.*); ///< DUT instance with interface ports


   /**
    * Test bench entry point.
    */
   initial begin
      // Specify time format for simulation
      $timeformat(
         .units_number       (   -9),
         .precision_number   (    3),
         .suffix_string      (" ns"),
         .minimum_field_width(   18)
      );

      // Add interfaces to uvm_config_db
      uvm_config_db#(virtual uvma_clk_if)::set(null, "*.env.sys_clk_agent", "vif", sys_clk_if);
      uvm_config_db#(virtual uvma_reset_if)::set(null, "*.env.sys_reset_agent", "vif", sys_reset_if);
      uvm_config_db#(virtual uvma_apb_if)::set(null, "*.env.apb_agent", "vif", apb_if);
      uvm_config_db#(virtual uvmt_apb_timer_probe_if)::set(null, "*", "vif", probe_if);

      // Run test
      uvm_top.enable_print_topology = 0;
      uvm_top.finish_on_completion  = 1;
      uvm_top.run_test();
   end

endmodule : uvmt_apb_timer_tb


`endif // __UVMT_APB_TIMER_TB_SV__
