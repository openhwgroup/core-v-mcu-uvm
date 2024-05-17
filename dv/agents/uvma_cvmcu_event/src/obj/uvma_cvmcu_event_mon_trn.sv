// Copyright 2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMA_CVMCU_EVENT_MON_TRN_SV__
`define __UVMA_CVMCU_EVENT_MON_TRN_SV__


/**
 * Monitor Transaction rebuilt by the Monitor Virtual Sequence (uvma_cvmcu_event_mon_seq_c).
 * Analog of uvma_cvmcu_event_seq_item_c.
 * @ingroup uvma_cvmcu_event_obj
 */
class uvma_cvmcu_event_mon_trn_c extends uvmx_mon_trn_c #(
   .T_CFG  (uvma_cvmcu_event_cfg_c  ),
   .T_CNTXT(uvma_cvmcu_event_cntxt_c)
);

   /// @name Data
   /// @{
   /// @}

   /// @name Metadata
   /// @{
   uvma_cvmcu_event_direction_enum  direction; ///< Directionality of this transaction
   /// @}


   `uvm_object_utils_begin(uvma_cvmcu_event_mon_trn_c)
      `uvm_field_enum(uvma_cvmcu_event_direction_enum, direction, UVM_DEFAULT + UVM_NOCOMPARE + UVM_NOPACK)
   `uvm_object_utils_end


   /**
    * Default constructor.
    */
   function new(string name="uvma_cvmcu_event_mon_trn");
      super.new(name);
   endfunction

   /**
    * Copies data from a sequence item instance.
    */
   virtual function void do_copy(uvm_object rhs);
      uvma_cvmcu_event_seq_item_c  item;
      super.do_copy(rhs);
      if ($cast(item, rhs)) begin
         direction = item.direction;
      end
   endfunction

   /**
    * TODO Implement or remove uvma_cvmcu_event_mon_trn_c::do_compare()
    */
   virtual function bit do_compare(uvm_object rhs, uvm_comparer comparer);
      uvma_cvmcu_event_mon_trn_c  trn;
      do_compare = super.do_compare(rhs, comparer);
      if (!$cast(trn, rhs)) begin
         `uvm_fatal("CVMCU_EVENT_MON_TRN", "Failed to cast rhs during do_compare()")
      end
      else begin
         // Add compares dependent on configuration and/or fields
         // Ex: if (cfg.enable_abc) begin
         //        do_compare &= comparer.compare_field_int("abc", abc, trn.abc, 8);
         //     end
      end
   endfunction

   /**
    * TODO Implement or remove uvma_cvmcu_event_mon_trn_c::do_print()
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
   endfunction

endclass


`endif // __UVMA_CVMCU_EVENT_MON_TRN_SV__