// Copyright 2022 Datum Technology Corporation
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVME_CVMCU_REG_HW_RESET_VSEQ_SV__
`define __UVME_CVMCU_REG_HW_RESET_VSEQ_SV__


/**
 * Virtual sequence that checks that the hardware reset value specified in the register block (uvme_cvmcu_reg_block_c) matches the DUT's.
 */
class uvme_cvmcu_reg_hw_reset_vseq_c extends uvme_cvmcu_reg_base_vseq_c;

   `include "uvme_cvmcu_reg_hw_reset_vseq_ignore_list.sv"

   rand uvm_reg_hw_reset_seq  hw_reset_seq; ///< Sequence to be run


   `uvm_object_utils_begin(uvme_cvmcu_reg_hw_reset_vseq_c)
      `uvm_field_object(hw_reset_seq, UVM_DEFAULT)
   `uvm_object_utils_end


   /**
    * Default constructor.
    */
   extern function new(string name="uvme_cvmcu_reg_hw_reset_vseq");

   /**
    * TODO Describe uvme_cvmcu_reg_hw_reset_vseq_c::add_to_ignore_list()
    */
   extern virtual function void add_to_ignore_list();

   /**
    * TODO Describe uvme_cvmcu_reg_hw_reset_vseq_c::run_single_block()
    */
   extern virtual task run_single_block();

   /**
    * TODO Describe uvme_cvmcu_reg_hw_reset_vseq_c::run_all_blocks()
    */
   extern virtual task run_all_blocks();

endclass : uvme_cvmcu_reg_hw_reset_vseq_c


function uvme_cvmcu_reg_hw_reset_vseq_c::new(string name="uvme_cvmcu_reg_hw_reset_vseq");

   super.new(name);
   hw_reset_seq = uvm_reg_hw_reset_seq::type_id::create("hw_reset_seq");

endfunction : new


function void uvme_cvmcu_reg_hw_reset_vseq_c::add_to_ignore_list();

   foreach (reset_ignore_list[ii]) begin
      ignore_list.push_back(reset_ignore_list[ii]);
   end

endfunction : add_to_ignore_list


task uvme_cvmcu_reg_hw_reset_vseq_c::run_single_block();

   hw_reset_seq.model = single_block;
   `uvm_send(hw_reset_seq)

endtask : run_single_block


task uvme_cvmcu_reg_hw_reset_vseq_c::run_all_blocks();

   hw_reset_seq.model = cfg.cvmcu_reg_block;
   `uvm_send(hw_reset_seq)

endtask : run_all_blocks


`endif // __UVME_CVMCU_REG_HW_RESET_VSEQ_SV__
