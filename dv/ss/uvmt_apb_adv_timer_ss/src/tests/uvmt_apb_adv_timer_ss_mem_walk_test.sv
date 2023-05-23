// Copyright 2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMT_APB_ADV_TIMER_SS_MEM_WALK_TEST_SV__
`define __UVMT_APB_ADV_TIMER_SS_MEM_WALK_TEST_SV__


/**
 * Test verifiying all memories in Sub-System register model by executing the walking-ones algorithm on each.
 * @ingroup uvmt_apb_adv_timer_ss_tests
 */
class uvmt_apb_adv_timer_ss_mem_walk_test_c extends uvmt_apb_adv_timer_ss_base_test_c;

   `uvm_component_utils(uvmt_apb_adv_timer_ss_mem_walk_test_c)
   `uvmx_test_reg(UVM_DO_MEM_WALK)

   /**
    * Default constructor.
    */
   function new(string name="uvmt_apb_adv_timer_ss_mem_walk_test", uvm_component parent=null);
      super.new(name, parent);
   endfunction

endclass : uvmt_apb_adv_timer_ss_mem_walk_test_c


`endif // __UVMT_APB_ADV_TIMER_SS_MEM_WALK_TEST_SV__