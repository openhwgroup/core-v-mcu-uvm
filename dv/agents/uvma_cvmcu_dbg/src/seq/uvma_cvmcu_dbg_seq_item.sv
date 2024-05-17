// Copyright 2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMA_CVMCU_DBG_SEQ_ITEM_SV__
`define __UVMA_CVMCU_DBG_SEQ_ITEM_SV__


/**
 * Sequence Item created by CORE-V-MCU Debug Interface Sequences.
 * Analog of uvma_cvmcu_dbg_mon_trn_c
 * @ingroup uvma_cvmcu_dbg_seq_item
 */
class uvma_cvmcu_dbg_seq_item_c extends uvmx_seq_item_c #(
   .T_CFG  (uvma_cvmcu_dbg_cfg_c  ),
   .T_CNTXT(uvma_cvmcu_dbg_cntxt_c)
);

   /// @name Data
   /// @{
   rand uvma_cvmcu_dbg_event_type_enum  event_type; ///< Event type
   /// @}

   /// @name Metadata
   /// @{
   /// @}


   `uvm_object_utils_begin(uvma_cvmcu_dbg_seq_item_c)
      `uvm_field_enum(uvma_cvmcu_dbg_event_type_enum, event_type, UVM_DEFAULT)
   `uvm_object_utils_end


   /**
    * Describes data space.
    */
   constraint data_cons {
   }

   /**
    * Describes metadata space.
    */
   constraint metadata_cons {
   }

   /**
    * TODO Implement or remove uvma_cvmcu_dbg_seq_item_c::rules_cons
    */
   constraint rules_cons {
   }


   /**
    * Default constructor.
    */
   function new(string name="uvma_cvmcu_dbg_seq_item");
      super.new(name);
   endfunction


   /**
    * // TODO Implement or remove uvma_cvmcu_dbg_seq_item::post_randomize_work()
    */
   virtual function void post_randomize_work();
   endfunction

   /**
    * Copies data from a monitor transaction instance.
    */
   virtual function void do_copy(uvm_object rhs);
      uvma_cvmcu_dbg_mon_trn_c  trn;
      super.do_copy(rhs);
      if ($cast(trn, rhs)) begin
         event_type = trn.event_type;
      end
   endfunction

   /**
    * TODO Implement or remove uvma_cvmcu_dbg_seq_item_c::do_print()
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
      case (event_type)
         UVMA_CVMCU_DBG_DEBUG_REQ: val_str = "DEBUG_REQ";
         UVMA_CVMCU_DBG_STOP_TIMER: val_str = "STOP_TIMER";
      endcase
      `uvmx_metadata_field("event_type", val_str)
   endfunction

endclass


`endif // __UVMA_CVMCU_DBG_SEQ_ITEM_SV__