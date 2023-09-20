// Copyright 2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMT_CVMCU_DBG_ST_BASE_TEST_SV__
`define __UVMT_CVMCU_DBG_ST_BASE_TEST_SV__


/**
 * Abstract Test from which all other CORE-V-MCU Debug Interface Agent Self-Tests must extend.
 * Subclasses must provide stimulus via vsequencer by implementing UVM runtime phases.
 * @ingroup uvmt_cvmcu_dbg_st_tests
 */
class uvmt_cvmcu_dbg_st_base_test_c extends uvmx_agent_test_c #(
   .T_CFG      (uvmt_cvmcu_dbg_st_test_cfg_c),
   .T_ENV_CFG  (uvme_cvmcu_dbg_st_cfg_c     ),
   .T_ENV_CNTXT(uvme_cvmcu_dbg_st_cntxt_c   ),
   .T_ENV      (uvme_cvmcu_dbg_st_env_c     ),
   .T_ENV_VSQR (uvme_cvmcu_dbg_st_vsqr_c    )
);

   /// @name Agents
   /// @{
   uvma_clk_agent_c  clk_agent; ///< Slow agent.
   uvma_reset_agent_c  reset_agent; ///< System agent.
   /// @}

   /// @name Default Sequences
   /// @{
   rand uvma_clk_start_vseq_c  clk_vseq; ///< Starts clk generation during pre_reset_phase.
   rand uvma_reset_pulse_vseq_c  reset_vseq; ///< Asserts reset during reset_phase.
   /// @}


   `uvm_component_utils(uvmt_cvmcu_dbg_st_base_test_c)
   `include "uvmt_cvmcu_dbg_st_base_test_workarounds.sv"


   /**
    * Sets up basic configuration for env
    */
   constraint base_cons {
   }

   /**
    * Sets clock frequency
    */
   constraint clk_cons {
      clk_vseq.frequency == test_cfg.clk_frequency;
   }


   /**
    * Default constructor.
    */
   function new(string name="uvmt_cvmcu_dbg_st_base_test", uvm_component parent=null);
      super.new(name, parent);
   endfunction

   /**
    * Creates Agent components.
    */
   virtual function void create_components();
      clk_agent = uvma_clk_agent_c::type_id::create("clk_agent", this);
      reset_agent = uvma_reset_agent_c::type_id::create("reset_agent", this);
   endfunction

   /**
    * Connects the reset agent to the environment's reset port.
    */
   virtual function void connect_env_reset();
      reset_agent.reset_mon_trn_ap.connect(env.reset_mon_trn_export);
   endfunction

   /**
    * Assigns configuration objects to Agents.
    */
   virtual function void assign_cfg();
      uvm_config_db#(uvma_clk_cfg_c)::set(this, "clk_agent", "cfg", test_cfg.clk_agent_cfg);
      uvm_config_db#(uvma_reset_cfg_c)::set(this, "reset_agent", "cfg", test_cfg.reset_agent_cfg);
   endfunction

   /**
    * Creates Clock and Reset Sequences.
    */
   virtual function void create_clk_reset_sequences();
      clk_vseq = uvma_clk_start_vseq_c::type_id::create("clk_vseq");
      reset_vseq = uvma_reset_pulse_vseq_c::type_id::create("reset_vseq");
   endfunction

/**
    * Runs clk_vseq.
    */
   virtual task pre_reset_phase(uvm_phase phase);
      phase.raise_objection(this);
      `uvm_info("TEST", $sformatf("Starting Clock Virtual Sequence:\n%s", clk_vseq.sprint()), UVM_NONE)
      clk_vseq.start(clk_agent.vsequencer);
      `uvm_info("TEST", $sformatf("Finished Clock Virtual Sequence:\n%s", clk_vseq.sprint()), UVM_NONE)
      phase.drop_objection(this);
   endtask

   /**
    * Runs reset_vseq.
    */
   virtual task reset_phase(uvm_phase phase);
      phase.raise_objection(this);
      `uvm_info("TEST", $sformatf("Starting Reset Virtual Sequence:\n%s", reset_vseq.sprint()), UVM_NONE)
      reset_vseq.start(reset_agent.vsequencer);
      `uvm_info("TEST", $sformatf("Finished Reset Virtual Sequence", reset_vseq.sprint()), UVM_NONE)
      phase.drop_objection(this);
   endtask

endclass : uvmt_cvmcu_dbg_st_base_test_c


`endif // __UVMT_CVMCU_DBG_ST_BASE_TEST_SV__