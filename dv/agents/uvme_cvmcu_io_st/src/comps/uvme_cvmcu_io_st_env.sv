// Copyright 2023 Acme Enterprises
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVME_CVMCU_IO_ST_ENV_SV__
`define __UVME_CVMCU_IO_ST_ENV_SV__


/**
 * CORE-V-MCU IO UVM Agent Self-Test Environment with TLM self-checking scoreboards and prediction.
 * @ingroup uvme_cvmcu_io_st_comps
 */
class uvme_cvmcu_io_st_env_c extends uvmx_agent_env_c #(
   .T_CFG      (uvme_cvmcu_io_st_cfg_c           ),
   .T_CNTXT    (uvme_cvmcu_io_st_cntxt_c         ),
   .T_VSQR     (uvme_cvmcu_io_st_vsqr_c          ),
   .T_PRD      (uvme_cvmcu_io_st_prd_c           ),
   .T_SB       (uvme_cvmcu_io_st_sb_c            ),
   .T_COV_MODEL(uvme_cvmcu_io_st_mock_cov_model_c)
);

   /// @name Agents
   /// @{
   uvma_cvmcu_io_agent_c  board_agent; ///< BOARD Agent instance.
   uvma_cvmcu_io_agent_c  chip_agent; ///< CHIP Agent instance.
   uvma_cvmcu_io_agent_c  passive_agent; ///< Passive Agent instance.
   /// @}



   `uvm_component_utils(uvme_cvmcu_io_st_env_c)


   /**
    * Default constructor.
    */
   function new(string name="uvme_cvmcu_io_env", uvm_component parent=null);
      super.new(name, parent);
      set_type_override_by_type(uvma_cvmcu_io_cov_model_c::get_type(), uvme_cvmcu_io_st_cov_model_c::get_type());
   endfunction

   /**
    * Assigns configuration handles to components using UVM Configuration Database.
    */
   virtual function void assign_cfg();
      uvm_config_db#(uvma_cvmcu_io_cfg_c)::set(this, "board_agent", "cfg", cfg.board_cfg);
      uvm_config_db#(uvma_cvmcu_io_cfg_c)::set(this, "chip_agent", "cfg", cfg.chip_cfg);
      uvm_config_db#(uvma_cvmcu_io_cfg_c)::set(this, "passive_agent", "cfg", cfg.passive_cfg);
   endfunction

   /**
    * Assigns context handles to components using UVM Configuration Database.
    */
   virtual function void assign_cntxt();
      uvm_config_db#(uvma_cvmcu_io_cntxt_c)::set(this, "board_agent", "cntxt", cntxt.board_cntxt);
      uvm_config_db#(uvma_cvmcu_io_cntxt_c)::set(this, "chip_agent", "cntxt", cntxt.chip_cntxt);
      uvm_config_db#(uvma_cvmcu_io_cntxt_c)::set(this, "passive_agent", "cntxt", cntxt.passive_cntxt);
   endfunction

   /**
    * Creates agent components.
    */
   virtual function void create_agents();
      board_agent = uvma_cvmcu_io_agent_c::type_id::create("board_agent", this);
      chip_agent = uvma_cvmcu_io_agent_c::type_id::create("chip_agent", this);
      passive_agent = uvma_cvmcu_io_agent_c::type_id::create("passive_agent", this);
   endfunction

   

   /**
    * Assembles virtual sequencer from agent sequencers.
    */
   virtual function void assemble_vsequencer();
      vsequencer.board_vsequencer = board_agent.vsequencer;
      vsequencer.chip_vsequencer = chip_agent.vsequencer;
      vsequencer.passive_vsequencer = passive_agent.vsequencer;
   endfunction

   
   /**
    * Connects agents to predictor.
    */
   virtual function void connect_predictor();
      // Agents -> Predictor
      board_agent.seq_item_ap.connect(predictor.board_fifo.analysis_export);
      chip_agent.seq_item_ap.connect(predictor.chip_fifo.analysis_export);
      board_agent.ig_mon_trn_ap.connect(predictor.ig_fifo.analysis_export);
      chip_agent.eg_mon_trn_ap.connect(predictor.eg_fifo.analysis_export);
      
   endfunction

   /**
    * Connects scoreboards components to agents/predictor.
    */
   virtual function void connect_scoreboard();
      // Agents -> Scoreboard
      passive_agent.ig_mon_trn_ap.connect(scoreboard.sb_board.act_export);
      passive_agent.eg_mon_trn_ap.connect(scoreboard.sb_chip.act_export);
      chip_agent.ig_mon_trn_ap.connect(scoreboard.sb_ig.act_export);
      board_agent.eg_mon_trn_ap.connect(scoreboard.sb_eg.act_export);
      // Predictor -> Scoreboard
      predictor.board_ap.connect(scoreboard.sb_board.exp_export);
      predictor.chip_ap.connect(scoreboard.sb_chip.exp_export);
      predictor.ig_ap.connect(scoreboard.sb_ig.exp_export);
      predictor.eg_ap.connect(scoreboard.sb_eg.exp_export);
      
   endfunction

endclass : uvme_cvmcu_io_st_env_c


`endif // __UVME_CVMCU_IO_ST_ENV_SV__