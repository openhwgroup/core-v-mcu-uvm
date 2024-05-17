// Copyright 2024 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVME_APB_ADV_TIMER_SS_SEQ_LIB_SV__
`define __UVME_APB_ADV_TIMER_SS_SEQ_LIB_SV__




/**
 * Sequence Library containing Sequences for the APB Advanced Timer Sub-System Environment.
 * @ingroup uvme_apb_adv_timer_ss_seq
 */
class uvme_apb_adv_timer_ss_seq_lib_c extends uvmx_seq_lib_c #(
   .T_SEQ_ITEM(uvmx_seq_item_base_c)
);

   `uvm_object_utils          (uvme_apb_adv_timer_ss_seq_lib_c)
   `uvm_sequence_library_utils(uvme_apb_adv_timer_ss_seq_lib_c)

   /**
    * Default constructor.
    */
    function new(string name="uvme_apb_adv_timer_ss_seq_lib");
      super.new(name);
   endfunction

   /**
    * Adds sequences to library.
    */
   virtual function void add_lib_sequences();
   endfunction

endclass : uvme_apb_adv_timer_ss_seq_lib_c


`endif // __UVME_APB_ADV_TIMER_SS_SEQ_LIB_SV__