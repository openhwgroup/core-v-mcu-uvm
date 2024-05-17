// Copyright 2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMA_CVMCU_DBG_MON_TRN_SV__
`define __UVMA_CVMCU_DBG_MON_TRN_SV__


/**
 * Monitor Transaction rebuilt by the Monitor Virtual Sequence (uvma_cvmcu_dbg_mon_seq_c).
 * Analog of uvma_cvmcu_dbg_seq_item_c.
 * @ingroup uvma_cvmcu_dbg_obj
 */
class uvma_cvmcu_dbg_mon_trn_c extends uvmx_mon_trn_c #(
   .T_CFG  (uvma_cvmcu_dbg_cfg_c  ),
   .T_CNTXT(uvma_cvmcu_dbg_cntxt_c)
);

   /// @name Data
   /// @{
   uvma_cvmcu_dbg_event_type_enum  event_type; ///< Event type
   /// @}

   /// @name Metadata
   /// @{
   /// @}


   `uvm_object_utils_begin(uvma_cvmcu_dbg_mon_trn_c)
      `uvm_field_enum(uvma_cvmcu_dbg_event_type_enum, event_type, UVM_DEFAULT)
   `uvm_object_utils_end


   /**
    * Default constructor.
    */
   function new(string name="uvma_cvmcu_dbg_mon_trn");
      super.new(name);
   endfunction

   /**
    * Copies data from a sequence item instance.
    */
   virtual function void do_copy(uvm_object rhs);
      uvma_cvmcu_dbg_seq_item_c  item;
      super.do_copy(rhs);
      if ($cast(item, rhs)) begin
         event_type = item.event_type;
      end
   endfunction

   /**
    * TODO Implement or remove uvma_cvmcu_dbg_mon_trn_c::do_compare()
    */
   virtual function bit do_compare(uvm_object rhs, uvm_comparer comparer);
      uvma_cvmcu_dbg_mon_trn_c  trn;
      do_compare = super.do_compare(rhs, comparer);
      if (!$cast(trn, rhs)) begin
         `uvm_fatal("CVMCU_DBG_MON_TRN", "Failed to cast rhs during do_compare()")
      end
      else begin
         // Add compares dependent on configuration and/or fields
         // Ex: if (cfg.enable_abc) begin
         //        do_compare &= comparer.compare_field_int("abc", abc, trn.abc, 8);
         //     end
      end
   endfunction

   /**
    * TODO Implement or remove uvma_cvmcu_dbg_mon_trn_c::do_print()
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
      case (event_type)
         UVMA_CVMCU_DBG_DEBUG_REQ: val_str = "DEBUG_REQ";
         UVMA_CVMCU_DBG_STOP_TIMER: val_str = "STOP_TIMER";
      endcase
      `uvmx_metadata_field("event_type", val_str)
   endfunction

endclass


`endif // __UVMA_CVMCU_DBG_MON_TRN_SV__