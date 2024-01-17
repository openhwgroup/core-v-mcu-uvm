// Copyright 2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMT_CVMCU_CHIP_BASE_TEST_SV__
`define __UVMT_CVMCU_CHIP_BASE_TEST_SV__


/**
 * Component from which all other CORE-V-MCU Chip tests must extend.
 * Subclasses must provide stimulus via sequencer by implementing UVM runtime phases.
 * @ingroup uvmt_cvmcu_chip_tests
 */
class uvmt_cvmcu_chip_base_test_c extends uvmx_chip_test_c #(
   .T_CFG      (uvmt_cvmcu_chip_test_cfg_c),
   .T_ENV_CFG  (uvme_cvmcu_chip_cfg_c     ),
   .T_ENV_CNTXT(uvme_cvmcu_chip_cntxt_c   ),
   .T_ENV      (uvme_cvmcu_chip_env_c     ),
   .T_ENV_SQR  (uvme_cvmcu_chip_sqr_c     )
);

   /// @name Agents
   /// @{
   uvma_clk_agent_c  sys_clk_agent; ///< System clock agent.
   uvma_clk_agent_c  jtag_clk_agent; ///< JTAG clock agent.
   uvma_clk_agent_c  uart0_clk_agent; ///< UART0 agent clock clock agent.
   uvma_clk_agent_c  uart1_clk_agent; ///< UART1 agent clock clock agent.
   uvma_reset_agent_c  sys_reset_agent; ///< System reset agent.
   uvma_reset_agent_c  jtag_reset_agent; ///< JTAG reset agent.
   /// @}

   /// @name Default sequences
   /// @{
   rand uvme_cvmcu_chip_init_seq_c  init_seq; ///< Starts at time 0.
   rand uvma_clk_start_seq_c  sys_clk_seq; ///< Starts sys_clk clock generation during pre_reset_phase.
   rand uvma_clk_start_seq_c  jtag_clk_seq; ///< Starts jtag_clk clock generation during pre_reset_phase.
   rand uvma_clk_start_seq_c  uart0_clk_seq; ///< Starts uart0_clk clock generation during pre_reset_phase.
   rand uvma_clk_start_seq_c  uart1_clk_seq; ///< Starts uart1_clk clock generation during pre_reset_phase.
   rand uvma_reset_pulse_seq_c  sys_reset_seq; ///< Asserts reset during reset_phase()
   rand uvma_reset_pulse_seq_c  jtag_reset_seq; ///< Asserts reset during reset_phase()
   /// @}


   `uvm_component_utils_begin(uvmt_cvmcu_chip_base_test_c)
      `uvm_field_object(test_cfg , UVM_DEFAULT)
      `uvm_field_object(env_cfg  , UVM_DEFAULT)
      `uvm_field_object(env_cntxt, UVM_DEFAULT)
   `uvm_component_utils_end
   `include "uvmt_cvmcu_chip_base_test_workarounds.sv"


   /**
    * Sets up basic configuration for environment.
    */
   constraint base_cons {
      env_cfg.uart0_agent_cfg.baud_rate == test_cfg.uart0_baud_rate;
      env_cfg.uart1_agent_cfg.baud_rate == test_cfg.uart1_baud_rate;
      env_cfg.uart0_agent_cfg.clk_frequency == test_cfg.uart0_clk_frequency;
      env_cfg.uart1_agent_cfg.clk_frequency == test_cfg.uart1_clk_frequency;
      env_cfg.sys_clk_frequency == test_cfg.sys_clk_frequency;
   }

   /**
    * Sets clock frequencies.
    */
   constraint clk_cons {
      sys_clk_seq.frequency == test_cfg.sys_clk_frequency;
      jtag_clk_seq.frequency == test_cfg.jtag_clk_frequency;
      uart0_clk_seq.frequency == test_cfg.uart0_clk_frequency;
      uart1_clk_seq.frequency == test_cfg.uart1_clk_frequency;
   }

   /**
    * Sets parameter values.
    */
   constraint parameters_cons {
      env_cfg.use_cores == `UVMT_CVMCU_CHIP_USE_CORES;
   }


   /**
    * Default constructor.
    */
    function new(string name="uvmt_cvmcu_chip_base_test", uvm_component parent=null);
      super.new(name, parent);
   endfunction

   /**
    * Creates agent components.
    */
   virtual function void create_components();
      sys_clk_agent = uvma_clk_agent_c::type_id::create("sys_clk_agent", this);
      jtag_clk_agent = uvma_clk_agent_c::type_id::create("jtag_clk_agent", this);
      uart0_clk_agent = uvma_clk_agent_c::type_id::create("uart0_clk_agent", this);
      uart1_clk_agent = uvma_clk_agent_c::type_id::create("uart1_clk_agent", this);
      sys_reset_agent = uvma_reset_agent_c::type_id::create("sys_reset_agent", this);
      jtag_reset_agent = uvma_reset_agent_c::type_id::create("jtag_reset_agent", this);
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
      uvm_config_db#(uvma_clk_cfg_c)::set(this, "jtag_clk_agent", "cfg", test_cfg.jtag_clk_agent_cfg);
      uvm_config_db#(uvma_clk_cfg_c)::set(this, "uart0_clk_agent", "cfg", test_cfg.uart0_clk_agent_cfg);
      uvm_config_db#(uvma_clk_cfg_c)::set(this, "uart1_clk_agent", "cfg", test_cfg.uart1_clk_agent_cfg);
      uvm_config_db#(uvma_reset_cfg_c)::set(this, "sys_reset_agent", "cfg", test_cfg.sys_reset_agent_cfg);
      uvm_config_db#(uvma_reset_cfg_c)::set(this, "jtag_reset_agent", "cfg", test_cfg.jtag_reset_agent_cfg);
   endfunction

   /**
    * Creates init and cfg Sequences.
    */
   virtual function void create_init_cfg_sequences();
      init_seq = uvme_cvmcu_chip_init_seq_c::type_id::create("init_seq");
   endfunction

   /**
    * Creates Clock and Reset Sequences.
    */
   virtual function void create_clk_reset_sequences();
      sys_clk_seq = uvma_clk_start_seq_c::type_id::create("sys_clk_seq");
      jtag_clk_seq = uvma_clk_start_seq_c::type_id::create("jtag_clk_seq");
      uart0_clk_seq = uvma_clk_start_seq_c::type_id::create("uart0_clk_seq");
      uart1_clk_seq = uvma_clk_start_seq_c::type_id::create("uart1_clk_seq");
      sys_reset_seq = uvma_reset_pulse_seq_c::type_id::create("sys_reset_seq");
      jtag_reset_seq = uvma_reset_pulse_seq_c::type_id::create("jtag_reset_seq");
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
            `uvm_info("TEST", $sformatf("Starting 'jtag_clk_seq'e:\n%s", jtag_clk_seq.sprint()), UVM_NONE)
            jtag_clk_seq.start(jtag_clk_agent.sequencer);
            `uvm_info("TEST", $sformatf("Finished 'jtag_clk_seq':\n%s", jtag_clk_seq.sprint()), UVM_NONE)
         end
         begin
            `uvm_info("TEST", $sformatf("Starting 'uart0_clk_seq'e:\n%s", uart0_clk_seq.sprint()), UVM_NONE)
            uart0_clk_seq.start(uart0_clk_agent.sequencer);
            `uvm_info("TEST", $sformatf("Finished 'uart0_clk_seq':\n%s", uart0_clk_seq.sprint()), UVM_NONE)
         end
         begin
            `uvm_info("TEST", $sformatf("Starting 'uart1_clk_seq'e:\n%s", uart1_clk_seq.sprint()), UVM_NONE)
            uart1_clk_seq.start(uart1_clk_agent.sequencer);
            `uvm_info("TEST", $sformatf("Finished 'uart1_clk_seq':\n%s", uart1_clk_seq.sprint()), UVM_NONE)
         end
      join
      phase.drop_objection(this);
   endtask

   /**
    * Runs sys_reset_seq, then the other reset sequences.
    */
   virtual task reset_phase(uvm_phase phase);
      phase.raise_objection(this);
      super.reset_phase(phase);
      `uvm_info("TEST", $sformatf("Starting 'sys_reset_seq':\n%s", sys_reset_seq.sprint()), UVM_NONE)
      sys_reset_seq.start(sys_reset_agent.sequencer);
      `uvm_info("TEST", $sformatf("Finished 'sys_reset_seq':\n%s", sys_reset_seq.sprint()), UVM_NONE)
      fork
         begin
            `uvm_info("TEST", $sformatf("Starting 'jtag_reset_seq':\n%s", jtag_reset_seq.sprint()), UVM_NONE)
            jtag_reset_seq.start(jtag_reset_agent.sequencer);
            `uvm_info("TEST", $sformatf("Finished 'jtag_reset_seq':\n%s", jtag_reset_seq.sprint()), UVM_NONE)
         end
      join
      phase.drop_objection(this);
   endtask

endclass


`endif // __UVMT_CVMCU_CHIP_BASE_TEST_SV__
