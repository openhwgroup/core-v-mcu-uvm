// Copyright 2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVME_CVMCU_EVENT_ST_SB_SV__
`define __UVME_CVMCU_EVENT_ST_SB_SV__


/**
 * Component encapsulating scoreboarding components for CORE-V-MCU Event Interface UVM Agent Self-Testing Environment.
 * @ingroup uvme_cvmcu_event_st_comps
 */
class uvme_cvmcu_event_st_sb_c extends uvmx_agent_sb_c #(
   .T_CFG  (uvme_cvmcu_event_st_cfg_c  ),
   .T_CNTXT(uvme_cvmcu_event_st_cntxt_c)
);

   /// @name Components
   /// @{
   uvme_cvmcu_event_st_sb_simplex_c  sb_core_agent; ///< CORE Scoreboard.
   uvme_cvmcu_event_st_sb_simplex_c  sb_sys_agent; ///< SYS Scoreboard.
   uvme_cvmcu_event_st_sb_simplex_c  sb_c2s; ///< C2s Scoreboard.
   uvme_cvmcu_event_st_sb_simplex_c  sb_s2c; ///< S2c Scoreboard.
   /// @}


   `uvm_component_utils(uvme_cvmcu_event_st_sb_c)


   /**
    * Default constructor.
    */
   function new(string name="uvme_cvmcu_event_st_sb", uvm_component parent=null);
      super.new(name, parent);
   endfunction

   /**
    * Assigns configuration handles to components using UVM Configuration Database.
    */
   virtual function void assign_cfg();
      uvm_config_db#(uvmx_sb_simplex_cfg_c)::set(this, "sb_core_agent", "cfg", cfg.sb_core_agent_cfg);
      uvm_config_db#(uvmx_sb_simplex_cfg_c)::set(this, "sb_sys_agent", "cfg", cfg.sb_sys_agent_cfg);
      uvm_config_db#(uvmx_sb_simplex_cfg_c)::set(this, "sb_c2s", "cfg", cfg.sb_c2s_cfg);
      uvm_config_db#(uvmx_sb_simplex_cfg_c)::set(this, "sb_s2c", "cfg", cfg.sb_s2c_cfg);
      endfunction

   /**
    * Assigns context handles to components using UVM Configuration Database.
    */
   virtual function void assign_cntxt();
      uvm_config_db#(uvmx_sb_simplex_cntxt_c)::set(this, "sb_core_agent", "cntxt", cntxt.sb_core_agent_cntxt);
      uvm_config_db#(uvmx_sb_simplex_cntxt_c)::set(this, "sb_sys_agent", "cntxt", cntxt.sb_sys_agent_cntxt);
      uvm_config_db#(uvmx_sb_simplex_cntxt_c)::set(this, "sb_c2s", "cntxt", cntxt.sb_c2s_cntxt);
      uvm_config_db#(uvmx_sb_simplex_cntxt_c)::set(this, "sb_s2c", "cntxt", cntxt.sb_s2c_cntxt);
      
   endfunction

   /**
    * Creates scoreboard components.
    */
   virtual function void create_components();
      sb_core_agent = uvme_cvmcu_event_st_sb_simplex_c::type_id::create("sb_core_agent", this);
      sb_sys_agent = uvme_cvmcu_event_st_sb_simplex_c::type_id::create("sb_sys_agent", this);
      sb_c2s = uvme_cvmcu_event_st_sb_simplex_c::type_id::create("sb_c2s", this);
      sb_s2c = uvme_cvmcu_event_st_sb_simplex_c::type_id::create("sb_s2c", this);
      
   endfunction

endclass


`endif // __UVME_CVMCU_EVENT_ST_SB_SV__