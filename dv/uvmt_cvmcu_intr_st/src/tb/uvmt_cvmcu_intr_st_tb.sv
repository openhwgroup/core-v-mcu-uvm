// Copyright 2022 Datum Technology Corporation
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMT_CVMCU_INTR_ST_TB_SV__
`define __UVMT_CVMCU_INTR_ST_TB_SV__


/**
 * Module instantiating the CORE-V MCU Interrupt UVM Agent interfaces, a clock % reset generating interface and a "DUT".
 * @ingroup uvmt_cvmcu_intr_st_tb
 */
module uvmt_cvmcu_intr_st_tb;

   import uvm_pkg::*;
   import uvmt_cvmcu_intr_st_pkg::*;

   uvmt_cvmcu_intr_st_clknrst_gen_if  gen_if(); ///< Provides clocking & reset
   uvma_cvmcu_intr_if  active_if (.clk(gen_if.clk), .reset_n(gen_if.reset_n)); ///< Active agent interface
   uvma_cvmcu_intr_if  passive_if(.clk(gen_if.clk), .reset_n(gen_if.reset_n)); ///< Passive agent interface
   uvmt_cvmcu_intr_st_dut_wrap  dut_wrap(.*); ///< Connects the agent interfaces


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
      uvm_config_db#(virtual uvmt_cvmcu_intr_st_clknrst_gen_if)::set(null, "*", "vif", gen_if);
      uvm_config_db#(virtual uvma_cvmcu_intr_if)::set(null, "*.env.active_agent" , "vif", active_if );
      uvm_config_db#(virtual uvma_cvmcu_intr_if)::set(null, "*.env.passive_agent", "vif", passive_if);

      // Run test
      uvm_top.enable_print_topology = 0;
      uvm_top.finish_on_completion  = 1;
      uvm_top.run_test();
   end

endmodule : uvmt_cvmcu_intr_st_tb


`endif // __UVMT_CVMCU_INTR_ST_TB_SV__
