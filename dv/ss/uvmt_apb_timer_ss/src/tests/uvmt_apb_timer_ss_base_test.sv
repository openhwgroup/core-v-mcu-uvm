// Copyright 2023 Acme Enterprises
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMT_APB_TIMER_SS_BASE_TEST_SV__
`define __UVMT_APB_TIMER_SS_BASE_TEST_SV__


/**
 * Component from which all other APB simple timer unit Sub-System tests must extend.
 * Subclasses must provide stimulus via vsequencer by implementing UVM runtime phases.
 * @ingroup uvmt_apb_timer_ss_tests
 */
class uvmt_apb_timer_ss_base_test_c extends uvmx_ss_test_c #(
   .T_CFG      (uvmt_apb_timer_ss_test_cfg_c),
   .T_ENV_CFG  (uvme_apb_timer_ss_cfg_c     ),
   .T_ENV_CNTXT(uvme_apb_timer_ss_cntxt_c   ),
   .T_ENV      (uvme_apb_timer_ss_env_c     ),
   .T_ENV_VSQR (uvme_apb_timer_ss_vsqr_c    )
);

   /// @name Agents
   /// @{
   uvma_clk_agent_c  sys_clk_agent; ///< Processor clock agent.
   uvma_clk_agent_c  ref_clk_agent; ///< Reference clock agent.
   uvma_reset_agent_c  sys_reset_agent; ///< System reset agent.
   /// @}

   /// @name Default sequences
   /// @{
   rand uvme_apb_timer_ss_init_vseq_c  init_vseq; ///< Starts at time 0.
   rand uvme_apb_timer_ss_cfg_vseq_c   cfg_vseq ; ///< Configures DUT registers during configure_phase.
   rand uvma_clk_start_vseq_c  sys_clk_vseq; ///< Starts sys_clk clock generation during pre_reset_phase.
   rand uvma_clk_start_vseq_c  ref_clk_vseq; ///< Starts ref_clk clock generation during pre_reset_phase.
   rand uvma_reset_pulse_vseq_c  sys_reset_vseq; ///< Asserts reset during reset_phase()
   /// @}


   `uvm_component_utils_begin(uvmt_apb_timer_ss_base_test_c)
      `uvm_field_object(test_cfg , UVM_DEFAULT)
      `uvm_field_object(env_cfg  , UVM_DEFAULT)
      `uvm_field_object(env_cntxt, UVM_DEFAULT)
   `uvm_component_utils_end
   `include "uvmt_apb_timer_ss_base_test_workarounds.sv"


   /**
    * Sets up basic configuration for environment.
    */
   constraint rules_cons {
      env_cfg.reset_type        == test_cfg.reset_type       ;
      env_cfg.trn_log_enabled   == test_cfg.trn_log_enabled  ;
      env_cfg.cov_model_enabled == test_cfg.cov_model_enabled;
   }

   /**
    * Sets clock frequencies.
    */
   constraint clk_cons {
      sys_clk_vseq.frequency == test_cfg.sys_clk_frequency;
      ref_clk_vseq.frequency == test_cfg.ref_clk_frequency;
   }



   /**
    * Default constructor.
    */
    function new(string name="uvmt_apb_timer_ss_base_test", uvm_component parent=null);
      super.new(name, parent);
   endfunction

   /**
    * Creates agent components.
    */
   virtual function void create_components();
      sys_clk_agent = uvma_clk_agent_c::type_id::create("sys_clk_agent", this);
      ref_clk_agent = uvma_clk_agent_c::type_id::create("ref_clk_agent", this);
      sys_reset_agent = uvma_reset_agent_c::type_id::create("sys_reset_agent", this);
   endfunction

   /**
    * Connects  reset agent to the environment's reset port.
    */
   virtual function void connect_env_reset();
      _agent.reset_mon_trn_ap.connect(env.reset_mon_trn_export);
   endfunction

   /**
    * Assigns configuration objects to agents.
    */
   virtual function void assign_cfg();
      uvm_config_db#(uvma_clk_cfg_c)::set(this, "sys_clk_agent", "cfg", test_cfg.sys_clk_agent_cfg);
      uvm_config_db#(uvma_clk_cfg_c)::set(this, "ref_clk_agent", "cfg", test_cfg.ref_clk_agent_cfg);
      uvm_config_db#(uvma_reset_cfg_c)::set(this, "sys_reset_agent", "cfg", test_cfg.sys_reset_agent_cfg);
   endfunction

   /**
    * Creates init and cfg Sequences.
    */
   virtual function void create_init_cfg_sequences();
      init_vseq = uvme_apb_timer_ss_init_vseq_c::type_id::create("init_vseq");
      cfg_vseq  = uvme_apb_timer_ss_cfg_vseq_c ::type_id::create("cfg_vseq" );
   endfunction

   /**
    * Creates Clock and Reset Sequences.
    */
   virtual function void create_clk_reset_sequences();
      sys_clk_vseq = uvma_clk_start_vseq_c::type_id::create("sys_clk_vseq");
      ref_clk_vseq = uvma_clk_start_vseq_c::type_id::create("ref_clk_vseq");
      sys_reset_vseq = uvma_reset_pulse_vseq_c::type_id::create("sys_reset_vseq");
   endfunction

   /**
    * Runs clock sequences.
    */
   virtual task pre_reset_phase(uvm_phase phase);
      phase.raise_objection(this);
      super.pre_reset_phase(phase);
      `uvm_info("TEST", $sformatf("Starting Init Virtual Sequence:\n%s", init_vseq.sprint()), UVM_NONE)
      init_vseq.start(vsequencer);
      `uvm_info("TEST", $sformatf("Finished Init Virtual Sequence:\n%s", init_vseq.sprint()), UVM_NONE)
      fork
         begin
            `uvm_info("TEST", $sformatf("Starting Processor Clock Virtual Sequence:\n%s", sys_clk_vseq.sprint()), UVM_NONE)
            sys_clk_vseq.start(sys_clk_agent.vsequencer);
            `uvm_info("TEST", $sformatf("Finished Processor Clock Virtual Sequence:\n%s", sys_clk_vseq.sprint()), UVM_NONE)
         end
         begin
            `uvm_info("TEST", $sformatf("Starting Reference Clock Virtual Sequence:\n%s", ref_clk_vseq.sprint()), UVM_NONE)
            ref_clk_vseq.start(ref_clk_agent.vsequencer);
            `uvm_info("TEST", $sformatf("Finished Reference Clock Virtual Sequence:\n%s", ref_clk_vseq.sprint()), UVM_NONE)
         end
      join
      phase.drop_objection(this);
   endtask

   /**
    * Runs _vseq.
    */
   virtual task reset_phase(uvm_phase phase);
      phase.raise_objection(this);
      super.reset_phase(phase);
      `uvm_info("TEST", $sformatf("Starting  Reset Virtual Sequence:\n%s", _vseq.sprint()), UVM_NONE)
      _vseq.start(_agent.vsequencer);
      `uvm_info("TEST", $sformatf("Finished  Reset Virtual Sequence:\n%s", _vseq.sprint()), UVM_NONE)
      phase.drop_objection(this);
   endtask

   /**
    * Runs cfg_vseq to configure DUT registers.
    */
   virtual task configure_phase(uvm_phase phase);
      phase.raise_objection(this);
      super.configure_phase(phase);
      `uvm_info("TEST", $sformatf("Starting Configuration Virtual Sequence:\n%s", cfg_vseq.sprint()), UVM_NONE)
      cfg_vseq.start(vsequencer);
      `uvm_info("TEST", $sformatf("Finished Configuration Virtual Sequence:\n%s", cfg_vseq.sprint()), UVM_NONE)
      phase.drop_objection(this);
   endtask

endclass : uvmt_apb_timer_ss_base_test_c


`endif // __UVMT_APB_TIMER_SS_BASE_TEST_SV__