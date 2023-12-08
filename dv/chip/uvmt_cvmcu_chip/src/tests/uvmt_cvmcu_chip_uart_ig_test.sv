// Copyright 2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMT_CVMCU_CHIP_UART_IG_TEST_SV__
`define __UVMT_CVMCU_CHIP_UART_IG_TEST_SV__


/**
 * Generates UART transactions from the outside world towards the core
 * @ingroup uvmt_cvmcu_chip_tests_functional
 */
class uvmt_cvmcu_chip_uart_ig_test_c extends uvmt_cvmcu_chip_base_test_c;

   /// @name Knobs
   /// @{
   rand int unsigned  num_items; ///< Number of transactions generated.
   rand int unsigned  min_gap; ///< Minimum cycles between transactions.
   rand int unsigned  max_gap; ///< Maximum cycles between transactions.
   /// @}


   /// @name Sequences
   /// @{
   rand uvme_cvmcu_chip_uart_ig_seq_c  uart_ig_seq; ///< Executes during 'main_phase()'
   /// @}


   `uvm_component_utils_begin(uvmt_cvmcu_chip_uart_ig_test_c)
      `uvm_field_int(num_items, UVM_DEFAULT + UVM_DEC)
      `uvm_field_int(min_gap, UVM_DEFAULT + UVM_DEC)
      `uvm_field_int(max_gap, UVM_DEFAULT + UVM_DEC)
      `uvm_utils_object(uart_ig_seq, UVM_DEFAULT)
   `uvm_component_utils_end


   /**
    * Describes randomization space for knobs.
    */
   constraint knobs_cons {
      num_items inside {[1:'d1000]};
      min_gap inside {[0:'d100]};
      max_gap inside {[0:'d100]};
   }

   /**
    * Synchronizes uart_ig_seq fields with test.
    */
   constraint sync_cons {
      uart_ig_seq.num_items == num_items;
      uart_ig_seq.min_gap == min_gap;
      uart_ig_seq.max_gap == max_gap;
   }

   /**
    * Restricts randomization space.
    */
   constraint rules_cons {
      env_cfg.scoreboarding_enabled == 1;
      min_gap <= max_gap;
   }


   /**
    * Default constructor.
    */
   function new(string name="uvmt_cvmcu_chip_uart_ig_test", uvm_component parent=null);
      super.new(name, parent);
   endfunction

   /**
    * Creates sequence uart_ig_seq.
    */
   virtual function void create_sequences();
      uart_ig_seq = uvme_cvmcu_chip_uart_ig_seq_c::type_id::create("uart_ig_seq");
   endfunction

   /**
    * TODO Implement or remove uvmt_cvmcu_chip_uart_ig_test_c::post_randomize_work()
    */
   virtual function void post_randomize_work();
   endfunction

   /**
    * Runs uart_ig_seq.
    */
   virtual task main_phase(uvm_phase phase);
      phase.raise_objection(this);
      `uvm_info("TEST", $sformatf("Starting 'uart_ig_seq':\n%s", uart_ig_seq.sprint()), UVM_NONE)
      uart_ig_seq.start(sequencer);
      `uvm_info("TEST", $sformatf("Finished 'uart_ig_seq':\n%s", uart_ig_seq.sprint()), UVM_NONE)
      phase.drop_objection(this);
   endtask

   /**
    * Ensures that test goals were met.
    */
   virtual function void check_phase(uvm_phase phase);
      if (!(env_cntxt.sb_udma_uart0_ingress_cntxt.match_count == num_items)) begin
         `uvm_error("TEST", $sformatf("Scoreboard 'sb_udma_uart0_ingress' did not observe %0d matches during simulation:  %0d matches", num_items, env_cntxt.sb_udma_uart0_ingress_cntxt.match_count))
      end
      if (!(env_cntxt.sb_udma_uart1_ingress_cntxt.match_count == num_items)) begin
         `uvm_error("TEST", $sformatf("Scoreboard 'sb_udma_uart1_ingress' did not observe %0d matches during simulation:  %0d matches", num_items, env_cntxt.sb_udma_uart1_ingress_cntxt.match_count))
      end
   endfunction

   /**
    * Prints end-of-test goals report.
    */
   virtual function void report_phase(uvm_phase phase);
      `uvmx_test_report({
         $sformatf("Scoreboard 'sb_udma_uart0_ingress' observed %0d matches during simulation", env_cntxt.sb_udma_uart0_ingress_cntxt.match_count),
         $sformatf("Scoreboard 'sb_udma_uart1_ingress' observed %0d matches during simulation", env_cntxt.sb_udma_uart1_ingress_cntxt.match_count)
      })
   endfunction

endclass


`endif // __UVMT_CVMCU_CHIP_UART_IG_TEST_SV__
