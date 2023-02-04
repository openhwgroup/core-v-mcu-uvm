// Copyright 2022-2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVME_CVMCU_CFG_SV__
`define __UVME_CVMCU_CFG_SV__


/**
 * Object encapsulating all parameters for creating, connecting and running the CORE-V MCU environment
 * (uvme_cvmcu_env_c) components.
 * @ingroup uvme_cvmcu_obj
 */
class uvme_cvmcu_cfg_c extends uvmx_env_cfg_c;

   // @name Integrals
   /// @{
   rand longint unsigned  reg_block_base_address; ///< Base address for #cvmcu_reg_block
   /// @}

   // TODO: Sub-Environments
   //       Ex: rand uvme_sub_cfg_c  sub_env_cfg; ///< Describe me!

   /// @name Agents
   /// @{
   rand uvma_obi_cfg_c  obi_instr_cfg; ///< Register access agent configuration
   rand uvma_obi_cfg_c  obi_data_cfg ; ///< Register access agent configuration
   /// @}

   /// @name Objects
   /// @{
   // TODO Add scoreboard configuration handles
   //      Ex: rand uvml_sb_cfg_c  sb_egress_cfg ; ///< Describe me!
   //          rand uvml_sb_cfg_c  sb_ingress_cfg; ///< Describe me!
   /// @}


   `uvm_object_utils_begin(uvme_cvmcu_cfg_c)
      `uvm_field_int (                         enabled              , UVM_DEFAULT)
      `uvm_field_enum(uvm_active_passive_enum, is_active            , UVM_DEFAULT)
      `uvm_field_enum(uvmx_reset_type_enum   , reset_type           , UVM_DEFAULT)
      `uvm_field_int (                         scoreboarding_enabled, UVM_DEFAULT)
      `uvm_field_int (                         cov_model_enabled    , UVM_DEFAULT)
      `uvm_field_int (                         trn_log_enabled      , UVM_DEFAULT)
      `uvm_field_int(reg_block_base_address, UVM_DEFAULT)
      // TODO: Add sub-environments configuration field macros
      //       Ex: `uvm_field_object(sub_env_cfg, UVM_DEFAULT)
      `uvm_field_object(obi_instr_cfg, UVM_DEFAULT)
      `uvm_field_object(obi_data_cfg, UVM_DEFAULT)
      // TODO Add scoreboard cfg field macros
      //      Ex: `uvm_field_object(sb_egress_cfg , UVM_DEFAULT)
      //          `uvm_field_object(sb_ingress_cfg, UVM_DEFAULT)
   `uvm_object_utils_end


   /**
    * Rules for safe default options: enabled, passive with scoreboarding and transaction logging enabled.
    */
   constraint defaults_cons {
      soft reg_block_base_address == uvme_cvmcu_default_reg_block_base_address;
   }

   /**
    * Sets agents configuration.
    */
   constraint agent_cfg_cons {
      obi_instr_cfg.drv_mode == UVMA_OBI_DRV_MODE_MSTR;
      obi_data_cfg .drv_mode == UVMA_OBI_DRV_MODE_MSTR;
      obi_instr_cfg.cov_model_enabled == 0;
      obi_data_cfg .cov_model_enabled == 0;
      obi_instr_cfg.data_width == (uvme_cvmcu_reg_block_reg_n_bytes*8);
      obi_data_cfg .data_width == (uvme_cvmcu_reg_block_reg_n_bytes*8);
      if (enabled) {
         obi_instr_cfg.enabled == 1;
         obi_data_cfg .enabled == 1;
      }
      else {
         obi_instr_cfg.enabled == 0;
         obi_data_cfg .enabled == 0;
      }
      if (is_active == UVM_ACTIVE) {
         obi_instr_cfg.is_active == UVM_ACTIVE;
         obi_data_cfg .is_active == UVM_ACTIVE;
      }
      else {
         obi_instr_cfg.is_active == UVM_PASSIVE;
         obi_data_cfg .is_active == UVM_PASSIVE;
      }
      if (trn_log_enabled) {
         obi_instr_cfg.trn_log_enabled == 1;
         obi_data_cfg .trn_log_enabled == 1;
      }
      else {
         obi_instr_cfg.trn_log_enabled == 0;
         obi_data_cfg .trn_log_enabled == 0;
      }
   }


   /**
    * Default constructor.
    */
   function new(string name="uvme_cvmcu_cfg");
      super.new(name);
   endfunction

   /**
    *
    */
   virtual function void create_objects();
      // TODO Create sub-environment cfg objects
      //      Ex: sub_env_cfg  = uvme_sub_env_cfg_c::type_id::create("sub_env_cfg");
      obi_instr_cfg = uvma_obi_cfg_c::type_id::create("obi_instr_cfg");
      obi_data_cfg  = uvma_obi_cfg_c::type_id::create("obi_data_cfg" );
      // TODO Create scoreboard cfg objects
      //      Ex: sb_egress_cfg  = uvml_sb_simplex_cfg_c::type_id::create("sb_egress_cfg" );
      //          sb_ingress_cfg = uvml_sb_simplex_cfg_c::type_id::create("sb_ingress_cfg");
   endfunction


endclass : uvme_cvmcu_cfg_c


`endif // __UVME_CVMCU_CFG_SV__
