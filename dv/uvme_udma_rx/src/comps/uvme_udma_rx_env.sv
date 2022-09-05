// Copyright 2022 Datum Technology Corporation
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVME_UDMA_RX_ENV_SV__
`define __UVME_UDMA_RX_ENV_SV__


/**
 * Top-level component that encapsulates, builds and connects all other uDMA Rx Channels Block environment components.
 * @ingroup uvme_udma_rx_comps
 */
class uvme_udma_rx_env_c extends uvml_env_c;

   /// @name Objects
   /// @{
   uvme_udma_rx_cfg_c    cfg  ; ///< Configuration handle.  Must be provided by component instantiating this environment.
   uvme_udma_rx_cntxt_c  cntxt; ///< Context handle.  Can be provided by component instantiating this environment.
   /// @}

   /// @name Components
   /// @{
   uvme_udma_rx_vsqr_c       vsequencer; ///< Virtual sequencer on which virtual sequences are run.
   uvme_udma_rx_prd_c        predictor ; ///< Feeds #scoreboard's expected port(s) with monitor transactions.
   uvme_udma_rx_sb_simplex_c scoreboard; ///< Ensures that data path transactions from #predictor and output monitor match.
   uvme_udma_rx_cov_model_c  cov_model ; ///< Functional coverage model.
   /// @}

   /// @name Agents
   /// @{
   uvma_clk_agent_c    clk_agent; ///< Clocking agent
   uvma_reset_agent_c  reset_agent; ///< Reset agent
   uvma_udma_rx_cp_agent_c      cp_agent    ; ///< Control plane agent
   uvma_udma_rx_dp_in_agent_c   dp_in_agent ; ///< Data plane agent for input
   uvma_udma_rx_dp_out_agent_c  dp_out_agent; ///< Data plane agent for output
   /// @}


   `uvm_component_utils_begin(uvme_udma_rx_env_c)
      `uvm_field_object(cfg  , UVM_DEFAULT)
      `uvm_field_object(cntxt, UVM_DEFAULT)
   `uvm_component_utils_end


   /**
    * Default constructor.
    */
   extern function new(string name="uvme_udma_rx_env", uvm_component parent=null);

   /**
    * 1. Ensures cfg & cntxt handles are not null
    * 2. Assigns cfg and cntxt handles via assign_cfg() & assign_cntxt()
    * 3. Creates all components via create_<x>()
    */
   extern virtual function void build_phase(uvm_phase phase);

   /**
    * 1. Connects agents to predictor via connect_predictor()
    * 2. Connects ral to predictor & provisioning agent via connect_reg_block()
    * 3. Connects predictor & agents to scoreboard via connect_scoreboard()
    * 4. Assembles virtual sequencer handles via assemble_vsequencer()
    * 5. Connects agents to coverage model via connect_coverage_model()
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
    * Creates environment's coverage model.
    */
   extern function void create_cov_model();

   /**
    * Connects agents to predictor.
    */
   extern function void connect_predictor();

   /**
    * Connects scoreboards components to agents/predictor.
    */
   extern function void connect_scoreboard();

   /**
    * Connects environment coverage model to agents/scoreboards/predictor.
    */
   extern function void connect_coverage_model();

   /**
    * Assembles virtual sequencer from agent sequencers.
    */
   extern function void assemble_vsequencer();

endclass : uvme_udma_rx_env_c


function uvme_udma_rx_env_c::new(string name="uvme_udma_rx_env", uvm_component parent=null);

   super.new(name, parent);

endfunction : new


function void uvme_udma_rx_env_c::build_phase(uvm_phase phase);

   super.build_phase(phase);
   get_cfg              ();
   get_cntxt            ();
   assign_cfg           ();
   assign_cntxt         ();
   create_agents        ();
   create_env_components();
   create_vsequencer    ();
   create_cov_model     ();

endfunction : build_phase


function void uvme_udma_rx_env_c::connect_phase(uvm_phase phase);

   super.connect_phase(phase);
   assemble_vsequencer();
   if (cfg.scoreboarding_enabled) begin
      connect_predictor ();
      connect_scoreboard();
   end
   if (cfg.cov_model_enabled) begin
      connect_coverage_model();
   end

endfunction: connect_phase


function void uvme_udma_rx_env_c::get_cfg();

   void'(uvm_config_db#(uvme_udma_rx_cfg_c)::get(this, "", "cfg", cfg));
   if (!cfg) begin
      `uvm_fatal("UDMA_RX_ENV", "Configuration handle is null")
   end
   else begin
      `uvm_info("UDMA_RX_ENV", $sformatf("Found configuration handle:\n%s", cfg.sprint()), UVM_DEBUG)
   end

endfunction : get_cfg


function void uvme_udma_rx_env_c::get_cntxt();

   void'(uvm_config_db#(uvme_udma_rx_cntxt_c)::get(this, "", "cntxt", cntxt));
   if (!cntxt) begin
      `uvm_info("UDMA_RX_ENV", "Context handle is null; creating.", UVM_DEBUG)
      cntxt = uvme_udma_rx_cntxt_c::type_id::create("cntxt");
   end

