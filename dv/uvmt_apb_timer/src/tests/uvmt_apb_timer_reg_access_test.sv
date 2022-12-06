// Copyright 2022 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMT_APB_TIMER_REG_ACCESS_TEST_SV__
`define __UVMT_APB_TIMER_REG_ACCESS_TEST_SV__


/**
 *
 * @ingroup uvmt_apb_timer_tests
 */
class uvmt_apb_timer_reg_access_test_c extends uvmt_apb_timer_base_test_c;

   `uvm_component_utils(uvmt_apb_timer_reg_access_test_c)
   `uvmx_test_reg(UVM_DO_REG_ACCESS)

   /**
    * Default constructor.
    */
   function new(string name="uvmt_apb_timer_reg_access_test", uvm_component parent=null);
      super.new(name, parent);
   endfunction

endclass : uvmt_apb_timer_reg_access_test_c


`endif // __UVMT_APB_TIMER_REG_ACCESS_TEST_SV__