// Copyright 2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMA_TPRESCALER_B_SEQ_ITEM_SV__
`define __UVMA_TPRESCALER_B_SEQ_ITEM_SV__


/**
 * Sequence Item created by Timer unit prescaler Sequences.
 * Analog of uvma_tprescaler_b_mon_trn_c
 * @ingroup uvma_tprescaler_b_seq
 */
class uvma_tprescaler_b_seq_item_c extends uvmx_block_seq_item_c #(
   .T_CFG  (uvma_tprescaler_b_cfg_c  ),
   .T_CNTXT(uvma_tprescaler_b_cntxt_c)
);

   /// @name Data
   /// @{
   /// @}



   `uvm_object_utils_begin(uvma_tprescaler_b_seq_item_c)
   `uvm_object_utils_end


   /**
    * Describes data space.
    */
   constraint data_cons {
   }

   /**
    * TODO Implement or remove uvma_tprescaler_b_seq_item_c::rules_cons
    */
   constraint rules_cons {
   }


   /**
    * Default constructor.
    */
   function new(string name="uvma_tprescaler_b_seq_item");
      super.new(name);
   endfunction


   /**
    * TODO Implement or remove uvma_tprescaler_b_seq_item_c::post_randomize()
    */
   virtual function void post_randomize_work();
   endfunction


   /**
    * TODO Implement or remove uvma_tprescaler_b_seq_item_c::do_print()
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


`endif // __UVMA_TPRESCALER_B_SEQ_ITEM_SV__