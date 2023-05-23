// Copyright 2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMT_CVMCU_IO_ST_DUT_WRAP_SV__
`define __UVMT_CVMCU_IO_ST_DUT_WRAP_SV__


/**
 * Module wrapper connecting CORE-V-MCU IO UVM Agent Self-Test Bench interfaces.  All ports are SV interfaces.
 * @ingroup uvmt_cvmcu_io_st_tb
 */
module uvmt_cvmcu_io_st_dut_wrap(
   uvma_cvmcu_io_if  board_if, ///< BOARD Agent interface
   uvma_cvmcu_io_if  chip_if, ///< CHIP Agent interface
   uvma_cvmcu_io_if  passive_if, ///< Passive Agent interface
   uvma_clk_if    ref_clk_i_if  , ///< Reference Clock interface
   uvma_reset_if  reset_if  ///< Active-low asynchronous reset interface
);

   assign chip_if.io_in_i = board_if.io_in_i;
   assign passive_if.io_in_i = board_if.io_in_i;
   assign chip_if.io_out_o = board_if.io_out_o;
   assign passive_if.io_out_o = board_if.io_out_o;
   assign chip_if.pad_cfg_o = board_if.pad_cfg_o;
   assign passive_if.pad_cfg_o = board_if.pad_cfg_o;
   assign chip_if.io_oe_o = board_if.io_oe_o;
   assign passive_if.io_oe_o = board_if.io_oe_o;
   assign chip_if.slow_clk_o = board_if.slow_clk_o;
   assign passive_if.slow_clk_o = board_if.slow_clk_o;

endmodule : uvmt_cvmcu_io_st_dut_wrap


`endif // __UVMT_CVMCU_IO_ST_DUT_WRAP_SV__