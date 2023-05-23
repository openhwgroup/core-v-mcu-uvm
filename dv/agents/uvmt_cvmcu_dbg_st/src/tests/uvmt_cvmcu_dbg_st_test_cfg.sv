// Copyright 2023 Acme Enterprises
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMT__ST_TEST_CFG_SV__
`define __UVMT__ST_TEST_CFG_SV__


/**
 * Object encapsulating common configuration parameters for  UVM Agent Self-Tests.
 * @ingroup uvmt_cvmcu_dbg_tests
 */
class uvmt_cvmcu_dbg_st_test_cfg_c extends uvmx_agent_test_cfg_c;

   /// @name Integrals
   /// @{
   rand int unsigned          clk_frequency; ///< Slow frequency (Hz).
   rand uvmx_reset_type_enum  reset_type; ///< Async/Sync for System.
   /// @}

   /// @name Command line arguments
   /// @{
   bit           cli_num_items_override; ///< Set to '1' if argument was found for num_items
   int unsigned  cli_num_items         ; ///< Parsed integer value from the CLI for num_items
   /// @}

   /// @name Objects
   /// @{
   rand uvma_clk_cfg_c    clk_agent_cfg  ; ///< Slow agent configuration.
   rand uvma_reset_cfg_c  reset_agent_cfg; ///< Reset Agent configuration.
   /// @}


   `uvm_object_utils_begin(uvmt_cvmcu_dbg_st_test_cfg_c)
      `uvm_field_int (                      clk_frequency, UVM_DEFAULT + UVM_DEC)
      `uvm_field_enum(uvmx_reset_type_enum, reset_type, UVM_DEFAULT)
      `uvm_field_int (trn_log_enabled         , UVM_DEFAULT          )
      `uvm_field_int (cov_model_enabled       , UVM_DEFAULT          )
      `uvm_field_int (startup_timeout         , UVM_DEFAULT + UVM_DEC)
      `uvm_field_int (heartbeat_period        , UVM_DEFAULT + UVM_DEC)
      `uvm_field_int (heartbeat_refresh_period, UVM_DEFAULT + UVM_DEC)
      `uvm_field_int (simulation_timeout      , UVM_DEFAULT + UVM_DEC)
      `uvm_field_int (cli_num_items_override  , UVM_DEFAULT          )
      `uvm_field_int (cli_num_items           , UVM_DEFAULT + UVM_DEC)
      `uvm_field_object(clk_agent_cfg, UVM_DEFAULT)
      `uvm_field_object(reset_agent_cfg, UVM_DEFAULT)
   `uvm_object_utils_end


   /**
    * Sets safe defaults for all simulation timing parameters.
    */
   constraint defaults_cons {
      clk_frequency == uvmt_cvmcu_dbg_st_default_clk_frequency;
      startup_timeout          == uvmt_cvmcu_dbg_st_default_startup_timeout         ;
      heartbeat_period         == uvmt_cvmcu_dbg_st_default_heartbeat_period        ;
      heartbeat_refresh_period == uvmt_cvmcu_dbg_st_default_heartbeat_refresh_period;
      simulation_timeout       == uvmt_cvmcu_dbg_st_default_simulation_timeout      ;
   }

   /**
    * Sets Agents configuration.
    */
   constraint agents_cons {
      clk_agent_cfg.enabled           == 1;
      clk_agent_cfg.is_active         == UVM_ACTIVE;
      clk_agent_cfg.bypass_mode       == 0;
      clk_agent_cfg.trn_log_enabled   == trn_log_enabled;
      clk_agent_cfg.cov_model_enabled == 0;
      reset_type                        == UVMX_RESET_SYNC;
      reset_agent_cfg.reset_type        == reset_type;
      reset_agent_cfg.polarity          == UVMX_ACTIVE_LOW;
      reset_agent_cfg.enabled           == 1;
      reset_agent_cfg.bypass_mode       == 0;
      reset_agent_cfg.is_active         == UVM_ACTIVE;
      reset_agent_cfg.trn_log_enabled   == trn_log_enabled;
      reset_agent_cfg.cov_model_enabled == 0;
      
   }


   /**
    * Default constructor.
    */
   function new(string name="uvmt_cvmcu_dbg_st_test_cfg");
      super.new(name);
   endfunction

   /**
    * Creates configuration objects.
    */
   virtual function void create_objects();
      clk_agent_cfg = uvma_clk_cfg_c::type_id::create("clk_agent_cfg");
      reset_agent_cfg = uvma_reset_cfg_c::type_id::create("reset_agent_cfg");
   endfunction

   /**
    * Processes Command Line Interface arguments.
    */
   virtual function void process_cli_args();
      string  cli_num_items_str  = "";
      cli_num_items_override = 0;
      if (uvm_cmdline_proc.get_arg_value("NUM_ITEMS=", cli_num_items_str)) begin
         if (cli_num_items_str != "") begin
            cli_num_items_override = 1;
            cli_num_items = cli_num_items_str.atoi();
         end
      end
   endfunction

endclass : uvmt_cvmcu_dbg_st_test_cfg_c


`endif // __UVMT__ST_TEST_CFG_SV__