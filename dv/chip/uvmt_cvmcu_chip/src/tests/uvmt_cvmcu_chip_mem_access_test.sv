// Copyright 2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMT_CVMCU_CHIP_MEM_ACCESS_TEST_SV__
`define __UVMT_CVMCU_CHIP_MEM_ACCESS_TEST_SV__


/**
 * Test verifying the accessibility of all memories in the CORE-V-MCU Chip DUT
 * by writing through its default address map then reading it via the backdoor, then reversing the process, making sure
 * that the resulting value matches the written value.
 * @ingroup uvmt_cvmcu_chip_tests
 */
class uvmt_cvmcu_chip_mem_access_test_c extends uvmt_cvmcu_chip_base_test_c;

   `uvm_component_utils(uvmt_cvmcu_chip_mem_access_test_c)
   `uvmx_test_reg(UVM_DO_MEM_ACCESS)

   /**
    * Default constructor.
    */
   function new(string name="uvmt_cvmcu_chip_mem_access_test", uvm_component parent=null);
      super.new(name, parent);
   endfunction

endclass


`endif // __UVMT_CVMCU_CHIP_MEM_ACCESS_TEST_SV__