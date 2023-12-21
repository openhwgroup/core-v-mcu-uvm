// Copyright 2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVME_CVMCU_CHIP_UART_IG_SEQ_SV__
`define __UVME_CVMCU_CHIP_UART_IG_SEQ_SV__


/**
 * Sequence for test 'uart_ig'.
 * @ingroup uvme_cvmcu_chip_seq_functional
 */
class uvme_cvmcu_chip_uart_ig_seq_c extends uvme_cvmcu_chip_base_seq_c;

   /// @name Knobs
   /// @{
   rand int unsigned  num_items; ///< Number of transactions generated.
   rand int unsigned  min_gap; ///< Minimum cycles between transactions.
   rand int unsigned  max_gap; ///< Maximum cycles between transactions.
   /// @}

   /// @name Sub-Sequences
   /// @{
   rand uvma_uart_rand_stim_seq_c  uart0_seq; ///< Stimulus for UART0
   rand uvma_uart_rand_stim_seq_c  uart1_seq; ///< Stimulus for UART1
   /// @}


   `uvm_object_utils_begin(uvme_cvmcu_chip_uart_ig_seq_c)
      `uvm_field_int(num_items, UVM_DEFAULT + UVM_DEC)
      `uvm_field_int(min_gap, UVM_DEFAULT + UVM_DEC)
      `uvm_field_int(max_gap, UVM_DEFAULT + UVM_DEC)
   `uvm_object_utils_end


   /**
    * Describes randomization space for knobs.
    */
   constraint space_cons {
      num_items inside {[1:'d100]};
      min_gap inside {[0:'d100]};
      max_gap inside {[0:'d100]};
   }

   /**
    * TODO Implement or remove uvme_cvmcu_chip_uart_ig_seq_c::rules_cons
    */
   constraint rules_cons {
      min_gap <= max_gap;
      uart0_seq.num_items == num_items;
      uart1_seq.num_items == num_items;
      uart0_seq.min_gap == min_gap;
      uart1_seq.min_gap == min_gap;
      uart0_seq.max_gap == max_gap;
      uart1_seq.max_gap == max_gap;
   }


   /**
    * Default constructor.
    */
   function new(string name="uvme_cvmcu_chip_uart_ig_seq");
      super.new(name);
   endfunction

   /**
    * Creates sequences uart0_seq, uart1_seq.
    */
   virtual function void create_sequences();
      uart0_seq = uvma_uart_rand_stim_seq_c::type_id::create("uart0_seq");
      uart1_seq = uvma_uart_rand_stim_seq_c::type_id::create("uart1_seq");
   endfunction

   /**
    * TODO Describe uvme_cvmcu_chip_uart_ig_seq_c::body()
    */
   virtual task body();
      cntxt.probe_vif.assign_uart0();
      cntxt.probe_vif.assign_uart1();
      fork
         uart0_rx();
         uart1_rx();
      join_none
      stimulus();
   endtask

   /**
    * Generates UART stimulus into MCU.
    */
   task stimulus();
      fork
         uart0_seq.start(p_sequencer.uart0_agent_sequencer);
         uart1_seq.start(p_sequencer.uart1_agent_sequencer);
      join
   endtask

endclass


`endif // __UVME_CVMCU_CHIP_UART_IG_SEQ_SV__
