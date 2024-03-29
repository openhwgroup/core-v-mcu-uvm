// Copyright 2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVME_APB_ADV_TIMER_SS_VSEQ_LIB_SV__
`define __UVME_APB_ADV_TIMER_SS_VSEQ_LIB_SV__


// TODO Include sequence files in uvme_apb_adv_timer_ss_vseq_lib.sv
//      Ex: `include "uvme_apb_adv_timer_ss_example_vseq.sv"


/**
 * Object cataloging the APB Advanced Timer Sub-System environment's virtual sequences.
 * @ingroup uvme_apb_adv_timer_ss_seq
 */
class uvme_apb_adv_timer_ss_vseq_lib_c extends uvmx_seq_lib_c #(
   .T_SEQ_ITEM(uvmx_seq_item_base_c)
);

   `uvm_object_utils          (uvme_apb_adv_timer_ss_vseq_lib_c)
   `uvm_sequence_library_utils(uvme_apb_adv_timer_ss_vseq_lib_c)

   /**
    * Default constructor.
    */
    function new(string name="uvme_apb_adv_timer_ss_vseq_lib");
      super.new(name);
   endfunction

   /**
    * User hook.
    */
   virtual function void add_lib_sequences();
      // TODO Add Sequences to uvme_apb_adv_timer_ss_vseq_lib_c
      // Ex: add_sequence(uvme_apb_adv_timer_ss_example_vseq_c::get_type());
   endfunction

endclass : uvme_apb_adv_timer_ss_vseq_lib_c


`endif // __UVME_APB_ADV_TIMER_SS_VSEQ_LIB_SV__