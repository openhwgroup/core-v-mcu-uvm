// Copyright 2023 Acme Enterprises
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVME_APB_ADV_TIMER_SS_ENV_SV__
`define __UVME_APB_ADV_TIMER_SS_ENV_SV__


/**
 * Component that encapsulates, builds and connects all other APB Advanced Timer Sub-System environment components.
 * @ingroup uvme_apb_adv_timer_ss_comps
 */
class uvme_apb_adv_timer_ss_env_c extends uvmx_ss_env_c #(
   .T_CFG      (uvme_apb_adv_timer_ss_cfg_c           ),
   .T_CNTXT    (uvme_apb_adv_timer_ss_cntxt_c         ),
   .T_VSQR     (uvme_apb_adv_timer_ss_vsqr_c          ),
   .T_PRD      (uvme_apb_adv_timer_ss_prd_c           ),
   .T_SB       (uvme_apb_adv_timer_ss_sb_c            ),
   .T_COV_MODEL(uvme_apb_adv_timer_ss_cov_model_c     ),
   .T_PROBE_VIF(virtual uvme_apb_adv_timer_ss_probe_if)
);

   /// @name Agents
   /// @{
   uvma_apb_agent_c  proc_agent; ///< Processor access agent
   /// @}

   /// @name Blocks
   /// @{
   uvme_adv_timer_b_env_c  adv_timer0_b_env; ///< Advanced timer 0 block
   uvme_adv_timer_b_env_c  adv_timer1_b_env; ///< Advanced timer 1 block
   uvme_adv_timer_b_env_c  adv_timer2_b_env; ///< Advanced timer 2 block
   uvme_adv_timer_b_env_c  adv_timer3_b_env; ///< Advanced timer 3 block
   /// @}

   /// @name Register Adapters
   /// @{
   uvma_apb_reg_adapter_c  proc_reg_adapter; ///< Converts APB sequence items to/from register operations.
   /// @}


   `uvm_component_utils(uvme_apb_adv_timer_ss_env_c)


   /**
    * Default constructor.
    */
   function new(string name="uvme_apb_adv_timer_ss_env", uvm_component parent=null);
      super.new(name, parent);
   endfunction

   /**
    * Assigns configuration handles to components using UVM Configuration Database.
    */
   virtual function void assign_cfg();
      uvm_config_db#(uvma_apb_cfg_c)::set(this, "proc_agent", "cfg", cfg.proc_agent_cfg);
      uvm_config_db#(uvme_adv_timer_b_cfg_c)::set(this, "adv_timer0_b_env", "cfg", cfg.adv_timer0_b_env_cfg);
      uvm_config_db#(uvme_adv_timer_b_cfg_c)::set(this, "adv_timer1_b_env", "cfg", cfg.adv_timer1_b_env_cfg);
      uvm_config_db#(uvme_adv_timer_b_cfg_c)::set(this, "adv_timer2_b_env", "cfg", cfg.adv_timer2_b_env_cfg);
      uvm_config_db#(uvme_adv_timer_b_cfg_c)::set(this, "adv_timer3_b_env", "cfg", cfg.adv_timer3_b_env_cfg);
   endfunction

   /**
    * Assigns context handles to components using UVM Configuration Database.
    */
   virtual function void assign_cntxt();
      uvm_config_db#(uvma_apb_cntxt_c)::set(this, "proc_agent", "cntxt", cntxt.proc_agent_cntxt);
      uvm_config_db#(uvme_adv_timer_b_cntxt_c)::set(this, "adv_timer0_b_env", "cntxt", cntxt.adv_timer0_b_env_cntxt);
      uvm_config_db#(uvme_adv_timer_b_cntxt_c)::set(this, "adv_timer1_b_env", "cntxt", cntxt.adv_timer1_b_env_cntxt);
      uvm_config_db#(uvme_adv_timer_b_cntxt_c)::set(this, "adv_timer2_b_env", "cntxt", cntxt.adv_timer2_b_env_cntxt);
      uvm_config_db#(uvme_adv_timer_b_cntxt_c)::set(this, "adv_timer3_b_env", "cntxt", cntxt.adv_timer3_b_env_cntxt);
   endfunction

   /**
    * Creates agent components.
    */
   virtual function void create_agents();
      proc_agent = uvma_apb_agent_c::type_id::create("proc_agent", this);
   endfunction

   /**
    * Creates block environment components.
    */
   virtual function void create_blocks();
      adv_timer0_b_env = uvme_adv_timer_b_env_c::type_id::create("adv_timer0_b_env", this);
      adv_timer1_b_env = uvme_adv_timer_b_env_c::type_id::create("adv_timer1_b_env", this);
      adv_timer2_b_env = uvme_adv_timer_b_env_c::type_id::create("adv_timer2_b_env", this);
      adv_timer3_b_env = uvme_adv_timer_b_env_c::type_id::create("adv_timer3_b_env", this);
   endfunction

   /**
    * Creates register adapters.
    */
   virtual function void create_reg_adapter();
      proc_reg_adapter = uvma_apb_reg_adapter_c::type_id::create("proc_reg_adapter");
   endfunction

   /**
    * Connects register block to register adapters.
    */
   virtual function void connect_reg_block();
      cntxt.reg_model.default_map.set_sequencer(proc_agent.vsequencer, proc_reg_adapter);
      cntxt.reg_model.default_map.set_auto_predict(1);
   endfunction

   /**
    * Connects environment coverage model to agents/scoreboards/predictor.
    */
   virtual function void connect_coverage_model();
   endfunction

   /**
    * Assembles virtual sequencer from agent, sub-system and block sequencers.
    */
   virtual function void assemble_vsequencer();
      vsequencer.proc_agent_vsequencer = proc_agent.vsequencer;
      vsequencer.adv_timer0_b_env_vsequencer = adv_timer0_b_env.vsequencer;
      vsequencer.adv_timer1_b_env_vsequencer = adv_timer1_b_env.vsequencer;
      vsequencer.adv_timer2_b_env_vsequencer = adv_timer2_b_env.vsequencer;
      vsequencer.adv_timer3_b_env_vsequencer = adv_timer3_b_env.vsequencer;
   endfunction


   /**
    * Adds automated register testing ignore lists.
    */
   virtual function void add_reg_test_ignore_lists();
      add_reg_test_ignore_list(UVM_DO_ALL_REG_MEM_TESTS, uvme_apb_adv_timer_ss_all_reg_mem_ignore_list    );
      add_reg_test_ignore_list(UVM_DO_REG_HW_RESET     , uvme_apb_adv_timer_ss_reg_hw_reset_ignore_list   );
      add_reg_test_ignore_list(UVM_DO_REG_BIT_BASH     , uvme_apb_adv_timer_ss_reg_bit_bash_ignore_list   );
      add_reg_test_ignore_list(UVM_DO_REG_ACCESS       , uvme_apb_adv_timer_ss_reg_access_ignore_list     );
      add_reg_test_ignore_list(UVM_DO_MEM_ACCESS       , uvme_apb_adv_timer_ss_mem_access_ignore_list     );
      add_reg_test_ignore_list(UVM_DO_SHARED_ACCESS    , uvme_apb_adv_timer_ss_shared_access_ignore_list  );
      add_reg_test_ignore_list(UVM_DO_MEM_WALK         , uvme_apb_adv_timer_ss_mem_walk_access_ignore_list);
   endfunction

endclass : uvme_apb_adv_timer_ss_env_c


`endif // __UVME_APB_ADV_TIMER_SS_ENV_SV__