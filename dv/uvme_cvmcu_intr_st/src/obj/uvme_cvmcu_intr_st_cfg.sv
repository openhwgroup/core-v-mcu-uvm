// Copyright 2022 Datum Technology Corporation
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVME_CVMCU_INTR_ST_CFG_SV__
`define __UVME_CVMCU_INTR_ST_CFG_SV__


/**
 * Object encapsulating all parameters for creating, connecting and running the CORE-V MCU Interrupt UVM Agent Self-Testing
 * Environment (uvme_cvmcu_intr_st_env_c) components.
 * @ingroup uvma_cvmcu_intr_st_obj
 */
class uvme_cvmcu_intr_st_cfg_c extends uvml_cfg_c;

   /// @name Integrals
   /// @{
   rand bit                      enabled              ; ///< Enables/disables all components' run_phase() execution
   rand uvm_active_passive_enum  is_active            ; ///< Controls #active_agent_cfg's setting of the same name
   rand bit                      scoreboarding_enabled; ///< Controls #sb_cfg's 'enabled' setting
   rand bit                      cov_model_enabled    ; ///< Enables/disables agents' functional coverage models.
   rand bit                      trn_log_enabled      ; ///< Enables/disables agents' transaction logging.
   /// @}

   /// @name Objects
   /// @{
   rand uvma_cvmcu_intr_cfg_c  active_agent_cfg ; ///< Active agent configuration
   rand uvma_cvmcu_intr_cfg_c  passive_agent_cfg; ///< Passive agent configuration
   rand uvml_sb_simplex_cfg_c  sb_e2e_cfg  ; ///< End-to-end scoreboard configuration
   rand uvml_sb_simplex_cfg_c  sb_agent_cfg; ///< Agent scoreboard configuration
   /// @}


   `uvm_object_utils_begin(uvme_cvmcu_intr_st_cfg_c)
      `uvm_field_int (                         enabled              , UVM_DEFAULT)
      `uvm_field_enum(uvm_active_passive_enum, is_active            , UVM_DEFAULT)
      `uvm_field_int (                         scoreboarding_enabled, UVM_DEFAULT)
      `uvm_field_int (                         cov_model_enabled    , UVM_DEFAULT)
      `uvm_field_int (                         trn_log_enabled      , UVM_DEFAULT)
      `uvm_field_object(active_agent_cfg , UVM_DEFAULT)
      `uvm_field_object(passive_agent_cfg, UVM_DEFAULT)
      `uvm_field_object(sb_e2e_cfg       , UVM_DEFAULT)
      `uvm_field_object(sb_agent_cfg     , UVM_DEFAULT)
   `uvm_object_utils_end


   /**
    * Rules for safe default options: enabled, active with scoreboarding and transaction logging enabled.
    */
   constraint defaults_cons {
      soft enabled                == 1;
      soft is_active              == UVM_ACTIVE;
      soft scoreboarding_enabled  == 1;
      soft cov_model_enabled      == 0;
      soft trn_log_enabled        == 1;
   }

   /**
    * Sets agent configuration.
    */
   constraint agent_cfg_cons {
      if (enabled) {
         active_agent_cfg .enabled == 1;
         passive_agent_cfg.enabled == 1;
      }
      else {
         active_agent_cfg .enabled == 0;
         passive_agent_cfg.enabled == 0;
      }
      if (is_active == UVM_ACTIVE) {
         active_agent_cfg.is_active == UVM_ACTIVE ;
      }
      else {
         active_agent_cfg.is_active == UVM_PASSIVE;
      }
      passive_agent_cfg.is_active == UVM_PASSIVE;
      if (trn_log_enabled) {
         active_agent_cfg .trn_log_enabled == 1;
         passive_agent_cfg.trn_log_enabled == 1;
      }
      else {
         active_agent_cfg .trn_log_enabled == 0;
         passive_agent_cfg.trn_log_enabled == 0;
      }
      if (cov_model_enabled) {
         active_agent_cfg .cov_model_enabled == 1;
         passive_agent_cfg.cov_model_enabled == 1;
      }
      else {
         active_agent_cfg .cov_model_enabled == 0;
         passive_agent_cfg.cov_model_enabled == 0;
      }
   }

   /**
    * Sets scoreboard configurations.
    */
   constraint sb_cfg_cons {
      sb_e2e_cfg  .mode == UVML_SB_MODE_IN_ORDER;
      sb_agent_cfg.mode == UVML_SB_MODE_IN_ORDER;
      if (scoreboarding_enabled) {
         sb_e2e_cfg  .enabled == 1;
         sb_agent_cfg.enabled == 1;
      }
      else {
         sb_e2e_cfg  .enabled == 0;
         sb_agent_cfg.enabled == 0;
      }
   }


   /**
    * Creates sub-configuration objects.
    */
   extern function new(string name="uvme_cvmcu_intr_st_cfg");

endclass : uvme_cvmcu_intr_st_cfg_c


function uvme_cvmcu_intr_st_cfg_c::new(string name="uvme_cvmcu_intr_st_cfg");

   super.new(name);
   active_agent_cfg   = uvma_cvmcu_intr_cfg_c   ::type_id::create("active_agent_cfg" );
   passive_agent_cfg  = uvma_cvmcu_intr_cfg_c   ::type_id::create("passive_agent_cfg");
   sb_e2e_cfg         = uvml_sb_simplex_cfg_c::type_id::create("sb_e2e_cfg"       );
   sb_agent_cfg       = uvml_sb_simplex_cfg_c::type_id::create("sb_agent_cfg"     );

endfunction : new


`endif // __UVME_CVMCU_INTR_ST_CFG_SV__
