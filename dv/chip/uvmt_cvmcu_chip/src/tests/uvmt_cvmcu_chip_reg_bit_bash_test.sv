// Copyright 2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMT_CVMCU_CHIP_REG_BIT_BASH_TEST_SV__
`define __UVMT_CVMCU_CHIP_REG_BIT_BASH_TEST_SV__


/**
 * Test checking the accessibility of every bit of every register in the CORE-V-MCU Chip DUT.
 * @ingroup uvmt_cvmcu_chip_tests
 */
class uvmt_cvmcu_chip_reg_bit_bash_test_c extends uvmt_cvmcu_chip_base_test_c;

   `uvm_component_utils(uvmt_cvmcu_chip_reg_bit_bash_test_c)
   `uvmx_test_reg(UVM_DO_REG_BIT_BASH)


   /**
    * Disables all agents not register-related.
    */
   constraint disable_agents_cons {
      env_cfg.qspi_s0_agent_cfg.enabled == 0;
      env_cfg.qspi_s1_agent_cfg.enabled == 0;
      env_cfg.camera_agent_cfg.enabled == 0;
      env_cfg.i2c_s0_agent_cfg.enabled == 0;
      env_cfg.i2c_s1_agent_cfg.enabled == 0;
      env_cfg.uart0_agent_cfg.enabled == 0;
      env_cfg.uart1_agent_cfg.enabled == 0;
      env_cfg.i2c_m_agent_cfg.enabled == 0;
      env_cfg.event_agent_cfg.enabled == 0;
      env_cfg.dbg_agent_cfg.enabled == 0;
      env_cfg.irq_l1_agent_cfg.enabled == 0;
      env_cfg.irq_l2_agent_cfg.enabled == 0;
   }

   /**
    * Disables all sub-systems.
    */
   constraint disable_ss_cons {
      env_cfg.apb_timer_ss_env_cfg.enabled == 0;
      env_cfg.apb_adv_timer_ss_env_cfg.enabled == 0;
   }


   /**
    * Default constructor.
    */
   function new(string name="uvmt_cvmcu_chip_reg_bit_bash_test", uvm_component parent=null);
      super.new(name, parent);
   endfunction

endclass


`endif // __UVMT_CVMCU_CHIP_REG_BIT_BASH_TEST_SV__