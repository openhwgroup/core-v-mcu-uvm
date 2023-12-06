// Copyright 2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMT_APB_ADV_TIMER_SS_TEST_CFG_SV__
`define __UVMT_APB_ADV_TIMER_SS_TEST_CFG_SV__


/**
 * Object encapsulating common configuration parameters for APB Advanced Timer Sub-System tests.
 * @ingroup uvmt_apb_adv_timer_ss_tests
 */
class uvmt_apb_adv_timer_ss_test_cfg_c extends uvmx_ss_test_cfg_c #(
   .T_REG_MODEL(uvme_apb_adv_timer_ss_reg_block_c)
);

   /// @name Knobs
   /// @{
   rand int unsigned  sys_clk_frequency; ///< System frequency (Hz).
   rand int unsigned  low_speed_clk_frequency; ///< Low speed frequency (Hz).
   /// @}

   /// @name Agents
   /// @{
   rand uvma_clk_cfg_c    sys_clk_agent_cfg; ///< System clock agent configuration.
   rand uvma_clk_cfg_c    low_speed_clk_agent_cfg; ///< Low speed clock agent configuration.
   rand uvma_reset_cfg_c  sys_reset_agent_cfg; ///< System reset agent configuration.
   /// @}


   `uvm_object_utils_begin(uvmt_apb_adv_timer_ss_test_cfg_c)
      `uvm_field_int(sys_clk_frequency, UVM_DEFAULT + UVM_DEC)
      `uvm_field_int(low_speed_clk_frequency, UVM_DEFAULT + UVM_DEC)
      `uvm_field_int(cli_block_name_override, UVM_DEFAULT)
      `uvm_field_string(cli_block_name, UVM_DEFAULT)
      `uvm_field_object(selected_reg_block, UVM_DEFAULT)
      `uvm_field_object(reg_model, UVM_DEFAULT + UVM_NOPRINT)
      `uvm_field_enum(uvmx_reset_type_enum, reset_type, UVM_DEFAULT)
      `uvm_field_int(auto_ral_update, UVM_DEFAULT)
      `uvm_field_int(startup_timeout, UVM_DEFAULT + UVM_DEC)
      `uvm_field_int(heartbeat_period, UVM_DEFAULT + UVM_DEC)
      `uvm_field_int(heartbeat_refresh_period, UVM_DEFAULT + UVM_DEC)
      `uvm_field_int(simulation_timeout, UVM_DEFAULT + UVM_DEC)
      `uvm_field_object(sys_clk_agent_cfg, UVM_DEFAULT)
      `uvm_field_object(low_speed_clk_agent_cfg, UVM_DEFAULT)
      `uvm_field_object(sys_reset_agent_cfg, UVM_DEFAULT)
   `uvm_object_utils_end



   /**
    * Sets safe defaults parameters.
    */
   constraint defaults_cons {
      soft reset_type == UVMX_RESET_SYNC;
      soft sys_clk_frequency == uvmt_apb_adv_timer_ss_default_sys_clk_frequency;
      soft low_speed_clk_frequency == uvmt_apb_adv_timer_ss_default_low_speed_clk_frequency;
      soft startup_timeout == uvmt_apb_adv_timer_ss_default_startup_timeout;
      soft heartbeat_period == uvmt_apb_adv_timer_ss_default_heartbeat_period;
      soft heartbeat_refresh_period == uvmt_apb_adv_timer_ss_default_heartbeat_refresh_period;
      soft simulation_timeout == uvmt_apb_adv_timer_ss_default_simulation_timeout;
      soft auto_ral_update == 1;
   }

   /**
    * Sets Agents configuration.
    */
   constraint agents_cons {
      sys_clk_agent_cfg.enabled == 1;
      sys_clk_agent_cfg.is_active == UVM_ACTIVE;
      low_speed_clk_agent_cfg.enabled == 1;
      low_speed_clk_agent_cfg.is_active == UVM_ACTIVE;
      sys_reset_agent_cfg.enabled == 1;
      sys_reset_agent_cfg.is_active == UVM_ACTIVE;
      sys_reset_agent_cfg.polarity == UVMX_RESET_ACTIVE_LOW;
      sys_reset_agent_cfg.reset_type == reset_type;
   }

   /**
    * TODO Implement or remove uvmt_apb_adv_timer_ss_test_cfg_c::rules_cons
    */
   constraint rules_cons {
   }


   /**
    * Default constructor.
    */
   function new(string name="uvmt_apb_adv_timer_ss_test_cfg");
      super.new(name);
   endfunction

   /**
    * Initializes objects and arrays.
    */
   virtual function void build();
      sys_clk_agent_cfg = uvma_clk_cfg_c::type_id::create("sys_clk_agent_cfg");
      low_speed_clk_agent_cfg = uvma_clk_cfg_c::type_id::create("low_speed_clk_agent_cfg");
      sys_reset_agent_cfg = uvma_reset_cfg_c::type_id::create("sys_reset_agent_cfg");
   endfunction

   /**
    * TODO Implement or remove uvmt_apb_adv_timer_ss_test_cfg_c::post_randomize_work()
    */
   virtual function void post_randomize_work();
   endfunction

endclass


`endif // __UVMT_APB_ADV_TIMER_SS_TEST_CFG_SV__