endfunction : get_cntxt


function void uvme_udma_rx_env_c::assign_cfg();

   uvm_config_db#(uvme_udma_rx_cfg_c)::set(this, "*", "cfg", cfg);
   uvm_config_db#(uvma_clk_cfg_c  )::set(this, "clk_agent"  , "cfg", cfg.clk_cfg  );
   uvm_config_db#(uvma_reset_cfg_c)::set(this, "reset_agent", "cfg", cfg.reset_cfg);
   uvm_config_db#(uvma_udma_rx_cp_cfg_c    )::set(this, "cp_agent"    , "cfg", cfg.cp_cfg    );
   uvm_config_db#(uvma_udma_rx_dp_in_cfg_c )::set(this, "dp_in_agent" , "cfg", cfg.dp_in_cfg );
   uvm_config_db#(uvma_udma_rx_dp_out_cfg_c)::set(this, "dp_out_agent", "cfg", cfg.dp_out_cfg);
   uvm_config_db#(uvml_sb_simplex_cfg_c)::set(this, "scoreboard", "cfg", cfg.sb_cfg);

endfunction: assign_cfg


function void uvme_udma_rx_env_c::assign_cntxt();

   uvm_config_db#(uvme_udma_rx_cntxt_c)::set(this, "*", "cntxt", cntxt);
   uvm_config_db#(uvma_clk_cntxt_c  )::set(this, "clk_agent"  , "cntxt", cntxt.clk_cntxt  );
   uvm_config_db#(uvma_reset_cntxt_c)::set(this, "reset_agent", "cntxt", cntxt.reset_cntxt);
   uvm_config_db#(uvma_udma_rx_cp_cntxt_c    )::set(this, "cp_agent"    , "cntxt", cntxt.cp_cntxt    );
   uvm_config_db#(uvma_udma_rx_dp_in_cntxt_c )::set(this, "dp_in_agent" , "cntxt", cntxt.dp_in_cntxt );
   uvm_config_db#(uvma_udma_rx_dp_out_cntxt_c)::set(this, "dp_out_agent", "cntxt", cntxt.dp_out_cntxt);
   uvm_config_db#(uvml_sb_simplex_cntxt_c)::set(this, "scoreboard", "cntxt", cntxt.sb_cntxt);

endfunction: assign_cntxt


function void uvme_udma_rx_env_c::create_agents();

   clk_agent    = uvma_clk_agent_c  ::type_id::create("clk_agent"  , this);
   reset_agent  = uvma_reset_agent_c::type_id::create("reset_agent", this);
   cp_agent     = uvma_udma_rx_cp_agent_c    ::type_id::create("cp_agent"    , this);
   dp_in_agent  = uvma_udma_rx_dp_in_agent_c ::type_id::create("dp_in_agent" , this);
   dp_out_agent = uvma_udma_rx_dp_out_agent_c::type_id::create("dp_out_agent", this);

endfunction: create_agents


function void uvme_udma_rx_env_c::create_env_components();

   if (cfg.scoreboarding_enabled) begin
      predictor  = uvme_udma_rx_prd_c       ::type_id::create("predictor" , this);
      scoreboard = uvme_udma_rx_sb_simplex_c::type_id::create("scoreboard", this);
   end

endfunction: create_env_components


function void uvme_udma_rx_env_c::create_vsequencer();

   vsequencer = uvme_udma_rx_vsqr_c::type_id::create("vsequencer", this);

endfunction: create_vsequencer


function void uvme_udma_rx_env_c::create_cov_model();

   cov_model = uvme_udma_rx_cov_model_c::type_id::create("cov_model", this);

endfunction: create_cov_model


function void uvme_udma_rx_env_c::connect_predictor();

   clk_agent  .mon_ap.connect(predictor.clk_export  );
   reset_agent.mon_ap.connect(predictor.reset_export);
   cp_agent   .mon_ap.connect(predictor.cp_export   );
   dp_in_agent.mon_ap.connect(predictor.dp_in_export);

endfunction: connect_predictor


function void uvme_udma_rx_env_c::connect_scoreboard();

   dp_out_agent.mon_ap.connect(scoreboard.act_export);
   predictor.dp_out_ap.connect(scoreboard.exp_export);

endfunction: connect_scoreboard


function void uvme_udma_rx_env_c::connect_coverage_model();

   cp_agent    .mon_ap.connect(cov_model.cp_export    );
   dp_in_agent .mon_ap.connect(cov_model.dp_in_export );
   dp_out_agent.mon_ap.connect(cov_model.dp_out_export);

endfunction: connect_coverage_model


function void uvme_udma_rx_env_c::assemble_vsequencer();

   vsequencer.clk_sequencer    = clk_agent   .sequencer;
   vsequencer.reset_sequencer  = reset_agent .sequencer;
   vsequencer.cp_sequencer     = cp_agent    .sequencer;
   vsequencer.dp_in_sequencer  = dp_in_agent .sequencer;
   vsequencer.dp_out_sequencer = dp_out_agent.sequencer;

endfunction: assemble_vsequencer


`endif // __UVME_UDMA_RX_ENV_SV__
