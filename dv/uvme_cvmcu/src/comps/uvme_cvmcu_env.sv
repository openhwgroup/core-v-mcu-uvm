// Copyright 2022-2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVME_CVMCU_ENV_SV__
`define __UVME_CVMCU_ENV_SV__


/**
 * Top-level component that encapsulates, builds and connects all other CORE-V MCU Sub-System environment components.
 * @ingroup uvme_cvmcu_comps
 */
class uvme_cvmcu_env_c extends uvmx_env_c #(
   .T_CFG      (uvme_cvmcu_cfg_c      ),
   .T_CNTXT    (uvme_cvmcu_cntxt_c    ),
   .T_VSQR     (uvme_cvmcu_vsqr_c     ),
   .T_PRD      (uvme_cvmcu_prd_c      ),
   .T_SB       (uvme_cvmcu_sb_c       ),
   .T_COV_MODEL(uvme_cvmcu_cov_model_c)
);

   /// @name Environment(s)
   /// @{
   // TODO: Add sub-environments
   //       Ex: uvme_apb_timer_env_c  sub_env; ///< Describe me!
   /// @}

   /// @name Agents
   /// @{
   uvma_obi_agent_c  obi_instr_agent; ///< Register access agent
   uvma_obi_agent_c  obi_data_agent ; ///< Register access agent
   /// @}

   /// @name Register Abstraction Layer (RAL)
   /// @{
   uvma_obi_reg_adapter_c  reg_adapter; ///< Converts obi sequence items to/from register operations.
   /// @}


   `uvm_component_utils(uvme_cvmcu_env_c)


   /**
    * Default constructor.
    */
   function new(string name="uvme_cvmcu_env", uvm_component parent=null);
      super.new(name, parent);
   endfunction

   /**
    * Retrieves probe_vif in #cntxt using uvm_config_db.
    */
   virtual function void get_vifs();
      if (!uvm_config_db#(virtual uvme_cvmcu_probe_if)::get(this, "", "vif", cntxt.probe_vif)) begin
         `uvm_fatal("CVMCU_ENV", $sformatf("Could not find probe_vif handle of type %s in uvm_config_db", $typename(cntxt.probe_vif)))
      end
      else begin
         `uvm_info("CVMCU_ENV", $sformatf("Found probe_vif handle of type %s in uvm_config_db", $typename(cntxt.probe_vif)), UVM_DEBUG)
      end
   endfunction

   /**
    * Assigns configuration handles to components using UVM Configuration Database.
    */
   virtual function void assign_cfg();
      uvm_config_db#(uvma_obi_cfg_c)::set(this, "obi_instr_agent", "cfg", cfg.obi_instr_cfg);
      uvm_config_db#(uvma_obi_cfg_c)::set(this, "obi_data_agent" , "cfg", cfg.obi_data_cfg );
      // TODO Assign sub-environment cfg handle
      //      Ex: uvm_config_db#(uvme_sub_cfg_c)::set(this, "sub_env", "cfg", cfg.sub_env_cfg);
   endfunction

   /**
    *
    */
   virtual function void assign_reg_blocks();
      // TODO Assign sub-environment register blocks
      //      cntxt.sub_env_cntxt.reg_block = reg_block.sub_block;
   endfunction

   /**
    * Assigns context handles to components using UVM Configuration Database.
    */
   virtual function void assign_cntxt();
      uvm_config_db#(uvma_obi_cntxt_c)::set(this, "obi_instr_agent", "cntxt", cntxt.obi_instr_cntxt);
      uvm_config_db#(uvma_obi_cntxt_c)::set(this, "obi_data_agent" , "cntxt", cntxt.obi_data_cntxt );
      // TODO Assign sub-environment cntxt handle
      //      Ex: uvm_config_db#(uvme_sub_cntxt_c)::set(this, "sub_env", "cntxt", cntxt.sub_env_cntxt);
   endfunction

   /**
    *
    */
   virtual function void create_envs();
      // TODO: Create sub-environments
      //       Ex: sub_env = uvme_sub_env_c::type_id::create("sub_env");
   endfunction

   /**
    * Creates agent components.
    */
   virtual function void create_agents();
      obi_instr_agent = uvma_obi_agent_c::type_id::create("obi_instr_agent", this);
      obi_data_agent  = uvma_obi_agent_c::type_id::create("obi_data_agent" , this);
   endfunction

   /**
    *
    */
   virtual function void create_reg_adapter();
      reg_adapter = uvma_obi_reg_adapter_c::type_id::create("reg_adapter");
   endfunction

   /**
    *
    */
   virtual function void connect_reg_block();
      cntxt.reg_model.default_map.set_sequencer(obi_data_agent.vsequencer, reg_adapter);
      cntxt.reg_model.default_map.set_auto_predict(1);
   endfunction

   /**
    * Connects agents to predictor.
    */
   virtual function void connect_predictor();
      obi_data_agent.mon_trn_ap.connect(predictor.obi_data_fifo.analysis_export);
   endfunction

   /**
    * Connects scoreboards components to agents/predictor.
    */
   virtual function void connect_scoreboard();
      // TODO Connect agents -> scoreboard
      //      Ex: pkt_agent.mon_ap.connect(scoreboard.sb_pkt.act_export);
      // TODO Connect predictor -> scoreboard
      //      Ex: predictor.pkt_out_ap.connect(scoreboard.sb_pkt.exp_export);
   endfunction

   /**
    * Connects environment coverage model to agents/scoreboards/predictor.
    */
   virtual function void connect_coverage_model();
      // TODO Implement uvme_cvmcu_env_c::connect_coverage_model()
      //      Ex: obi_instr_agent.mon_ap.connect(cov_model.obi_instr_export);
   endfunction

   /**
    * Assembles virtual sequencer from agent sequencers.
    */
   virtual function void assemble_vsequencer();
      vsequencer.obi_instr_vsequencer = obi_instr_agent.vsequencer;
      vsequencer.obi_data_vsequencer  = obi_data_agent.vsequencer ;
   endfunction

   /**
    *
    */
   virtual function void add_reg_test_ignore_lists();
      add_reg_test_ignore_list(UVM_DO_ALL_REG_MEM_TESTS, uvme_cvmcu_all_reg_mem_ignore_list    );
      add_reg_test_ignore_list(UVM_DO_REG_HW_RESET     , uvme_cvmcu_reg_hw_reset_ignore_list   );
      add_reg_test_ignore_list(UVM_DO_REG_BIT_BASH     , uvme_cvmcu_reg_bit_bash_ignore_list   );
      add_reg_test_ignore_list(UVM_DO_REG_ACCESS       , uvme_cvmcu_reg_access_ignore_list     );
      add_reg_test_ignore_list(UVM_DO_MEM_ACCESS       , uvme_cvmcu_mem_access_ignore_list     );
      add_reg_test_ignore_list(UVM_DO_SHARED_ACCESS    , uvme_cvmcu_shared_access_ignore_list  );
      add_reg_test_ignore_list(UVM_DO_MEM_WALK         , uvme_cvmcu_mem_walk_access_ignore_list);
   endfunction

endclass : uvme_cvmcu_env_c


`endif // __UVME_CVMCU_ENV_SV__
