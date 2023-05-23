// Copyright 2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMA_CVMCU_CPI_RX_PHY_DRV_SV__
`define __UVMA_CVMCU_CPI_RX_PHY_DRV_SV__


/**
 * Driver driving CORE-V-MCU Camera Parallel Interface Virtual Interface (uvma_cvmcu_cpi_if) RX PHY.
 * @ingroup uvma_cvmcu_cpi_comps
 */
class uvma_cvmcu_cpi_rx_phy_drv_c extends uvmx_mp_drv_c #(
   .T_MP      (virtual uvma_cvmcu_cpi_if.rx_phy_drv_mp),
   .T_CFG     (uvma_cvmcu_cpi_cfg_c  ),
   .T_CNTXT   (uvma_cvmcu_cpi_cntxt_c),
   .T_SEQ_ITEM(uvma_cvmcu_cpi_rx_phy_seq_item_c)
);

   `uvm_component_utils(uvma_cvmcu_cpi_rx_phy_drv_c)
   `uvmx_mp_drv(rx_phy_drv_mp, rx_phy_drv_cb)

   /**
    * Default constructor.
    */
   function new(string name="uvma_cvmcu_cpi_rx_phy_drv", uvm_component parent=null);
      super.new(name, parent);
   endfunction


   /**
    * Drives RX PHY Driver clocking block (rx_phy_drv_cb) on each clock cycle.
    */
   virtual task drive_item(ref uvma_cvmcu_cpi_rx_phy_seq_item_c item);
   endtask

endclass : uvma_cvmcu_cpi_rx_phy_drv_c


`endif // __UVMA_CVMCU_CPI_RX_PHY_DRV_SV__