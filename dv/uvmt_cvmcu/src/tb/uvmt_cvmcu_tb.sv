// Copyright 2022-2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMT_CVMCU_TB_SV__
`define __UVMT_CVMCU_TB_SV__


/**
 * Module encapsulating the CORE-V MCU Sub-System DUT wrapper, agents and clock generating interfaces.
 * @ingroup uvmt_cvmcu_tb
 */
module uvmt_cvmcu_tb;

   import uvm_pkg       ::*;
   import uvmx_pkg      ::*;
   import uvmt_cvmcu_pkg::*;

   logic  clk, reset_n;
   assign clk     = sys_clk_if.clk;
   assign reset_n = sys_reset_if.reset_n;

   uvma_clk_if          sys_clk_if  (.*); ///< Clock generating interface
   uvma_reset_if        sys_reset_if(.*); ///< Reset assertion interface
   uvma_obi_if          obi_instr_if(.*); ///< OBI interface
   uvma_obi_if          obi_data_if (.*); ///< OBI interface
   uvme_cvmcu_probe_if  probe_if    (.*); ///< Misc. signals interface
   uvmt_cvmcu_dut_wrap  dut_wrap    (.*); ///< DUT instance with interface ports

   bind uvmt_cvmcu_dut_wrap : dut_wrap  uvme_cvmcu_chkr chkr(.*); ///< Checker instantiation and binding

   /**
    * Test bench entry point.
    */
   initial begin
      uvm_config_db#(virtual uvma_clk_if        )::set(null, "*.sys_clk_agent"      , "vif", sys_clk_if  );
      uvm_config_db#(virtual uvma_reset_if      )::set(null, "*.sys_reset_agent"    , "vif", sys_reset_if);
      uvm_config_db#(virtual uvma_obi_if        )::set(null, "*.env.obi_instr_agent", "vif", obi_instr_if);
      uvm_config_db#(virtual uvma_obi_if        )::set(null, "*.env.obi_data_agent" , "vif", obi_data_if );
      uvm_config_db#(virtual uvme_cvmcu_probe_if)::set(null, "*.env"                , "vif", probe_if    );
      uvmx_top.run_test();
   end

endmodule : uvmt_cvmcu_tb


`endif // __UVMT_CVMCU_TB_SV__
