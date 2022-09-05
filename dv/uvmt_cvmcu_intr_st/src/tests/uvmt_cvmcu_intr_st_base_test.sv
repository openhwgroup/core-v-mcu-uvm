// Copyright 2022 Datum Technology Corporation
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMT_CVMCU_INTR_ST_BASE_TEST_SV__
`define __UVMT_CVMCU_INTR_ST_BASE_TEST_SV__


/**
 * Component from which all other CORE-V MCU Interrupt UVM Agent Self-Tests must extend.
 * Subclasses must run sequences on the virtual sequencer by implementing UVM runtime phases.
 * @ingroup uvmt_cvmcu_intr_st_tests
 */
class uvmt_cvmcu_intr_st_base_test_c extends uvml_test_c;

   virtual uvmt_cvmcu_intr_st_clknrst_gen_if  clknrst_gen_vif; ///< Handle to clock and reset generation interface

   /// @name Objects
   /// @{
   rand uvmt_cvmcu_intr_st_test_cfg_c  test_cfg ; ///< Test configuration handle
   rand uvme_cvmcu_intr_st_cfg_c       env_cfg  ; ///< Environment configuration handle
   uvme_cvmcu_intr_st_cntxt_c          env_cntxt; ///< Environment context handle
   uvml_logs_rs_c                      rs       ; ///< Custom UVM report server
   /// @}

   /// @name Components
   /// @{
   uvme_cvmcu_intr_st_env_c   env       ; ///< Target environment
   uvme_cvmcu_intr_st_vsqr_c  vsequencer; ///< Target environment virtual sequencer handle
   /// @}


   `uvm_component_utils_begin(uvmt_cvmcu_intr_st_base_test_c)
      `uvm_field_object(test_cfg , UVM_DEFAULT)
      `uvm_field_object(env_cfg  , UVM_DEFAULT)
      `uvm_field_object(env_cntxt, UVM_DEFAULT)
   `uvm_component_utils_end


   /**
    * Sets safe default options for #env_cfg.
    */
   constraint env_cfg_cons {
           env_cfg.enabled               == 1;
           env_cfg.is_active             == UVM_ACTIVE;
      soft env_cfg.trn_log_enabled       == 1;
      soft env_cfg.scoreboarding_enabled == 1;
      soft env_cfg.cov_model_enabled     == 1;
   }

   // Additional, temporary constraints to get around known design bugs/constraints
   `include "uvmt_cvmcu_intr_st_base_test_workarounds.sv"


   /**
    * Replaces default report server with rs.
    */
   extern function new(string name="uvmt_cvmcu_intr_st_base_test", uvm_component parent=null);

   /**
    * 1. Builds test_cfg & env_cfg
    * 2. Randomizes entire test class
    * 3. Passes env_cfg to env
    * 4. Builds env_cntxt
    * 5. Passes env_cntxt to env using uvm_config_db
    * 6. Builds env
    * 7. Builds the rest of the components/objects
    */
   extern virtual function void build_phase(uvm_phase phase);

   /**
    * 1. Assigns environment's virtual sequencer handle to vsequencer.
    * 2. Add register callback (reg_cbs) to all registers & fields.
    */
   extern virtual function void connect_phase(uvm_phase phase);

   /**
    * Triggers the start of clock generation.
    */
   extern virtual task run_phase(uvm_phase phase);

   /**
    * Asserts & de-asserts reset by using #clknrst_vif.
    */
   extern virtual task reset_phase(uvm_phase phase);

   /**
    * Retrieves #clknrst_gen_vif from uvm_config_db.
    */
   extern function void retrieve_clknrst_gen_vif();

   /**
    * Creates test_cfg and env_cfg.
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
    * Assigns environment configuration (env_cfg) handle to environment (env) using uvm_config_db.
    */
   extern function void assign_cfg();

   /**
    * Creates env_cntxt.
    */
   extern function void create_cntxt();

   /**
    * Assigns environment context (env_cntxt) handle to environment (env) using uvm_config_db.
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
    * Starts clock generation via clknrst_gen_vif functions.
    */
   extern task start_clk();

endclass : uvmt_cvmcu_intr_st_base_test_c


function uvmt_cvmcu_intr_st_base_test_c::new(string name="uvmt_cvmcu_intr_st_base_test", uvm_component parent=null);

   super.new(name, parent);
   rs = new("rs");
   uvm_report_server::set_server(rs);

endfunction : new


function void uvmt_cvmcu_intr_st_base_test_c::build_phase(uvm_phase phase);

   super.build_phase(phase);
   retrieve_clknrst_gen_vif();
   create_cfg              ();
   randomize_test          ();
   cfg_hrtbt_monitor       ();
   assign_cfg              ();
   create_cntxt            ();
   assign_cntxt            ();
   create_env              ();
   create_components       ();

endfunction : build_phase


function void uvmt_cvmcu_intr_st_base_test_c::connect_phase(uvm_phase phase);

   super.connect_phase(phase);
   vsequencer = env.vsequencer;

endfunction : connect_phase


task uvmt_cvmcu_intr_st_base_test_c::run_phase(uvm_phase phase);

   super.run_phase(phase);
   start_clk();

endtask : run_phase


task uvmt_cvmcu_intr_st_base_test_c::reset_phase(uvm_phase phase);

   super.reset_phase(phase);
   `uvm_info("TEST", $sformatf("Asserting reset for %0t", (test_cfg.reset_period * 1ns)), UVM_NONE)
   clknrst_gen_vif.assert_reset();
   `uvml_hrtbt()
   #(test_cfg.reset_period * 1ns);
   clknrst_gen_vif.deassert_reset();
   `uvml_hrtbt()
   `uvm_info("TEST", "De-asserted reset", UVM_NONE)

endtask : reset_phase


function void uvmt_cvmcu_intr_st_base_test_c::retrieve_clknrst_gen_vif();

   if (!uvm_config_db#(virtual uvmt_cvmcu_intr_st_clknrst_gen_if)::get(this, "", "vif", clknrst_gen_vif)) begin
      `uvm_fatal("TEST", $sformatf("Could not find clknrst_gen_vif handle of type %s in uvm_config_db", $typename(clknrst_gen_vif)))
   end
   else begin
      `uvm_info("TEST", $sformatf("Found clknrst_gen_vif handle of type %s in uvm_config_db", $typename(clknrst_gen_vif)), UVM_DEBUG)
   end

endfunction : retrieve_clknrst_gen_vif


function void uvmt_cvmcu_intr_st_base_test_c::create_cfg();

   test_cfg = uvmt_cvmcu_intr_st_test_cfg_c::type_id::create("test_cfg");
   env_cfg  = uvme_cvmcu_intr_st_cfg_c     ::type_id::create("env_cfg" );

endfunction : create_cfg


function void uvmt_cvmcu_intr_st_base_test_c::randomize_test();

   test_cfg.process_cli_args();
   `uvm_info("TEST", "Randomizing test ...", UVM_NONE)
   if (!this.randomize()) begin
      `uvm_fatal("TEST", "Failed to randomize test");
   end
   `uvm_info("TEST", $sformatf("Top-level environment configuration:\n%s", env_cfg.sprint()), UVM_NONE)

