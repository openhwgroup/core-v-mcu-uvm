// Copyright 2022 Datum Technology Corporation
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVME_CVMCU_CFG_SV__
`define __UVME_CVMCU_CFG_SV__


/**
 * Object encapsulating all parameters for creating, connecting and running CORE-V MCU environment (uvme_cvmcu_env_c) components.
 */
class uvme_cvmcu_cfg_c extends uvm_object;

   // Generic options
   rand bit                      enabled;
   rand uvm_active_passive_enum  is_active;
   rand bit                      scoreboarding_enabled;
   rand bit                      cov_model_enabled;
   rand bit                      trn_log_enabled;

   // Sub-system parameters
   rand longint unsigned  reg_block_base_address;
   rand int unsigned      sys_clk_period;

   // Agent cfg handles
   rand uvma_clk_cfg_c         sys_clk_cfg;
   rand uvma_reset_cfg_c       sys_reset_cfg;
   rand uvma_obi_cfg_c         obi_instr_cfg;
   rand uvma_obi_cfg_c         obi_data_cfg;
   rand uvma_cvmcu_intr_cfg_c  intr_cfg;

   // Objects
   rand uvme_cvmcu_reg_block_c  cvmcu_reg_block;
   rand uvml_sb_cfg_c           sb_dma_cfg;


   `uvm_object_utils_begin(uvme_cvmcu_cfg_c)
      `uvm_field_int (                         enabled              , UVM_DEFAULT)
      `uvm_field_enum(uvm_active_passive_enum, is_active            , UVM_DEFAULT)
      `uvm_field_int (                         scoreboarding_enabled, UVM_DEFAULT)
      `uvm_field_int (                         cov_model_enabled    , UVM_DEFAULT)
      `uvm_field_int (                         trn_log_enabled      , UVM_DEFAULT)

      `uvm_field_int(reg_block_base_address, UVM_DEFAULT)
      `uvm_field_int(sys_clk_period, UVM_DEFAULT + UVM_DEC)

      `uvm_field_object(sys_clk_cfg  , UVM_DEFAULT)
      `uvm_field_object(sys_reset_cfg, UVM_DEFAULT)
      `uvm_field_object(obi_instr_cfg, UVM_DEFAULT)
      `uvm_field_object(obi_data_cfg , UVM_DEFAULT)
      `uvm_field_object(intr_cfg     , UVM_DEFAULT)

      `uvm_field_object(cvmcu_reg_block, UVM_DEFAULT)
      `uvm_field_object(sb_dma_cfg, UVM_DEFAULT)
   `uvm_object_utils_end


   constraint defaults_cons {
      soft enabled                  == 0;
      soft is_active                == UVM_PASSIVE;
      soft scoreboarding_enabled    == 1;
      soft cov_model_enabled        == 0;
      soft trn_log_enabled          == 1;
           reg_block_base_address   == uvme_cvmcu_default_reg_block_base_address;
           sys_clk_period           == uvme_cvmcu_default_sys_clk_period;
   }

   constraint agent_cfg_cons {
      if (enabled) {
         sys_clk_cfg  .enabled == 1;
         sys_reset_cfg.enabled == 1;
         obi_instr_cfg.enabled == 1;
         obi_data_cfg .enabled == 1;
         intr_cfg     .enabled == 1;

         sys_clk_cfg.period == sys_clk_period;
      }
      else {
         sys_clk_cfg  .enabled == 0;
         sys_reset_cfg.enabled == 0;
         obi_instr_cfg.enabled == 0;
         obi_data_cfg .enabled == 0;
         intr_cfg     .enabled == 0;
      }

      if (is_active == UVM_ACTIVE) {
         sys_clk_cfg  .is_active == UVM_ACTIVE;
         sys_reset_cfg.is_active == UVM_ACTIVE;
         obi_instr_cfg.is_active == UVM_ACTIVE;
         obi_data_cfg .is_active == UVM_ACTIVE;
      }
      intr_cfg.is_active == UVM_PASSIVE;

      if (trn_log_enabled) {
         sys_clk_cfg  .trn_log_enabled == 1;
         sys_reset_cfg.trn_log_enabled == 1;
         obi_instr_cfg.trn_log_enabled == 1;
         obi_data_cfg .trn_log_enabled == 1;
         intr_cfg     .trn_log_enabled == 1;
      }
      else {
         sys_clk_cfg  .trn_log_enabled == 0;
         sys_reset_cfg.trn_log_enabled == 0;
         obi_instr_cfg.trn_log_enabled == 0;
         obi_data_cfg .trn_log_enabled == 0;
         intr_cfg     .trn_log_enabled == 0;
      }

      if (cov_model_enabled) {
         sys_clk_cfg  .cov_model_enabled == 1;
         sys_reset_cfg.cov_model_enabled == 1;
         obi_instr_cfg.cov_model_enabled == 1;
         obi_data_cfg .cov_model_enabled == 1;
         intr_cfg     .cov_model_enabled == 1;
      }
      else {
         sys_clk_cfg  .cov_model_enabled == 0;
         sys_reset_cfg.cov_model_enabled == 0;
         obi_instr_cfg.cov_model_enabled == 0;
         obi_data_cfg .cov_model_enabled == 0;
         intr_cfg     .cov_model_enabled == 0;
      }
   }


   /**
    * Creates sub-configuration objects.
    */
   extern function new(string name="uvme_cvmcu_cfg");

endclass : uvme_cvmcu_cfg_c


function uvme_cvmcu_cfg_c::new(string name="uvme_cvmcu_cfg");

   super.new(name);

   sys_clk_cfg   = uvma_clk_cfg_c       ::type_id::create("sys_clk_cfg");
   sys_reset_cfg = uvma_reset_cfg_c     ::type_id::create("sys_reset_cfg");
   obi_instr_cfg = uvma_obi_cfg_c       ::type_id::create("obi_instr_cfg");
   obi_data_cfg  = uvma_obi_cfg_c       ::type_id::create("obi_data_cfg");
   intr_cfg      = uvma_cvmcu_intr_cfg_c::type_id::create("intr_cfg");

   cvmcu_reg_block = uvme_cvmcu_reg_block_c::type_id::create("cvmcu_reg_block");
   cvmcu_reg_block.cfg = this;
   cvmcu_reg_block.build();

   // Create scoreboard cfg objects
   sb_dma_cfg = uvml_sb_cfg_c::type_id::create("sb_dma_cfg");

endfunction : new


`endif // __UVME_CVMCU_CFG_SV__
