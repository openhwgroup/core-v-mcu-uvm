// Copyright 2023 Acme Enterprises
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMT_CVMCU_CPI_ST_RAND_STIM_TEST_SV__
`define __UVMT_CVMCU_CPI_ST_RAND_STIM_TEST_SV__


/**
 * Test running uvme_cvmcu_cpi_st_rand_stim_vseq_c with default parameters and Scoreboarding enabled.
 * @ingroup uvmt_cvmcu_cpi_st_tests
 */
class uvmt_cvmcu_cpi_st_rand_stim_test_c extends uvmt_cvmcu_cpi_st_base_test_c;

   rand uvme_cvmcu_cpi_st_rand_stim_vseq_c  rand_stim_vseq; ///< Virtual Sequence run during #main_phase()


   `uvm_component_utils(uvmt_cvmcu_cpi_st_rand_stim_test_c)


   /**
    * Overrides number of stimulus items to drive with CLI argument (if present).
    */
   constraint rand_stim_vseq_cons {
      env_cfg.scoreboarding_enabled == 1;
      if (test_cfg.cli_num_items_override) {
         rand_stim_vseq.num_items == test_cfg.cli_num_items;
      }
   }


   /**
    * Default constructor.
    */
   function new(string name="uvmt_cvmcu_cpi_st_rand_stim_test", uvm_component parent=null);
      super.new(name, parent);
   endfunction

   /**
    * Creates rand_stim_vseq.
    */
   virtual function void create_sequences();
      super.create_sequences();
      rand_stim_vseq = uvme_cvmcu_cpi_st_rand_stim_vseq_c::type_id::create("rand_stim_vseq");
   endfunction

   /**
    * Runs rand_stim_vseq on vsequencer.
    */
   virtual task main_phase(uvm_phase phase);
      phase.raise_objection(this);
      `uvm_info("TEST", $sformatf("Starting rand_stim Virtual Sequence:\n%s", rand_stim_vseq.sprint()), UVM_NONE)
      rand_stim_vseq.start(vsequencer);
      `uvm_info("TEST", $sformatf("Finished rand_stim Virtual Sequence:\n%s", rand_stim_vseq.sprint()), UVM_NONE)
      phase.drop_objection(this);
   endtask

   /**
    * Checks that all scoreboards have numbers of matches equal to number of Sequence Items specified to be generated.
    */
   virtual function void check_phase(uvm_phase phase);
      super.check_phase(phase);
      if (env_cntxt.sb_agent_cntxt.match_count != rand_stim_vseq.num_items) begin
         `uvm_error("TEST", $sformatf("Agent scoreboard saw less than %0d matches: %0d", rand_stim_vseq.num_items, env_cntxt.sb_agent_cntxt.match_count))
      end
      if (env_cntxt.sb_e2e_cntxt.match_count != rand_stim_vseq.num_items) begin
         `uvm_error("TEST", $sformatf("End-to-end scoreboard saw less than %0d matches: %0d", rand_stim_vseq.num_items, env_cntxt.sb_e2e_cntxt.match_count))
      end
   endfunction

endclass : uvmt_cvmcu_cpi_st_rand_stim_test_c


`endif // __UVMT_CVMCU_CPI_ST_RAND_STIM_TEST_SV__