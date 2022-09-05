// Copyright 2022 Datum Technology Corporation
// Copyright 2022 Low Power Futures
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVME_APB_TIMER_CFG_SV__
`define __UVME_APB_TIMER_CFG_SV__


/**
 * Object encapsulating all parameters for creating, connecting and running the CORE-V MCU APB Timer Sub-System environment
 * (uvme_apb_timer_env_c) components.
 * @ingroup uvme_apb_timer_obj
 */
class uvme_apb_timer_cfg_c extends uvml_cfg_c;

   /// @name Generic options
   /// @{
   rand bit                      enabled              ; ///< Enables/disables all components' run_phase() execution
   rand uvm_active_passive_enum  is_active            ; ///< Enables/disables stimulus generation
   rand bit                      scoreboarding_enabled; ///< Connects/disconnects scoreboards
   rand bit                      cov_model_enabled    ; ///< Enables/disables agents' functional coverage models.
   rand bit                      trn_log_enabled      ; ///< Enables/disables transaction logging.
   /// @}

   /// @name Sub-system parameters
   /// @{
   rand uvml_reset_type_enum  reset_type            ; ///< Specifies if reset pulse is sync/async
   rand longint unsigned      reg_block_base_address; ///< Base address for #apb_timer_reg_block
   rand int unsigned          sys_clk_frequency; ///< Frequency for clock generation (Hz)
   /// @}

   // TODO: Add sub-environments configuration handles
   //       Ex: rand uvme_sub_env_cfg_c  sub_env_cfg; ///< Describe me!

   /// @name Agent configuration handles
   /// @{
   rand uvma_clk_cfg_c    sys_clk_cfg  ; ///< Clock agent configuration
   rand uvma_reset_cfg_c  sys_reset_cfg; ///< Reset agent configuration
   rand uvma_apb_cfg_c    apb_cfg      ; ///< Register access agent configuration
   /// @}

   /// @name Objects
   /// @{
   rand uvme_apb_timer_reg_block_c  apb_timer_reg_block; ///< Register block model
   // TODO Add scoreboard configuration handles
   //      Ex: rand uvml_sb_cfg_c  sb_egress_cfg ; ///< Describe me!
   //          rand uvml_sb_cfg_c  sb_ingress_cfg; ///< Describe me!
   /// @}


   `uvm_object_utils_begin(uvme_apb_timer_cfg_c)
      `uvm_field_int (                         enabled              , UVM_DEFAULT)
      `uvm_field_enum(uvm_active_passive_enum, is_active            , UVM_DEFAULT)
      `uvm_field_int (                         scoreboarding_enabled, UVM_DEFAULT)
      `uvm_field_int (                         cov_model_enabled    , UVM_DEFAULT)
      `uvm_field_int (                         trn_log_enabled      , UVM_DEFAULT)
      `uvm_field_int(reg_block_base_address, UVM_DEFAULT)
      `uvm_field_int(sys_clk_frequency, UVM_DEFAULT + UVM_DEC)
      // TODO: Add sub-environments configuration field macros
      //       Ex: `uvm_field_object(sub_env_cfg, UVM_DEFAULT)
      `uvm_field_object(sys_clk_cfg, UVM_DEFAULT)
      `uvm_field_object(sys_reset_cfg, UVM_DEFAULT)
      `uvm_field_object(apb_cfg, UVM_DEFAULT)
      `uvm_field_object(apb_timer_reg_block, UVM_DEFAULT)
      // TODO Add scoreboard cfg field macros
      //      Ex: `uvm_field_object(sb_egress_cfg , UVM_DEFAULT)
      //          `uvm_field_object(sb_ingress_cfg, UVM_DEFAULT)
   `uvm_object_utils_end


   /**
    * Rules for safe default options: enabled, passive with scoreboarding and transaction logging enabled.
    */
   constraint defaults_cons {
      soft enabled                     == 1;
      soft is_active                   == UVM_PASSIVE;
      soft scoreboarding_enabled       == 1;
      soft cov_model_enabled           == 0;
      soft trn_log_enabled             == 1;
           reset_type                  == UVML_RESET_TYPE_SYNCHRONOUS;
           reg_block_base_address      == uvme_apb_timer_default_reg_block_base_address;
           sys_clk_frequency           == uvme_apb_timer_default_sys_clk_frequency;
   }

   /**
    * Sets agents configuration.
    */
   constraint agent_cfg_cons {
      sys_reset_cfg.reset_type        == reset_type;
      sys_reset_cfg.polarity          == UVML_RESET_ACTIVE_LOW;
      sys_clk_cfg.mon_enabled         == 0;
      sys_clk_cfg.cov_model_enabled   == 0;
      sys_reset_cfg.cov_model_enabled == 0;
      apb_cfg.cov_model_enabled       == 0;
      apb_cfg.drv_mode                == UVMA_APB_DRV_MODE_MSTR;
      if (enabled) {
         sys_clk_cfg  .enabled == 1;
         sys_reset_cfg.enabled == 1;
         apb_cfg      .enabled == 1;
      }
      else {
         sys_clk_cfg  .enabled == 0;
         sys_reset_cfg.enabled == 0;
         apb_cfg      .enabled == 0;
      }
      if (is_active == UVM_ACTIVE) {
         sys_clk_cfg  .is_active == UVM_ACTIVE;
         sys_reset_cfg.is_active == UVM_ACTIVE;
         apb_cfg      .is_active == UVM_ACTIVE;
      }
      else {
         sys_clk_cfg  .is_active == UVM_PASSIVE;
         sys_reset_cfg.is_active == UVM_PASSIVE;
         apb_cfg      .is_active == UVM_PASSIVE;
      }
      if (trn_log_enabled) {
         sys_clk_cfg  .trn_log_enabled == 1;
         sys_reset_cfg.trn_log_enabled == 1;
         apb_cfg      .trn_log_enabled == 1;
      }
      else {
         sys_clk_cfg  .trn_log_enabled == 0;
         sys_reset_cfg.trn_log_enabled == 0;
         apb_cfg      .trn_log_enabled == 0;
      }
   }


   /**
    * Creates sub-configuration objects.
    */
   extern function new(string name="uvme_apb_timer_cfg");

endclass : uvme_apb_timer_cfg_c


function uvme_apb_timer_cfg_c::new(string name="uvme_apb_timer_cfg");

   super.new(name);
   // TODO Create sub-environment cfg objects
   //      Ex: sub_env_cfg  = uvme_sub_env_cfg_c::type_id::create("sub_env_cfg");
   sys_clk_cfg = uvma_clk_cfg_c::type_id::create("sys_clk_cfg");
   sys_reset_cfg = uvma_reset_cfg_c::type_id::create("sys_reset_cfg");
   apb_cfg = uvma_apb_cfg_c::type_id::create("apb_cfg");
   apb_timer_reg_block = uvme_apb_timer_reg_block_c::type_id::create("apb_timer_reg_block");
   apb_timer_reg_block.cfg = this;
   apb_timer_reg_block.build();
   // TODO Create scoreboard cfg objects
   //      Ex: sb_egress_cfg  = uvml_sb_simplex_cfg_c::type_id::create("sb_egress_cfg" );
   //          sb_ingress_cfg = uvml_sb_simplex_cfg_c::type_id::create("sb_ingress_cfg");

endfunction : new


`endif // __UVME_APB_TIMER_CFG_SV__
