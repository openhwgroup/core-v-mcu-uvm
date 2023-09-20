// Copyright 2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMA_CVMCU_CPI_TX_PHY_DRV_SV__
`define __UVMA_CVMCU_CPI_TX_PHY_DRV_SV__


/**
 * Driver driving CORE-V-MCU Camera Parallel Interface Virtual Interface (uvma_cvmcu_cpi_if) TX PHY.
 * @ingroup uvma_cvmcu_cpi_comps
 */
class uvma_cvmcu_cpi_tx_phy_drv_c extends uvmx_mp_drv_c #(
   .T_MP      (virtual uvma_cvmcu_cpi_if.tx_phy_drv_mp),
   .T_CFG     (uvma_cvmcu_cpi_cfg_c  ),
   .T_CNTXT   (uvma_cvmcu_cpi_cntxt_c),
   .T_SEQ_ITEM(uvma_cvmcu_cpi_tx_phy_seq_item_c)
);

   `uvm_component_utils(uvma_cvmcu_cpi_tx_phy_drv_c)
   `uvmx_mp_drv(tx_phy_drv_mp, tx_phy_drv_cb)

   /**
    * Default constructor.
    */
   function new(string name="uvma_cvmcu_cpi_tx_phy_drv", uvm_component parent=null);
      super.new(name, parent);
   endfunction

   /**
    * Trims data outside configured widths.
    */
   virtual function void process_item(ref uvma_cvmcu_cpi_tx_phy_seq_item_c item);
      `uvmx_trim(item.cam_data_i, cfg.data_width)
   endfunction

   /**
    * Drives TX PHY Driver clocking block (tx_phy_drv_cb) on each clock cycle.
    */
   virtual task drive_item(ref uvma_cvmcu_cpi_tx_phy_seq_item_c item);
      `uvmx_mp_drv_signal(item, cam_data_i)
      `uvmx_mp_drv_signal(item, cam_hsync_i)
      `uvmx_mp_drv_signal(item, cam_vsync_i)
   endtask


endclass : uvma_cvmcu_cpi_tx_phy_drv_c


`endif // __UVMA_CVMCU_CPI_TX_PHY_DRV_SV__