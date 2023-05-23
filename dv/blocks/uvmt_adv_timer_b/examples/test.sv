// Copyright 2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// This file contains sample code that demonstrates how to add a new test to the  Block Test Bench and UVM Test Library.


`ifndef __UVMT_ADV_TIMER_B_EXAMPLE_TEST_SV__
`define __UVMT_ADV_TIMER_B_EXAMPLE_TEST_SV__


/**
 * Self-checking Test which runs Virtual Sequence 'example_vseq'.
 * @ingroup uvmt_adv_timer_b_tests
 */
class uvmt_adv_timer_b_example_test_c extends uvmt_adv_timer_b_base_test_c;

   rand uvme_adv_timer_b_example_vseq_c  example_vseq; ///< Virtual Sequence run during main_phase.


   `uvm_component_utils(uvmt_adv_timer_b_example_test_c)


   /**
    * Rules for this test.
    */
   constraint example_cons {
      env_cfg.scoreboarding_enabled == 1;
      if (test_cfg.cli_num_items_override) {
         example_vseq.num_items == test_cfg.cli_num_items;
      }
      else {
         example_vseq.num_items == uvme_adv_timer_b_default_num_items_cons;
      }
   }


   /**
    * Default constructor.
    */
   function new(string name="uvmt_adv_timer_b_example_test", uvm_component parent=null);
      super.new(name, parent);
   endfunction

   /**
    * Creates example_vseq.
    */
   virtual function void create_sequences();
      example_vseq = uvme_adv_timer_b_example_vseq_c::type_id::create("example_vseq");
   endfunction

   /**
    * Runs example_vseq on vsequencer.
    */
   virtual task main_phase(uvm_phase phase);
      super.main_phase(phase);
      phase.raise_objection(this);
      `uvm_info("TEST", $sformatf("Starting 'example_vseq' Virtual Sequence:\n%s", example_vseq.sprint()), UVM_NONE)
      example_vseq.start(vsequencer);
      `uvm_info("TEST", $sformatf("Finished 'example_vseq' Virtual Sequence:\n%s", example_vseq.sprint()), UVM_NONE)
      phase.drop_objection(this);
   endtask

   /**
    * Ensures that items were generated and that the scoreboard saw the same number of matches.
    */
   virtual function void check_phase(uvm_phase phase);
      super.check_phase(phase);
      if (example_vseq.num_items == 0) begin
         `uvm_error("TEST", "No items were generated")
      end
      if (example_vseq.num_items != env_cntxt.sb_cntxt.match_count) begin
         `uvm_error("TEST", $sformatf("Number of items driven in (%0d) and number of scoreboard matches (%0d) do not match", example_vseq.num_items, env_cntxt.sb_cntxt.match_count))
      end
   endfunction

endclass : uvmt_adv_timer_b_example_test_c


`endif // __UVMT_ADV_TIMER_B_EXAMPLE_TEST_SV__