// Copyright 2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVME_CVMCU_CPI_ST_ENV_SV__
`define __UVME_CVMCU_CPI_ST_ENV_SV__


/**
 * CORE-V-MCU Camera Parallel Interface UVM Agent Self-Test Environment with TLM self-checking scoreboards and prediction.
 * @ingroup uvme_cvmcu_cpi_st_comps
 */
class uvme_cvmcu_cpi_st_env_c extends uvmx_agent_env_c #(
   .T_CFG      (uvme_cvmcu_cpi_st_cfg_c           ),
   .T_CNTXT    (uvme_cvmcu_cpi_st_cntxt_c         ),
   .T_SQR      (uvme_cvmcu_cpi_st_sqr_c           ),
   .T_PRD      (uvme_cvmcu_cpi_st_prd_c           ),
   .T_SB       (uvme_cvmcu_cpi_st_sb_c            ),
   .T_COV_MODEL(uvme_cvmcu_cpi_st_mock_cov_model_c)
);

   /// @name Agents
   /// @{
   uvma_cvmcu_cpi_agent_c  tx_agent; ///< TX Agent instance.
   uvma_cvmcu_cpi_agent_c  rx_agent; ///< RX Agent instance.
   uvma_cvmcu_cpi_agent_c  passive_agent; ///< Passive Agent instance.
   /// @}



   `uvm_component_utils(uvme_cvmcu_cpi_st_env_c)


   /**
    * Default constructor.
    */
   function new(string name="uvme_cvmcu_cpi_env", uvm_component parent=null);
      super.new(name, parent);
      set_type_override_by_type(uvma_cvmcu_cpi_cov_model_c::get_type(), uvme_cvmcu_cpi_st_cov_model_c::get_type());
   endfunction

   /**
    * Assigns configuration handles to components using UVM Configuration Database.
    */
   virtual function void assign_cfg();
      uvm_config_db#(uvma_cvmcu_cpi_cfg_c)::set(this, "tx_agent", "cfg", cfg.tx_agent_cfg);
      uvm_config_db#(uvma_cvmcu_cpi_cfg_c)::set(this, "rx_agent", "cfg", cfg.rx_agent_cfg);
      uvm_config_db#(uvma_cvmcu_cpi_cfg_c)::set(this, "passive_agent", "cfg", cfg.passive_agent_cfg);
   endfunction

   /**
    * Assigns context handles to components using UVM Configuration Database.
    */
   virtual function void assign_cntxt();
      uvm_config_db#(uvma_cvmcu_cpi_cntxt_c)::set(this, "tx_agent", "cntxt", cntxt.tx_agent_cntxt);
      uvm_config_db#(uvma_cvmcu_cpi_cntxt_c)::set(this, "rx_agent", "cntxt", cntxt.rx_agent_cntxt);
      uvm_config_db#(uvma_cvmcu_cpi_cntxt_c)::set(this, "passive_agent", "cntxt", cntxt.passive_agent_cntxt);
   endfunction

   /**
    * Creates agent components.
    */
   virtual function void create_agents();
      tx_agent = uvma_cvmcu_cpi_agent_c::type_id::create("tx_agent", this);
      rx_agent = uvma_cvmcu_cpi_agent_c::type_id::create("rx_agent", this);
      passive_agent = uvma_cvmcu_cpi_agent_c::type_id::create("passive_agent", this);
   endfunction



   /**
    * Assembles virtual sequencer from agent sequencers.
    */
   virtual function void assemble_sequencer();
      sequencer.tx_sequencer = tx_agent.sequencer;
      sequencer.rx_sequencer = rx_agent.sequencer;
      sequencer.passive_sequencer = passive_agent.sequencer;
   endfunction


   /**
    * Connects agents to predictor.
    */
   virtual function void connect_predictor();
      // Agents -> Predictor
      tx_agent.seq_item_ap.connect(predictor.agent_fifo.analysis_export);
      rx_agent.mon_trn_ap .connect(predictor.e2e_fifo.analysis_export  );
   endfunction

   /**
    * Connects scoreboards components to agents/predictor.
    */
   virtual function void connect_scoreboard();
      // Agents -> Scoreboard
      passive_agent.mon_trn_ap.connect(scoreboard.sb_agent.act_export);
      rx_agent.mon_trn_ap.connect(scoreboard.sb_e2e.act_export);
      // Predictor -> Scoreboard
      predictor.agent_ap.connect(scoreboard.sb_agent.exp_export);
      predictor.e2e_ap  .connect(scoreboard.sb_e2e  .exp_export);
   endfunction
endclass


`endif // __UVME_CVMCU_CPI_ST_ENV_SV__