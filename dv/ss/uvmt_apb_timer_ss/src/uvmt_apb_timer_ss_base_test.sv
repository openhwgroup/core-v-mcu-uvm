// Copyright 2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMT_APB_TIMER_SS_BASE_TEST_SV__
`define __UVMT_APB_TIMER_SS_BASE_TEST_SV__


/**
 * Component from which all other APB simple timer unit Sub-System tests must extend.
 * Subclasses must provide stimulus via sequencer by implementing UVM runtime phases.
 * @ingroup uvmt_apb_timer_ss_tests
 */
class uvmt_apb_timer_ss_base_test_c extends uvmx_ss_test_c #(
   .T_CFG      (uvmt_apb_timer_ss_test_cfg_c),
   .T_ENV_CFG  (uvme_apb_timer_ss_cfg_c     ),
   .T_ENV_CNTXT(uvme_apb_timer_ss_cntxt_c   ),
   .T_ENV      (uvme_apb_timer_ss_env_c     ),
   .T_ENV_SQR  (uvme_apb_timer_ss_sqr_c     )
);

   /// @name Agents
   /// @{
   uvma_clk_agent_c  sys_clk_agent; ///< Processor clock agent.
   uvma_clk_agent_c  ref_clk_agent; ///< Reference clock agent.
   uvma_reset_agent_c  sys_reset_agent; ///< System reset agent.
   /// @}

   /// @name Default sequences
   /// @{
   rand uvme_apb_timer_ss_init_seq_c  init_seq; ///< Starts at time 0.
   rand uvme_apb_timer_ss_cfg_seq_c   cfg_seq ; ///< Configures DUT registers during configure_phase.
   rand uvma_clk_start_seq_c  sys_clk_seq; ///< Starts sys_clk clock generation during pre_reset_phase.
   rand uvma_clk_start_seq_c  ref_clk_seq; ///< Starts ref_clk clock generation during pre_reset_phase.
   rand uvma_reset_pulse_seq_c  sys_reset_seq; ///< Asserts reset during reset_phase()
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
   constraint base_cons {
   }

   /**
    * Sets clock frequencies.
    */
   constraint clk_cons {
      sys_clk_seq.frequency == test_cfg.sys_clk_frequency;
      ref_clk_seq.frequency == test_cfg.ref_clk_frequency;
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
    * Connects System reset agent to the environment's reset port.
    */
   virtual function void connect_env_reset();
      sys_reset_agent.reset_mon_trn_ap.connect(env.reset_mon_trn_export);
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
      init_seq = uvme_apb_timer_ss_init_seq_c::type_id::create("init_seq");
      cfg_seq  = uvme_apb_timer_ss_cfg_seq_c ::type_id::create("cfg_seq" );
   endfunction

   /**
    * Creates Clock and Reset Sequences.
    */
   virtual function void create_clk_reset_sequences();
      sys_clk_seq = uvma_clk_start_seq_c::type_id::create("sys_clk_seq");
      ref_clk_seq = uvma_clk_start_seq_c::type_id::create("ref_clk_seq");
      sys_reset_seq = uvma_reset_pulse_seq_c::type_id::create("sys_reset_seq");
   endfunction

   /**
    * Runs clock sequences.
    */
   virtual task pre_reset_phase(uvm_phase phase);
      phase.raise_objection(this);
      super.pre_reset_phase(phase);
      `uvm_info("TEST", $sformatf("Starting 'init_seq':\n%s", init_seq.sprint()), UVM_NONE)
      init_seq.start(sequencer);
      `uvm_info("TEST", $sformatf("Finished 'init_seq':\n%s", init_seq.sprint()), UVM_NONE)
      fork
         begin
            `uvm_info("TEST", $sformatf("Starting 'sys_clk_seq'e:\n%s", sys_clk_seq.sprint()), UVM_NONE)
            sys_clk_seq.start(sys_clk_agent.sequencer);
            `uvm_info("TEST", $sformatf("Finished 'sys_clk_seq':\n%s", sys_clk_seq.sprint()), UVM_NONE)
         end
         begin
            `uvm_info("TEST", $sformatf("Starting 'ref_clk_seq'e:\n%s", ref_clk_seq.sprint()), UVM_NONE)
            ref_clk_seq.start(ref_clk_agent.sequencer);
            `uvm_info("TEST", $sformatf("Finished 'ref_clk_seq':\n%s", ref_clk_seq.sprint()), UVM_NONE)
         end
      join
      phase.drop_objection(this);
   endtask

   /**
    * Runs sys_reset_seq.
    */
   virtual task reset_phase(uvm_phase phase);
      phase.raise_objection(this);
      super.reset_phase(phase);
      `uvm_info("TEST", $sformatf("Starting 'sys_reset_seq':\n%s", sys_reset_seq.sprint()), UVM_NONE)
      sys_reset_seq.start(sys_reset_agent.sequencer);
      `uvm_info("TEST", $sformatf("Finished 'sys_reset_seq':\n%s", sys_reset_seq.sprint()), UVM_NONE)
      phase.drop_objection(this);
   endtask

   /**
    * Runs cfg_seq to configure DUT registers.
    */
   virtual task configure_phase(uvm_phase phase);
      phase.raise_objection(this);
      super.configure_phase(phase);
      `uvm_info("TEST", $sformatf("Starting 'cfg_seq':\n%s", cfg_seq.sprint()), UVM_NONE)
      cfg_seq.start(sequencer);
      `uvm_info("TEST", $sformatf("Finished 'cfg_seq':\n%s", cfg_seq.sprint()), UVM_NONE)
      phase.drop_objection(this);
   endtask

endclass


`endif // __UVMT_APB_TIMER_SS_BASE_TEST_SV__