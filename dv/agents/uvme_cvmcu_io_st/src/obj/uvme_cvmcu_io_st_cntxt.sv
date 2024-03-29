// Copyright 2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVME_CVMCU_IO_ST_CNTXT_SV__
`define __UVME_CVMCU_IO_ST_CNTXT_SV__


/**
 * Object encapsulating all state variables for CORE-V-MCU IO UVM Agent Self-Test Environment (uvme_cvmcu_io_st_env_c).
 * @ingroup uvme_cvmcu_io_st_obj
 */
class uvme_cvmcu_io_st_cntxt_c extends uvmx_agent_env_cntxt_c #(
   .T_CFG(uvme_cvmcu_io_st_cfg_c)
);

   /// @name Agent Context Handles
   /// @{
   uvma_cvmcu_io_cntxt_c  board_agent_cntxt; ///< BOARD Agent context.
   uvma_cvmcu_io_cntxt_c  chip_agent_cntxt; ///< CHIP Agent context.
   uvma_cvmcu_io_cntxt_c  passive_cntxt; ///< Passive Agent context.
   /// @}

   /// @name Objects
   /// @{
   uvmx_sb_simplex_cntxt_c  sb_board_agent_cntxt; ///< BOARD Scoreboard context.
   uvmx_sb_simplex_cntxt_c  sb_chip_agent_cntxt; ///< CHIP Scoreboard context.
   uvmx_sb_simplex_cntxt_c  sb_ig_cntxt; ///< IG Scoreboard context.
   uvmx_sb_simplex_cntxt_c  sb_eg_cntxt; ///< EG Scoreboard context.
   /// @}


   `uvm_object_utils_begin(uvme_cvmcu_io_st_cntxt_c)
      `uvm_field_object(board_agent_cntxt, UVM_DEFAULT)
      `uvm_field_object(chip_agent_cntxt, UVM_DEFAULT)
      `uvm_field_object(passive_cntxt, UVM_DEFAULT)
      `uvm_field_object(sb_board_agent_cntxt, UVM_DEFAULT)
      `uvm_field_object(sb_chip_agent_cntxt, UVM_DEFAULT)
      `uvm_field_object(sb_ig_cntxt, UVM_DEFAULT)
      `uvm_field_object(sb_eg_cntxt, UVM_DEFAULT)
   `uvm_object_utils_end


   /**
    * Default constructor.
    */
   function new(string name="uvme_cvmcu_io_st_cntxt");
      super.new(name);
   endfunction

   /**
    * Creates objects.
    */
   virtual function void create_objects();
      board_agent_cntxt = uvma_cvmcu_io_cntxt_c::type_id::create("board_agent_cntxt");
      chip_agent_cntxt = uvma_cvmcu_io_cntxt_c::type_id::create("chip_agent_cntxt");
      passive_cntxt = uvma_cvmcu_io_cntxt_c::type_id::create("passive_cntxt");
      sb_board_agent_cntxt = uvmx_sb_simplex_cntxt_c::type_id::create("sb_board_agent_cntxt");
      sb_chip_agent_cntxt = uvmx_sb_simplex_cntxt_c::type_id::create("sb_chip_agent_cntxt");
      sb_ig_cntxt = uvmx_sb_simplex_cntxt_c::type_id::create("sb_ig_cntxt");
      sb_eg_cntxt = uvmx_sb_simplex_cntxt_c::type_id::create("sb_eg_cntxt");
      board_agent_cntxt.create_objects(cfg.board_cfg);
      chip_agent_cntxt.create_objects(cfg.chip_cfg);
   endfunction

   /**
    * Forces all agent contexts to reset.
    */
   virtual function void reset();
      board_agent_cntxt.reset();
      chip_agent_cntxt.reset();
      passive_cntxt.reset();
   endfunction

endclass : uvme_cvmcu_io_st_cntxt_c


`endif // __UVME_CVMCU_IO_ST_CNTXT_SV__