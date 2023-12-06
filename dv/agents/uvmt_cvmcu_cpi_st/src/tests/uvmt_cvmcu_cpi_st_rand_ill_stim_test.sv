// Copyright 2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMT_CVMCU_CPI_ST_RAND_ILL_STIM_TEST_SV__
`define __UVMT_CVMCU_CPI_ST_RAND_ILL_STIM_TEST_SV__


/**
 * Ensures functionality with random valid stimulus and synchronized scoreboarding.
 * @ingroup uvmt_cvmcu_cpi_st_tests
 */
class uvmt_cvmcu_cpi_st_rand_ill_stim_test_c extends uvmt_cvmcu_cpi_st_base_test_c;

   /// @name Sequences
   /// @{
   rand uvme_cvmcu_cpi_st_rand_ill_stim_seq_c  rand_ill_stim_seq; ///< Executes during 'main_phase()'
   /// @}


   `uvm_component_utils_begin(uvmt_cvmcu_cpi_st_rand_ill_stim_test_c)
      `uvm_field_object(rand_ill_stim_seq, UVM_DEFAULT)
   `uvm_component_utils_end


   /**
    * Assigns Command Line Interface parsed values to knobs/sequences.
    */
   constraint cli_cons {
      if (test_cfg.cli_num_items_override) {
         rand_ill_stim_seq.num_items == test_cfg.cli_num_items;
      }
      else {
         rand_ill_stim_seq.num_items == test_cfg.num_items;
      }
      if (test_cfg.cli_num_errors_override) {
         rand_ill_stim_seq.num_errors == test_cfg.cli_num_errors;
      }
      else {
         rand_ill_stim_seq.num_errors == test_cfg.num_errors;
      }
      if (test_cfg.cli_min_size_override) {
         rand_ill_stim_seq.min_size == test_cfg.cli_min_size;
      }
      else {
         rand_ill_stim_seq.min_size == test_cfg.min_size;
      }
      if (test_cfg.cli_max_size_override) {
         rand_ill_stim_seq.max_size == test_cfg.cli_max_size;
      }
      else {
         rand_ill_stim_seq.max_size == test_cfg.max_size;
      }
      if (test_cfg.cli_min_gap_override) {
         rand_ill_stim_seq.min_gap == test_cfg.cli_min_gap;
      }
      else {
         rand_ill_stim_seq.min_gap == test_cfg.min_gap;
      }
      if (test_cfg.cli_max_gap_override) {
         rand_ill_stim_seq.max_gap == test_cfg.cli_max_gap;
      }
      else {
         rand_ill_stim_seq.max_gap == test_cfg.max_gap;
      }
   }

   /**
    * Restricts randomization space.
    */
   constraint rules_cons {
      env_cfg.scoreboarding_enabled == 1;
   }


   /**
    * Default constructor.
    */
   function new(string name="uvmt_cvmcu_cpi_st_rand_ill_stim_test", uvm_component parent=null);
      super.new(name, parent);
   endfunction

   /**
    * Creates sequence rand_ill_stim_seq.
    */
   virtual function void create_sequences();
      rand_ill_stim_seq = uvme_cvmcu_cpi_st_rand_ill_stim_seq_c::type_id::create("rand_ill_stim_seq");
   endfunction

   /**
    * Runs rand_ill_stim_seq.
    */
   virtual task main_phase(uvm_phase phase);
      phase.raise_objection(this);
      `uvm_info("TEST", $sformatf("Starting 'rand_ill_stim':\n%s", rand_ill_stim_seq.sprint()), UVM_NONE)
      rand_ill_stim_seq.start(sequencer);
      `uvm_info("TEST", $sformatf("Finished 'rand_ill_stim':\n%s", rand_ill_stim_seq.sprint()), UVM_NONE)
      phase.drop_objection(this);
   endtask

   /**
    * Ensures that test goals were met.
    */
   virtual function void check_phase(uvm_phase phase);
      if (env_cntxt.sb_agent_cntxt.match_count != (rand_ill_stim_seq.num_items-rand_ill_stim_seq.num_errors)) begin
         `uvm_error("TEST", $sformatf("Scoreboard 'agent' saw less than %0d matches: %0d", (rand_ill_stim_seq.num_items-rand_ill_stim_seq.num_errors), env_cntxt.sb_agent_cntxt.match_count))
      end
      if (env_cntxt.sb_e2e_cntxt.match_count != (rand_ill_stim_seq.num_items-rand_ill_stim_seq.num_errors)) begin
         `uvm_error("TEST", $sformatf("Scoreboard 'e2e' saw less than %0d matches: %0d", (rand_ill_stim_seq.num_items-rand_ill_stim_seq.num_errors), env_cntxt.sb_e2e_cntxt.match_count))
      end
   endfunction

   /**
    * Prints end-of-test goals report.
    */
   virtual function void report_phase(uvm_phase phase);
      `uvmx_test_report({
         $sformatf("Scoreboard 'agent' saw %0d matches during simulation", env_cntxt.sb_agent_cntxt.match_count),
         $sformatf("Scoreboard 'e2e' saw %0d matches during simulation", env_cntxt.sb_e2e_cntxt.match_count)
      })
   endfunction

endclass


`endif // __UVMT_CVMCU_CPI_ST_RAND_ILL_STIM_TEST_SV__