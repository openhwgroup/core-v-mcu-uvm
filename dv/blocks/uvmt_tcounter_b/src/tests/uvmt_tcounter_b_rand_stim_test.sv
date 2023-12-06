// Copyright 2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMT_TCOUNTER_B_RAND_STIM_TEST_SV__
`define __UVMT_TCOUNTER_B_RAND_STIM_TEST_SV__


/**
 * Ensures functionality with random valid stimulus and synchronized scoreboarding.
 * @ingroup uvmt_tcounter_b_tests_functional
 */
class uvmt_tcounter_b_rand_stim_test_c extends uvmt_tcounter_b_base_test_c;

   /// @name Sequences
   /// @{
   rand uvme_tcounter_b_rand_stim_seq_c  rand_stim_seq; ///< Executes during 'main_phase()'
   /// @}


   `uvm_component_utils_begin(uvmt_tcounter_b_rand_stim_test_c)
      `uvm_utils_object(rand_stim_seq, UVM_DEFAULT)
   `uvm_component_utils_end


   /**
    * Assigns Command Line Interface parsed values to knobs/sequences.
    */
   constraint cli_cons {
      if (test_cfg.cli_num_items_override) {
         rand_stim_seq.num_items == test_cfg.cli_num_items;
      }
      else {
         rand_stim_seq.num_items == test_cfg.num_items;
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
   function new(string name="uvmt_tcounter_b_rand_stim_test", uvm_component parent=null);
      super.new(name, parent);
   endfunction

   /**
    * Creates sequence rand_stim_seq.
    */
   virtual function void create_sequences();
      rand_stim_seq = uvme_tcounter_b_rand_stim_seq_c::type_id::create("rand_stim_seq");
   endfunction

   /**
    * Runs rand_stim_seq.
    */
   virtual task main_phase(uvm_phase phase);
      phase.raise_objection(this);
      `uvm_info("TEST", $sformatf("Starting 'rand_stim_seq':\n%s", rand_stim_seq.sprint()), UVM_NONE)
      rand_stim_seq.start(sequencer);
      `uvm_info("TEST", $sformatf("Finished 'rand_stim_seq':\n%s", rand_stim_seq.sprint()), UVM_NONE)
      phase.drop_objection(this);
   endtask

   /**
    * Ensures that test goals were met.
    */
   virtual function void check_phase(uvm_phase phase);
      if (!(env_cntxt.sb_cntxt.match_count == num_items)) begin
         `uvm_error("TEST", $sformatf("Scoreboard did not see %0d matches during simulation:  %0d matches", num_items, env_cntxt.sb_cntxt.match_count))
      end
   endfunction

   /**
    * Prints end-of-test goals report.
    */
   virtual function void report_phase(uvm_phase phase);
      `uvmx_test_report(
         $sformatf("Scoreboard saw %0d matches during simulation", env_cntxt.sb_cntxt.match_count)
      )
   endfunction

endclass


`endif // __UVMT_TCOUNTER_B_RAND_STIM_TEST_SV__