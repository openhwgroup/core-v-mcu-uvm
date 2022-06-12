// Copyright 2022 Datum Technology Corporation
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVME_CVMCU_VSEQ_LIB_SV__
`define __UVME_CVMCU_VSEQ_LIB_SV__


`include "uvme_cvmcu_base_vseq.sv"
`include "uvme_cvmcu_sys_clk_vseq.sv"
`include "uvme_cvmcu_sys_reset_vseq.sv"
`include "uvme_cvmcu_reg_base_vseq.sv"
`include "uvme_cvmcu_reg_bit_bash_vseq.sv"
`include "uvme_cvmcu_reg_hw_reset_vseq.sv"
`include "uvme_cvmcu_smoke_vseq.sv"


/**
 * Object cataloging the CORE-V MCU environment's virtual sequences.
 */
class uvme_cvmcu_vseq_lib_c extends uvml_vseq_lib_c #(
   .REQ(uvm_sequence_item),
   .RSP(uvm_sequence_item)
);


   `uvm_object_utils          (uvme_cvmcu_vseq_lib_c)
   `uvm_sequence_library_utils(uvme_cvmcu_vseq_lib_c)


   /**
    * Initializes sequence library
    */
   extern function new(string name="uvme_cvmcu_vseq_lib");

endclass : uvme_cvmcu_vseq_lib_c


function uvme_cvmcu_vseq_lib_c::new(string name="uvme_cvmcu_vseq_lib");

   super.new(name);
   init_sequence_library();

   add_sequence(uvme_cvmcu_reg_bit_bash_vseq_c::get_type());
   add_sequence(uvme_cvmcu_reg_hw_reset_vseq_c::get_type());
   add_sequence(uvme_cvmcu_smoke_vseq_c       ::get_type());

endfunction : new


`endif // __UVME_CVMCU_VSEQ_LIB_SV__
