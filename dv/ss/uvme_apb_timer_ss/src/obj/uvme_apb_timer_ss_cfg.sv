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

   // @name Integrals
   /// @{
   rand longint unsigned  reg_block_base_address; ///< Base address for #apb_timer_ss_reg_block   /// @}

   /// @name Agents
   /// @{
   rand uvma_apb_cfg_c  proc_agent_cfg; ///< Processor interface agent configuration
   /// @}


   /// @name Blocks
   /// @{
   rand uvme_tcounter_b_cfg_c  counter_lo_b_env_cfg; ///< Counter block 0 block configuration
   rand uvme_tcounter_b_cfg_c  counter_hi_b_env_cfg; ///< Counter block 1 block configuration
   rand uvme_tprescaler_b_cfg_c  prescaler_lo_b_env_cfg; ///< Prescaler block 0 block configuration
   rand uvme_tprescaler_b_cfg_c  prescaler_hi_b_env_cfg; ///< Prescaler block 1 block configuration
   /// @}



   `uvm_object_utils_begin(uvme_apb_timer_ss_cfg_c)
      `uvm_field_int (                         enabled              , UVM_DEFAULT)
      `uvm_field_enum(uvm_active_passive_enum, is_active            , UVM_DEFAULT)
      `uvm_field_enum(uvmx_reset_type_enum   , reset_type           , UVM_DEFAULT)
      `uvm_field_int (                         scoreboarding_enabled, UVM_DEFAULT)
      `uvm_field_int (                         cov_model_enabled    , UVM_DEFAULT)
      `uvm_field_int (                         trn_log_enabled      , UVM_DEFAULT)
      `uvm_field_int(reg_block_base_address, UVM_DEFAULT)
      `uvm_field_object(proc_agent_cfg, UVM_DEFAULT)
      `uvm_field_object(counter_lo_b_env_cfg , UVM_DEFAULT)
      `uvm_field_object(counter_hi_b_env_cfg , UVM_DEFAULT)
      `uvm_field_object(prescaler_lo_b_env_cfg , UVM_DEFAULT)
      `uvm_field_object(prescaler_hi_b_env_cfg , UVM_DEFAULT)
   `uvm_object_utils_end


   /**
    * Rules for safe default options: enabled, passive with scoreboarding and transaction logging enabled.
    */
   constraint defaults_cons {
      soft reg_block_base_address == uvme_apb_timer_ss_default_reg_block_base_address;
   }

   /**
    * Sets Processor interface agent configuration.
    */
   constraint proc_agent_cfg_cons {
      proc_agent_cfg.enabled == enabled;
      proc_agent_cfg.bypass_mode == 0;
      proc_agent_cfg.data_width == 32;
      proc_agent_cfg.addr_width == 32;
      proc_agent_cfg.is_active == UVM_PASSIVE;
      proc_agent_cfg.trn_log_enabled == trn_log_enabled;
      proc_agent_cfg.cov_model_enabled == 0;
   }

   /**
    * Sets Counter block 0 block environment configuration.
    */
   constraint counter_lo_b_env_cfg_cons {
      counter_lo_b_env_cfg.enabled == enabled;
      counter_lo_b_env_cfg.is_active == UVM_PASSIVE;
      counter_lo_b_env_cfg.scoreboarding_enabled == scoreboarding_enabled;
      counter_lo_b_env_cfg.trn_log_enabled == trn_log_enabled;
      counter_lo_b_env_cfg.cov_model_enabled == cov_model_enabled;
   }

   /**
    * Sets Counter block 1 block environment configuration.
    */
   constraint counter_hi_b_env_cfg_cons {
      counter_hi_b_env_cfg.enabled == enabled;
      counter_hi_b_env_cfg.is_active == UVM_PASSIVE;
      counter_hi_b_env_cfg.scoreboarding_enabled == scoreboarding_enabled;
      counter_hi_b_env_cfg.trn_log_enabled == trn_log_enabled;
      counter_hi_b_env_cfg.cov_model_enabled == cov_model_enabled;
   }

   /**
    * Sets Prescaler block 0 block environment configuration.
    */
   constraint prescaler_lo_b_env_cfg_cons {
      prescaler_lo_b_env_cfg.enabled == enabled;
      prescaler_lo_b_env_cfg.is_active == UVM_PASSIVE;
      prescaler_lo_b_env_cfg.scoreboarding_enabled == scoreboarding_enabled;
      prescaler_lo_b_env_cfg.trn_log_enabled == trn_log_enabled;
      prescaler_lo_b_env_cfg.cov_model_enabled == cov_model_enabled;
   }

   /**
    * Sets Prescaler block 1 block environment configuration.
    */
   constraint prescaler_hi_b_env_cfg_cons {
      prescaler_hi_b_env_cfg.enabled == enabled;
      prescaler_hi_b_env_cfg.is_active == UVM_PASSIVE;
      prescaler_hi_b_env_cfg.scoreboarding_enabled == scoreboarding_enabled;
      prescaler_hi_b_env_cfg.trn_log_enabled == trn_log_enabled;
      prescaler_hi_b_env_cfg.cov_model_enabled == cov_model_enabled;
   }

   /**
    * Default constructor.
    */
   function new(string name="uvme_apb_timer_ss_cfg");
      super.new(name);
   endfunction

   /**
    * Creates agent, sub-system, block and scoreboard configuration objects.
    */
   virtual function void create_objects();
      proc_agent_cfg = uvma_apb_cfg_c::type_id::create("proc_cfg");
      counter_lo_b_env_cfg = uvme_tcounter_b_cfg_c::type_id::create("counter_lo_b_env_cfg");
      counter_hi_b_env_cfg = uvme_tcounter_b_cfg_c::type_id::create("counter_hi_b_env_cfg");
      prescaler_lo_b_env_cfg = uvme_tprescaler_b_cfg_c::type_id::create("prescaler_lo_b_env_cfg");
      prescaler_hi_b_env_cfg = uvme_tprescaler_b_cfg_c::type_id::create("prescaler_hi_b_env_cfg");
   endfunction

endclass : uvme_apb_timer_ss_cfg_c


`endif // __UVME_APB_TIMER_SS_CFG_SV__