endfunction : randomize_test


function void uvmt_cvmcu_intr_st_base_test_c::cfg_hrtbt_monitor();

   `uvml_hrtbt_set_cfg(startup_timeout , test_cfg.startup_timeout)
   `uvml_hrtbt_set_cfg(heartbeat_period, test_cfg.heartbeat_period)
   `uvml_watchdog_set_cfg(timeout, test_cfg.simulation_timeout)

endfunction : cfg_hrtbt_monitor


function void uvmt_cvmcu_intr_st_base_test_c::assign_cfg();

   uvm_config_db#(uvme_cvmcu_intr_st_cfg_c)::set(this, "env", "cfg", env_cfg);

endfunction : assign_cfg


function void uvmt_cvmcu_intr_st_base_test_c::create_cntxt();

   env_cntxt = uvme_cvmcu_intr_st_cntxt_c::type_id::create("env_cntxt");

endfunction : create_cntxt


function void uvmt_cvmcu_intr_st_base_test_c::assign_cntxt();

   uvm_config_db#(uvme_cvmcu_intr_st_cntxt_c)::set(this, "env", "cntxt", env_cntxt);

endfunction : assign_cntxt


function void uvmt_cvmcu_intr_st_base_test_c::create_env();

   env = uvme_cvmcu_intr_st_env_c::type_id::create("env", this);

endfunction : create_env


function void uvmt_cvmcu_intr_st_base_test_c::create_components();

   // TODO Implement uvmt_cvmcu_intr_st_base_test_c::create_components()

endfunction : create_components


task uvmt_cvmcu_intr_st_base_test_c::start_clk();

   clknrst_gen_vif.set_clk_period(test_cfg.clk_period);
   clknrst_gen_vif.start_clk();

endtask : start_clk


`endif // __UVMT_CVMCU_INTR_ST_BASE_TEST_SV__
