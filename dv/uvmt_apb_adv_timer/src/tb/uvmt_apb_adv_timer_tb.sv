// Copyright 2022 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMT_APB_ADV_TIMER_TB_SV__
`define __UVMT_APB_ADV_TIMER_TB_SV__


/**
 * Module encapsulating the APB Advanced Timer Sub-System DUT wrapper, agents and clock generating interfaces.
 * @ingroup uvmt_apb_adv_timer_tb
 */
module uvmt_apb_adv_timer_tb;

   import uvm_pkg               ::*;
   import uvmx_pkg              ::*;
   import uvmt_apb_adv_timer_pkg::*;

   logic  clk, reset_n;
   assign clk     = sys_clk_if.clk;
   assign reset_n = sys_reset_if.reset_n;

   uvma_clk_if                  sys_clk_if  (.*); ///< Clock generating interface
   uvma_reset_if                sys_reset_if(.*); ///< Reset assertion interface
   uvma_apb_if                  apb_if      (.*); ///< APB interface
   uvme_apb_adv_timer_probe_if  probe_if    (.*); ///< Misc. signals interface
   uvmt_apb_adv_timer_dut_wrap  dut_wrap    (.*); ///< DUT instance with interface ports

   bind uvmt_apb_adv_timer_dut_wrap : dut_wrap  uvme_apb_adv_timer_chkr chkr(.*); ///< Checker instantiation and binding

   /**
    * Test bench entry point.
    */
   initial begin
      uvm_config_db#(virtual uvma_clk_if                )::set(null, "*.sys_clk_agent"  , "vif", sys_clk_if  );
      uvm_config_db#(virtual uvma_reset_if              )::set(null, "*.sys_reset_agent", "vif", sys_reset_if);
      uvm_config_db#(virtual uvma_apb_if                )::set(null, "*.env.apb_agent"  , "vif", apb_if      );
      uvm_config_db#(virtual uvme_apb_adv_timer_probe_if)::set(null, "*.env"            , "vif", probe_if    );
      uvmx_top.run_test();
   end

endmodule : uvmt_apb_adv_timer_tb


`endif // __UVMT_APB_ADV_TIMER_TB_SV__
