// Copyright 2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVME_TCOUNTER_B_SEQ_LIB_SV__
`define __UVME_TCOUNTER_B_SEQ_LIB_SV__


`include "uvme_tcounter_b_base_seq.sv"
`include "uvme_tcounter_b_fix_stim_seq.sv"
`include "uvme_tcounter_b_rand_stim_seq.sv"
`include "uvme_tcounter_b_fix_ill_stim_seq.sv"
`include "uvme_tcounter_b_rand_ill_stim_seq.sv"


/**
 * Sequence Library containing Sequences for Timer unit counter Block Environment.
 * @ingroup uvme_tcounter_b_seq
 */
class uvme_tcounter_b_seq_lib_c extends uvmx_seq_lib_c #(
   .T_SEQ_ITEM(uvmx_seq_item_c)
);

   `uvm_object_utils          (uvme_tcounter_b_seq_lib_c)
   `uvm_sequence_library_utils(uvme_tcounter_b_seq_lib_c)

   /**
    * Default constructor.
    */
   function new(string name="uvme_tcounter_b_seq_lib");
      super.new(name);
   endfunction

   /**
    * Adds sequences to library.
    */
   virtual function void add_lib_sequences();
      add_sequence(uvme_tcounter_b_fix_stim_seq_c::get_type());
      add_sequence(uvme_tcounter_b_rand_stim_seq_c::get_type());
      add_sequence(uvme_tcounter_b_fix_ill_stim_seq_c::get_type());
      add_sequence(uvme_tcounter_b_rand_ill_stim_seq_c::get_type());
   endfunction

endclass


`endif // __UVME_TCOUNTER_B_SEQ_LIB_SV__