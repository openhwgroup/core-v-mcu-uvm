// Copyright 2022 Datum Technology Corporation
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
// Licensed under the Solderpad Hardware License v 2.1 (the "License"); you may not use this file except in compliance
// with the License, or, at your option, the Apache License version 2.0.  You may obtain a copy of the License at
//                                        https://solderpad.org/licenses/SHL-2.1/
// Unless required by applicable law or agreed to in writing, any work distributed under the License is distributed on
// an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.  See the License for the
// specific language governing permissions and limitations under the License.
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
   
   // TODO: Add sub-environments configuration handles
   //       Ex: rand uvme_sub_env_cfg_c  sub_env_cfg;
   
   // Agent cfg handles
   rand uvma_clk_cfg_c  sys_clk_cfg;
   rand uvma_reset_cfg_c  sys_reset_cfg;
   rand uvma_obi_cfg_c  obi_master_cfg;
   
   // Objects
   rand uvme_cvmcu_reg_block_c  cvmcu_reg_block;
   // TODO Add scoreboard configuration handles
   //      Ex: rand uvml_sb_cfg_c  sb_egress_cfg;
   //          rand uvml_sb_cfg_c  sb_ingress_cfg;
   
   
   `uvm_object_utils_begin(uvme_cvmcu_cfg_c)
      `uvm_field_int (                         enabled              , UVM_DEFAULT)
      `uvm_field_enum(uvm_active_passive_enum, is_active            , UVM_DEFAULT)
      `uvm_field_int (                         scoreboarding_enabled, UVM_DEFAULT)
      `uvm_field_int (                         cov_model_enabled    , UVM_DEFAULT)
      `uvm_field_int (                         trn_log_enabled      , UVM_DEFAULT)
      
      `uvm_field_int(reg_block_base_address, UVM_DEFAULT)
      `uvm_field_int(sys_clk_period, UVM_DEFAULT + UVM_DEC)
      
      // TODO: Add sub-environments configuration field macros
      //       Ex: `uvm_field_object(sub_env_cfg, UVM_DEFAULT)
      
      `uvm_field_object(sys_clk_cfg, UVM_DEFAULT)
      `uvm_field_object(sys_reset_cfg, UVM_DEFAULT)
      `uvm_field_object(obi_master_cfg, UVM_DEFAULT)
      
      `uvm_field_object(cvmcu_reg_block, UVM_DEFAULT)
      // TODO Add scoreboard cfg field macros
      //      Ex: `uvm_field_object(sb_egress_cfg , UVM_DEFAULT)
      //          `uvm_field_object(sb_ingress_cfg, UVM_DEFAULT)
   `uvm_object_utils_end
   
   
   constraint defaults_cons {
      soft enabled                  == 0;
      soft is_active                == UVM_PASSIVE;
      soft scoreboarding_enabled    == 1;
      soft cov_model_enabled        == 0;
      soft trn_log_enabled          == 1;
           reg_block_base_address   == uvme_cvmcu_default_reg_block_base_address;
           sys_clk_period == uvme_cvmcu_default_sys_clk_period;
   }
   
   constraint agent_cfg_cons {
      if (enabled) {
         sys_clk_cfg.enabled == 1;
         sys_reset_cfg.enabled == 1;
         obi_master_cfg.enabled == 1;
         
         // TODO Assign period to sys_clk
         //      Ex: sys_clk_cfg.period == sys_clk_period;
      }
      
      if (is_active == UVM_ACTIVE) {
         sys_clk_cfg.is_active == UVM_ACTIVE;
         sys_reset_cfg.is_active == UVM_ACTIVE;
         obi_master_cfg.is_active == UVM_ACTIVE;
      }
      
      if (trn_log_enabled) {
         sys_clk_cfg.trn_log_enabled == 1;
         sys_reset_cfg.trn_log_enabled == 1;
         obi_master_cfg.trn_log_enabled == 1;
      }
   }
   
   
   /**
    * Creates sub-configuration objects.
    */
   extern function new(string name="uvme_cvmcu_cfg");
   
endclass : uvme_cvmcu_cfg_c


function uvme_cvmcu_cfg_c::new(string name="uvme_cvmcu_cfg");
   
   super.new(name);
   
   // TODO Create environment cfg objects
   //      Ex: sub_env_cfg  = uvme_sub_env_cfg_c::type_id::create("sub_env_cfg");
   
   sys_clk_cfg = uvma_clk_cfg_c::type_id::create("sys_clk_cfg");
   sys_reset_cfg = uvma_reset_cfg_c::type_id::create("sys_reset_cfg");
   obi_master_cfg = uvma_obi_cfg_c::type_id::create("obi_master_cfg");
   
   cvmcu_reg_block = uvme_cvmcu_reg_block_c::type_id::create("cvmcu_reg_block");
   cvmcu_reg_block.cfg = this;
   cvmcu_reg_block.build();
   
   // TODO Create scoreboard cfg objects
   //      Ex: sb_egress_cfg  = uvml_sb_cfg_c::type_id::create("sb_egress_cfg" );
   //          sb_ingress_cfg = uvml_sb_cfg_c::type_id::create("sb_ingress_cfg");
   
endfunction : new


`endif // __UVME_CVMCU_CFG_SV__
