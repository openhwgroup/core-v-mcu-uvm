// Copyright 2023 Acme Enterprises
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

   /// @name TX
   /// @{
   uvma_cvmcu_cpi_data_l_t  cam_data_i ; ///< Data signal
   logic                    cam_hsync_i; ///< Horizontal sync
   logic                    cam_vsync_i; ///< Vertical sync
   /// @}

   /// @name RX
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

endclass : uvma_cvmcu_cpi_phy_mon_trn_c


`endif // __UVMA_CVMCU_CPI_PHY_MON_TRN_SV__