// Copyright 2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVME_ADV_TIMER_B_CFG_SV__
`define __UVME_ADV_TIMER_B_CFG_SV__


/**
 * Object encapsulating all parameters for creating, connecting and running the Advanced timer counter Block environment (uvme_adv_timer_b_env_c).
 * @ingroup uvme_adv_timer_b_obj
 */
class uvme_adv_timer_b_cfg_c extends uvmx_block_env_cfg_c;

   /// @name Settings
   /// @{
   /// @}

   // @name Bus Widths
   /// @{ 
   rand int unsigned num_bits; ///< 
   rand int unsigned n_extsig; ///< 
   /// @}

    /// @name Objects
   /// @{
   rand uvma_adv_timer_b_cfg_c  agent_cfg; ///< Block Agent configuration
   rand uvmx_sb_simplex_cfg_c  sb_cfg; ///< Data path scoreboard configuration
   /// @}


   `uvm_object_utils_begin(uvme_adv_timer_b_cfg_c)
      `uvm_field_int(enabled, UVM_DEFAULT)
      `uvm_field_enum(uvm_active_passive_enum, is_active, UVM_DEFAULT)
      `uvm_field_enum(uvmx_reset_type_enum, reset_type, UVM_DEFAULT)
      `uvm_field_int(drv_idle_random, UVM_DEFAULT)
      `uvm_field_int(scoreboarding_enabled, UVM_DEFAULT)
      `uvm_field_int(num_bits, UVM_DEFAULT + UVM_DEC)
      `uvm_field_int(n_extsig, UVM_DEFAULT + UVM_DEC)
      `uvm_field_object(agent_cfg, UVM_DEFAULT)
      `uvm_field_object(sb_cfg, UVM_DEFAULT)
   `uvm_object_utils_end



   /**
    * Assigns agent variable bit width fields.
    */
   constraint bw_sync_cons {
     agent_cfg.num_bits == num_bits;
     agent_cfg.n_extsig == n_extsig;
   }

   /**
    * Sets configuration fields for basic agent configuration.
    */
   constraint agent_basics_cons {
      agent_cfg.enabled         == enabled;
      agent_cfg.is_active       == is_active;
      agent_cfg.drv_idle_random == drv_idle_random;
      agent_cfg.bypass_mode     == 0;
   }

   /**
    * Sets all configuration fields for scoreboard.
    */
   constraint sb_cons {
      sb_cfg.enabled     == scoreboarding_enabled;
      sb_cfg.mode        == UVMX_SB_MODE_IN_ORDER;
      sb_cfg.log_enabled == 1;
   }

   /**
    * TODO Implement or remove uvme_adv_timer_b_cfg_c::rules_cons
    */
   constraint rules_cons {
   }


   /**
    * Default constructor.
    */
   function new(string name="uvme_adv_timer_b_cfg");
      super.new(name);
   endfunction

   /**
    * Initializes objects and arrays.
    */
   virtual function void build();
      agent_cfg = uvma_adv_timer_b_cfg_c::type_id::create("agent_cfg");
      sb_cfg = uvmx_sb_simplex_cfg_c::type_id::create("sb_cfg");
   endfunction

   /**
    * Adds transaction fields to scoreboard logs.
    */
   virtual function void cfg_sb_logs();
      // TODO Complete uvme_adv_timer_b_cfg_c scoreboard logging configuration
   endfunction

   /**
    * TODO Implement uvme_adv_timer_b_cfg_c::post_randomize() or remove altogether
    */
   virtual function void post_randomize_work();
   endfunction

endclass


`endif // __UVME_ADV_TIMER_B_CFG_SV__