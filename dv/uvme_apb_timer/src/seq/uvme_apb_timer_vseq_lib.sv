// Copyright 2022 Datum Technology Corporation
// Copyright 2022 Low Power Futures
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVME_APB_TIMER_VSEQ_LIB_SV__
`define __UVME_APB_TIMER_VSEQ_LIB_SV__


`include "uvme_apb_timer_base_vseq.sv"
`include "uvme_apb_timer_sys_clk_vseq.sv"
`include "uvme_apb_timer_sys_reset_vseq.sv"
`include "uvme_apb_timer_reg_base_vseq.sv"
`include "uvme_apb_timer_reg_bit_bash_vseq.sv"
`include "uvme_apb_timer_reg_hw_reset_vseq.sv"
`include "uvme_apb_timer_smoke_vseq.sv"


/**
 * Object cataloging the CORE-V MCU APB Timer Sub-System environment's virtual sequences.
 * @ingroup uvme_apb_timer_seq
 */
class uvme_apb_timer_vseq_lib_c extends uvml_vseq_lib_c #(
   .REQ(uvm_sequence_item),
   .RSP(uvm_sequence_item)
);

   `uvm_object_utils          (uvme_apb_timer_vseq_lib_c)
   `uvm_sequence_library_utils(uvme_apb_timer_vseq_lib_c)

   /**
    * 1. Initializes sequence library
    * 2. Adds sequences to library
    */
   extern function new(string name="uvme_apb_timer_vseq_lib");

endclass : uvme_apb_timer_vseq_lib_c


function uvme_apb_timer_vseq_lib_c::new(string name="uvme_apb_timer_vseq_lib");

   super.new(name);
   init_sequence_library();
   add_sequence(uvme_apb_timer_reg_bit_bash_vseq_c::get_type());
   add_sequence(uvme_apb_timer_reg_hw_reset_vseq_c::get_type());

endfunction : new


`endif // __UVME_APB_TIMER_VSEQ_LIB_SV__
