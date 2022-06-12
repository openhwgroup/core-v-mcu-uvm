// Copyright 2022 Datum Technology Corporation
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMA_CVMCU_INTR_SEQ_LIB_SV__
`define __UVMA_CVMCU_INTR_SEQ_LIB_SV__


`include "uvma_cvmcu_intr_base_seq.sv"


/**
 * Object cataloging the CORE-V MCU Interrupt UVM Agent sequences.
 */
class uvma_cvmcu_intr_seq_lib_c extends uvml_seq_lib_c #(
   .REQ(uvm_sequence_item),
   .RSP(uvm_sequence_item)
);

   `uvm_object_utils          (uvma_cvmcu_intr_seq_lib_c)
   `uvm_sequence_library_utils(uvma_cvmcu_intr_seq_lib_c)


   /**
    * 1. Initializes sequence library
    * 2. Adds sequences to library
    */
   extern function new(string name="uvma_cvmcu_intr_seq_lib");

endclass : uvma_cvmcu_intr_seq_lib_c


function uvma_cvmcu_intr_seq_lib_c::new(string name="uvma_cvmcu_intr_seq_lib");

   super.new(name);
   init_sequence_library();

endfunction : new


`endif // __UVMA_CVMCU_INTR_SEQ_LIB_SV__
