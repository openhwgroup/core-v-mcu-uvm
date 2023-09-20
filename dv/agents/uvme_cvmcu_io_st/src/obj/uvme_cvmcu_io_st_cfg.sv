// Copyright 2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVME_CVMCU_IO_ST_CFG_SV__
`define __UVME_CVMCU_IO_ST_CFG_SV__


/**
 * Object encapsulating all parameters for creating, connecting and running CORE-V-MCU IO UVM Agent Self-Testing Environment (uvme_cvmcu_io_st_env_c).
 * @ingroup uvme_cvmcu_io_st_obj
 */
class uvme_cvmcu_io_st_cfg_c extends uvmx_agent_env_cfg_c;

   /// @name Integrals
   /// @{
   rand bit  drv_idle_random; ///< Specifies the type of data to send during idle cycles
   /// @}

   /// @name Objects
   /// @{
   rand uvma_cvmcu_io_cfg_c  board_agent_cfg; ///< BOARD Agent configuration.
   rand uvma_cvmcu_io_cfg_c  chip_agent_cfg; ///< CHIP Agent configuration.
   rand uvma_cvmcu_io_cfg_c  passive_cfg; ///< Passive Agent configuration.
   rand uvmx_sb_simplex_cfg_c  sb_board_agent_cfg; ///< BOARD Agent configuration.
   rand uvmx_sb_simplex_cfg_c  sb_chip_agent_cfg; ///< CHIP Agent configuration.
   rand uvmx_sb_simplex_cfg_c  sb_ig_cfg; ///< IG Agent configuration.
   rand uvmx_sb_simplex_cfg_c  sb_eg_cfg; ///< EG Agent configuration.
      /// @}


   `uvm_object_utils_begin(uvme_cvmcu_io_st_cfg_c)
      `uvm_field_int (                         enabled              , UVM_DEFAULT          )
      `uvm_field_enum(uvm_active_passive_enum, is_active            , UVM_DEFAULT          )
      `uvm_field_int (                         drv_idle_random      , UVM_DEFAULT          )
      `uvm_field_enum(uvmx_reset_type_enum   , reset_type           , UVM_DEFAULT          )
      `uvm_field_int (                         scoreboarding_enabled, UVM_DEFAULT          )
      `uvm_field_object(board_agent_cfg, UVM_DEFAULT)
      `uvm_field_object(chip_agent_cfg, UVM_DEFAULT)
      `uvm_field_object(passive_cfg, UVM_DEFAULT)
      `uvm_field_object(sb_board_agent_cfg, UVM_DEFAULT)
      `uvm_field_object(sb_chip_agent_cfg, UVM_DEFAULT)
      `uvm_field_object(sb_ig_cfg, UVM_DEFAULT)
      `uvm_field_object(sb_eg_cfg, UVM_DEFAULT)
   `uvm_object_utils_end


   /**
    * Sets all configuration fields for agent configurations.
    */
   constraint agents_cfg_cons {
      board_agent_cfg.bypass_mode == 0;
      chip_agent_cfg.bypass_mode == 0;
      passive_cfg.bypass_mode == 0;
      board_agent_cfg.drv_mode == UVMA_CVMCU_IO_DRV_MODE_BOARD;
      chip_agent_cfg.drv_mode == UVMA_CVMCU_IO_DRV_MODE_CHIP;
      board_agent_cfg.drv_idle_random == drv_idle_random;
      chip_agent_cfg.drv_idle_random == drv_idle_random;
      board_agent_cfg.reset_type == reset_type;
      chip_agent_cfg.reset_type == reset_type;
      passive_cfg.reset_type == reset_type;
      board_agent_cfg.enabled == enabled;
      chip_agent_cfg.enabled == enabled;
      passive_cfg.enabled == enabled;
      passive_cfg.is_active == UVM_PASSIVE;
      board_agent_cfg.is_active == is_active;
      chip_agent_cfg.is_active == is_active;
   }

   /**
    * Sets all configuration fields for Scoreboard configurations.
    */
   constraint sb_e2e_cfg_cons {
      sb_board_agent_cfg.mode == UVMX_SB_MODE_IN_ORDER;
      sb_chip_agent_cfg.mode == UVMX_SB_MODE_IN_ORDER;
      sb_ig_cfg.mode == UVMX_SB_MODE_IN_ORDER;
      sb_eg_cfg.mode == UVMX_SB_MODE_IN_ORDER;
      sb_board_agent_cfg.enabled == scoreboarding_enabled;
      sb_chip_agent_cfg.enabled == scoreboarding_enabled;
      sb_ig_cfg.enabled == scoreboarding_enabled;
      sb_eg_cfg.enabled == scoreboarding_enabled;
   }


   /**
    * Default constructor.
    */
   function new(string name="uvme_cvmcu_io_st_cfg");
      super.new(name);
   endfunction

   /**
    * Creates objects.
    */
   virtual function void create_objects();
      board_agent_cfg = uvma_cvmcu_io_cfg_c::type_id::create("board_agent_cfg");
      chip_agent_cfg = uvma_cvmcu_io_cfg_c::type_id::create("chip_agent_cfg");
      passive_cfg = uvma_cvmcu_io_cfg_c::type_id::create("passive_cfg");
      sb_board_agent_cfg = uvmx_sb_simplex_cfg_c::type_id::create("sb_board_agent_cfg");
      sb_chip_agent_cfg = uvmx_sb_simplex_cfg_c::type_id::create("sb_chip_agent_cfg");
      sb_ig_cfg = uvmx_sb_simplex_cfg_c::type_id::create("sb_ig_cfg");
      sb_eg_cfg = uvmx_sb_simplex_cfg_c::type_id::create("sb_eg_cfg");
   endfunction

   /**
    * Adds fields to Scoreboard logs.
    */
   function void post_randomize();
      sb_board_agent_cfg.reset_log();
      sb_chip_agent_cfg.reset_log();
      sb_ig_cfg.reset_log();
      sb_eg_cfg.reset_log();
      sb_board_agent_cfg.add_to_log("size");
      sb_chip_agent_cfg.add_to_log("size");
      sb_ig_cfg.add_to_log("size");
      sb_eg_cfg.add_to_log("size");
      sb_board_agent_cfg.add_to_log("data");
      sb_chip_agent_cfg.add_to_log("data");
      sb_ig_cfg.add_to_log("data");
      sb_eg_cfg.add_to_log("data");
   endfunction

endclass : uvme_cvmcu_io_st_cfg_c


`endif // __UVME_CVMCU_IO_ST_CFG_SV__