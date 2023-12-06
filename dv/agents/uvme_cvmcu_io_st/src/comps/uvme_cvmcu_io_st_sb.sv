// Copyright 2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVME_CVMCU_IO_ST_SB_SV__
`define __UVME_CVMCU_IO_ST_SB_SV__


/**
 * Component encapsulating scoreboarding components for CORE-V-MCU IO UVM Agent Self-Testing Environment.
 * @ingroup uvme_cvmcu_io_st_comps
 */
class uvme_cvmcu_io_st_sb_c extends uvmx_agent_sb_c #(
   .T_CFG  (uvme_cvmcu_io_st_cfg_c  ),
   .T_CNTXT(uvme_cvmcu_io_st_cntxt_c)
);

   /// @name Components
   /// @{
   uvme_cvmcu_io_st_sb_simplex_c  sb_board_agent; ///< BOARD Scoreboard.
   uvme_cvmcu_io_st_sb_simplex_c  sb_chip_agent; ///< CHIP Scoreboard.
   uvme_cvmcu_io_st_sb_simplex_c  sb_ig; ///< Ig Scoreboard.
   uvme_cvmcu_io_st_sb_simplex_c  sb_eg; ///< Eg Scoreboard.
   /// @}


   `uvm_component_utils(uvme_cvmcu_io_st_sb_c)


   /**
    * Default constructor.
    */
   function new(string name="uvme_cvmcu_io_st_sb", uvm_component parent=null);
      super.new(name, parent);
   endfunction

   /**
    * Assigns configuration handles to components using UVM Configuration Database.
    */
   virtual function void assign_cfg();
      uvm_config_db#(uvmx_sb_simplex_cfg_c)::set(this, "sb_board_agent", "cfg", cfg.sb_board_agent_cfg);
      uvm_config_db#(uvmx_sb_simplex_cfg_c)::set(this, "sb_chip_agent", "cfg", cfg.sb_chip_agent_cfg);
      uvm_config_db#(uvmx_sb_simplex_cfg_c)::set(this, "sb_ig", "cfg", cfg.sb_ig_cfg);
      uvm_config_db#(uvmx_sb_simplex_cfg_c)::set(this, "sb_eg", "cfg", cfg.sb_eg_cfg);
      endfunction

   /**
    * Assigns context handles to components using UVM Configuration Database.
    */
   virtual function void assign_cntxt();
      uvm_config_db#(uvmx_sb_simplex_cntxt_c)::set(this, "sb_board_agent", "cntxt", cntxt.sb_board_agent_cntxt);
      uvm_config_db#(uvmx_sb_simplex_cntxt_c)::set(this, "sb_chip_agent", "cntxt", cntxt.sb_chip_agent_cntxt);
      uvm_config_db#(uvmx_sb_simplex_cntxt_c)::set(this, "sb_ig", "cntxt", cntxt.sb_ig_cntxt);
      uvm_config_db#(uvmx_sb_simplex_cntxt_c)::set(this, "sb_eg", "cntxt", cntxt.sb_eg_cntxt);
      
   endfunction

   /**
    * Creates scoreboard components.
    */
   virtual function void create_components();
      sb_board_agent = uvme_cvmcu_io_st_sb_simplex_c::type_id::create("sb_board_agent", this);
      sb_chip_agent = uvme_cvmcu_io_st_sb_simplex_c::type_id::create("sb_chip_agent", this);
      sb_ig = uvme_cvmcu_io_st_sb_simplex_c::type_id::create("sb_ig", this);
      sb_eg = uvme_cvmcu_io_st_sb_simplex_c::type_id::create("sb_eg", this);
      
   endfunction

endclass


`endif // __UVME_CVMCU_IO_ST_SB_SV__