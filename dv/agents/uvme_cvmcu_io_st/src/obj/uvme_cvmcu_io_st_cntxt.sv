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
   uvma_cvmcu_io_cntxt_c  passive_agent_cntxt; ///< Passive Agent context.
   /// @}

   /// @name Objects
   /// @{
   uvmx_sb_simplex_cntxt_c  sb_board_agent_cntxt; ///< BOARD Scoreboard context.
   uvmx_sb_simplex_cntxt_c  sb_chip_agent_cntxt; ///< CHIP Scoreboard context.
   uvmx_sb_simplex_cntxt_c  sb_ig_cntxt; ///< Ig Scoreboard context.
   uvmx_sb_simplex_cntxt_c  sb_eg_cntxt; ///< Eg Scoreboard context.
   /// @}


   `uvm_object_utils_begin(uvme_cvmcu_io_st_cntxt_c)
      `uvm_field_object(board_agent_cntxt, UVM_DEFAULT)
      `uvm_field_object(chip_agent_cntxt, UVM_DEFAULT)
      `uvm_field_object(passive_agent_cntxt, UVM_DEFAULT)
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
   virtual function void build(uvme_cvmcu_io_st_cfg_c cfg);
      board_agent_cntxt = uvma_cvmcu_io_cntxt_c::type_id::create("board_agent_cntxt");
      chip_agent_cntxt = uvma_cvmcu_io_cntxt_c::type_id::create("chip_agent_cntxt");
      passive_agent_cntxt = uvma_cvmcu_io_cntxt_c::type_id::create("passive_agent_cntxt");
      sb_board_agent_cntxt = uvmx_sb_simplex_cntxt_c::type_id::create("sb_board_agent_cntxt");
      sb_chip_agent_cntxt = uvmx_sb_simplex_cntxt_c::type_id::create("sb_chip_agent_cntxt");
      sb_ig_cntxt = uvmx_sb_simplex_cntxt_c::type_id::create("sb_ig_cntxt");
      sb_eg_cntxt = uvmx_sb_simplex_cntxt_c::type_id::create("sb_eg_cntxt");
   endfunction

   /**
    * Returns all state variables to initial values.
    */
   virtual function void do_reset(uvme_cvmcu_io_st_cfg_c cfg);
      board_agent_cntxt.reset();
      chip_agent_cntxt.reset();
      passive_agent_cntxt.reset();
   endfunction

endclass


`endif // __UVME_CVMCU_IO_ST_CNTXT_SV__