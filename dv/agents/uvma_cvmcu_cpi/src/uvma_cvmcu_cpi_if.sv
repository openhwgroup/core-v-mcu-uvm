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
(   input  clk_i , ///< Clock
   input  rstn_i  ///< Reset
);

   /// @name 'PHY' signals
   /// @{
   wire [(DATA_WIDTH-1):0]  cam_data_i ; ///< Data signal
   wire                     cam_hsync_i; ///< Horizontal sync
   wire                     cam_vsync_i; ///< Vertical sync
   /// @}


   /**
    * Used by uvma_cvmcu_cpi_tx_phy_drv_c.
    */
   clocking tx_phy_drv_cb @(posedge clk_i);
      output cam_data_i, cam_hsync_i, cam_vsync_i;
   endclocking

   /**
    * Used by uvma_cvmcu_cpi_rx_phy_drv_c.
    */
   clocking rx_phy_drv_cb @(posedge clk_i);
   endclocking

   /**
    * Used by uvma_cvmcu_cpi_phy_mon_c.
    */
   clocking phy_mon_cb @(posedge clk_i);
      input cam_data_i, cam_hsync_i, cam_vsync_i;
   endclocking


   /**
    * Used by uvma_cvmcu_cpi_tx_phy_drv_c.
    */
   modport tx_phy_drv_mp (
      clocking tx_phy_drv_cb,
      input    clk_i,
      input    rstn_i
   );

   /**
    * Used by uvma_cvmcu_cpi_rx_phy_drv_c.
    */
   modport rx_phy_drv_mp (
      clocking rx_phy_drv_cb,
      input    clk_i,
      input    rstn_i
   );

   /**
    * Used by uvma_cvmcu_cpi_phy_mon_c.
    */
   modport phy_mon_mp (
      clocking phy_mon_cb,
      input    clk_i,
      input    rstn_i
   );

endinterface : uvma_cvmcu_cpi_if


`endif // __UVMA_CVMCU_CPI_IF_SV__