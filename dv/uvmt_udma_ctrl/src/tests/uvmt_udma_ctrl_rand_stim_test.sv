// Copyright 2022 Datum Technology Corporation
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMT_UDMA_CTRL_RAND_STIM_TEST_SV__
`define __UVMT_UDMA_CTRL_RAND_STIM_TEST_SV__


/**
 * Test which runs virtual sequence 'my_vseq' for 10 items of completely random stimulus.
 * @ingroup uvmt_udma_ctrl_tests
 */
class uvmt_udma_ctrl_rand_stim_test_c extends uvmt_udma_ctrl_base_test_c;

   rand uvme_udma_ctrl_rand_stim_vseq_c  rand_stim_vseq; ///< Virtual sequence to be run


   `uvm_component_utils(uvmt_udma_ctrl_rand_stim_test_c)


   /**
    *
    */
   constraint my_vseq_cons {
      rand_stim_vseq.num_items == 10;
   }


   /**
    * Creates rand_stim_vseq.
    */
   extern function new(string name="uvmt_udma_ctrl_rand_stim_test", uvm_component parent=null);

   /**
    * Runs rand_stim_vseq on vsequencer.
    */
   extern virtual task main_phase(uvm_phase phase);

endclass : uvmt_udma_ctrl_rand_stim_test_c


function uvmt_udma_ctrl_rand_stim_test_c::new(string name="uvmt_udma_ctrl_rand_stim_test", uvm_component parent=null);

   super.new(name, parent);
   rand_stim_vseq = uvme_udma_ctrl_rand_stim_vseq_c::type_id::create("rand_stim_vseq");

endfunction : new


task uvmt_udma_ctrl_rand_stim_test_c::main_phase(uvm_phase phase);

   super.main_phase(phase);
   phase.raise_objection(this);
   `uvm_info("TEST", $sformatf("Starting rand_stim virtual sequence:\n%s", rand_stim_vseq.sprint()), UVM_NONE)
   rand_stim_vseq.start(vsequencer);
   `uvm_info("TEST", $sformatf("Finished rand_stim virtual sequence:\n%s", rand_stim_vseq.sprint()), UVM_NONE)
   phase.drop_objection(this);

endtask : main_phase


`endif // __UVMT_UDMA_CTRL_RAND_STIM_TEST_SV__
