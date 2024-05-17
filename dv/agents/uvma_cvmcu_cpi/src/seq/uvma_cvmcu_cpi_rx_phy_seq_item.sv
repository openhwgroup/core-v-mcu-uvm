// Copyright 2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMA_CVMCU_CPI_RX_PHY_SEQ_ITEM_SV__
`define __UVMA_CVMCU_CPI_RX_PHY_SEQ_ITEM_SV__


/**
 * Sequence Item created by CORE-V-MCU Camera Parallel Interface Sequences for driving uvma_cvmcu_cpi_rx_phy_drv_c.
 * @ingroup uvma_cvmcu_cpi_seq_item
 */
class uvma_cvmcu_cpi_rx_phy_seq_item_c extends uvmx_seq_item_c #(
   .T_CFG  (uvma_cvmcu_cpi_cfg_c  ),
   .T_CNTXT(uvma_cvmcu_cpi_cntxt_c)
);

   /// @name Data
   /// @{
   /// @}

   /// @name Metadata
   /// @{
   uvma_cvmcu_cpi_data_l_t  cam_data_i ; ///< Data signal
   logic  cam_hsync_i; ///< Horizontal sync
   logic  cam_vsync_i; ///< Vertical sync
   /// @}


   `uvm_object_utils_begin(uvma_cvmcu_cpi_rx_phy_seq_item_c)
      `uvm_field_int(cam_data_i, UVM_DEFAULT)
      `uvm_field_int(cam_hsync_i, UVM_DEFAULT)
      `uvm_field_int(cam_vsync_i, UVM_DEFAULT)
   `uvm_object_utils_end


   /**
    * Default constructor.
    */
   function new(string name="uvma_cvmcu_cpi_rx_phy_seq_item");
      super.new(name);
   endfunction

   /**
    * Describes sequence item for logger.
    */
   virtual function uvmx_metadata_t get_metadata();
      string  val_str;
      val_str = $sformatf("%h", cam_data_i);
      `uvmx_metadata_field("cam_data_i", val_str)
      val_str = $sformatf("%b", cam_hsync_i);
      `uvmx_metadata_field("cam_hsync_i", val_str)
      val_str = $sformatf("%b", cam_vsync_i);
      `uvmx_metadata_field("cam_vsync_i", val_str)
   endfunction

endclass


`endif // __UVMA_CVMCU_CPI_RX_PHY_SEQ_ITEM_SV__