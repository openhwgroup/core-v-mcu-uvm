// Copyright 2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMT_ADV_TIMER_B_TB_SV__
`define __UVMT_ADV_TIMER_B_TB_SV__


/**
 * Module encapsulating the  Block DUT wrapper, agents and clock generating interfaces.
 * @ingroup uvmt_adv_timer_b_tb
 */
module uvmt_adv_timer_b_tb;

   import uvm_pkg ::*;
   import uvmx_pkg::*;
   import uvmt_adv_timer_b_pkg::*;

   /// @name Clock & Reset
   /// @{
   logic  clk_i   ; ///< 
   logic  ls_clk_i; ///< 
   logic  rstn_i  ; ///< 
   uvma_clk_if    clk_i_if(); ///<  interface
   uvma_clk_if    ls_clk_i_if(); ///<  interface
   uvma_reset_if  reset_if(.clk(clk_i)); ///<  interface
   assign clk_i    = clk_i_if.clk;
   assign ls_clk_i = ls_clk_i_if.clk;
   assign rstn_i   = reset_if.reset_n;
   /// @}

   uvma_adv_timer_b_if agent_if(.*); ///< Block Agent interface
   uvmt_adv_timer_b_dut_wrap  dut_wrap(.*); ///< DUT wrapper instance
   bind uvmt_adv_timer_b_dut_wrap : dut_wrap  uvma_adv_timer_b_if_chkr chkr(.*); ///< Checker instantiation and binding

   /**
    * Test Bench entry point.
    */
   initial begin
      uvm_config_db#(virtual uvma_clk_if  )::set(null, "uvm_test_top.clk_i_agent", "vif", clk_i_if);
      uvm_config_db#(virtual uvma_clk_if  )::set(null, "uvm_test_top.ls_clk_i_agent", "vif", ls_clk_i_if);
      uvm_config_db#(virtual uvma_reset_if)::set(null, "uvm_test_top.reset_agent", "vif", reset_if);
      uvm_config_db#(virtual uvma_adv_timer_b_if)::set(null, "uvm_test_top.env.agent", "vif", agent_if);
      uvmx_top.run_test();
   end

endmodule : uvmt_adv_timer_b_tb


`endif // __UVMT_ADV_TIMER_B_TB_SV__