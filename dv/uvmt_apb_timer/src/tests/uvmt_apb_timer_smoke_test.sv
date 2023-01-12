// Copyright 2022-2023 Datum Technology Corporation
// All rights reserved.
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
   function new(string name="uvmt_apb_timer_smoke_test", uvm_component parent=null);
      super.new(name, parent);
      smoke_vseq = uvme_apb_timer_smoke_vseq_c::type_id::create("smoke_vseq");
   endfunction

   /**
    * Runs smoke_vseq on vsequencer.
    */
   virtual task configure_phase(uvm_phase phase);
      phase.raise_objection(this);
      `uvm_info("TEST", $sformatf("Starting smoke Virtual Sequence:\n%s", smoke_vseq.sprint()), UVM_NONE)
      smoke_vseq.start(vsequencer);
      `uvm_info("TEST", $sformatf("Finished smoke Virtual Sequence:\n%s", smoke_vseq.sprint()), UVM_NONE)
      phase.drop_objection(this);
   endtask

endclass : uvmt_apb_timer_smoke_test_c


`endif // __UVMT_APB_TIMER_SMOKE_TEST_SV__
