// Copyright 2022-2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMT_APB_ADV_TIMER_BASE_TEST_SV__
`define __UVMT_APB_ADV_TIMER_BASE_TEST_SV__


/**
 * Component from which all other APB Advanced Timer Sub-System tests must extend.
 * Subclasses must provide stimulus via the virtual sequencer by implementing UVM runtime phases.
 * @ingroup uvmt_apb_adv_timer_tests
 */
class uvmt_apb_adv_timer_base_test_c extends uvmx_test_c #(
   .T_CFG      (uvmt_apb_adv_timer_test_cfg_c),
   .T_ENV_CFG  (uvme_apb_adv_timer_cfg_c     ),
   .T_ENV_CNTXT(uvme_apb_adv_timer_cntxt_c   ),
   .T_ENV      (uvme_apb_adv_timer_env_c     ),
   .T_ENV_VSQR (uvme_apb_adv_timer_vsqr_c    )
);

   /// @name Agents
   /// @{
   uvma_clk_agent_c    sys_clk_agent; ///<
   uvma_reset_agent_c  sys_reset_agent; ///<
   /// @}

   /// @name Default sequences
   /// @{
   rand uvma_clk_start_vseq_c    sys_clk_vseq  ; ///< Starts clock generation during pre_reset_phase()
   rand uvma_reset_pulse_vseq_c  sys_reset_vseq; ///< Asserts reset during reset_phase()
   /// @}


   `uvm_component_utils_begin(uvmt_apb_adv_timer_base_test_c)
      `uvm_field_object(test_cfg , UVM_DEFAULT)
      `uvm_field_object(env_cfg  , UVM_DEFAULT)
      `uvm_field_object(env_cntxt, UVM_DEFAULT)
   `uvm_component_utils_end
   `include "uvmt_apb_adv_timer_base_test_workarounds.sv"


   /**
    * Describe rules_cons
    */
   constraint rules_cons {
      sys_clk_vseq.frequency == test_cfg.sys_clk_frequency;
      env_cfg.reset_type         == test_cfg.reset_type       ;
      env_cfg .trn_log_enabled   == test_cfg.trn_log_enabled  ;
      env_cfg .cov_model_enabled == test_cfg.cov_model_enabled;
   }

   /**
    * Default constructor.
    */
    function new(string name="uvmt_apb_adv_timer_base_test", uvm_component parent=null);
      super.new(name, parent);
   endfunction

   /**
    *
    */
   virtual function void create_components();
      sys_clk_agent = uvma_clk_agent_c::type_id::create("sys_clk_agent", this);
      sys_reset_agent = uvma_reset_agent_c::type_id::create("sys_reset_agent", this);
   endfunction

   /**
    *
    */
   virtual function void connect_env_reset();
      sys_reset_agent.reset_mon_trn_ap.connect(env.reset_mon_trn_export);
   endfunction

   /**
    *
    */
   virtual function void assign_cfg();
      uvm_config_db#(uvma_clk_cfg_c)::set(this, "sys_clk_agent", "cfg", test_cfg.sys_clk_agent_cfg);
      uvm_config_db#(uvma_reset_cfg_c)::set(this, "sys_reset_agent", "cfg", test_cfg.sys_reset_agent_cfg);
   endfunction

   /**
    *
    */
   virtual function void create_sequences();
      sys_clk_vseq = uvma_clk_start_vseq_c::type_id::create("sys_clk_vseq");
      sys_reset_vseq = uvma_reset_pulse_vseq_c::type_id::create("sys_reset_vseq");
   endfunction

   /**
    * Runs sys_clk_vseq.
    */
   virtual task pre_reset_phase(uvm_phase phase);
      phase.raise_objection(this);
      `uvm_info("TEST", $sformatf("Starting Clock Virtual Sequence:\n%s", sys_clk_vseq.sprint()), UVM_NONE)
      sys_clk_vseq.start(sys_clk_agent.vsequencer);
      `uvm_info("TEST", $sformatf("Finished Clock Virtual Sequence:\n%s", sys_clk_vseq.sprint()), UVM_NONE)
      phase.drop_objection(this);
   endtask

   /**
    * Runs sys_reset_vseq.
    */
   virtual task reset_phase(uvm_phase phase);
      phase.raise_objection(this);
      `uvm_info("TEST", $sformatf("Starting Reset Virtual Sequence:\n%s", sys_reset_vseq.sprint()), UVM_NONE)
      sys_reset_vseq.start(sys_reset_agent.vsequencer);
      `uvm_info("TEST", $sformatf("Finished Reset Virtual Sequence", sys_reset_vseq.sprint()), UVM_NONE)
      phase.drop_objection(this);
   endtask

endclass : uvmt_apb_adv_timer_base_test_c


`endif // __UVMT_APB_ADV_TIMER_BASE_TEST_SV__