// Copyright 2022-2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMT_CVMCU_REG_BIT_BASH_TEST_SV__
`define __UVMT_CVMCU_REG_BIT_BASH_TEST_SV__


/**
 * Test checking the accessibility of every bit of every register in the CORE-V MCU DUT.
 * @ingroup uvmt_cvmcu_tests
 */
class uvmt_cvmcu_reg_bit_bash_test_c extends uvmt_cvmcu_base_test_c;

   `uvm_component_utils(uvmt_cvmcu_reg_bit_bash_test_c)
   `uvmx_test_reg(UVM_DO_REG_BIT_BASH)

   /**
    * Default constructor.
    */
   function new(string name="uvmt_cvmcu_reg_bit_bash_test", uvm_component parent=null);
      super.new(name, parent);
   endfunction

endclass : uvmt_cvmcu_reg_bit_bash_test_c


`endif // __UVMT_CVMCU_REG_BIT_BASH_TEST_SV__
