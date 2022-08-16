// Copyright 2022 Datum Technology Corporation
// Copyright 2022 Low Power Futures
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMT_APB_TIMER_SMOKE_TEST_SV__
`define __UVMT_APB_TIMER_SMOKE_TEST_SV__


/**
 * Test which runs virtual sequence 'smoke_vseq'.
 */
class uvmt_apb_timer_smoke_test_c extends uvmt_apb_timer_base_test_c;

   rand uvme_apb_timer_smoke_vseq_c  smoke_vseq; ///< Virtual sequence to be run

   `uvm_component_utils(uvmt_apb_timer_smoke_test_c)

   /**
    * Creates smoke_vseq.
    */
   extern function new(string name="uvmt_apb_timer_smoke_test", uvm_component parent=null);

   /**
    * Runs smoke_vseq on vsequencer.
    */
   extern virtual task main_phase(uvm_phase phase);

   /**
    * Empty.
    */
   extern virtual task configure_phase(uvm_phase phase);

endclass : uvmt_apb_timer_smoke_test_c


function uvmt_apb_timer_smoke_test_c::new(string name="uvmt_apb_timer_smoke_test", uvm_component parent=null);

   super.new(name, parent);
   smoke_vseq = uvme_apb_timer_smoke_vseq_c::type_id::create("smoke_vseq");

endfunction : new


task uvmt_apb_timer_smoke_test_c::main_phase(uvm_phase phase);

   super.main_phase(phase);
   phase.raise_objection(this);
   `uvm_info("TEST", $sformatf("Starting 'smoke' virtual sequence:\n%s", smoke_vseq.sprint()), UVM_NONE)
   smoke_vseq.start(vsequencer);
   `uvm_info("TEST", $sformatf("Finished 'smoke' virtual sequence:\n%s", smoke_vseq.sprint()), UVM_NONE)
   phase.drop_objection(this);

endtask : main_phase


task uvmt_apb_timer_smoke_test_c::configure_phase(uvm_phase phase);

   // Do not update DUT with RAL contents for smoke test

endtask : configure_phase


`endif // __UVMT_APB_TIMER_SMOKE_TEST_SV__
