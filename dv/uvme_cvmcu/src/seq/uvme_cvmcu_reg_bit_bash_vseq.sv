// Copyright 2022 Datum Technology Corporation
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVME_CVMCU_REG_BIT_BASH_VSEQ_SV__
`define __UVME_CVMCU_REG_BIT_BASH_VSEQ_SV__


/**
 * Virtual sequence that checks that  writable registers specified in the RAL
 * (uvme_cvmcu_ral_c) are writable in the DUT as well.
 */
class uvme_cvmcu_reg_bit_bash_vseq_c extends uvme_cvmcu_reg_base_vseq_c;

   `include "uvme_cvmcu_reg_bit_bash_vseq_ignore_list.sv"

   rand uvm_reg_bit_bash_seq  bit_bash_seq; ///< Sequence to be run


   `uvm_object_utils_begin(uvme_cvmcu_reg_bit_bash_vseq_c)
      `uvm_field_object(bit_bash_seq, UVM_DEFAULT)
   `uvm_object_utils_end


   /**
    * Default constructor.
    */
   extern function new(string name="uvme_cvmcu_reg_bit_bash_vseq");

   /**
    * TODO Describe uvme_cvmcu_reg_bit_bash_vseq_c::add_to_ignore_list()
    */
   extern virtual function void add_to_ignore_list();

   /**
    * TODO Describe uvme_cvmcu_reg_bit_bash_vseq_c::run_single_block()
    */
   extern virtual task run_single_block();

   /**
    * TODO Describe uvme_cvmcu_reg_bit_bash_vseq_c::run_all_blocks()
    */
   extern virtual task run_all_blocks();

endclass : uvme_cvmcu_reg_bit_bash_vseq_c


function uvme_cvmcu_reg_bit_bash_vseq_c::new(string name="uvme_cvmcu_reg_bit_bash_vseq");

   super.new(name);
   bit_bash_seq = uvm_reg_bit_bash_seq::type_id::create("bit_bash_seq");

endfunction : new


function void uvme_cvmcu_reg_bit_bash_vseq_c::add_to_ignore_list();

   foreach (bb_ignore_list[ii]) begin
      ignore_list.push_back(bb_ignore_list[ii]);
   end

endfunction : add_to_ignore_list


task uvme_cvmcu_reg_bit_bash_vseq_c::run_single_block();

   bit_bash_seq.model = single_block;
   `uvm_send(bit_bash_seq)

endtask : run_single_block


task uvme_cvmcu_reg_bit_bash_vseq_c::run_all_blocks();

   bit_bash_seq.model = cfg.cvmcu_reg_block;
   `uvm_send(bit_bash_seq)

endtask : run_all_blocks


`endif // __UVME_CVMCU_REG_BIT_BASH_VSEQ_SV__
