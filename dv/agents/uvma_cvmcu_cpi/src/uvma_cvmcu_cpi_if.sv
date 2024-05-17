// Copyright 2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMA_CVMCU_CPI_IF_SV__
`define __UVMA_CVMCU_CPI_IF_SV__


/**
 * Encapsulates all signals and clocking of the CORE-V-MCU Camera Parallel Interface.
 * @ingroup uvma_cvmcu_cpi_misc
 */
interface uvma_cvmcu_cpi_if #(
   parameter DATA_WIDTH  = `UVMA_CVMCU_CPI_DATA_MAX_WIDTH  ///< Data
)
(
   input  clk_i , ///< Clock
   input  rstn_i  ///< Reset
);

   /// @name 'PHY' signals
   /// @{
   wire [(DATA_WIDTH-1):0]  cam_data_i ; ///< Data signal
   wire                     cam_hsync_i; ///< Horizontal sync
   wire                     cam_vsync_i; ///< Vertical sync
   /// @}


   /// @name Used by uvma_cvmcu_cpi_tx_phy_drv_c
   /// @{
   clocking tx_phy_drv_cb @(posedge clk_i);
      output cam_data_i, cam_hsync_i, cam_vsync_i;
   endclocking
   modport tx_phy_drv_mp (clocking tx_phy_drv_cb);
   /// @}

   /// @name Used by uvma_cvmcu_cpi_rx_phy_drv_c
   /// @{
   clocking rx_phy_drv_cb @(posedge clk_i);
      input cam_data_i, cam_hsync_i, cam_vsync_i;
   endclocking
   modport rx_phy_drv_mp (clocking rx_phy_drv_cb);
   /// @}

   /// @name Used by uvma_cvmcu_cpi_phy_mon_c
   /// @{
   clocking phy_mon_cb @(posedge clk_i);
      input cam_data_i, cam_hsync_i, cam_vsync_i;
   endclocking
   modport phy_mon_mp (clocking phy_mon_cb);
   /// @}


   /// @name Accessors
   /// @{
   `uvmx_if_reset(rstn_i)
   `uvmx_if_cb(tx_phy_drv_mp, tx_phy_drv_cb)
   `uvmx_if_cb(rx_phy_drv_mp, rx_phy_drv_cb)
   `uvmx_if_cb(phy_mon_mp, phy_mon_cb)
   `uvmx_if_signal_out(cam_data_i, [(DATA_WIDTH-1):0], phy_mon_mp.phy_mon_cb, tx_phy_drv_mp.tx_phy_drv_cb)
   `uvmx_if_signal_out(cam_hsync_i, , phy_mon_mp.phy_mon_cb, tx_phy_drv_mp.tx_phy_drv_cb)
   `uvmx_if_signal_out(cam_vsync_i, , phy_mon_mp.phy_mon_cb, tx_phy_drv_mp.tx_phy_drv_cb)
   /// @}

endinterface


`endif // __UVMA_CVMCU_CPI_IF_SV__