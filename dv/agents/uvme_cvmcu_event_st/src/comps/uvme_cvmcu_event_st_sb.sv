// Copyright 2023 Acme Enterprises
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
   uvme_cvmcu_event_st_sb_simplex_c  sb_agent; ///< Agent Scoreboard.
   uvme_cvmcu_event_st_sb_simplex_c  sb_e2e  ; ///< End-to-end Scoreboard.
   /// @}


   `uvm_component_utils(uvme_cvmcu_event_st_sb_c)


   /**
    * Default constructor.
    */
   function new(string name="uvme_cvmcu_event_st_sb", uvm_component parent=null);
      super.new(name, parent);
   endfunction

   /**
    *
    */
   virtual function void assign_cfg();
      uvm_config_db#(uvml_sb_simplex_cfg_c)::set(this, "sb_agent", "cfg", cfg.sb_agent_cfg);
      uvm_config_db#(uvml_sb_simplex_cfg_c)::set(this, "sb_e2e"  , "cfg", cfg.sb_e2e_cfg  );
      endfunction

   /**
    *
    */
   virtual function void assign_cntxt();
      uvm_config_db#(uvml_sb_simplex_cntxt_c)::set(this, "sb_agent", "cntxt", cntxt.sb_agent_cntxt);
      uvm_config_db#(uvml_sb_simplex_cntxt_c)::set(this, "sb_e2e"  , "cntxt", cntxt.sb_e2e_cntxt  );
   
   endfunction

   /**
    * Creates scoreboard components.
    */
   virtual function void create_components();
      sb_agent = uvme_cvmcu_event_st_sb_simplex_c::type_id::create("sb_agent", this);
      sb_e2e   = uvme_cvmcu_event_st_sb_simplex_c::type_id::create("sb_e2e"  , this);
   
   endfunction

endclass : uvme_cvmcu_event_st_sb_c


`endif // __UVME_CVMCU_EVENT_ST_SB_SV__