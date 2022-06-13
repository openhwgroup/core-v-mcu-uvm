// Copyright 2022 Datum Technology Corporation
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVME_CVMCU_INTR_ST_VSEQ_LIB_SV__
`define __UVME_CVMCU_INTR_ST_VSEQ_LIB_SV__


`include "uvme_cvmcu_intr_st_base_vseq.sv"
`include "uvme_cvmcu_intr_st_rand_stim_vseq.sv"


/**
 * Object cataloging the CORE-V MCU Interrupt UVM Agent self-test environment's virtual sequences.
 */
class uvme_cvmcu_intr_st_vseq_lib_c extends uvml_vseq_lib_c #(
   .REQ(uvm_sequence_item),
   .RSP(uvm_sequence_item)
);

   `uvm_object_utils          (uvme_cvmcu_intr_st_vseq_lib_c)
   `uvm_sequence_library_utils(uvme_cvmcu_intr_st_vseq_lib_c)

   /**
    * 1. Initializes sequence library
    * 2. Adds sequences to library
    */
   extern function new(string name="uvme_cvmcu_intr_st_vseq_lib");

endclass : uvme_cvmcu_intr_st_vseq_lib_c


function uvme_cvmcu_intr_st_vseq_lib_c::new(string name="uvme_cvmcu_intr_st_vseq_lib");

   super.new(name);
   init_sequence_library();

   add_sequence(uvme_cvmcu_intr_st_rand_stim_vseq_c::get_type());

endfunction : new


`endif // __UVME_CVMCU_INTR_ST_VSEQ_LIB_SV__
