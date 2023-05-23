// Copyright 2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMT_CVMCU_DBG_ST_TB_SV__
`define __UVMT_CVMCU_DBG_ST_TB_SV__


/**
 * Module encapsulating the CORE-V-MCU Debug Interface UVM Agent Self-Test "DUT" wrapper, agents and clock generating interfaces.
 * @ingroup uvmt_cvmcu_dbg_st_tb
 */
module uvmt_cvmcu_dbg_st_tb;

   import uvm_pkg ::*;
   import uvmx_pkg::*;
   import uvmt_cvmcu_dbg_st_pkg::*;

   /// @name Clock & Reset
   /// @{
   logic  clk    ; ///< Slow
   logic  reset_n; ///< System
   uvma_clk_if    clk_if(); ///< Slow interface
   uvma_reset_if  reset_if(.clk(clk)); ///< System interface
   assign clk     = clk_if.clk;
   assign reset_n = reset_if.reset_n;
   /// @}

   uvma_cvmcu_dbg_if           core_if(.*); ///< CORE Agent interface
   uvma_cvmcu_dbg_if           sys_if(.*); ///< SYS Agent interface
   uvma_cvmcu_dbg_if           passive_if(.*); ///< Passive Agent interface
   uvmt_cvmcu_dbg_st_dut_wrap  dut_wrap  (.*); ///< "DUT" instance
   bind uvmt_cvmcu_dbg_st_dut_wrap : dut_wrap  uvma_cvmcu_dbg_if_chkr passive_if_chkr(.cvmcu_dbg_if(passive_if)); ///< Checker instantiation and binding.

   /**
    * Test bench entry point.
    */
   initial begin
      uvm_config_db#(virtual uvma_clk_if  )::set(null, "uvm_test_top.clk_agent", "vif", clk_if);
      uvm_config_db#(virtual uvma_reset_if)::set(null, "uvm_test_top.reset_agent", "vif", reset_if);
      uvm_config_db#(virtual uvma_cvmcu_dbg_if)::set(null, "uvm_test_top.env.core_agent", "vif", core_if);
      uvm_config_db#(virtual uvma_cvmcu_dbg_if)::set(null, "uvm_test_top.env.sys_agent", "vif", sys_if);
      uvm_config_db#(virtual uvma_cvmcu_dbg_if)::set(null, "uvm_test_top.env.passive_agent", "vif", passive_if);
      uvmx_top.run_test();
   end

endmodule : uvmt_cvmcu_dbg_st_tb


`endif // __UVMT_CVMCU_DBG_ST_TB_SV__