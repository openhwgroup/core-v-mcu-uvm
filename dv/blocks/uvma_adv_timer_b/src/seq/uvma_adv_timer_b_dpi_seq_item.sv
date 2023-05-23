// Copyright 2023 Acme Enterprises
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMA_ADV_TIMER_B_DPI_SEQ_ITEM_SV__
`define __UVMA_ADV_TIMER_B_DPI_SEQ_ITEM_SV__


/**
 * Sequence Item providing stimulus for the Data Plane Input driver (uvma_adv_timer_b_dpi_drv_c).
 * @ingroup uvma_adv_timer_b_seq
 */
class uvma_adv_timer_b_dpi_seq_item_c extends uvmx_seq_item_c #(
   .T_CFG  (uvma_adv_timer_b_cfg_c  ),
   .T_CNTXT(uvma_adv_timer_b_cntxt_c)
);

   /// @name Data
   /// @{
   rand uvma_adv_timer_b_n_extsig_b_t  signal_i; ///< 
   /// @}

   /// @name Metadata
   /// @{
   /// @}


   `uvm_object_utils_begin(uvma_adv_timer_b_dpi_seq_item_c)
      `uvm_field_int(signal_i, UVM_DEFAULT)
   `uvm_object_utils_end


   /**
    * Default constructor.
    */
   function new(string name="uvma_adv_timer_b_dpi_seq_item");
      super.new(name);
   endfunction

   /**
    * Describes transaction for logger.
    */
   virtual function uvmx_metadata_t get_metadata();
      string signal_i_str;
      signal_i_str = $sformatf("%h", signal_i);
      `uvmx_metadata_field("signal_i", signal_i_str)
   endfunction

endclass : uvma_adv_timer_b_dpi_seq_item_c


`endif // __UVMA_ADV_TIMER_B_DPI_SEQ_ITEM_SV__