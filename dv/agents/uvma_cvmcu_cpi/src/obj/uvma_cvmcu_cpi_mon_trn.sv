// Copyright 2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMA_CVMCU_CPI_MON_TRN_SV__
`define __UVMA_CVMCU_CPI_MON_TRN_SV__


/**
 * Monitor Transaction rebuilt by the Monitor Virtual Sequence (uvma_cvmcu_cpi_mon_seq_c).
 * Analog of uvma_cvmcu_cpi_seq_item_c.
 * @ingroup uvma_cvmcu_cpi_obj
 */
class uvma_cvmcu_cpi_mon_trn_c extends uvmx_mon_trn_c #(
   .T_CFG  (uvma_cvmcu_cpi_cfg_c  ),
   .T_CNTXT(uvma_cvmcu_cpi_cntxt_c)
);

   /// @name Data
   /// @{
   uvmx_byte_l_t  data[$]; ///< Data transferred.
   int unsigned  data_size; ///< Size of transfer (in bytes).
   /// @}

   /// @name Metadata
   /// @{
   /// @}


   `uvm_object_utils_begin(uvma_cvmcu_cpi_mon_trn_c)
      `uvm_field_int(data_size, UVM_DEFAULT + UVM_DEC + UVM_NOPACK)
      `uvm_field_queue_int(data, UVM_DEFAULT)
   `uvm_object_utils_end


   /**
    * Default constructor.
    */
   function new(string name="uvma_cvmcu_cpi_mon_trn");
      super.new(name);
   endfunction

   /**
    * Copies data from a sequence item instance.
    */
   virtual function void do_copy(uvm_object rhs);
      uvma_cvmcu_cpi_seq_item_c  item;
      super.do_copy(rhs);
      if ($cast(item, rhs)) begin
         data_size = item.data_size;
         foreach (item.data[ii]) begin
            data.push_back(item.data[ii]);
         end
      end
   endfunction

   /**
    * TODO Implement or remove uvma_cvmcu_cpi_mon_trn_c::do_compare()
    */
   virtual function bit do_compare(uvm_object rhs, uvm_comparer comparer);
      uvma_cvmcu_cpi_mon_trn_c  trn;
      do_compare = super.do_compare(rhs, comparer);
      if (!$cast(trn, rhs)) begin
         `uvm_fatal("CVMCU_CPI_MON_TRN", "Failed to cast rhs during do_compare()")
      end
      else begin
         // Add compares dependent on configuration and/or fields
         // Ex: if (cfg.enable_abc) begin
         //        do_compare &= comparer.compare_field_int("abc", abc, trn.abc, 8);
         //     end
      end
   endfunction

   /**
    * TODO Implement or remove uvma_cvmcu_cpi_mon_trn_c::do_print()
    */
   virtual function void do_print(uvm_printer printer);
      super.do_print(printer);
      // Print dependent on configuration and/or fields
      // Ex: if (cfg.enable_abc) begin
      //        printer.print_field("abc", abc, 8);
      //     end
   endfunction

   /**
    * Describes transaction for logger.
    */
   virtual function uvmx_metadata_t get_metadata();
      string  val_str;
      val_str = $sformatf("%0d", data_size);
      `uvmx_metadata_field("size", val_str)
      val_str = $sformatf("%h%h ... %h%h", data[data_size-1], data[data_size-2], data[1], data[0]);
      `uvmx_metadata_field("data", val_str)
   endfunction

endclass


`endif // __UVMA_CVMCU_CPI_MON_TRN_SV__