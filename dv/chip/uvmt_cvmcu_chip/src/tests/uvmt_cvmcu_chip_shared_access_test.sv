// Copyright 2023 Acme Enterprises
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMT_CVMCU_CHIP_SHARED_ACCESS_TEST_SV__
`define __UVMT_CVMCU_CHIP_SHARED_ACCESS_TEST_SV__


/**
 * Test verifying the accessibility of all shared registers and memories in the CORE-V-MCU Chip DUT
 * by writing through each address map then reading it via every other address maps in which the register/memory is
 * readable and the backdoor, making sure that the resulting register value matches the mirrored value and the resulting
 * memory value matches the written value.
 * @ingroup uvmt_cvmcu_chip_tests
 */
class uvmt_cvmcu_chip_shared_access_test_c extends uvmt_cvmcu_chip_base_test_c;

   `uvm_component_utils(uvmt_cvmcu_chip_shared_access_test_c)
   `uvmx_test_reg(UVM_DO_SHARED_ACCESS)

   /**
    * Default constructor.
    */
   function new(string name="uvmt_cvmcu_chip_shared_access_test", uvm_component parent=null);
      super.new(name, parent);
   endfunction

endclass : uvmt_cvmcu_chip_shared_access_test_c


`endif // __UVMT_CVMCU_CHIP_SHARED_ACCESS_TEST_SV__