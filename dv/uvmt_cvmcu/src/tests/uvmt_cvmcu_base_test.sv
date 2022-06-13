// Copyright 2022 Datum Technology Corporation
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMT_CVMCU_BASE_TEST_SV__
`define __UVMT_CVMCU_BASE_TEST_SV__


/**
 * Abstract component from which all other CORE-V MCU test cases must ultimately extend.
 * Subclasses must provide stimulus via the virtual sequencer by implementing UVM runtime phases.
 */
class uvmt_cvmcu_base_test_c extends uvm_test;

   // Objects
   rand uvmt_cvmcu_test_cfg_c  test_cfg ;
   rand uvme_cvmcu_cfg_c       env_cfg  ;
   uvme_cvmcu_cntxt_c          env_cntxt;
   uvme_cvmcu_reg_block_c      reg_block;
   uvml_logs_rs_text_c         rs       ;
   uvml_logs_reg_logger_cbs_c  reg_cbs  ;

   // Components
   uvme_cvmcu_env_c   env       ;
   uvme_cvmcu_vsqr_c  vsequencer;

   // Handle to design probe interface
   virtual uvmt_cvmcu_probe_if  probe_vif;

   // Default sequences
   rand uvme_cvmcu_sys_clk_vseq_c    sys_clk_vseq;
   rand uvme_cvmcu_sys_reset_vseq_c  sys_reset_vseq;


   `uvm_component_utils_begin(uvmt_cvmcu_base_test_c)
      `uvm_field_object(test_cfg , UVM_DEFAULT)
      `uvm_field_object(env_cfg  , UVM_DEFAULT)
      `uvm_field_object(env_cntxt, UVM_DEFAULT)
   `uvm_component_utils_end


   constraint env_cfg_cons {
      env_cfg.enabled         == 1;
      env_cfg.is_active       == UVM_ACTIVE;
      env_cfg.trn_log_enabled == 1;
   }


   // Additional, temporary constraints to get around known design bugs/constraints
   `include "uvmt_cvmcu_base_test_workarounds.sv"


   /**
    * 1. Replaces default report server with rs.
    * 2. Creates reset_vseq.
    */
   extern function new(string name="uvmt_cvmcu_base_test", uvm_component parent=null);

   /**
    * 1. Builds test_cfg & env_cfg via create_cfg()
    * 2. Randomizes entire test class via randomize_test()
    * 3. Passes env_cfg to env via uvm_config_db via assign_cfg()
    * 4. Builds env_cntxt via create_cntxt()
    * 5. Passes env_cntxt to env using UVM Configuration Database via assign_cntxt()
    * 6. Builds env via create_env()
    * 7. Builds the rest of the components/objects via create_components()
    */
   extern virtual function void build_phase(uvm_phase phase);

   /**
    * 1. Assigns environment's virtual sequencer handle to vsequencer.
    * 2. Add register callback (reg_cbs) to all registers & fields.
    */
   extern virtual function void connect_phase(uvm_phase phase);

   /**
    * Runs sys_clk_vseq.
    */
   extern virtual task pre_reset_phase(uvm_phase phase);

   /**
    * Runs sys_reset_vseq.
    */
   extern virtual task reset_phase(uvm_phase phase);

   /**
    * Writes contents of RAL to the DUT.
    */
   extern virtual task configure_phase(uvm_phase phase);

   /**
    * Prints out start of phase banners.
    */
   extern virtual function void phase_started(uvm_phase phase);

   /**
    * Indicates to the test bench (uvmt_cvmcu_tb) that the test has completed.
    * This is done by checking the properties of the phase argument.
    */
   extern virtual function void phase_ended(uvm_phase phase);

   /**
    * Retrieves probe_vif from UVM configuration database.
    */
   extern function void retrieve_probe_vif();

   /**
    * Creates test_cfg and env_cfg. Assigns reg_block handle to env_cfg's.
    */
   extern function void create_cfg();

   /**
    * 1. Calls test_cfg's process_cli_args()
    * 2. Calls randomize on 'this' and fatals out if it fails.
    */
   extern function void randomize_test();

   /**
    * Configures uvml_default_hrtbt_monitor.
    */
   extern function void cfg_hrtbt_monitor();

   /**
    * Assigns environment configuration (env_cfg) handle to environment (env)
    * using UVM Configuration Database.
    */
   extern function void assign_cfg();

   /**
    * Creates env_cntxt.
    */
   extern function void create_cntxt();

   /**
    * Assigns environment context (env_cntxt) handle to environment (env) using
    * UVM Configuration Database.
    */
   extern function void assign_cntxt();

   /**
    * Creates env.
    */
   extern function void create_env();

   /**
    * Creates additional (non-environment) components (and objects).
    */
   extern function void create_components();

   /**
    * Prints overlined and underlined text in uppercase.
    */
   extern function void print_banner(string text);

endclass : uvmt_cvmcu_base_test_c


function uvmt_cvmcu_base_test_c::new(string name="uvmt_cvmcu_base_test", uvm_component parent=null);

   super.new(name, parent);

   rs = new("rs");
   uvm_report_server::set_server(rs);
   sys_clk_vseq = uvme_cvmcu_sys_clk_vseq_c::type_id::create("sys_clk_vseq");
   sys_reset_vseq = uvme_cvmcu_sys_reset_vseq_c::type_id::create("sys_reset_vseq");

endfunction : new


function void uvmt_cvmcu_base_test_c::build_phase(uvm_phase phase);

   super.build_phase(phase);

   retrieve_probe_vif();
   create_cfg        ();
   randomize_test    ();
   cfg_hrtbt_monitor ();
   assign_cfg        ();
   create_cntxt      ();
   assign_cntxt      ();
   create_env        ();
   create_components ();

endfunction : build_phase


function void uvmt_cvmcu_base_test_c::connect_phase(uvm_phase phase);

   super.connect_phase(phase);

   vsequencer = env.vsequencer;
   reg_block  = env.reg_block;
   uvm_reg_cb::add(null, reg_cbs);

endfunction : connect_phase


task uvmt_cvmcu_base_test_c::pre_reset_phase(uvm_phase phase);

   super.pre_reset_phase(phase);

   `uvm_info("TEST", $sformatf("Starting sys_clk virtual sequence:\n%s", sys_clk_vseq.sprint()), UVM_NONE)
   sys_clk_vseq.start(vsequencer);
   `uvm_info("TEST", "Finished sys_clk virtual sequence", UVM_NONE)

endtask : pre_reset_phase


task uvmt_cvmcu_base_test_c::reset_phase(uvm_phase phase);

   super.reset_phase(phase);

   `uvm_info("TEST", $sformatf("Starting sys_reset virtual sequence:\n%s", sys_reset_vseq.sprint()), UVM_NONE)
   sys_reset_vseq.start(vsequencer);
   `uvm_info("TEST", "Finished sys_reset virtual sequence", UVM_NONE)

endtask : reset_phase


task uvmt_cvmcu_base_test_c::configure_phase(uvm_phase phase);

   uvm_status_e status;

   super.configure_phase(phase);

   `uvm_info("TEST", $sformatf("Starting to update DUT with RAL contents:\n%s", reg_block.sprint()), UVM_NONE)
   reg_block.update(status);
   `uvm_info("TEST", "Finished updating DUT with RAL contents", UVM_NONE)

endtask : configure_phase


function void uvmt_cvmcu_base_test_c::phase_started(uvm_phase phase);

   super.phase_started(phase);
   print_banner($sformatf("start of %s phase", phase.get_name()));

endfunction : phase_started


function void uvmt_cvmcu_base_test_c::phase_ended(uvm_phase phase);

   super.phase_ended(phase);

   if (phase.is(uvm_final_phase::get())) begin
     uvm_config_db#(bit)::set(null, "", "sim_finished", 1);
     print_banner("test finished");
   end

endfunction : phase_ended


function void uvmt_cvmcu_base_test_c::retrieve_probe_vif();

   if (!uvm_config_db#(virtual uvmt_cvmcu_probe_if)::get(this, "", "probe_vif", probe_vif)) begin
      `uvm_fatal("VIF", $sformatf("Could not find probe_vif handle of type %s in uvm_config_db", $typename(probe_vif)))
   end
   else begin
      `uvm_info("VIF", $sformatf("Found probe_vif handle of type %s in uvm_config_db", $typename(probe_vif)), UVM_DEBUG)
   end

endfunction : retrieve_probe_vif


function void uvmt_cvmcu_base_test_c::create_cfg();

   test_cfg  = uvmt_cvmcu_test_cfg_c::type_id::create("test_cfg");
   env_cfg   = uvme_cvmcu_cfg_c     ::type_id::create("env_cfg" );

endfunction : create_cfg


function void uvmt_cvmcu_base_test_c::randomize_test();

   test_cfg.process_cli_args();
   if (!this.randomize()) begin
      `uvm_fatal("TEST", "Failed to randomize test");
   end
   `uvm_info("TEST", $sformatf("Top-level environment configuration:\n%s", env_cfg.sprint()), UVM_NONE)

endfunction : randomize_test


function void uvmt_cvmcu_base_test_c::cfg_hrtbt_monitor();

   `uvml_hrtbt_set_cfg(startup_timeout , test_cfg.startup_timeout)
   `uvml_hrtbt_set_cfg(heartbeat_period, test_cfg.heartbeat_period)
   `uvml_watchdog_set_cfg(timeout, test_cfg.simulation_timeout)

