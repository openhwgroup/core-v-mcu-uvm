// Copyright 2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMA_TCOUNTER_B_DPI_MON_TRN_SV__
`define __UVMA_TCOUNTER_B_DPI_MON_TRN_SV__


/**
 * Control Plane monitor transaction sampled by uvma_tcounter_b_dpi_mon_c.
 * @ingroup uvma_tcounter_b_obj
 */
class uvma_tcounter_b_dpi_mon_trn_c extends uvmx_mon_trn_c #(
   .T_CFG  (uvma_tcounter_b_cfg_c  ),
   .T_CNTXT(uvma_tcounter_b_cntxt_c)
);

   /// @name Data
   /// @{
   logic                                write_counter_i; ///< Loads counter value
   uvma_tcounter_b_counter_value_i_l_t  counter_value_i; ///< Counter value to be loaded
   /// @}

   /// @name Metadata
   /// @{
   /// @}


   `uvm_object_utils_begin(uvma_tcounter_b_dpi_mon_trn_c)
      `uvm_field_int(write_counter_i, UVM_DEFAULT)
      `uvm_field_int(counter_value_i, UVM_DEFAULT)
   `uvm_object_utils_end


   /**
    * Default constructor.
    */
   function new(string name="uvma_tcounter_b_dpi_mon_trn");
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

endclass : uvma_tcounter_b_dpi_mon_trn_c


`endif // __UVMA_TCOUNTER_B_DPI_MON_TRN_SV__