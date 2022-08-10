// Copyright 2022 Datum Technology Corporation
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMT_UDMA_CTRL_TB_SV__
`define __UVMT_UDMA_CTRL_TB_SV__


/**
 * Module encapsulating the uDMA Controller Block DUT wrapper, agents and clock generating interfaces.
 * @ingroup uvmt_udma_ctrl_tb
 */
module uvmt_udma_ctrl_tb;

   import uvm_pkg::*;
   import uvmt_udma_ctrl_pkg::*;

   uvma_clk_if    clk_if(); ///< Clock generating interface
   uvma_reset_if  reset_if(.clk(clk_if.clk)); ///< Reset assertion interface
   uvma_udma_ctrl_cp_if      cp_if(.clk(clk_if.clk), .reset_n(reset_if.reset_n)); ///< Control plane interface
   uvma_udma_ctrl_dp_in_if   dp_in_if(.clk(clk_if.clk), .reset_n(reset_if.reset_n)); ///< Data plane input interface
   uvma_udma_ctrl_dp_out_if  dp_out_if(.clk(clk_if.clk), .reset_n(reset_if.reset_n)); ///< Data plane output interface
   uvmt_udma_ctrl_probe_if   probe_if(); ///< Misc. signals interface
   uvmt_udma_ctrl_dut_wrap   dut_wrap(.*); ///< DUT instance with interface ports


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
      uvm_config_db#(virtual uvma_clk_if  )::set(null, "*.env.clk_agent"  , "vif", clk_if  );
      uvm_config_db#(virtual uvma_reset_if)::set(null, "*.env.reset_agent", "vif", reset_if);
      uvm_config_db#(virtual uvma_udma_ctrl_cp_if    )::set(null, "*.env.cp_agent"    , "vif", cp_if    );
      uvm_config_db#(virtual uvma_udma_ctrl_dp_in_if )::set(null, "*.env.dp_in_agent" , "vif", dp_in_if );
      uvm_config_db#(virtual uvma_udma_ctrl_dp_out_if)::set(null, "*.env.dp_out_agent", "vif", dp_out_if);
      uvm_config_db#(virtual uvmt_udma_ctrl_probe_if )::set(null, "*"                 , "vif", probe_if );

      // Run test
      uvm_top.enable_print_topology = 0;
      uvm_top.finish_on_completion  = 1;
      uvm_top.run_test();
   end

endmodule : uvmt_udma_ctrl_tb


`endif // __UVMT_UDMA_CTRL_TB_SV__