endfunction : cfg_hrtbt_monitor


function void uvmt_cvmcu_base_test_c::assign_cfg();

   uvm_config_db#(uvme_cvmcu_cfg_c)::set(this, "env", "cfg", env_cfg);

endfunction : assign_cfg


function void uvmt_cvmcu_base_test_c::create_cntxt();

   env_cntxt = uvme_cvmcu_cntxt_c::type_id::create("env_cntxt");

endfunction : create_cntxt


function void uvmt_cvmcu_base_test_c::assign_cntxt();

   uvm_config_db#(uvme_cvmcu_cntxt_c)::set(this, "env", "cntxt", env_cntxt);

endfunction : assign_cntxt


function void uvmt_cvmcu_base_test_c::create_env();

   env = uvme_cvmcu_env_c::type_id::create("env", this);

endfunction : create_env


function void uvmt_cvmcu_base_test_c::create_components();

   reg_cbs = uvml_logs_reg_logger_cbs_c::type_id::create("reg_cbs");

endfunction : create_components


function void uvmt_cvmcu_base_test_c::print_banner(string text);

   $display("");
   $display("*******************************************************************************");
   $display(text.toupper());
   $display("*******************************************************************************");

endfunction : print_banner


`endif // __UVMT_CVMCU_BASE_TEST_SV__
