// Copyright 2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMT__ST_RAND_ILL_STIM_TEST_SV__
`define __UVMT__ST_RAND_ILL_STIM_TEST_SV__


/**
 * Self-checking Test which runs Virtual Sequence 'rand_ill_stim_vseq': fixed number of items of completely random, partially illegal stimulus.
 * @ingroup uvmt_cvmcu_cpi_st_tests
 */
class uvmt_cvmcu_cpi_st_rand_ill_stim_test_c extends uvmt_cvmcu_cpi_st_base_test_c;

   rand uvme_cvmcu_cpi_st_rand_ill_stim_vseq_c  rand_ill_stim_vseq; ///< Virtual Sequence run during main_phase.


   `uvm_component_utils(uvmt_cvmcu_cpi_st_rand_ill_stim_test_c)


   /**
    * Rules for this test.
    */
   constraint rand_ill_stim_cons {
      env_cfg.scoreboarding_enabled == 1;
      //if (test_cfg.cli_num_items_override) {
      //   rand_ill_stim_vseq.num_items == test_cfg.cli_num_items;
      //}
      //else {
      //   rand_ill_stim_vseq.num_items == uvme_cvmcu_cpi_st_default_num_items_cons;
      //}
   }


   /**
    * Default constructor.
    */
   function new(string name="uvmt_cvmcu_cpi_st_fixed_stim_test", uvm_component parent=null);
      super.new(name, parent);
   endfunction

   /**
    * Creates rand_ill_stim_vseq.
    */
   virtual function void create_sequences();
      super.create_sequences();
      rand_ill_stim_vseq = uvme_cvmcu_cpi_st_rand_ill_stim_vseq_c::type_id::create("rand_ill_stim_vseq");
   endfunction

   /**
    * Runs rand_ill_stim_vseq on vsequencer.
    */
   virtual task main_phase(uvm_phase phase);
      phase.raise_objection(this);
      `uvm_info("TEST", $sformatf("Starting 'rand_ill_stim_vseq' Virtual Sequence:\n%s", rand_ill_stim_vseq.sprint()), UVM_NONE)
      rand_ill_stim_vseq.start(vsequencer);
      `uvm_info("TEST", $sformatf("Finished 'rand_ill_stim_vseq' Virtual Sequence:\n%s", rand_ill_stim_vseq.sprint()), UVM_NONE)
      phase.drop_objection(this);
   endtask

   /**
    * Ensures that error events were observed, predicted, scoreboarded, and that the counts match what was driven in.
    */
   virtual function void check_phase(uvm_phase phase);
      super.check_phase(phase);
      // TODO Implement uvmt_cvmcu_cpi_st_rand_ill_stim_test_c::check_phase()
      //      Ex: if (env_cntxt.prd_abc == 0) begin
      //             `uvm_error("TEST", "Did not predict ...")
      //          end
      //          if (env_cntxt.agent_cntxt.mon_abc == 0) begin
      //             `uvm_error("TEST", "Did not observe ...")
      //          end
      //          if (rand_ill_stim_vseq.num_errors != env_cntxt.agent_cntxt.mon_abc) begin
      //             `uvm_error("TEST", $sformatf("Number of ... driven in (%0d) and observed (%0d) do not match", rand_ill_stim_vseq.num_errors, env_cntxt.agent_cntxt.mon_abc))
      //          end
      //          if (rand_ill_stim_vseq.num_items != env_cntxt.sb_cntxt.match_count) begin
      //             `uvm_error("TEST", $sformatf("Number of items driven in (%0d) and observed (%0d) do not match", rand_ill_stim_vseq.num_items, env_cntxt.sb_cntxt.match_count))
      //          end
   endfunction : check_phase

endclass : uvmt_cvmcu_cpi_st_rand_ill_stim_test_c


`endif // __UVMT__ST_RAND_ILL_STIM_TEST_SV__