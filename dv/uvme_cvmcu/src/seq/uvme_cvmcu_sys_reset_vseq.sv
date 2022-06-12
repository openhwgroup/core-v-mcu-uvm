// Copyright 2022 Datum Technology Corporation
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVME_CVMCU_SYS_RESET_VSEQ_SV__
`define __UVME_CVMCU_SYS_RESET_VSEQ_SV__


/**
 * Virtual sequence responsible for asserting reset with the CORE-V MCU DUT.
 */
class uvme_cvmcu_sys_reset_vseq_c extends uvme_cvmcu_base_vseq_c;

   rand uvma_reset_pulse_seq_c  pulse_seq;


   `uvm_object_utils_begin(uvme_cvmcu_sys_reset_vseq_c)
      `uvm_field_object(pulse_seq, UVM_DEFAULT)
   `uvm_object_utils_end


   constraint pulse_seq_cons {
      pulse_seq.duration == 100;
   }


   /**
    * Default constructor.
    */
   extern function new(string name="uvme_cvmcu_sys_reset_vseq_c");

   /**
    * TODO Describe uvme_cvmcu_sys_reset_vseq_c::body()
    */
   extern virtual task body();

endclass : uvme_cvmcu_sys_reset_vseq_c


function uvme_cvmcu_sys_reset_vseq_c::new(string name="uvme_cvmcu_sys_reset_vseq_c");

   super.new(name);
   pulse_seq = uvma_reset_pulse_seq_c::type_id::create("pulse_seq");

endfunction : new


task uvme_cvmcu_sys_reset_vseq_c::body();

   `uvm_do_with(pulse_seq, p_sequencer.sys_reset_sequencer)

endtask : body


`endif // __UVME_CVMCU_SYS_RESET_VSEQ_SV__
