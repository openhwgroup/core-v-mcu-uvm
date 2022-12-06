// Copyright 2022 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMT_APB_TIMER_REG_BIT_BASH_TEST_SV__
`define __UVMT_APB_TIMER_REG_BIT_BASH_TEST_SV__


/**
 * Test checking the accessibility of every bit of every register in the APB Timer Sub-System DUT.
 * @ingroup uvmt_apb_timer_tests
 */
class uvmt_apb_timer_reg_bit_bash_test_c extends uvmt_apb_timer_base_test_c;

   `uvm_component_utils(uvmt_apb_timer_reg_bit_bash_test_c)
   `uvmx_test_reg(UVM_DO_REG_BIT_BASH)

   /**
    * Default constructor.
    */
   function new(string name="uvmt_apb_timer_reg_bit_bash_test", uvm_component parent=null);
      super.new(name, parent);
   endfunction

endclass : uvmt_apb_timer_reg_bit_bash_test_c


`endif // __UVMT_APB_TIMER_REG_BIT_BASH_TEST_SV__