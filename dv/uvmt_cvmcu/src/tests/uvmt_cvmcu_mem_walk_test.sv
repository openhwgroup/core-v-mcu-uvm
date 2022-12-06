// Copyright 2022 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMT_CVMCU_MEM_WALK_TEST_SV__
`define __UVMT_CVMCU_MEM_WALK_TEST_SV__


/**
 *
 * @ingroup uvmt_cvmcu_tests
 */
class uvmt_cvmcu_mem_walk_test_c extends uvmt_cvmcu_base_test_c;

   `uvm_component_utils(uvmt_cvmcu_mem_walk_test_c)
   `uvmx_test_reg(UVM_DO_MEM_WALK)

   /**
    * Default constructor.
    */
   function new(string name="uvmt_cvmcu_mem_walk_test", uvm_component parent=null);
      super.new(name, parent);
   endfunction

endclass : uvmt_cvmcu_mem_walk_test_c


`endif // __UVMT_CVMCU_MEM_WALK_TEST_SV__