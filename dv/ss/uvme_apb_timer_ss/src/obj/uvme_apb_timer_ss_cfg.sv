// Copyright 2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVME_APB_TIMER_SS_CFG_SV__
`define __UVME_APB_TIMER_SS_CFG_SV__


/**
 * Object encapsulating all parameters for creating, connecting and running the APB simple timer unit Sub-System environment
 * (uvme_apb_timer_ss_env_c) components.
 * @ingroup uvme_apb_timer_ss_obj
 */
class uvme_apb_timer_ss_cfg_c extends uvmx_ss_env_cfg_c;

   // @name Settings
   /// @{
   rand uvm_reg_addr_t  reg_block_base_address; ///< Base address for #apb_timer_ss_reg_block
   /// @}

   /// @name Agents
   /// @{
   rand uvma_apb_cfg_c  proc_agent_cfg; ///< Processor interface agent configuration
   rand uvma_irq_cfg_c  irq_events_agent_cfg; /// Events IRQ agent configuration
   /// @}

   /// @name Blocks
   /// @{
   rand uvme_tcounter_b_cfg_c  counter_lo_b_env_cfg; ///< Counter block 0 block configuration
   rand uvme_tcounter_b_cfg_c  counter_hi_b_env_cfg; ///< Counter block 1 block configuration
   rand uvme_tprescaler_b_cfg_c  prescaler_lo_b_env_cfg; ///< Prescaler block 0 block configuration
   rand uvme_tprescaler_b_cfg_c  prescaler_hi_b_env_cfg; ///< Prescaler block 1 block configuration
   /// @}


   `uvm_object_utils_begin(uvme_apb_timer_ss_cfg_c)
      `uvm_field_int(enabled, UVM_DEFAULT)
      `uvm_field_enum(uvm_active_passive_enum, is_active, UVM_DEFAULT)
      `uvm_field_enum(uvmx_reset_type_enum, reset_type, UVM_DEFAULT)
      `uvm_field_int(scoreboarding_enabled, UVM_DEFAULT)
      `uvm_field_int(reg_block_base_address, UVM_DEFAULT)
      `uvm_field_object(proc_agent_cfg, UVM_DEFAULT)
      `uvm_field_object(irq_events_agent_cfg, UVM_DEFAULT)
      `uvm_field_object(counter_lo_b_env_cfg, UVM_DEFAULT)
      `uvm_field_object(counter_hi_b_env_cfg, UVM_DEFAULT)
      `uvm_field_object(prescaler_lo_b_env_cfg, UVM_DEFAULT)
      `uvm_field_object(prescaler_hi_b_env_cfg, UVM_DEFAULT)
   `uvm_object_utils_end


   /**
    * Sets valid and default values for settings.
    */
   constraint settings_space_cons {
      soft reg_block_base_address == uvme_apb_timer_ss_default_reg_block_base_address;
   }

   /**
    * Sets Processor interface agent configuration.
    */
   constraint proc_agent_cfg_cons {
      soft proc_agent_cfg.enabled == enabled;
      proc_agent_cfg.data_width == 32;
      proc_agent_cfg.addr_width == 32;
      proc_agent_cfg.drv_mode == UVMA_APB_DRV_MODE_MSTR;
      proc_agent_cfg.is_active == is_active;
   }

   /**
    * Sets Events IRQ agent configuration.
    */
   constraint irq_events_agent_cfg_cons {
      soft irq_events_agent_cfg.enabled == enabled;
      irq_events_agent_cfg.num_lines == 2;
      irq_events_agent_cfg.is_active == UVM_PASSIVE;
   }

   /**
    * Sets Counter block 0 block environment configuration.
    */
   constraint counter_lo_b_env_cfg_cons {
      soft counter_lo_b_env_cfg.enabled == enabled;
      counter_lo_b_env_cfg.is_active == UVM_PASSIVE;
      counter_lo_b_env_cfg.scoreboarding_enabled == scoreboarding_enabled;
   }

   /**
    * Sets Counter block 1 block environment configuration.
    */
   constraint counter_hi_b_env_cfg_cons {
      soft counter_hi_b_env_cfg.enabled == enabled;
      counter_hi_b_env_cfg.is_active == UVM_PASSIVE;
      counter_hi_b_env_cfg.scoreboarding_enabled == scoreboarding_enabled;
   }

   /**
    * Sets Prescaler block 0 block environment configuration.
    */
   constraint prescaler_lo_b_env_cfg_cons {
      soft prescaler_lo_b_env_cfg.enabled == enabled;
      prescaler_lo_b_env_cfg.is_active == UVM_PASSIVE;
      prescaler_lo_b_env_cfg.scoreboarding_enabled == scoreboarding_enabled;
   }

   /**
    * Sets Prescaler block 1 block environment configuration.
    */
   constraint prescaler_hi_b_env_cfg_cons {
      soft prescaler_hi_b_env_cfg.enabled == enabled;
      prescaler_hi_b_env_cfg.is_active == UVM_PASSIVE;
      prescaler_hi_b_env_cfg.scoreboarding_enabled == scoreboarding_enabled;
   }

   /**
    * TODO Implement or remove uvme_apb_timer_ss_cfg_c::rules_cons
    */
   constraint rules_cons {
   }


   /**
    * Default constructor.
    */
   function new(string name="uvme_apb_timer_ss_cfg");
      super.new(name);
   endfunction

   /**
    * Initializes objects and arrays.
    */
   virtual function void build();
      proc_agent_cfg = uvma_apb_cfg_c::type_id::create("proc_cfg");
      irq_events_agent_cfg = uvma_irq_cfg_c::type_id::create("irq_events_cfg");
      counter_lo_b_env_cfg = uvme_tcounter_b_cfg_c::type_id::create("counter_lo_b_env_cfg");
      counter_hi_b_env_cfg = uvme_tcounter_b_cfg_c::type_id::create("counter_hi_b_env_cfg");
      prescaler_lo_b_env_cfg = uvme_tprescaler_b_cfg_c::type_id::create("prescaler_lo_b_env_cfg");
      prescaler_hi_b_env_cfg = uvme_tprescaler_b_cfg_c::type_id::create("prescaler_hi_b_env_cfg");
   endfunction

   /**
    * Configures IRQ lines.
    */
   virtual function void cfg_irq();
      irq_events_agent_cfg.lines = uvme_apb_timer_ss_events_irq_lines;
   endfunction

   /**
    * TODO Implement or remove uvme_apb_timer_ss_cfg_c::post_randomize()
    */
   virtual function void post_randomize_work();
   endfunction

endclass


`endif // __UVME_APB_TIMER_SS_CFG_SV__