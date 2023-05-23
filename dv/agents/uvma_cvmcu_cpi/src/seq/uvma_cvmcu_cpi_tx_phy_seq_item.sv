// Copyright 2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMA_CVMCU_CPI_TX_PHY_SEQ_ITEM_SV__
`define __UVMA_CVMCU_CPI_TX_PHY_SEQ_ITEM_SV__


/**
 * Sequence Item created by CORE-V-MCU Camera Parallel Interface Virtual Sequences for driving uvma_cvmcu_cpi_tx_phy_drv_c.
 * @ingroup uvma_cvmcu_cpi_seq
 */
class uvma_cvmcu_cpi_tx_phy_seq_item_c extends uvmx_seq_item_c #(
   .T_CFG  (uvma_cvmcu_cpi_cfg_c  ),
   .T_CNTXT(uvma_cvmcu_cpi_cntxt_c)
);

   /// @name Data
   /// @{
   rand uvma_cvmcu_cpi_data_b_t  cam_data_i ; ///< Data signal
   rand bit                      cam_hsync_i; ///< Horizontal sync
   rand bit                      cam_vsync_i; ///< Vertical sync
   /// @}

   /// @name Metadata
   /// @{
   /// @}


   `uvm_object_utils_begin(uvma_cvmcu_cpi_tx_phy_seq_item_c)
      `uvm_field_int(cam_data_i, UVM_DEFAULT)
      `uvm_field_int(cam_hsync_i, UVM_DEFAULT)
      `uvm_field_int(cam_vsync_i, UVM_DEFAULT)
   `uvm_object_utils_end


   /**
    * Default constructor.
    */
   function new(string name="uvma_cvmcu_cpi_tx_phy_seq_item");
      super.new(name);
   endfunction

   /**
    * Describes transaction as metadata for uvml_logs_metadata_logger_c.
    */
   virtual function uvmx_metadata_t get_metadata();
      string cam_data_i_str;
      string cam_hsync_i_str;
      string cam_vsync_i_str;
      cam_data_i_str = $sformatf("%h", cam_data_i);
      cam_hsync_i_str = $sformatf("%b", cam_hsync_i);
      cam_vsync_i_str = $sformatf("%b", cam_vsync_i);
      `uvmx_metadata_field("cam_data_i", cam_data_i_str)
      `uvmx_metadata_field("cam_hsync_i", cam_hsync_i_str)
      `uvmx_metadata_field("cam_vsync_i", cam_vsync_i_str)
   endfunction

endclass : uvma_cvmcu_cpi_tx_phy_seq_item_c


`endif // __UVMA_CVMCU_CPI_TX_PHY_SEQ_ITEM_SV__