// Copyright 2022 Datum Technology Corporation
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVME_CVMCU_INTR_ST_ENV_SV__
`define __UVME_CVMCU_INTR_ST_ENV_SV__


/**
 * Top-level component that encapsulates, builds and connects all other CORE-V MCU Interrupt UVM Agent Self-Test Environment
 * (uvme_cvmcu_intr_st_env_c) components.
 * @ingroup uvma_cvmcu_intr_st_comps
 */
class uvme_cvmcu_intr_st_env_c extends uvml_env_c;

   /// @name Objects
   /// @{
   uvme_cvmcu_intr_st_cfg_c    cfg  ; ///< Configuration handle.  Must be provided by component instantiating this environment.
   uvme_cvmcu_intr_st_cntxt_c  cntxt; ///< Context handle.  Can be provided by component instantiating this environment.
   /// @}

   /// @name Agents
   /// @{
   uvma_cvmcu_intr_agent_c  active_agent ; ///< Agent instance generating stimulus.
   uvma_cvmcu_intr_agent_c  passive_agent; ///< Agent instance receiving stimulus.
   /// @}

   /// @name Components
   /// @{
   uvme_cvmcu_intr_st_vsqr_c  vsequencer; ///< Virtual sequencer on which virtual sequences are run.
   uvme_cvmcu_intr_st_prd_c   predictor ; ///< Feeds #scoreboard's expected ports.
   uvme_cvmcu_intr_st_sb_c    scoreboard; ///< Top-level scoreboarding component.
   /// @}


   `uvm_component_utils_begin(uvme_cvmcu_intr_st_env_c)
      `uvm_field_object(cfg  , UVM_DEFAULT)
      `uvm_field_object(cntxt, UVM_DEFAULT)
   `uvm_component_utils_end


   /**
    * Default constructor.
    */
   extern function new(string name="uvme_cvmcu_intr_st_env", uvm_component parent=null);

   /**
    * 1. Ensures #cfg & #cntxt handles are not null
    * 2. Assigns #cfg and #cntxt handles
    * 3. Creates all components via create_<x>()
    */
   extern virtual function void build_phase(uvm_phase phase);

   /**
    * 1. Connects agents to predictor
    * 2. Connects predictor & agents to scoreboard
    * 3. Assembles virtual sequencer handles
    * 4. Connects agents to coverage model
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
    * Assigns configuration handles to components using UVM Configuration Database.
    */
   extern function void assign_cfg();

   /**
    * Assigns context handles to components using UVM Configuration Database.
    */
   extern function void assign_cntxt();

   /**
    * Creates agent components.
    */
   extern function void create_agents();

   /**
    * Creates additional (non-agent) environment components (and objects).
    */
   extern function void create_env_components();

   /**
    * Creates environment's virtual sequencer.
    */
   extern function void create_vsequencer();

   /**
    * Connects agents to predictor.
    */
   extern function void connect_predictor();

   /**
    * Connects scoreboards components to agents/predictor.
    */
   extern function void connect_scoreboard();

   /**
    * Assembles virtual sequencer from agent sequencers.
    */
   extern function void assemble_vsequencer();

endclass : uvme_cvmcu_intr_st_env_c


function uvme_cvmcu_intr_st_env_c::new(string name="uvme_cvmcu_intr_st_env", uvm_component parent=null);

   super.new(name, parent);
   set_type_override_by_type(
      uvma_cvmcu_intr_cov_model_c   ::get_type(),
      uvme_cvmcu_intr_st_cov_model_c::get_type(),
   );

endfunction : new


function void uvme_cvmcu_intr_st_env_c::build_phase(uvm_phase phase);

   super.build_phase(phase);
   get_cfg              ();
   get_cntxt            ();
   assign_cfg           ();
   assign_cntxt         ();
   create_agents        ();
   create_env_components();
   create_vsequencer    ();

endfunction : build_phase


function void uvme_cvmcu_intr_st_env_c::connect_phase(uvm_phase phase);

   super.connect_phase(phase);
   assemble_vsequencer();
   connect_predictor  ();
   if (cfg.scoreboarding_enabled) begin
      connect_scoreboard();
   end

endfunction: connect_phase


function void uvme_cvmcu_intr_st_env_c::get_cfg();

   void'(uvm_config_db#(uvme_cvmcu_intr_st_cfg_c)::get(this, "", "cfg", cfg));
   if (!cfg) begin
      `uvm_fatal("CVMCU_INTR_ST_ENV", "Configuration handle is null")
   end
   else begin
      `uvm_info("CVMCU_INTR_ST_ENV", $sformatf("Found configuration handle:\n%s", cfg.sprint()), UVM_DEBUG)
   end

endfunction : get_cfg


function void uvme_cvmcu_intr_st_env_c::get_cntxt();

   void'(uvm_config_db#(uvme_cvmcu_intr_st_cntxt_c)::get(this, "", "cntxt", cntxt));
   if (!cntxt) begin
      `uvm_info("CVMCU_INTR_ST_ENV", "Context handle is null; creating.", UVM_DEBUG)
      cntxt = uvme_cvmcu_intr_st_cntxt_c::type_id::create("cntxt");
   end

