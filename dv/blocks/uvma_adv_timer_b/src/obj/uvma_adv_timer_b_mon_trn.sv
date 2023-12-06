// Copyright 2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMA_ADV_TIMER_B_MON_TRN_SV__
`define __UVMA_ADV_TIMER_B_MON_TRN_SV__


/**
 * Monitor Transaction rebuilt by the Monitor Sequence (uvma_adv_timer_b_mon_seq_c).
 * Analog of uvma_adv_timer_b_seq_item_c.
 * @ingroup uvma_adv_timer_b_obj
 */
class uvma_adv_timer_b_mon_trn_c extends uvmx_block_mon_trn_c #(
   .T_CFG  (uvma_adv_timer_b_cfg_c  ),
   .T_CNTXT(uvma_adv_timer_b_cntxt_c)
);

   /// @name Data
   /// @{
   /// @}


   `uvm_object_utils_begin(uvma_adv_timer_b_mon_trn_c)
      `uvm_field_enum(uvmx_block_mon_direction_enum, direction, UVM_DEFAULT)
    `uvm_object_utils_end


   /**
    * Default constructor.
    */
   function new(string name="uvma_adv_timer_b_mon_trn");
      super.new(name);
   endfunction

   /**
    * TODO Implement or remove uvma_adv_timer_b_mon_trn_c::do_compare()
    */
   virtual function bit do_compare(uvm_object rhs, uvm_comparer comparer);
      uvma_adv_timer_b_mon_trn_c  trn;
      do_compare = super.do_compare(rhs, comparer);
      if (!$cast(trn, rhs)) begin
         `uvm_fatal("<built-in method upper of str object at 0x7f386bd6a1f0>_MON_TRN", "Failed to cast rhs during do_compare()")
      end
      else begin
         // Add compares dependent on configuration and/or fields
         // Ex: if (cfg.enable_abc) begin
         //        do_compare &= comparer.compare_field_int("abc", abc, trn.abc, 8);
         //     end
      end
   endfunction

   /**
    * TODO Implement or remove uvma_adv_timer_b_mon_trn_c::do_print()
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


`endif // __UVMA_ADV_TIMER_B_MON_TRN_SV__