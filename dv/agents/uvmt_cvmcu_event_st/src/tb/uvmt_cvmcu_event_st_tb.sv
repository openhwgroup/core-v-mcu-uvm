// Copyright 2023 Acme Enterprises
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMT_CVMCU_EVENT_ST_TB_SV__
`define __UVMT_CVMCU_EVENT_ST_TB_SV__


/**
 * Module encapsulating the CORE-V-MCU Event Interface UVM Agent Self-Test "DUT" wrapper, agents and clock generating interfaces.
 * @ingroup uvmt_cvmcu_event_st_tb
 */
module uvmt_cvmcu_event_st_tb;

   import uvm_pkg ::*;
   import uvmx_pkg::*;
   import uvmt_cvmcu_event_st_pkg::*;

   /// @name Clock & Reset
   /// @{
   logic  low_speed_clk_i; ///< Low speed clock
   logic  HRESETn        ; ///< System reset
   uvma_clk_if    low_speed_clk_i_if(); ///< Low speed clock interface
   uvma_reset_if  reset_if(.clk(low_speed_clk_i)); ///< System reset interface
   assign low_speed_clk_i = low_speed_clk_i_if.clk;
   assign HRESETn         = reset_if.reset_n;
   /// @}

   uvma_cvmcu_event_if           core_if(.*); ///< CORE Agent interface
   uvma_cvmcu_event_if           sys_if(.*); ///< SYS Agent interface
   uvma_cvmcu_event_if           passive_if(.*); ///< Passive Agent interface
   uvmt_cvmcu_event_st_dut_wrap  dut_wrap  (.*); ///< "DUT" instance
   bind uvmt_cvmcu_event_st_dut_wrap : dut_wrap  uvma_cvmcu_event_if_chkr passive_if_chkr(.cvmcu_event_if(passive_if)); ///< Checker instantiation and binding.

   /**
    * Test bench entry point.
    */
   initial begin
      uvm_config_db#(virtual uvma_clk_if  )::set(null, "uvm_test_top.low_speed_clk_i_agent", "vif", low_speed_clk_i_if);
      uvm_config_db#(virtual uvma_reset_if)::set(null, "uvm_test_top.reset_agent", "vif", reset_if);
      uvm_config_db#(virtual uvma_cvmcu_event_if)::set(null, "uvm_test_top.env.core_agent", "vif", core_if);
      uvm_config_db#(virtual uvma_cvmcu_event_if)::set(null, "uvm_test_top.env.sys_agent", "vif", sys_if);
      uvm_config_db#(virtual uvma_cvmcu_event_if)::set(null, "uvm_test_top.env.passive_agent", "vif", passive_if);
      uvmx_top.run_test();
   end

endmodule : uvmt_cvmcu_event_st_tb


`endif // __UVMT_CVMCU_EVENT_ST_TB_SV__