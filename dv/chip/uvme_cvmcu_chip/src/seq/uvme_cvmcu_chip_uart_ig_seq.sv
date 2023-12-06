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


   `uvm_object_utils_begin(uvme_cvmcu_chip_uart_ig_seq_c)
      `uvm_field_int(num_items, UVM_DEFAULT + UVM_DEC)
      `uvm_field_int(min_gap, UVM_DEFAULT + UVM_DEC)
      `uvm_field_int(max_gap, UVM_DEFAULT + UVM_DEC)
   `uvm_object_utils_end


   /**
    * Describes randomization space for knobs.
    */
   constraint space_cons {
      num_items inside {[1:'d1000]};
      min_gap inside {[0:'d100]};
      max_gap inside {[0:'d100]};
   }

   /**
    * TODO Implement or remove uvme_cvmcu_chip_uart_ig_seq_c::rules_cons
    */
   constraint rules_cons {
   }


   /**
    * Default constructor.
    */
   function new(string name="uvme_cvmcu_chip_uart_ig_seq");
      super.new(name);
   endfunction

   /**
    * TODO Implement or remove uvme_cvmcu_chip_uart_ig_seq_c::post_randomize_work()
    */
   virtual function void post_randomize_work();
   endfunction

   /**
    * TODO Describe uvme_cvmcu_chip_uart_ig_seq_c::body()
    */
   virtual task body();
      // TODO Implement uvme_cvmcu_chip_uart_ig_seq_c::body()
   endtask

endclass


`endif // __UVME_CVMCU_CHIP_UART_IG_SEQ_SV__