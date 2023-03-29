// Copyright 2022-2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMT_CVMCU_UART_LPBK_TEST_SV__
`define __UVMT_CVMCU_UART_LPBK_TEST_SV__


/**
 * Test which runs Virtual Sequence 'uart_lpbk_vseq' for 100 items of stimulus.
 */
class uvmt_cvmcu_uart_lpbk_test_c extends uvmt_cvmcu_base_test_c;

   rand uvme_cvmcu_uart_lpbk_vseq_c  uart_lpbk_vseq; ///< Virtual sequence to be run


   `uvm_component_utils(uvmt_cvmcu_uart_lpbk_test_c)


   /**
    *
    */
   constraint uart_lpbk_vseq_cons {
   }


   /**
    * Creates uart_lpbk_vseq.
    */
   function new(string name="uvmt_cvmcu_uart_lpbk_test", uvm_component parent=null);
      super.new(name, parent);
      uart_lpbk_vseq = uvme_cvmcu_uart_lpbk_vseq_c::type_id::create("uart_lpbk_vseq");
   endfunction

   /**
    * Runs uart_lpbk_vseq on vsequencer.
    */
   virtual task main_phase(uvm_phase phase);
      phase.raise_objection(this);
      `uvm_info("TEST", $sformatf("Starting uart_lpbk Virtual Sequence:\n%s", uart_lpbk_vseq.sprint()), UVM_NONE)
      uart_lpbk_vseq.start(vsequencer);
      `uvm_info("TEST", $sformatf("Finished uart_lpbk Virtual Sequence:\n%s", uart_lpbk_vseq.sprint()), UVM_NONE)
      phase.drop_objection(this);
   endtask

endclass : uvmt_cvmcu_uart_lpbk_test_c


`endif // __UVMT_CVMCU_UART_LPBK_TEST_SV__
