// Copyright 2022 Datum Technology Corporation
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMT_CVMCU_TB_SV__
`define __UVMT_CVMCU_TB_SV__


/**
 * Module encapsulating the CORE-V MCU DUT wrapper, agents and clock generating interfaces.
 */
module uvmt_cvmcu_tb;

   timeunit       1ns;
   timeprecision  1ps;

   import uvm_pkg       ::*;
   import uvmt_cvmcu_pkg::*;

   logic clk = 0;
   logic reset_n = 1;

   initial begin
      forever begin
         #10ns;
         clk = !clk;
      end
   end

   initial begin
      #1000ns;
      reset_n = 0;
      #100ns;
      $finish();
      reset_n = 1;
      #100ns;
   end

   // Support agent interfaces
   uvma_clk_if    sys_clk_if();
   uvma_reset_if  sys_reset_if(.clk(clk)/*.clk(sys_clk_if.clk)*/);

   // Core agent interfaces
   uvma_obi_if         obi_instr_if(.clk(clk)/*.clk(sys_clk_if.clk)*/, .reset_n(/*sys_reset_if.*/reset_n));
   uvma_obi_if         obi_data_if (.clk(clk)/*.clk(sys_clk_if.clk)*/, .reset_n(/*sys_reset_if.*/reset_n));
   uvma_cvmcu_intr_if  intr_if     (.clk(clk)/*.clk(sys_clk_if.clk)*/, .reset_n(/*sys_reset_if.*/reset_n));

   // Misc. interfaces
   uvmt_cvmcu_probe_if  probe_if();

   // DUT instance
   uvmt_cvmcu_dut_wrap  dut_wrap(.*);


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
      uvm_config_db#(virtual uvma_clk_if        )::set(null, "*.env.sys_clk_agent"  , "vif"      , sys_clk_if  );
      uvm_config_db#(virtual uvma_reset_if      )::set(null, "*.env.sys_reset_agent", "vif"      , sys_reset_if);
      uvm_config_db#(virtual uvma_obi_if        )::set(null, "*.env.obi_instr_agent", "vif"      , obi_instr_if);
      uvm_config_db#(virtual uvma_obi_if        )::set(null, "*.env.obi_data_agent" , "vif"      , obi_data_if );
      uvm_config_db#(virtual uvma_cvmcu_intr_if )::set(null, "*.env.intr_agent"     , "vif"      , intr_if     );
      uvm_config_db#(virtual uvmt_cvmcu_probe_if)::set(null, "*"                    , "probe_vif", probe_if    );

      // Run test
      uvm_top.enable_print_topology = 0;
      uvm_top.finish_on_completion  = 1;
      uvm_top.run_test();
   end

endmodule : uvmt_cvmcu_tb


`endif // __UVMT_CVMCU_TB_SV__
