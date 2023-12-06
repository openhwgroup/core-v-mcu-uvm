// Copyright 2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMA_CVMCU_IO_SEQ_LIB_SV__
`define __UVMA_CVMCU_IO_SEQ_LIB_SV__


`include "uvma_cvmcu_io_base_seq.sv"
`include "uvma_cvmcu_io_fix_stim_seq.sv"
`include "uvma_cvmcu_io_rand_stim_seq.sv"
`include "uvma_cvmcu_io_fix_ill_stim_seq.sv"
`include "uvma_cvmcu_io_rand_ill_stim_seq.sv"


/**
 * Sequence Library containing Sequences for CORE-V-MCU IO UVM Agent.
 * @ingroup uvma_cvmcu_io_seq
 */
class uvma_cvmcu_io_seq_lib_c extends uvmx_seq_lib_c #(
   .T_SEQ_ITEM(uvmx_seq_item_c)
);

   `uvm_object_utils          (uvma_cvmcu_io_seq_lib_c)
   `uvm_sequence_library_utils(uvma_cvmcu_io_seq_lib_c)

   /**
    * Default constructor.
    */
   function new(string name="uvma_cvmcu_io_seq_lib");
      super.new(name);
   endfunction

   /**
    * Adds sequences to library
    */
   virtual function void add_lib_sequences();
      add_sequence(uvma_cvmcu_io_fix_stim_seq_c::get_type());
      add_sequence(uvma_cvmcu_io_rand_stim_seq_c::get_type());
      add_sequence(uvma_cvmcu_io_fix_ill_stim_seq_c::get_type());
      add_sequence(uvma_cvmcu_io_rand_ill_stim_seq_c::get_type());
   endfunction

endclass


`endif // __UVMA_CVMCU_IO_VSEQ_LIB_SV__