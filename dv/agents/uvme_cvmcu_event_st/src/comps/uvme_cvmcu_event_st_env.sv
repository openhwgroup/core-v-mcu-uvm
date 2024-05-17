// Copyright 2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVME_CVMCU_EVENT_ST_ENV_SV__
`define __UVME_CVMCU_EVENT_ST_ENV_SV__


/**
 * CORE-V-MCU Event Interface UVM Agent Self-Test Environment with TLM self-checking scoreboards and prediction.
 * @ingroup uvme_cvmcu_event_st_comps
 */
class uvme_cvmcu_event_st_env_c extends uvmx_agent_env_c #(
   .T_CFG      (uvme_cvmcu_event_st_cfg_c           ),
   .T_CNTXT    (uvme_cvmcu_event_st_cntxt_c         ),
   .T_SQR      (uvme_cvmcu_event_st_sqr_c           ),
   .T_PRD      (uvme_cvmcu_event_st_prd_c           ),
   .T_SB       (uvme_cvmcu_event_st_sb_c            ),
   .T_COV_MODEL(uvme_cvmcu_event_st_mock_cov_model_c)
);

   /// @name Agents
   /// @{
   uvma_cvmcu_event_agent_c  core_agent; ///< CORE Agent instance.
   uvma_cvmcu_event_agent_c  sys_agent; ///< SYS Agent instance.
   uvma_cvmcu_event_agent_c  passive_agent; ///< Passive Agent instance.
   /// @}



   `uvm_component_utils(uvme_cvmcu_event_st_env_c)


   /**
    * Default constructor.
    */
   function new(string name="uvme_cvmcu_event_env", uvm_component parent=null);
      super.new(name, parent);
      set_type_override_by_type(uvma_cvmcu_event_cov_model_c::get_type(), uvme_cvmcu_event_st_cov_model_c::get_type());
   endfunction

   /**
    * Assigns configuration handles to components using UVM Configuration Database.
    */
   virtual function void assign_cfg();
      uvm_config_db#(uvma_cvmcu_event_cfg_c)::set(this, "core_agent", "cfg", cfg.core_agent_cfg);
      uvm_config_db#(uvma_cvmcu_event_cfg_c)::set(this, "sys_agent", "cfg", cfg.sys_agent_cfg);
      uvm_config_db#(uvma_cvmcu_event_cfg_c)::set(this, "passive_agent", "cfg", cfg.passive_agent_cfg);
   endfunction

   /**
    * Assigns context handles to components using UVM Configuration Database.
    */
   virtual function void assign_cntxt();
      uvm_config_db#(uvma_cvmcu_event_cntxt_c)::set(this, "core_agent", "cntxt", cntxt.core_agent_cntxt);
      uvm_config_db#(uvma_cvmcu_event_cntxt_c)::set(this, "sys_agent", "cntxt", cntxt.sys_agent_cntxt);
      uvm_config_db#(uvma_cvmcu_event_cntxt_c)::set(this, "passive_agent", "cntxt", cntxt.passive_agent_cntxt);
   endfunction

   /**
    * Creates agent components.
    */
   virtual function void create_agents();
      core_agent = uvma_cvmcu_event_agent_c::type_id::create("core_agent", this);
      sys_agent = uvma_cvmcu_event_agent_c::type_id::create("sys_agent", this);
      passive_agent = uvma_cvmcu_event_agent_c::type_id::create("passive_agent", this);
   endfunction



   /**
    * Assembles virtual sequencer from agent sequencers.
    */
   virtual function void assemble_sequencer();
      sequencer.core_sequencer = core_agent.sequencer;
      sequencer.sys_sequencer = sys_agent.sequencer;
      sequencer.passive_sequencer = passive_agent.sequencer;
   endfunction


   /**
    * Connects agents to predictor.
    */
   virtual function void connect_predictor();
      // Agents -> Predictor
      core_agent.seq_item_ap.connect(predictor.core_fifo.analysis_export);
      sys_agent.seq_item_ap.connect(predictor.sys_fifo.analysis_export);
      core_agent.c2s_mon_trn_ap.connect(predictor.c2s_fifo.analysis_export);
      sys_agent.s2c_mon_trn_ap.connect(predictor.s2c_fifo.analysis_export);
   endfunction

   /**
    * Connects scoreboards components to agents/predictor.
    */
   virtual function void connect_scoreboard();
      // Agents -> Scoreboard
      passive_agent.c2s_mon_trn_ap.connect(scoreboard.sb_core_agent.act_export);
      passive_agent.s2c_mon_trn_ap.connect(scoreboard.sb_sys_agent.act_export);
      sys_agent.c2s_mon_trn_ap.connect(scoreboard.sb_c2s.act_export);
      core_agent.s2c_mon_trn_ap.connect(scoreboard.sb_s2c.act_export);
      // Predictor -> Scoreboard
      predictor.core_ap.connect(scoreboard.sb_core_agent.exp_export);
      predictor.sys_ap.connect(scoreboard.sb_sys_agent.exp_export);
      predictor.c2s_ap.connect(scoreboard.sb_c2s.exp_export);
      predictor.s2c_ap.connect(scoreboard.sb_s2c.exp_export);
   endfunction
endclass


`endif // __UVME_CVMCU_EVENT_ST_ENV_SV__