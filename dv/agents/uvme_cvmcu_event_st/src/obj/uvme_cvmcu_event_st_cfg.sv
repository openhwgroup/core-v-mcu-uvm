// Copyright 2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVME_CVMCU_EVENT_ST_CFG_SV__
`define __UVME_CVMCU_EVENT_ST_CFG_SV__


/**
 * Object encapsulating all parameters for creating, connecting and running CORE-V-MCU Event Interface UVM Agent Self-Testing Environment (uvme_cvmcu_event_st_env_c).
 * @ingroup uvme_cvmcu_event_st_obj
 */
class uvme_cvmcu_event_st_cfg_c extends uvmx_agent_env_cfg_c;

   /// @name Parameters
   /// @{
   rand bit  drv_idle_random; ///< Specifies the type of data to send during idle cycles
   /// @}

   /// @name Objects
   /// @{
   rand uvma_cvmcu_event_cfg_c  core_agent_cfg; ///< CORE Agent configuration.
   rand uvma_cvmcu_event_cfg_c  sys_agent_cfg; ///< SYS Agent configuration.
   rand uvma_cvmcu_event_cfg_c  passive_agent_cfg; ///< Passive Agent configuration.
   rand uvmx_sb_simplex_cfg_c  sb_core_agent_cfg; ///< CORE Agent configuration.
   rand uvmx_sb_simplex_cfg_c  sb_sys_agent_cfg; ///< SYS Agent configuration.
   rand uvmx_sb_simplex_cfg_c  sb_c2s_cfg; ///< C2s Agent configuration.
   rand uvmx_sb_simplex_cfg_c  sb_s2c_cfg; ///< S2c Agent configuration.
   /// @}


   `uvm_object_utils_begin(uvme_cvmcu_event_st_cfg_c)
      `uvm_field_int (enabled, UVM_DEFAULT)
      `uvm_field_enum(uvm_active_passive_enum, is_active, UVM_DEFAULT)
      `uvm_field_int(drv_idle_random, UVM_DEFAULT)
      `uvm_field_enum(uvmx_reset_type_enum, reset_type, UVM_DEFAULT)
      `uvm_field_int(scoreboarding_enabled, UVM_DEFAULT)
      `uvm_field_object(core_agent_cfg, UVM_DEFAULT)
      `uvm_field_object(sys_agent_cfg, UVM_DEFAULT)
      `uvm_field_object(passive_agent_cfg, UVM_DEFAULT)
      `uvm_field_object(sb_core_agent_cfg, UVM_DEFAULT)
      `uvm_field_object(sb_sys_agent_cfg, UVM_DEFAULT)
      `uvm_field_object(sb_c2s_cfg, UVM_DEFAULT)
      `uvm_field_object(sb_s2c_cfg, UVM_DEFAULT)
   `uvm_object_utils_end


   /**
    * Sets valid and default values for agent parameters.
    */
   constraint agents_params_cons {
      core_agent_cfg.drv_idle_random == drv_idle_random;
      sys_agent_cfg.drv_idle_random == drv_idle_random;
   }

   /**
    * Sets configuration fields for basic agents configurations.
    */
   constraint agents_basic_cons {
      core_agent_cfg.enabled == enabled;
      sys_agent_cfg.enabled == enabled;
      passive_agent_cfg.enabled == enabled;
      passive_agent_cfg.is_active == UVM_PASSIVE;
      core_agent_cfg.is_active == is_active;
      sys_agent_cfg.is_active == is_active;
      core_agent_cfg.bypass_mode == 0;
      sys_agent_cfg.bypass_mode == 0;
      passive_agent_cfg.bypass_mode == 0;
      core_agent_cfg.drv_mode == UVMA_CVMCU_EVENT_DRV_MODE_CORE;
      sys_agent_cfg.drv_mode == UVMA_CVMCU_EVENT_DRV_MODE_SYS;
      core_agent_cfg.reset_type == reset_type;
      sys_agent_cfg.reset_type == reset_type;
      passive_agent_cfg.reset_type == reset_type;
   }

   /**
    * Sets all configuration fields for scoreboards.
    */
   constraint sb_cons {
      sb_core_agent_cfg.mode == UVMX_SB_MODE_IN_ORDER;
      sb_sys_agent_cfg.mode == UVMX_SB_MODE_IN_ORDER;
      sb_c2s_cfg.mode == UVMX_SB_MODE_IN_ORDER;
      sb_s2c_cfg.mode == UVMX_SB_MODE_IN_ORDER;
      sb_core_agent_cfg.enabled == scoreboarding_enabled;
      sb_sys_agent_cfg.enabled == scoreboarding_enabled;
      sb_c2s_cfg.enabled == scoreboarding_enabled;
      sb_s2c_cfg.enabled == scoreboarding_enabled;
   }

   /**
    * TODO Implement or remove uvme_cvmcu_event_st_cfg_c::rules_cons
    */
   constraint rules_cons {
   }


   /**
    * Default constructor.
    */
   function new(string name="uvme_cvmcu_event_st_cfg");
      super.new(name);
   endfunction

   /**
    * Initializes objects and arrays.
    */
   virtual function void build();
      core_agent_cfg = uvma_cvmcu_event_cfg_c::type_id::create("core_agent_cfg");
      sys_agent_cfg = uvma_cvmcu_event_cfg_c::type_id::create("sys_agent_cfg");
      passive_agent_cfg = uvma_cvmcu_event_cfg_c::type_id::create("passive_agent_cfg");
      sb_core_agent_cfg = uvmx_sb_simplex_cfg_c::type_id::create("sb_core_agent_cfg");
      sb_sys_agent_cfg = uvmx_sb_simplex_cfg_c::type_id::create("sb_sys_agent_cfg");
      sb_c2s_cfg = uvmx_sb_simplex_cfg_c::type_id::create("sb_c2s_cfg");
      sb_s2c_cfg = uvmx_sb_simplex_cfg_c::type_id::create("sb_s2c_cfg");
   endfunction

   /**
    * Adds transaction fields to scoreboard logs.
    */
   virtual function void cfg_sb_logs();
      sb_core_agent_cfg.add_to_log("size");
      sb_sys_agent_cfg.add_to_log("size");
      sb_c2s_cfg.add_to_log("size");
      sb_s2c_cfg.add_to_log("size");
      sb_core_agent_cfg.add_to_log("data");
      sb_sys_agent_cfg.add_to_log("data");
      sb_c2s_cfg.add_to_log("data");
      sb_s2c_cfg.add_to_log("data");
      // TODO Complete uvme_cvmcu_event_st_cfg_c scoreboard logging configuration
   endfunction

   /**
    * TODO Implement uvme_cvmcu_event_st_cfg_c::post_randomize() or remove altogether
    */
   virtual function void post_randomize_work();
   endfunction

endclass


`endif // __UVME_CVMCU_EVENT_ST_CFG_SV__