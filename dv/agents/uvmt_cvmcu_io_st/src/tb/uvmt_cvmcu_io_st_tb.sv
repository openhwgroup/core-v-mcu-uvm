// Copyright 2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMT_CVMCU_IO_ST_TB_SV__
`define __UVMT_CVMCU_IO_ST_TB_SV__


/**
 * Module encapsulating the CORE-V-MCU IO UVM Agent Self-Test "DUT" wrapper, agents and clock generating interfaces.
 * @ingroup uvmt_cvmcu_io_st_tb
 */
module uvmt_cvmcu_io_st_tb;

   import uvm_pkg ::*;
   import uvmx_pkg::*;
   import uvmt_cvmcu_io_st_pkg::*;

   /// @name Clock & Reset
   /// @{
   logic  ref_clk_i; ///< Reference Clock
   logic  rstn_i   ; ///< Active-low asynchronous reset
   uvma_clk_if    ref_clk_i_if(); ///< Reference Clock interface
   uvma_reset_if  reset_if(.clk(ref_clk_i)); ///< Active-low asynchronous reset interface
   assign ref_clk_i = ref_clk_i_if.clk;
   assign rstn_i    = reset_if.reset_n;
   /// @}

   uvma_cvmcu_io_if           board_if(.*); ///< BOARD Agent interface
   uvma_cvmcu_io_if           chip_if(.*); ///< CHIP Agent interface
   uvma_cvmcu_io_if           passive_if(.*); ///< Passive Agent interface
   uvmt_cvmcu_io_st_dut_wrap  dut_wrap  (.*); ///< "DUT" instance
   bind uvmt_cvmcu_io_st_dut_wrap : dut_wrap  uvma_cvmcu_io_if_chkr passive_if_chkr(.cvmcu_io_if(passive_if)); ///< Checker instantiation and binding.

   /**
    * Test bench entry point.
    */
   initial begin
      uvm_config_db#(virtual uvma_clk_if  )::set(null, "uvm_test_top.ref_clk_i_agent", "vif", ref_clk_i_if);
      uvm_config_db#(virtual uvma_reset_if)::set(null, "uvm_test_top.reset_agent", "vif", reset_if);
      uvm_config_db#(virtual uvma_cvmcu_io_if)::set(null, "uvm_test_top.env.board_agent", "vif", board_if);
      uvm_config_db#(virtual uvma_cvmcu_io_if)::set(null, "uvm_test_top.env.chip_agent", "vif", chip_if);
      uvm_config_db#(virtual uvma_cvmcu_io_if)::set(null, "uvm_test_top.env.passive_agent", "vif", passive_if);
      uvmx_top.run_test();
   end

endmodule : uvmt_cvmcu_io_st_tb


`endif // __UVMT_CVMCU_IO_ST_TB_SV__