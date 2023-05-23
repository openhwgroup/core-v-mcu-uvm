// Copyright 2023 Acme Enterprises
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMT_CVMCU_CHIP_MEM_WALK_TEST_SV__
`define __UVMT_CVMCU_CHIP_MEM_WALK_TEST_SV__


/**
 * Test verifiying all memories in Chip register model by executing the walking-ones algorithm on each.
 * @ingroup uvmt_cvmcu_chip_tests
 */
class uvmt_cvmcu_chip_mem_walk_test_c extends uvmt_cvmcu_chip_base_test_c;

   `uvm_component_utils(uvmt_cvmcu_chip_mem_walk_test_c)
   `uvmx_test_reg(UVM_DO_MEM_WALK)

   /**
    * Default constructor.
    */
   function new(string name="uvmt_cvmcu_chip_mem_walk_test", uvm_component parent=null);
      super.new(name, parent);
   endfunction

endclass : uvmt_cvmcu_chip_mem_walk_test_c


`endif // __UVMT_CVMCU_CHIP_MEM_WALK_TEST_SV__