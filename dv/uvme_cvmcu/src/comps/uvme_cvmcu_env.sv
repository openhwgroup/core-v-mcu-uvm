// Copyright 2022 Datum Technology Corporation
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVME_CVMCU_ENV_SV__
`define __UVME_CVMCU_ENV_SV__


/**
 * Top-level component that encapsulates, builds and connects all other CORE-V MCU Environment components.
 */
class uvme_cvmcu_env_c extends uvm_env;

   // Objects
   uvme_cvmcu_cfg_c    cfg  ; ///<
   uvme_cvmcu_cntxt_c  cntxt; ///<

   // Register Abstraction Layer (RAL)
   uvme_cvmcu_reg_block_c  reg_block; ///<
   uvma_obi_reg_adapter_c  reg_adapter; ///<

   // Components
   uvme_cvmcu_cov_model_c  cov_model ; ///<
   uvme_cvmcu_prd_c        predictor ; ///<
   uvme_cvmcu_sb_c         sb        ; ///<
   uvme_cvmcu_vsqr_c       vsequencer; ///<

   // Agents
   uvma_clk_agent_c         sys_clk_agent  ; ///<
   uvma_reset_agent_c       sys_reset_agent; ///<
   uvma_obi_agent_c         obi_instr_agent; ///<
   uvma_obi_agent_c         obi_data_agent ; ///<
   uvma_cvmcu_intr_agent_c  intr_agent     ; ///<


   `uvm_component_utils_begin(uvme_cvmcu_env_c)
      `uvm_field_object(cfg  , UVM_DEFAULT)
      `uvm_field_object(cntxt, UVM_DEFAULT)
   `uvm_component_utils_end


   /**
    * Default constructor.
    */
   extern function new(string name="uvme_cvmcu_env", uvm_component parent=null);

   /**
    * 1. Ensures cfg & cntxt handles are not null
    * 2. Assigns cfg and cntxt handles via assign_cfg() & assign_cntxt()
    * 3. Builds all components via create_<x>()
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
    * Creates ral_adapter which translates to/from ral to obi_agent.
    */
   extern function void create_reg_adapter();

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
    * Connects RAL to provisioning agent (obi_agent).
    */
   extern function void connect_reg_block();

   /**
    * Connects environment coverage model to agents/scoreboards/predictor.
    */
   extern function void connect_coverage_model();

   /**
    * Assembles virtual sequencer from agent sequencers.
    */
   extern function void assemble_vsequencer();

endclass : uvme_cvmcu_env_c


function uvme_cvmcu_env_c::new(string name="uvme_cvmcu_env", uvm_component parent=null);

   super.new(name, parent);

endfunction : new


function void uvme_cvmcu_env_c::build_phase(uvm_phase phase);

   super.build_phase(phase);

   void'(uvm_config_db#(uvme_cvmcu_cfg_c)::get(this, "", "cfg", cfg));
   if (!cfg) begin
      `uvm_fatal("CFG", "Configuration handle is null")
   end
   else begin
      `uvm_info("CFG", $sformatf("Found configuration handle:\n%s", cfg.sprint()), UVM_DEBUG)
   end

   if (cfg.enabled) begin
      void'(uvm_config_db#(uvme_cvmcu_cntxt_c)::get(this, "", "cntxt", cntxt));
      if (!cntxt) begin
         `uvm_info("CNTXT", "Context handle is null; creating.", UVM_DEBUG)
         cntxt = uvme_cvmcu_cntxt_c::type_id::create("cntxt");
      end

      assign_cfg           ();
      assign_cntxt         ();
      create_agents        ();
      create_reg_adapter   ();
      create_env_components();

      if (cfg.is_active) begin
         create_vsequencer();
      end

      if (cfg.cov_model_enabled) begin
         create_cov_model();
      end
   end

endfunction : build_phase


function void uvme_cvmcu_env_c::connect_phase(uvm_phase phase);

   super.connect_phase(phase);

   if (cfg.enabled) begin
      if (cfg.scoreboarding_enabled) begin
         connect_predictor ();
         connect_scoreboard();
      end

      if (cfg.is_active) begin
         connect_reg_block();
         assemble_vsequencer();
      end

      if (cfg.cov_model_enabled) begin
         connect_coverage_model();
      end
   end

endfunction: connect_phase


function void uvme_cvmcu_env_c::assign_cfg();

   uvm_config_db#(uvme_cvmcu_cfg_c     )::set(this, "*"              , "cfg", cfg              );
   uvm_config_db#(uvma_clk_cfg_c       )::set(this, "sys_clk_agent"  , "cfg", cfg.sys_clk_cfg  );
   uvm_config_db#(uvma_reset_cfg_c     )::set(this, "sys_reset_agent", "cfg", cfg.sys_reset_cfg);
   uvm_config_db#(uvma_obi_cfg_c       )::set(this, "obi_instr_agent", "cfg", cfg.obi_instr_cfg);
   uvm_config_db#(uvma_obi_cfg_c       )::set(this, "obi_data_agent" , "cfg", cfg.obi_data_cfg );
   uvm_config_db#(uvma_cvmcu_intr_cfg_c)::set(this, "intr_agent"     , "cfg", cfg.intr_cfg     );

