// Copyright 2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// This file contains sample code that demonstrates how to add a new test to the CORE-V-MCU Chip Test Bench and UVM Test Library.


`ifndef __UVMT_CVMCU_CHIP_EXAMPLE_TEST_SV__
`define __UVMT_CVMCU_CHIP_EXAMPLE_TEST_SV__


/**
 * Test which runs Virtual Sequence 'example_vseq' for 100 items of stimulus.
 */
class uvmt_cvmcu_chip_example_test_c extends uvmt_cvmcu_chip_base_test_c;

   rand uvme_cvmcu_chip_example_vseq_c  example_vseq; ///< Virtual sequence run during main_phase.


   `uvm_component_utils(uvmt_cvmcu_chip_example_test_c)


   /**
    * Rules for this test.
    */
   constraint example_test_cons {
      example_vseq.num_items == 100;
   }


   /**
    * Default constructor.
    */
   function new(string name="uvmt_cvmcu_chip_example_test", uvm_component parent=null);
      super.new(name, parent);
   endfunction


   /**
    * Creates example_vseq.
    */
   virtual function void create_objects();
      example_vseq = uvme_cvmcu_chip_example_vseq_c::type_id::create("example_vseq");
   endfunction

   /**
    * Runs example_vseq on vsequencer.
    */
   virtual task main_phase(uvm_phase phase);
      phase.raise_objection(this);
      `uvm_info("TEST", $sformatf("Starting 'example_vseq' Virtual Sequence:\n%s", example_vseq.sprint()), UVM_NONE)
      example_vseq.start(vsequencer);
      `uvm_info("TEST", $sformatf("Finished 'example_vseq' Virtual Sequence:\n%s", example_vseq.sprint()), UVM_NONE)
      phase.drop_objection(this);
   endtask

endclass : uvmt_cvmcu_chip_example_test_c


`endif // __UVMT_CVMCU_CHIP_EXAMPLE_TEST_SV__