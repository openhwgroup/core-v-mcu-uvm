// Copyright 2023 Acme Enterprises
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMT_ADV_TIMER_B_FIX_ILL_STIM_TEST_SV__
`define __UVMT_ADV_TIMER_B_FIX_ILL_STIM_TEST_SV__


/**
 * Self-checking Test which runs Virtual Sequence 'fix_ill_stim_vseq': reference partially illegal stimulus for the DUT.
 * @ingroup uvmt_adv_timer_b_tests
 */
class uvmt_adv_timer_b_fix_ill_stim_test_c extends uvmt_adv_timer_b_base_test_c;

   rand uvme_adv_timer_b_fix_ill_stim_vseq_c  fix_ill_stim_vseq; ///< Virtual Sequence run during main_phase.


   `uvm_component_utils(uvmt_adv_timer_b_fix_ill_stim_test_c)


   /**
    * Rules for this test.
    */
   constraint fix_ill_stim_cons {
      env_cfg.scoreboarding_enabled == 1;
   }


   /**
    * Default constructor.
    */
   function new(string name="uvmt_adv_timer_b_fix_ill_stim_test", uvm_component parent=null);
      super.new(name, parent);
   endfunction

   /**
    * Creates fix_ill_stim_vseq.
    */
   virtual function void create_sequences();
      super.create_sequences();
      fix_ill_stim_vseq = uvme_adv_timer_b_fix_ill_stim_vseq_c::type_id::create("fix_ill_stim_vseq");
   endfunction

   /**
    * Runs fix_ill_stim_vseq on vsequencer.
    */
   virtual task main_phase(uvm_phase phase);
      phase.raise_objection(this);
      `uvm_info("TEST", $sformatf("Starting 'fix_ill_stim_vseq' Virtual Sequence:\n%s", fix_ill_stim_vseq.sprint()), UVM_NONE)
      fix_ill_stim_vseq.start(vsequencer);
      `uvm_info("TEST", $sformatf("Finished 'fix_ill_stim_vseq' Virtual Sequence:\n%s", fix_ill_stim_vseq.sprint()), UVM_NONE)
      phase.drop_objection(this);
   endtask

   /**
    * Ensures that error events were observed and predicted.
    */
   virtual function void check_phase(uvm_phase phase);
      super.check_phase(phase);
      // TODO Implement uvmt_adv_timer_b_fix_ill_stim_test_c::check_phase()
      //      Ex: if (env_cntxt.prd_abc == 0) begin
      //             `uvm_error("TEST", "Did not predict ...")
      //          end
      //          if (env_cntxt.agent_cntxt.mon_abc == 0) begin
      //             `uvm_error("TEST", "Did not observe ... ")
      //          end
   endfunction : check_phase

endclass : uvmt_adv_timer_b_fix_ill_stim_test_c


`endif // __UVMT_ADV_TIMER_B_FIX_ILL_STIM_TEST_SV__