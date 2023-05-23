// Copyright 2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMT_CVMCU_CPI_ST_TB_SV__
`define __UVMT_CVMCU_CPI_ST_TB_SV__


/**
 * Module encapsulating the CORE-V-MCU Camera Parallel Interface UVM Agent Self-Test "DUT" wrapper, agents and clock generating interfaces.
 * @ingroup uvmt_cvmcu_cpi_st_tb
 */
module uvmt_cvmcu_cpi_st_tb;

   import uvm_pkg ::*;
   import uvmx_pkg::*;
   import uvmt_cvmcu_cpi_st_pkg::*;

   /// @name Clock & Reset
   /// @{
   logic  clk_i ; ///< Clock
   logic  rstn_i; ///< Reset
   uvma_clk_if    clk_i_if(); ///< Clock interface
   uvma_reset_if  reset_if(.clk(clk_i)); ///< Reset interface
   assign clk_i  = clk_i_if.clk;
   assign rstn_i = reset_if.reset_n;
   /// @}

   uvma_cvmcu_cpi_if           tx_if(.*); ///< TX Agent interface
   uvma_cvmcu_cpi_if           rx_if(.*); ///< RX Agent interface
   uvma_cvmcu_cpi_if           passive_if(.*); ///< Passive Agent interface
   uvmt_cvmcu_cpi_st_dut_wrap  dut_wrap  (.*); ///< "DUT" instance
   bind uvmt_cvmcu_cpi_st_dut_wrap : dut_wrap  uvma_cvmcu_cpi_if_chkr passive_if_chkr(.cvmcu_cpi_if(passive_if)); ///< Checker instantiation and binding.

   /**
    * Test bench entry point.
    */
   initial begin
      uvm_config_db#(virtual uvma_clk_if  )::set(null, "uvm_test_top.clk_i_agent", "vif", clk_i_if);
      uvm_config_db#(virtual uvma_reset_if)::set(null, "uvm_test_top.reset_agent", "vif", reset_if);
      uvm_config_db#(virtual uvma_cvmcu_cpi_if)::set(null, "uvm_test_top.env.tx_agent", "vif", tx_if);
      uvm_config_db#(virtual uvma_cvmcu_cpi_if)::set(null, "uvm_test_top.env.rx_agent", "vif", rx_if);
      uvm_config_db#(virtual uvma_cvmcu_cpi_if)::set(null, "uvm_test_top.env.passive_agent", "vif", passive_if);
      uvmx_top.run_test();
   end

endmodule : uvmt_cvmcu_cpi_st_tb


`endif // __UVMT_CVMCU_CPI_ST_TB_SV__