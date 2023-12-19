// Copyright 2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVME_APB_ADV_TIMER_SS_CFG_SV__
`define __UVME_APB_ADV_TIMER_SS_CFG_SV__


/**
 * Object encapsulating all parameters for creating, connecting and running the APB Advanced Timer Sub-System environment
 * (uvme_apb_adv_timer_ss_env_c) components.
 * @ingroup uvme_apb_adv_timer_ss_obj
 */
class uvme_apb_adv_timer_ss_cfg_c extends uvmx_ss_env_cfg_c;

   // @name Settings
   /// @{
   rand uvm_reg_addr_t  reg_block_base_address; ///< Base address for #apb_adv_timer_ss_reg_block
   /// @}

   /// @name Agents
   /// @{
   rand uvma_apb_cfg_c  proc_agent_cfg; ///< Processor access agent configuration
   rand uvma_irq_cfg_c  irq_events_agent_cfg; /// Events IRQ agent configuration
   /// @}

   /// @name Blocks
   /// @{
   rand uvme_adv_timer_b_cfg_c  adv_timer0_b_env_cfg; ///< Advanced timer 0 block configuration
   rand uvme_adv_timer_b_cfg_c  adv_timer1_b_env_cfg; ///< Advanced timer 1 block configuration
   rand uvme_adv_timer_b_cfg_c  adv_timer2_b_env_cfg; ///< Advanced timer 2 block configuration
   rand uvme_adv_timer_b_cfg_c  adv_timer3_b_env_cfg; ///< Advanced timer 3 block configuration
   /// @}


   `uvm_object_utils_begin(uvme_apb_adv_timer_ss_cfg_c)
      `uvm_field_int(enabled, UVM_DEFAULT)
      `uvm_field_enum(uvm_active_passive_enum, is_active, UVM_DEFAULT)
      `uvm_field_enum(uvmx_reset_type_enum, reset_type, UVM_DEFAULT)
      `uvm_field_int(scoreboarding_enabled, UVM_DEFAULT)
      `uvm_field_int(reg_block_base_address, UVM_DEFAULT)
      `uvm_field_object(proc_agent_cfg, UVM_DEFAULT)
      `uvm_field_object(irq_events_agent_cfg, UVM_DEFAULT)
      `uvm_field_object(adv_timer0_b_env_cfg, UVM_DEFAULT)
      `uvm_field_object(adv_timer1_b_env_cfg, UVM_DEFAULT)
      `uvm_field_object(adv_timer2_b_env_cfg, UVM_DEFAULT)
      `uvm_field_object(adv_timer3_b_env_cfg, UVM_DEFAULT)
   `uvm_object_utils_end


   /**
    * Sets valid and default values for settings.
    */
   constraint settings_space_cons {
      soft reg_block_base_address == uvme_apb_adv_timer_ss_default_reg_block_base_address;
   }

   /**
    * Sets Processor access agent configuration.
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
      irq_events_agent_cfg.num_lines == 4;
      irq_events_agent_cfg.is_active == UVM_PASSIVE;
   }

   /**
    * Sets Advanced timer 0 block environment configuration.
    */
   constraint adv_timer0_b_env_cfg_cons {
      soft adv_timer0_b_env_cfg.enabled == enabled;
      adv_timer0_b_env_cfg.is_active == UVM_PASSIVE;
      adv_timer0_b_env_cfg.scoreboarding_enabled == scoreboarding_enabled;
   }

   /**
    * Sets Advanced timer 1 block environment configuration.
    */
   constraint adv_timer1_b_env_cfg_cons {
      soft adv_timer1_b_env_cfg.enabled == enabled;
      adv_timer1_b_env_cfg.is_active == UVM_PASSIVE;
      adv_timer1_b_env_cfg.scoreboarding_enabled == scoreboarding_enabled;
   }

   /**
    * Sets Advanced timer 2 block environment configuration.
    */
   constraint adv_timer2_b_env_cfg_cons {
      soft adv_timer2_b_env_cfg.enabled == enabled;
      adv_timer2_b_env_cfg.is_active == UVM_PASSIVE;
      adv_timer2_b_env_cfg.scoreboarding_enabled == scoreboarding_enabled;
   }

   /**
    * Sets Advanced timer 3 block environment configuration.
    */
   constraint adv_timer3_b_env_cfg_cons {
      soft adv_timer3_b_env_cfg.enabled == enabled;
      adv_timer3_b_env_cfg.is_active == UVM_PASSIVE;
      adv_timer3_b_env_cfg.scoreboarding_enabled == scoreboarding_enabled;
   }

   /**
    * TODO Implement or remove uvme_apb_adv_timer_ss_cfg_c::rules_cons
    */
   constraint rules_cons {
   }


   /**
    * Default constructor.
    */
   function new(string name="uvme_apb_adv_timer_ss_cfg");
      super.new(name);
   endfunction

   /**
    * Initializes objects and arrays.
    */
   virtual function void build();
      proc_agent_cfg = uvma_apb_cfg_c::type_id::create("proc_cfg");
      irq_events_agent_cfg = uvma_irq_cfg_c::type_id::create("irq_events_cfg");
      adv_timer0_b_env_cfg = uvme_adv_timer_b_cfg_c::type_id::create("adv_timer0_b_env_cfg");
      adv_timer1_b_env_cfg = uvme_adv_timer_b_cfg_c::type_id::create("adv_timer1_b_env_cfg");
      adv_timer2_b_env_cfg = uvme_adv_timer_b_cfg_c::type_id::create("adv_timer2_b_env_cfg");
      adv_timer3_b_env_cfg = uvme_adv_timer_b_cfg_c::type_id::create("adv_timer3_b_env_cfg");
   endfunction

   /**
    * Configures IRQ lines.
    */
   virtual function void cfg_irq();
      irq_events_agent_cfg.lines = uvme_apb_adv_timer_ss_events_irq_lines;
   endfunction

   /**
    * TODO Implement or remove uvme_apb_adv_timer_ss_cfg_c::post_randomize()
    */
   virtual function void post_randomize_work();
   endfunction

endclass


`endif // __UVME_APB_ADV_TIMER_SS_CFG_SV__