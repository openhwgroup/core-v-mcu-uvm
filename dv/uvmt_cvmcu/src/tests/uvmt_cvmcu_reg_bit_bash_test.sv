// Copyright 2022 Datum Technology Corporation
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMT_CVMCU_REG_BIT_BASH_TEST_SV__
`define __UVMT_CVMCU_REG_BIT_BASH_TEST_SV__


/**
 * Checks that all writable registers specified in the RAL are writable in the DUT.
 */
class uvmt_cvmcu_reg_bit_bash_test_c extends uvmt_cvmcu_reg_base_test_c;

   // Sequences
   rand uvme_cvmcu_reg_bit_bash_vseq_c  bit_bash_vseq;


   `uvm_component_utils(uvmt_cvmcu_reg_bit_bash_test_c)


   constraint defaults_cons {
      soft bit_bash_vseq.single_block_mode == 1;
   }


   /**
    * Creates bit_bash_vseq.
    */
   extern function new(string name="uvmt_cvmcu_reg_bit_bash_test", uvm_component parent=null);

   /**
    * Runs bit_bash_vseq on vsequencer.
    */
   extern virtual task configure_phase(uvm_phase phase);

endclass : uvmt_cvmcu_reg_bit_bash_test_c


function uvmt_cvmcu_reg_bit_bash_test_c::new(string name="uvmt_cvmcu_reg_bit_bash_test", uvm_component parent=null);

   super.new(name, parent);

   bit_bash_vseq = uvme_cvmcu_reg_bit_bash_vseq_c::type_id::create("bit_bash_vseq");

endfunction : new


task uvmt_cvmcu_reg_bit_bash_test_c::configure_phase(uvm_phase phase);

   super.configure_phase(phase);

   `uvm_info("TEST", $sformatf("Starting bit bash virtual sequence:\n%s", bit_bash_vseq.sprint()), UVM_NONE)
   bit_bash_vseq.single_block = test_cfg.selected_reg_block;
   bit_bash_vseq.start(vsequencer);
   `uvm_info("TEST", "Finished bit bash virtual sequence", UVM_NONE)

endtask : configure_phase


`endif // __UVMT_CVMCU_REG_BIT_BASH_TEST_SV__
