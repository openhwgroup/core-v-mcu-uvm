// Copyright 2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMA_CVMCU_IO_MON_TRN_SV__
`define __UVMA_CVMCU_IO_MON_TRN_SV__


/**
 * Monitor Transaction rebuilt by the Monitor Virtual Sequence (uvma_cvmcu_io_mon_vseq_c).
 * Analog of uvma_cvmcu_io_seq_item_c.
 * @ingroup uvma_cvmcu_io_obj
 */
class uvma_cvmcu_io_mon_trn_c extends uvmx_mon_trn_c #(
   .T_CFG  (uvma_cvmcu_io_cfg_c  ),
   .T_CNTXT(uvma_cvmcu_io_cntxt_c)
);

   /// @name Data
   /// @{
   int unsigned  data_size; ///< Size of #data
   uvmx_byte_l_t  data[]; ///< Payload Data
   // TODO Add data fields
   //      Ex: uvma_cvmcu_io_user_l_t  user; ///< User Data
   /// @}

   /// @name Metadata
   /// @{
   // TODO Add data fields
   //      Ex: int unsigned  latency; ///< TODO Describe me
   /// @}


   `uvm_object_utils_begin(uvma_cvmcu_io_mon_trn_c)
      `uvm_field_int(data_size, UVM_DEFAULT + UVM_DEC + UVM_NOPACK)
      `uvm_field_array_int(data, UVM_DEFAULT)
   `uvm_object_utils_end


   /**
    * Default constructor.
    */
   function new(string name="uvma_cvmcu_io_mon_trn");
      super.new(name);
   endfunction

   /**
    * Copies data from sequence item.
    */
   virtual function void do_copy(uvm_object rhs);
      uvma_cvmcu_io_seq_item_c  item;
      super.do_copy(rhs);
      if ($cast(item, rhs)) begin
         data_size = item.data_size;
         data      = new[item.data_size];
         foreach (data[ii]) begin
            data[ii] = item.data[ii];
         end
      end
   endfunction

   /**
    * Describes transaction as metadata for uvml_logs_metadata_logger_c.
    */
   virtual function uvmx_metadata_t get_metadata();
      string        data_size_str, data_str;
      data_size_str = $sformatf("%0d", data_size);
      data_str = $sformatf("%h%h ... %h%h", data[data_size-1], data[data_size-2], data[1], data[0]);
      `uvmx_metadata_field("size", data_size_str)
      `uvmx_metadata_field("data", data_str)
   endfunction

endclass : uvma_cvmcu_io_mon_trn_c


`endif // __UVMA_CVMCU_IO_MON_TRN_SV__