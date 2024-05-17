// Copyright 2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMA_CVMCU_CPI_PHY_MON_TRN_SV__
`define __UVMA_CVMCU_CPI_PHY_MON_TRN_SV__


/**
 * PHY Monitor Transaction sampled by monitor (uvma_cvmcu_cpi_phy_mon_c).
 * @ingroup uvma_cvmcu_cpi_obj
 */
class uvma_cvmcu_cpi_phy_mon_trn_c extends uvmx_mon_trn_c #(
   .T_CFG  (uvma_cvmcu_cpi_cfg_c  ),
   .T_CNTXT(uvma_cvmcu_cpi_cntxt_c)
);

   /// @name Tx
   /// @{
   uvma_cvmcu_cpi_data_l_t  cam_data_i ; ///< Data signal
   logic                    cam_hsync_i; ///< Horizontal sync
   logic                    cam_vsync_i; ///< Vertical sync
   /// @}

   /// @name Rx
   /// @{
   /// @}


   `uvm_object_utils_begin(uvma_cvmcu_cpi_phy_mon_trn_c)
      `uvm_field_int(cam_data_i, UVM_DEFAULT)
      `uvm_field_int(cam_hsync_i, UVM_DEFAULT)
      `uvm_field_int(cam_vsync_i, UVM_DEFAULT)
   `uvm_object_utils_end


   /**
    * Default constructor.
    */
   function new(string name="uvma_cvmcu_cpi_rx_phy_mon_trn");
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


`endif // __UVMA_CVMCU_CPI_PHY_MON_TRN_SV__