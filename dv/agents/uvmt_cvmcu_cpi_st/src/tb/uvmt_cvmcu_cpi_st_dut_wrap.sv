// Copyright 2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMT_CVMCU_CPI_ST_DUT_WRAP_SV__
`define __UVMT_CVMCU_CPI_ST_DUT_WRAP_SV__


/**
 * Module wrapper connecting CORE-V-MCU Camera Parallel Interface UVM Agent Self-Test Bench interfaces.  All ports are SV interfaces.
 * @ingroup uvmt_cvmcu_cpi_st_tb
 */
module uvmt_cvmcu_cpi_st_dut_wrap(
   uvma_cvmcu_cpi_if  tx_if, ///< TX Agent interface
   uvma_cvmcu_cpi_if  rx_if, ///< RX Agent interface
   uvma_cvmcu_cpi_if  passive_if, ///< Passive Agent interface
   uvma_clk_if    clk_i_if  , ///< Clock interface
   uvma_reset_if  reset_if  ///< Reset interface
);

   assign rx_if.cam_data_i = tx_if.cam_data_i;
   assign passive_if.cam_data_i = tx_if.cam_data_i;
   assign rx_if.cam_hsync_i = tx_if.cam_hsync_i;
   assign passive_if.cam_hsync_i = tx_if.cam_hsync_i;
   assign rx_if.cam_vsync_i = tx_if.cam_vsync_i;
   assign passive_if.cam_vsync_i = tx_if.cam_vsync_i;

endmodule : uvmt_cvmcu_cpi_st_dut_wrap


`endif // __UVMT_CVMCU_CPI_ST_DUT_WRAP_SV__