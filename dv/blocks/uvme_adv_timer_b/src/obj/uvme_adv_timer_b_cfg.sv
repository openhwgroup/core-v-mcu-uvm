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

   // @name Bus Widths
   /// @{ 
   rand int unsigned num_bits; ///< 
   rand int unsigned n_extsig; ///< 
   /// @}

   // @name Integrals
   /// @{
   /// @}

   /// @name Objects
   /// @{
   rand uvma_adv_timer_b_cfg_c  agent_cfg; ///< Block Agent configuration
   rand uvmx_sb_simplex_cfg_c  sb_cfg; ///< Data path scoreboard configuration
   /// @}


   `uvm_object_utils_begin(uvme_adv_timer_b_cfg_c)
      `uvm_field_int (                         enabled              , UVM_DEFAULT)
      `uvm_field_enum(uvm_active_passive_enum, is_active            , UVM_DEFAULT)
      `uvm_field_int (                         num_bits, UVM_DEFAULT + UVM_DEC)
      `uvm_field_int (                         n_extsig, UVM_DEFAULT + UVM_DEC)
      `uvm_field_enum(uvmx_reset_type_enum   , reset_type           , UVM_DEFAULT)
      `uvm_field_int (                         scoreboarding_enabled, UVM_DEFAULT)
      `uvm_field_object(agent_cfg, UVM_DEFAULT)
      `uvm_field_object(sb_cfg   , UVM_DEFAULT)
   `uvm_object_utils_end


   /**
    * Sets variable bit width fields for agent configurations.
    */
   constraint bw_cons {
     agent_cfg.num_bits == num_bits;
     agent_cfg.n_extsig == n_extsig;
   }

   /**
    * Sets agent configuration.
    */
   constraint agent_cfg_cons {
      agent_cfg.enabled     == enabled;
      agent_cfg.is_active   == is_active;
      agent_cfg.bypass_mode == 0;
   }

   /**
    * Sets scoreboard configuration.
    */
   constraint sb_cons {
      sb_cfg.enabled     == scoreboarding_enabled;
      sb_cfg.mode        == UVMX_SB_MODE_IN_ORDER;
      sb_cfg.log_enabled == 1;
   }


   /**
    * Default constructor.
    */
   function new(string name="uvme_adv_timer_b_cfg");
      super.new(name);
   endfunction

   /**
    * Creates objects.
    */
   virtual function void create_objects();
      agent_cfg = uvma_adv_timer_b_cfg_c::type_id::create("agent_cfg");
      sb_cfg    = uvmx_sb_simplex_cfg_c::type_id::create("sb_cfg");
   endfunction

   /**
    * Adds fields to Scoreboard logs.
    */
   function void post_randomize();
      sb_cfg.reset_log();
      // TODO Add scoreboard transaction log fields
      //      Ex: sb_cfg.add_to_log("abc");
      //          sb_cfg.add_to_log("def");
   endfunction

endclass : uvme_adv_timer_b_cfg_c


`endif // __UVME_ADV_TIMER_B_CFG_SV__