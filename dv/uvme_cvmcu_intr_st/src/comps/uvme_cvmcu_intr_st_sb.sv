// Copyright 2022 Datum Technology Corporation
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVME_CVMCU_INTR_ST_SB_SV__
`define __UVME_CVMCU_INTR_ST_SB_SV__


/**
 * Component encapsulating the scoreboarding components verifying the CORE-V MCU Interrupt UVM Agent.
 */
class uvme_cvmcu_intr_st_sb_c extends uvm_component;

   /// @name Objects
   /// @{
   uvme_cvmcu_intr_st_cfg_c    cfg  ; ///< Environment configuration handle
   uvme_cvmcu_intr_st_cntxt_c  cntxt; ///< Environment context handle
   /// @}

   /// @name Components
   /// @{
   uvme_cvmcu_intr_st_sb_simplex_c  sb_e2e  ; ///< Ensures that monitored transactions from #active_agent and #passive_agent match.
   uvme_cvmcu_intr_st_sb_simplex_c  sb_agent; ///< Ensures that #active_agent sequence items and monitored transactions match.
   /// @}

   /// @name TLM
   /// @{
   uvm_analysis_export #(uvma_cvmcu_intr_mon_trn_c)  e2e_act_export  ; ///< Port for #sb_e2e Actual Transactions.
   uvm_analysis_export #(uvma_cvmcu_intr_mon_trn_c)  e2e_exp_export  ; ///< Port for #sb_e2e Expected Transactions.
   uvm_analysis_export #(uvma_cvmcu_intr_mon_trn_c)  agent_act_export; ///< Port for #sb_agent Actual Transactions.
   uvm_analysis_export #(uvma_cvmcu_intr_mon_trn_c)  agent_exp_export; ///< Port for #sb_agent Expected Transactions.
   /// @}


   `uvm_component_utils_begin(uvme_cvmcu_intr_st_sb_c)
      // UVM Field Util Macros
   `uvm_component_utils_end


   /**
    * Default constructor.
    */
   extern function new(string name="uvme_cvmcu_intr_st_sb", uvm_component parent=null);

   /**
    * Ensures #cfg & #cntxt handles are not null.
    */
   extern virtual function void build_phase(uvm_phase phase);

   /**
    * Connects exports to scoreboards'.
    */
   extern virtual function void connect_phase(uvm_phase phase);

   /**
    * Uses uvm_config_db to retrieve cfg.
    */
   extern function void get_cfg();

   /**
    * Uses uvm_config_db to retrieve cntxt.
    */
   extern function void get_cntxt();

   /**
    * Assigns configuration handles to components using uvm_config_db.
    */
   extern function void assign_cfg();

   /**
    * Assigns context handles to components using uvm_config_db.
    */
   extern function void assign_cntxt();

   /**
    * Creates scoreboard components.
    */
   extern function void create_components();

   /**
    * Connects scoreboard TLM ports.
    */
   extern function void connect_ports();

endclass : uvme_cvmcu_intr_st_sb_c


function uvme_cvmcu_intr_st_sb_c::new(string name="uvme_cvmcu_intr_st_sb", uvm_component parent=null);

   super.new(name, parent);

endfunction : new


function void uvme_cvmcu_intr_st_sb_c::build_phase(uvm_phase phase);

   super.build_phase(phase);
   get_cfg          ();
   get_cntxt        ();
   assign_cfg       ();
   assign_cntxt     ();
   create_components();

endfunction : build_phase


function void uvme_cvmcu_intr_st_sb_c::connect_phase(uvm_phase phase);

   super.connect_phase(phase);
   connect_ports();

endfunction : connect_phase


function void uvme_cvmcu_intr_st_sb_c::get_cfg();

   void'(uvm_config_db#(uvme_cvmcu_intr_st_cfg_c)::get(this, "", "cfg", cfg));
   if (cfg == null) begin
      `uvm_fatal("{{ name.upper() }}_ST_SB", "Configuration handle is null")
   end

endfunction : get_cfg


function void uvme_cvmcu_intr_st_sb_c::get_cntxt();

   void'(uvm_config_db#(uvme_cvmcu_intr_st_cntxt_c)::get(this, "", "cntxt", cntxt));
   if (cntxt == null) begin
      `uvm_fatal("{{ name.upper() }}_ST_SB", "Context handle is null")
   end

endfunction : get_cntxt


function void uvme_cvmcu_intr_st_sb_c::assign_cfg();

   uvm_config_db#(uvml_sb_simplex_cfg_c)::set(this, "sb_e2e"  , "cfg", cfg.sb_e2e_cfg  );
   uvm_config_db#(uvml_sb_simplex_cfg_c)::set(this, "sb_agent", "cfg", cfg.sb_agent_cfg);

endfunction: assign_cfg


function void uvme_cvmcu_intr_st_sb_c::assign_cntxt();

   uvm_config_db#(uvml_sb_simplex_cntxt_c)::set(this, "sb_e2e"  , "cntxt", cntxt.sb_e2e_cntxt  );
   uvm_config_db#(uvml_sb_simplex_cntxt_c)::set(this, "sb_agent", "cntxt", cntxt.sb_agent_cntxt);

endfunction: assign_cntxt


function void uvme_cvmcu_intr_st_sb_c::create_components();

   sb_e2e   = uvme_cvmcu_intr_st_sb_simplex_c::type_id::create("sb_e2e"  , this);
   sb_agent = uvme_cvmcu_intr_st_sb_simplex_c::type_id::create("sb_agent", this);

endfunction: create_components


function void uvme_cvmcu_intr_st_sb_c::connect_ports();

   e2e_act_export   = sb_e2e.act_export;
   e2e_exp_export   = sb_e2e.exp_export;
   agent_act_export = sb_agent.act_export;
   agent_exp_export = sb_agent.exp_export;

endfunction: connect_ports


`endif // __UVME_CVMCU_INTR_ST_SB_SV__
