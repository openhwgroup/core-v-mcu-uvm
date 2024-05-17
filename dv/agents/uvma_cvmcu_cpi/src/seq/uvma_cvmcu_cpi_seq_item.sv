// Copyright 2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMA_CVMCU_CPI_SEQ_ITEM_SV__
`define __UVMA_CVMCU_CPI_SEQ_ITEM_SV__


/**
 * Sequence Item created by CORE-V-MCU Camera Parallel Interface Sequences.
 * Analog of uvma_cvmcu_cpi_mon_trn_c
 * @ingroup uvma_cvmcu_cpi_seq_item
 */
class uvma_cvmcu_cpi_seq_item_c extends uvmx_seq_item_c #(
   .T_CFG  (uvma_cvmcu_cpi_cfg_c  ),
   .T_CNTXT(uvma_cvmcu_cpi_cntxt_c)
);

   /// @name Data
   /// @{
   rand uvmx_byte_b_t  data[]; ///< Data to be transferred.
   rand int unsigned  data_size; ///< Size of transfer (in bytes).
   /// @}

   /// @name Metadata
   /// @{
   /// @}


   `uvm_object_utils_begin(uvma_cvmcu_cpi_seq_item_c)
      `uvm_field_int(data_size, UVM_DEFAULT + UVM_DEC + UVM_NOPACK)
      `uvm_field_array_int(data, UVM_DEFAULT)
   `uvm_object_utils_end


   /**
    * Describes data space.
    */
   constraint data_cons {
      data.size() == data_size;
   }

   /**
    * Describes metadata space.
    */
   constraint metadata_cons {
      data_size inside {[`UVMA_CVMCU_CPI_DATA_MIN_SIZE:`UVMA_CVMCU_CPI_DATA_MAX_SIZE]};
   }

   /**
    * TODO Implement or remove uvma_cvmcu_cpi_seq_item_c::rules_cons
    */
   constraint rules_cons {
   }


   /**
    * Default constructor.
    */
   function new(string name="uvma_cvmcu_cpi_seq_item");
      super.new(name);
   endfunction


   /**
    * // TODO Implement or remove uvma_cvmcu_cpi_seq_item::post_randomize_work()
    */
   virtual function void post_randomize_work();
   endfunction

   /**
    * Copies data from a monitor transaction instance.
    */
   virtual function void do_copy(uvm_object rhs);
      uvma_cvmcu_cpi_mon_trn_c  trn;
      super.do_copy(rhs);
      if ($cast(trn, rhs)) begin
         data_size = trn.data_size;
         data      = new[data_size];
         foreach (data[ii]) begin
            data[ii] = trn.data[ii];
         end
      end
   endfunction

   /**
    * TODO Implement or remove uvma_cvmcu_cpi_seq_item_c::do_print()
    */
   virtual function void do_print(uvm_printer printer);
      super.do_print(printer);
      // Print dependent on configuration and/or fields
      // Ex: if (cfg.enable_abc) begin
      //        printer.print_field("abc", abc, 8);
      //     end
   endfunction

   /**
    * Describes sequence item for logger.
    */
   virtual function uvmx_metadata_t get_metadata();
      string  val_str;
      val_str = $sformatf("%0d", data_size);
      `uvmx_metadata_field("size", val_str)
      `uvmx_metadata_field_darray("data", data)
   endfunction

endclass


`endif // __UVMA_CVMCU_CPI_SEQ_ITEM_SV__