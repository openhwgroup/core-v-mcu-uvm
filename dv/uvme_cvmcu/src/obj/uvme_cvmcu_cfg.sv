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
   rand uvma_obi_cfg_c  obi_instr_cfg; ///< Instruction OBI agent configuration
   rand uvma_obi_cfg_c  obi_data_cfg ; ///< Data OBI agent configuration
   rand uvma_apb_cfg_c  apb_cfg      ; ///< APB agent configuration
   rand uvma_irq_cfg_c  irq_cfg      ; ///< Interrupt request agent configuration
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
      `uvm_field_object(obi_data_cfg , UVM_DEFAULT)
      `uvm_field_object(apb_cfg      , UVM_DEFAULT)
      `uvm_field_object(irq_cfg      , UVM_DEFAULT)
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
      apb_cfg      .cov_model_enabled == 0;
      irq_cfg      .cov_model_enabled == 0;
      obi_instr_cfg.addr_width == 32;
      obi_data_cfg .addr_width == 32;
      apb_cfg      .addr_width == 32;
      obi_instr_cfg.data_width == (uvme_cvmcu_reg_block_reg_n_bytes*8);
      obi_data_cfg .data_width == (uvme_cvmcu_reg_block_reg_n_bytes*8);
      apb_cfg      .data_width == (uvme_cvmcu_reg_block_reg_n_bytes*8);
      apb_cfg      .sel_width  == 1;
      irq_cfg      .num_lines  == 32;
      obi_instr_cfg.enabled == enabled;
      obi_data_cfg .enabled == enabled;
      apb_cfg      .enabled == enabled;
      irq_cfg      .enabled == enabled;
      obi_instr_cfg.is_active == is_active;
      obi_data_cfg .is_active == is_active;
      apb_cfg.is_active == UVM_PASSIVE;
      irq_cfg.is_active == UVM_PASSIVE;
      obi_instr_cfg.trn_log_enabled == trn_log_enabled;
      obi_data_cfg .trn_log_enabled == trn_log_enabled;
      apb_cfg      .trn_log_enabled == trn_log_enabled;
      irq_cfg      .trn_log_enabled == trn_log_enabled;
   }


   /**
    * Default constructor.
    */
   function new(string name="uvme_cvmcu_cfg");
      super.new(name);
   endfunction

   /**
    * Creates agents.
    */
   virtual function void create_objects();
      // TODO Create sub-environment cfg objects
      //      Ex: sub_env_cfg  = uvme_sub_env_cfg_c::type_id::create("sub_env_cfg");
      obi_instr_cfg = uvma_obi_cfg_c::type_id::create("obi_instr_cfg");
      obi_data_cfg  = uvma_obi_cfg_c::type_id::create("obi_data_cfg" );
      apb_cfg       = uvma_apb_cfg_c::type_id::create("apb_cfg"      );
      irq_cfg       = uvma_irq_cfg_c::type_id::create("irq_cfg"      );
      // TODO Create scoreboard cfg objects
      //      Ex: sb_egress_cfg  = uvml_sb_simplex_cfg_c::type_id::create("sb_egress_cfg" );
      //          sb_ingress_cfg = uvml_sb_simplex_cfg_c::type_id::create("sb_ingress_cfg");
   endfunction

   /**
    * Configures IRQ lines.
    */
   function void post_randomize();
      super.post_randomize();
      irq_cfg.lines = uvme_cvmcu_irq_lines;
   endfunction


endclass : uvme_cvmcu_cfg_c


`endif // __UVME_CVMCU_CFG_SV__
