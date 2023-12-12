// Copyright 2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMT_APB_ADV_TIMER_SS_REG_HW_RESET_TEST_SV__
`define __UVMT_APB_ADV_TIMER_SS_REG_HW_RESET_TEST_SV__


/**
 * Test ensuring that the reset values specified for registers in reg_model matches what is in the APB Advanced Timer Sub-System DUT.
 * @ingroup uvmt_apb_adv_timer_ss_tests
 */
class uvmt_apb_adv_timer_ss_reg_hw_reset_test_c extends uvmt_apb_adv_timer_ss_base_test_c;

   `uvm_component_utils(uvmt_apb_adv_timer_ss_reg_hw_reset_test_c)
   `uvmx_test_reg(UVM_DO_REG_HW_RESET)


   /**
    * Disables all agents not register-related.
    */
   constraint disable_agents_cons {
      env_cfg.irq_events_agent_cfg.enabled == 0;
   }

   /**
    * Disables all blocks.
    */
   constraint disable_blocks_cons {
      env_cfg.adv_timer0_b_cfg.enabled == 0;
      env_cfg.adv_timer1_b_cfg.enabled == 0;
      env_cfg.adv_timer2_b_cfg.enabled == 0;
      env_cfg.adv_timer3_b_cfg.enabled == 0;
   }


   /**
    * Default constructor.
    */
   function new(string name="uvmt_apb_adv_timer_ss_reg_hw_reset_test", uvm_component parent=null);
      super.new(name, parent);
   endfunction

endclass


`endif // __UVMT_APB_ADV_TIMER_SS_REG_HW_RESET_TEST_SV__