endfunction: assign_cfg


function void uvme_cvmcu_env_c::assign_cntxt();

   uvm_config_db#(uvme_cvmcu_cntxt_c     )::set(this, "*"              , "cntxt", cntxt                );
   uvm_config_db#(uvma_clk_cntxt_c       )::set(this, "sys_clk_agent"  , "cntxt", cntxt.sys_clk_cntxt  );
   uvm_config_db#(uvma_reset_cntxt_c     )::set(this, "sys_reset_agent", "cntxt", cntxt.sys_reset_cntxt);
   uvm_config_db#(uvma_obi_cntxt_c       )::set(this, "obi_instr_agent", "cntxt", cntxt.obi_instr_cntxt);
   uvm_config_db#(uvma_obi_cntxt_c       )::set(this, "obi_data_agent" , "cntxt", cntxt.obi_data_cntxt );
   uvm_config_db#(uvma_cvmcu_intr_cntxt_c)::set(this, "intr_agent"     , "cntxt", cntxt.intr_cntxt     );

endfunction: assign_cntxt


function void uvme_cvmcu_env_c::create_agents();

   sys_clk_agent   = uvma_clk_agent_c       ::type_id::create("sys_clk_agent"  , this);
   sys_reset_agent = uvma_reset_agent_c     ::type_id::create("sys_reset_agent", this);
   obi_instr_agent = uvma_obi_agent_c       ::type_id::create("obi_instr_agent", this);
   obi_data_agent  = uvma_obi_agent_c       ::type_id::create("obi_data_agent" , this);
   intr_agent      = uvma_cvmcu_intr_agent_c::type_id::create("intr_agent"     , this);

endfunction: create_agents


function void uvme_cvmcu_env_c::create_env_components();

   if (cfg.scoreboarding_enabled) begin
      predictor = uvme_cvmcu_prd_c::type_id::create("predictor", this);
      sb        = uvme_cvmcu_sb_c ::type_id::create("sb"       , this);
   end

endfunction: create_env_components


function void uvme_cvmcu_env_c::create_reg_adapter();

   reg_adapter = uvma_obi_reg_adapter_c::type_id::create("reg_adapter");
   reg_block = cfg.cvmcu_reg_block;

endfunction: create_reg_adapter


function void uvme_cvmcu_env_c::create_vsequencer();

   vsequencer = uvme_cvmcu_vsqr_c::type_id::create("vsequencer", this);

endfunction: create_vsequencer


function void uvme_cvmcu_env_c::create_cov_model();

   cov_model = uvme_cvmcu_cov_model_c::type_id::create("cov_model", this);

endfunction: create_cov_model


function void uvme_cvmcu_env_c::connect_predictor();

   sys_clk_agent  .mon_ap       .connect(predictor.sys_clk_export  );
   sys_reset_agent.mon_ap       .connect(predictor.sys_reset_export);
   obi_instr_agent.mon_trn_ap   .connect(predictor.obi_instr_export);
   obi_data_agent .mon_trn_ap   .connect(predictor.obi_data_export );
   intr_agent     .mon_trn_ap   .connect(predictor.intr_export     );
   vsequencer     .dma_egress_ap.connect(predictor.dma_in_export   );

endfunction: connect_predictor


function void uvme_cvmcu_env_c::connect_scoreboard();

   // vsequencer -> scoreboard
   vsequencer.dma_ingress_ap.connect(sb.dma_sb.act_export);

   // predictor -> scoreboard
   predictor.dma_out_ap.connect(sb.dma_sb.exp_export);

endfunction: connect_scoreboard


function void uvme_cvmcu_env_c::connect_reg_block();

   reg_block.cntxt = cntxt;
   reg_block.connect();
   reg_block.default_map.set_sequencer(obi_master_agent.vsequencer, reg_adapter);
   reg_block.default_map.set_auto_predict(1);

endfunction: connect_reg_block


function void uvme_cvmcu_env_c::connect_coverage_model();

   // TODO Implement uvme_cvmcu_env_c::connect_coverage_model()
   //      Ex: obi_instr_agent.mon_ap.connect(cov_model.obi_instr_export);

endfunction: connect_coverage_model


function void uvme_cvmcu_env_c::assemble_vsequencer();

   vsequencer.sys_clk_sequencer   = sys_clk_agent  .sequencer ;
   vsequencer.sys_reset_sequencer = sys_reset_agent.sequencer ;
   vsequencer.obi_instr_sequencer = obi_instr_agent.vsequencer;
   vsequencer.obi_data_sequencer  = obi_data_agent .vsequencer;
   vsequencer.intr_sequencer      = intr_agent     .vsequencer;

endfunction: assemble_vsequencer


`endif // __UVME_CVMCU_ENV_SV__