endfunction : get_cntxt


function void uvme_cvmcu_intr_st_env_c::assign_cfg();

   uvm_config_db #(uvme_cvmcu_intr_st_cfg_c)::set(this, "*"            , "cfg", cfg                  );
   uvm_config_db #(uvma_cvmcu_intr_cfg_c   )::set(this, "active_agent" , "cfg", cfg.active_agent_cfg );
   uvm_config_db #(uvma_cvmcu_intr_cfg_c   )::set(this, "passive_agent", "cfg", cfg.passive_agent_cfg);

endfunction: assign_cfg


function void uvme_cvmcu_intr_st_env_c::assign_cntxt();

   uvm_config_db #(uvme_cvmcu_intr_st_cntxt_c)::set(this, "*"            , "cntxt", cntxt                    );
   uvm_config_db #(uvma_cvmcu_intr_cntxt_c   )::set(this, "active_agent" , "cntxt", cntxt.active_agent_cntxt );
   uvm_config_db #(uvma_cvmcu_intr_cntxt_c   )::set(this, "passive_agent", "cntxt", cntxt.passive_agent_cntxt);

endfunction: assign_cntxt


function void uvme_cvmcu_intr_st_env_c::create_agents();

   active_agent  = uvma_cvmcu_intr_agent_c::type_id::create("active_agent" , this);
   passive_agent = uvma_cvmcu_intr_agent_c::type_id::create("passive_agent", this);

endfunction: create_agents


function void uvme_cvmcu_intr_st_env_c::create_env_components();

   predictor  = uvme_cvmcu_intr_st_prd_c::type_id::create("predictor" , this);
   scoreboard = uvme_cvmcu_intr_st_sb_c ::type_id::create("scoreboard", this);

endfunction: create_env_components


function void uvme_cvmcu_intr_st_env_c::create_vsequencer();

   vsequencer = uvme_cvmcu_intr_st_vsqr_c::type_id::create("vsequencer", this);

endfunction: create_vsequencer


function void uvme_cvmcu_intr_st_env_c::connect_predictor();

   // Connect agent -> predictor
   active_agent.mon_ap.connect(predictor.e2e_in_export  );
   active_agent.drv_ap.connect(predictor.agent_in_export);

endfunction: connect_predictor


function void uvme_cvmcu_intr_st_env_c::connect_scoreboard();

   // Connect agent -> scoreboard
   passive_agent.mon_ap.connect(scoreboard.e2e_act_export  );
   active_agent .mon_ap.connect(scoreboard.agent_act_export);
   // Connect predictor -> scoreboard
   predictor.e2e_out_ap  .connect(scoreboard.e2e_exp_export  );
   predictor.agent_out_ap.connect(scoreboard.agent_exp_export);

endfunction: connect_scoreboard


function void uvme_cvmcu_intr_st_env_c::assemble_vsequencer();

   vsequencer.active_sequencer  = active_agent.sequencer ;
   vsequencer.passive_sequencer = passive_agent.sequencer;

endfunction: assemble_vsequencer


`endif // __UVME_CVMCU_INTR_ST_ENV_SV__
