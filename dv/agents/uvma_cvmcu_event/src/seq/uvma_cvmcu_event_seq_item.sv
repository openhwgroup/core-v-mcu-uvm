// Copyright 2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMA_CVMCU_EVENT_SEQ_ITEM_SV__
`define __UVMA_CVMCU_EVENT_SEQ_ITEM_SV__


/**
 * Sequence Item created by CORE-V-MCU Event Interface Sequences. Analog of uvma_cvmcu_event_mon_trn_c
 * @ingroup uvma_cvmcu_event_seq
 */
class uvma_cvmcu_event_seq_item_c extends uvmx_seq_item_c #(
   .T_CFG  (uvma_cvmcu_event_cfg_c  ),
   .T_CNTXT(uvma_cvmcu_event_cntxt_c)
);

   /// @name Data
   /// @{
   rand uvmx_byte_b_t  data[]; ///< Payload Data
   // TODO Add data fields
   //      Ex: rand uvma_cvmcu_event_user_b_t  user; ///< User Data
   /// @}

   /// @name Metadata
   /// @{
   rand int unsigned  data_size    ; ///< Size of #data
   rand int unsigned  bandwidth_pct; ///< % of #be to be used on average per active cycle
   /// @}


   `uvm_object_utils_begin(uvma_cvmcu_event_seq_item_c)
      `uvm_field_int(data_size, UVM_DEFAULT + UVM_DEC + UVM_NOPACK)
      `uvm_field_int(bandwidth_pct, UVM_DEFAULT + UVM_DEC + UVM_NOPACK)
      `uvm_field_array_int(data, UVM_DEFAULT)
   `uvm_object_utils_end


   /**
    * Bounds #data_size and #data.size().  Ensures #bandwitdh_pct is a legal value.
    */
   constraint limits_cons {
      data.size() == data_size;
      data_size inside {[`UVMA_CVMCU_EVENT_DATA_MIN_SIZE:`UVMA_CVMCU_EVENT_DATA_MAX_SIZE]};
      bandwidth_pct inside {[1:100]};
   }


   /**
    * Default constructor.
    */
   function new(string name="uvma_cvmcu_event_seq_item");
      super.new(name);
   endfunction

   /**
    * Copies data from monitor transaction.
    */
   virtual function void do_copy(uvm_object rhs);
      uvma_cvmcu_event_mon_trn_c  trn;
      super.do_copy(rhs);
      if ($cast(trn, rhs)) begin
         data_size = trn.data_size;
         data      = new[trn.data_size];
         foreach (data[ii]) begin
            data[ii] = trn.data[ii];
         end
      end
   endfunction

   /**
    * Describes transaction as metadata for logger.
    */
   virtual function uvmx_metadata_t get_metadata();
      string  data_size_str, bandwidth_pct_str, data_str;
      data_size_str     = $sformatf("%0d", data_size);
      bandwidth_pct_str = $sformatf("%0d", bandwidth_pct);
      data_str          = $sformatf("%h%h ... %h%h", data[data_size-1], data[data_size-2], data[1], data[0]);
      `uvmx_metadata_field("size" , data_size_str    )
      `uvmx_metadata_field("band%", bandwidth_pct_str)
      `uvmx_metadata_field("data" , data_str         )
   endfunction

endclass : uvma_cvmcu_event_seq_item_c


`endif // __UVMA_CVMCU_EVENT_SEQ_ITEM_SV__