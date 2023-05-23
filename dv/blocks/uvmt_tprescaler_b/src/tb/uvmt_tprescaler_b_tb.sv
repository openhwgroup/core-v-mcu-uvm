// Copyright 2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMT_TPRESCALER_B_TB_SV__
`define __UVMT_TPRESCALER_B_TB_SV__


/**
 * Module encapsulating the  Block DUT wrapper, agents and clock generating interfaces.
 * @ingroup uvmt_tprescaler_b_tb
 */
module uvmt_tprescaler_b_tb;

   import uvm_pkg ::*;
   import uvmx_pkg::*;
   import uvmt_tprescaler_b_pkg::*;

   /// @name Clock & Reset
   /// @{
   logic  clk_i ; ///< 
   logic  rst_ni; ///< 
   uvma_clk_if    clk_i_if(); ///<  interface
   uvma_reset_if  reset_if(.clk(clk_i)); ///<  interface
   assign clk_i  = clk_i_if.clk;
   assign rst_ni = reset_if.reset_n;
   /// @}

   uvma_tprescaler_b_if        agent_if(.*); ///< Block Agent interface
   uvmt_tprescaler_b_dut_wrap  dut_wrap(.*); ///< DUT wrapper instance
   bind uvmt_tprescaler_b_dut_wrap : dut_wrap  uvma_tprescaler_b_if_chkr chkr(.*); ///< Checker instantiation and binding

   /**
    * Test Bench entry point.
    */
   initial begin
      uvm_config_db#(virtual uvma_clk_if  )::set(null, "uvm_test_top.clk_i_agent", "vif", clk_i_if);
      uvm_config_db#(virtual uvma_reset_if)::set(null, "uvm_test_top.reset_agent", "vif", reset_if);
      uvm_config_db#(virtual uvma_tprescaler_b_if)::set(null, "uvm_test_top.env.agent", "vif", agent_if);
      uvmx_top.run_test();
   end

endmodule : uvmt_tprescaler_b_tb


`endif // __UVMT_TPRESCALER_B_TB_SV__