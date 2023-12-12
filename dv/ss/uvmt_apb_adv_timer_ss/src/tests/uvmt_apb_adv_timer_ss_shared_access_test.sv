// Copyright 2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMT_APB_ADV_TIMER_SS_SHARED_ACCESS_TEST_SV__
`define __UVMT_APB_ADV_TIMER_SS_SHARED_ACCESS_TEST_SV__


/**
 * Test verifying the accessibility of all shared registers and memories in the APB Advanced Timer Sub-System DUT
 * by writing through each address map then reading it via every other address maps in which the register/memory is
 * readable and the backdoor, making sure that the resulting register value matches the mirrored value and the resulting
 * memory value matches the written value.
 * @ingroup uvmt_apb_adv_timer_ss_tests
 */
class uvmt_apb_adv_timer_ss_shared_access_test_c extends uvmt_apb_adv_timer_ss_base_test_c;

   `uvm_component_utils(uvmt_apb_adv_timer_ss_shared_access_test_c)
   `uvmx_test_reg(UVM_DO_SHARED_ACCESS)


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
   function new(string name="uvmt_apb_adv_timer_ss_shared_access_test", uvm_component parent=null);
      super.new(name, parent);
   endfunction

endclass


`endif // __UVMT_APB_ADV_TIMER_SS_SHARED_ACCESS_TEST_SV__