// Copyright 2022 Datum Technology Corporation
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// This file contains sample code that demonstrates how to add a new test to the CORE-V MCU Interrupt UVM Agent Self-Test
// Bench and UVM Test Library.


`ifndef __UVMT_CVMCU_INTR_ST_MY_TEST_SV__
`define __UVMT_CVMCU_INTR_ST_MY_TEST_SV__


/**
 * Test which runs virtual sequence 'my_vseq' for 100 items of stimulus.
 */
class uvmt_cvmcu_intr_st_my_test_c extends uvmt_cvmcu_intr_st_base_test_c;

   rand uvme_cvmcu_intr_st_my_vseq_c  my_vseq; ///< Virtual sequence to be run


   `uvm_component_utils(uvmt_cvmcu_intr_st_my_test_c)


   /**
    *
    */
   constraint my_vseq_cons {
      my_vseq.num_items == 100;
   }


   /**
    * Creates my_vseq.
    */
   extern function new(string name="uvmt_cvmcu_intr_st_my_test", uvm_component parent=null);

   /**
    * Runs my_vseq on vsequencer.
    */
   extern virtual task main_phase(uvm_phase phase);

endclass : uvmt_cvmcu_intr_st_my_test_c


function uvmt_cvmcu_intr_st_my_test_c::new(string name="uvmt_cvmcu_intr_st_my_test", uvm_component parent=null);

   super.new(name, parent);
   my_vseq = uvme_cvmcu_intr_st_my_vseq_c::type_id::create("my_vseq");

endfunction : new


task uvmt_cvmcu_intr_st_my_test_c::main_phase(uvm_phase phase);

   super.main_phase(phase);

   phase.raise_objection(this);
   `uvm_info("TEST", $sformatf("Starting my virtual sequence:\n%s", my_vseq.sprint()), UVM_NONE)
   my_vseq.start(vsequencer);
   `uvm_info("TEST", $sformatf("Finished my virtual sequence:\n%s", my_vseq.sprint()), UVM_NONE)
   phase.drop_objection(this);

endtask : main_phase


`endif // __UVMT_CVMCU_INTR_ST_MY_TEST_SV__
