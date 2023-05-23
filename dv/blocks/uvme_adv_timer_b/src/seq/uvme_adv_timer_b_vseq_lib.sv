// Copyright 2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVME_ADV_TIMER_B_VSEQ_LIB_SV__
`define __UVME_ADV_TIMER_B_VSEQ_LIB_SV__


`include "uvme_adv_timer_b_base_vseq.sv"
`include "uvme_adv_timer_b_fix_ill_stim_vseq.sv"
`include "uvme_adv_timer_b_fix_stim_vseq.sv"
`include "uvme_adv_timer_b_rand_ill_stim_vseq.sv"
`include "uvme_adv_timer_b_rand_stim_vseq.sv"


/**
 * Virtual Sequence Library containing Sequences for  Block Environment.
 * @ingroup uvme_adv_timer_b_seq
 */
class uvme_adv_timer_b_vseq_lib_c extends uvmx_seq_lib_c #(
   .T_SEQ_ITEM(uvmx_seq_item_c)
);

   `uvm_object_utils          (uvme_adv_timer_b_vseq_lib_c)
   `uvm_sequence_library_utils(uvme_adv_timer_b_vseq_lib_c)

   /**
    * Default constructor.
    */
   function new(string name="uvme_adv_timer_b_vseq_lib");
      super.new(name);
   endfunction

   /**
    * Adds sequences to library.
    */
   virtual function void add_lib_sequences();
      add_sequence(uvme_adv_timer_b_fix_ill_stim_vseq_c ::get_type());
      add_sequence(uvme_adv_timer_b_fix_stim_vseq_c     ::get_type());
      add_sequence(uvme_adv_timer_b_rand_ill_stim_vseq_c::get_type());
      add_sequence(uvme_adv_timer_b_rand_stim_vseq_c    ::get_type());
   endfunction

endclass : uvme_adv_timer_b_vseq_lib_c


`endif // __UVME_ADV_TIMER_B_VSEQ_LIB_SV__