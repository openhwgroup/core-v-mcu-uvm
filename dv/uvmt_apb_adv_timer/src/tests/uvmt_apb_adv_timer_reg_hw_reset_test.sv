// Copyright 2022-2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMT_APB_ADV_TIMER_REG_HW_RESET_TEST_SV__
`define __UVMT_APB_ADV_TIMER_REG_HW_RESET_TEST_SV__


/**
 * Test ensuring that the reset values specified for registers in the RAL matches what is in the APB Advanced Timer Sub-System DUT.
 * @ingroup uvmt_apb_adv_timer_tests
 */
class uvmt_apb_adv_timer_reg_hw_reset_test_c extends uvmt_apb_adv_timer_base_test_c;

   `uvm_component_utils(uvmt_apb_adv_timer_reg_hw_reset_test_c)
   `uvmx_test_reg(UVM_DO_REG_HW_RESET)

   /**
    * Default constructor.
    */
   function new(string name="uvmt_apb_adv_timer_reg_hw_reset_test", uvm_component parent=null);
      super.new(name, parent);
   endfunction

endclass : uvmt_apb_adv_timer_reg_hw_reset_test_c


`endif // __UVMT_APB_ADV_TIMER_REG_HW_RESET_TEST_SV__