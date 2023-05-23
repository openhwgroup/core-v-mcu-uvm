// Copyright 2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMA_TPRESCALER_B_DPI_SEQ_ITEM_SV__
`define __UVMA_TPRESCALER_B_DPI_SEQ_ITEM_SV__


/**
 * Sequence Item providing stimulus for the Data Plane Input driver (uvma_tprescaler_b_dpi_drv_c).
 * @ingroup uvma_tprescaler_b_seq
 */
class uvma_tprescaler_b_dpi_seq_item_c extends uvmx_seq_item_c #(
   .T_CFG  (uvma_tprescaler_b_cfg_c  ),
   .T_CNTXT(uvma_tprescaler_b_cntxt_c)
);

   /// @name Data
   /// @{
   rand bit                                    write_counter_i; ///< 
   rand uvma_tprescaler_b_counter_value_i_b_t  counter_value_i; ///< 
   /// @}

   /// @name Metadata
   /// @{
   /// @}


   `uvm_object_utils_begin(uvma_tprescaler_b_dpi_seq_item_c)
      `uvm_field_int(write_counter_i, UVM_DEFAULT)
      `uvm_field_int(counter_value_i, UVM_DEFAULT)
   `uvm_object_utils_end


   /**
    * Default constructor.
    */
   function new(string name="uvma_tprescaler_b_dpi_seq_item");
      super.new(name);
   endfunction

   /**
    * Describes transaction for logger.
    */
   virtual function uvmx_metadata_t get_metadata();
      string write_counter_i_str;
      string counter_value_i_str;
      write_counter_i_str = $sformatf("%b", write_counter_i);
      counter_value_i_str = $sformatf("%h", counter_value_i);
      `uvmx_metadata_field("write_counter_i", write_counter_i_str)
      `uvmx_metadata_field("counter_value_i", counter_value_i_str)
   endfunction

endclass : uvma_tprescaler_b_dpi_seq_item_c


`endif // __UVMA_TPRESCALER_B_DPI_SEQ_ITEM_SV__