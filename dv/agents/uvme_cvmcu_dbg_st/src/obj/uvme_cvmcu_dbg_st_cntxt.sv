// Copyright 2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVME_CVMCU_DBG_ST_CNTXT_SV__
`define __UVME_CVMCU_DBG_ST_CNTXT_SV__


/**
 * Object encapsulating all state variables for CORE-V-MCU Debug Interface UVM Agent Self-Test Environment (uvme_cvmcu_dbg_st_env_c).
 * @ingroup uvme_cvmcu_dbg_st_obj
 */
class uvme_cvmcu_dbg_st_cntxt_c extends uvmx_agent_env_cntxt_c #(
   .T_CFG(uvme_cvmcu_dbg_st_cfg_c)
);

   /// @name Agent Context Handles
   /// @{
   uvma_cvmcu_dbg_cntxt_c  core_agent_cntxt; ///< CORE Agent context.
   uvma_cvmcu_dbg_cntxt_c  sys_agent_cntxt; ///< SYS Agent context.
   uvma_cvmcu_dbg_cntxt_c  passive_agent_cntxt; ///< Passive Agent context.
   /// @}

   /// @name Objects
   /// @{
   uvmx_sb_simplex_cntxt_c  sb_agent_cntxt; ///< Agent Scoreboard context.
   uvmx_sb_simplex_cntxt_c  sb_e2e_cntxt  ; ///< End-to-end Scoreboard context.
   /// @}


   `uvm_object_utils_begin(uvme_cvmcu_dbg_st_cntxt_c)
      `uvm_field_object(core_agent_cntxt, UVM_DEFAULT)
      `uvm_field_object(sys_agent_cntxt, UVM_DEFAULT)
      `uvm_field_object(passive_agent_cntxt, UVM_DEFAULT)
      `uvm_field_object(sb_agent_cntxt, UVM_DEFAULT)
      `uvm_field_object(sb_e2e_cntxt, UVM_DEFAULT)
   `uvm_object_utils_end


   /**
    * Default constructor.
    */
   function new(string name="uvme_cvmcu_dbg_st_cntxt");
      super.new(name);
   endfunction

   /**
    * Creates objects.
    */
   virtual function void build(uvme_cvmcu_dbg_st_cfg_c cfg);
      core_agent_cntxt = uvma_cvmcu_dbg_cntxt_c::type_id::create("core_agent_cntxt");
      sys_agent_cntxt = uvma_cvmcu_dbg_cntxt_c::type_id::create("sys_agent_cntxt");
      passive_agent_cntxt = uvma_cvmcu_dbg_cntxt_c::type_id::create("passive_agent_cntxt");
      sb_agent_cntxt = uvmx_sb_simplex_cntxt_c::type_id::create("sb_agent_cntxt");
      sb_e2e_cntxt = uvmx_sb_simplex_cntxt_c::type_id::create("sb_e2e_cntxt");
   endfunction

   /**
    * Returns all state variables to initial values.
    */
   virtual function void do_reset(uvme_cvmcu_dbg_st_cfg_c cfg);
      core_agent_cntxt.reset();
      sys_agent_cntxt.reset();
      passive_agent_cntxt.reset();
   endfunction

endclass


`endif // __UVME_CVMCU_DBG_ST_CNTXT_SV__