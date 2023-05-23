// Copyright 2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMT_ADV_TIMER_B_RAND_STIM_TEST_SV__
`define __UVMT_ADV_TIMER_B_RAND_STIM_TEST_SV__


/**
 * Self-checking Test which runs Virtual Sequence 'rand_stim_vseq': fixed number of items of completely random stimulus.
 * @ingroup uvmt_adv_timer_b_tests
 */
class uvmt_adv_timer_b_rand_stim_test_c extends uvmt_adv_timer_b_base_test_c;

   rand uvme_adv_timer_b_rand_stim_vseq_c  rand_stim_vseq; ///< Virtual Sequence run during main_phase.


   `uvm_component_utils(uvmt_adv_timer_b_rand_stim_test_c)


   /**
    * Rules for this test.
    */
   constraint rand_stim_cons {
      env_cfg.scoreboarding_enabled == 1;
      if (test_cfg.cli_num_items_override) {
         rand_stim_vseq.num_items == test_cfg.cli_num_items;
      }
      else {
         rand_stim_vseq.num_items == uvme_adv_timer_b_default_num_items_cons;
      }
   }


   /**
    * Default constructor.
    */
   function new(string name="uvmt_adv_timer_b_rand_stim_test", uvm_component parent=null);
      super.new(name, parent);
   endfunction

   /**
    * Creates rand_stim_vseq.
    */
   virtual function void create_sequences();
      super.create_sequences();
      rand_stim_vseq = uvme_adv_timer_b_rand_stim_vseq_c::type_id::create("rand_stim_vseq");
   endfunction

   /**
    * Runs rand_stim_vseq on vsequencer.
    */
   virtual task main_phase(uvm_phase phase);
      phase.raise_objection(this);
      `uvm_info("TEST", $sformatf("Starting 'rand_stim_vseq' Virtual Sequence:\n%s", rand_stim_vseq.sprint()), UVM_NONE)
      rand_stim_vseq.start(vsequencer);
      `uvm_info("TEST", $sformatf("Finished 'rand_stim_vseq' Virtual Sequence:\n%s", rand_stim_vseq.sprint()), UVM_NONE)
      phase.drop_objection(this);
   endtask

   /**
    * Ensures that items were generated and that the scoreboard saw the same number of matches.
    */
   virtual function void check_phase(uvm_phase phase);
      super.check_phase(phase);
      if (rand_stim_vseq.num_items == 0) begin
         `uvm_error("TEST", "No items were generated")
      end
      if (rand_stim_vseq.num_items != env_cntxt.sb_cntxt.match_count) begin
         `uvm_error("TEST", $sformatf("Number of items driven in (%0d) and number of scoreboard matches (%0d) do not match", rand_stim_vseq.num_items, env_cntxt.sb_cntxt.match_count))
      end
   endfunction

endclass : uvmt_adv_timer_b_rand_stim_test_c


`endif // __UVMT_ADV_TIMER_B_RAND_STIM_TEST_SV__