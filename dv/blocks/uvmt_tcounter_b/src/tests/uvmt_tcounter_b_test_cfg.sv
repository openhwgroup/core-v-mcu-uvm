// Copyright 2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMT_TCOUNTER_B_TEST_CFG_SV__
`define __UVMT_TCOUNTER_B_TEST_CFG_SV__


/**
 * Object encapsulating common configuration parameters for Timer unit counter UVM Agent Self-Tests.
 * @ingroup uvmt_tcounter_b_tests
 */
class uvmt_tcounter_b_test_cfg_c extends uvmx_block_test_cfg_c;

   /// @name Integrals
   /// @{
   rand int unsigned          clk_i_frequency; ///< Input clock frequency (Hz).
   rand uvmx_reset_type_enum  reset_type; ///< Async/Sync reset.
   /// @}

   /// @name Command line arguments
   /// @{
   bit           cli_num_items_override; ///< Set to '1' if argument was found for num_items
   int unsigned  cli_num_items         ; ///< Parsed integer value from the CLI for num_items
   /// @}

   /// @name Objects
   /// @{
   rand uvma_clk_cfg_c    clk_i_agent_cfg  ; ///< Input clock agent configuration.
   rand uvma_reset_cfg_c  reset_agent_cfg; ///< Reset Agent configuration.
   /// @}


   `uvm_object_utils_begin(uvmt_tcounter_b_test_cfg_c)
      `uvm_field_int (                      clk_i_frequency, UVM_DEFAULT + UVM_DEC)
      `uvm_field_enum(uvmx_reset_type_enum, reset_type   , UVM_DEFAULT          )
      `uvm_field_int (startup_timeout         , UVM_DEFAULT + UVM_DEC)
      `uvm_field_int (heartbeat_period        , UVM_DEFAULT + UVM_DEC)
      `uvm_field_int (heartbeat_refresh_period, UVM_DEFAULT + UVM_DEC)
      `uvm_field_int (simulation_timeout      , UVM_DEFAULT + UVM_DEC)
      `uvm_field_int (cli_num_items_override  , UVM_DEFAULT          )
      `uvm_field_int (cli_num_items           , UVM_DEFAULT + UVM_DEC)
      `uvm_field_object(clk_i_agent_cfg, UVM_DEFAULT)
      `uvm_field_object(reset_agent_cfg, UVM_DEFAULT)
   `uvm_object_utils_end


   /**
    * Sets safe defaults for all simulation timing parameters.
    */
   constraint defaults_cons {
      clk_i_frequency == uvmt_tcounter_b_default_clk_i_frequency;
      startup_timeout          == uvmt_tcounter_b_default_startup_timeout         ;
      heartbeat_period         == uvmt_tcounter_b_default_heartbeat_period        ;
      heartbeat_refresh_period == uvmt_tcounter_b_default_heartbeat_refresh_period;
      simulation_timeout       == uvmt_tcounter_b_default_simulation_timeout      ;
   }

   /**
    * Sets Agents configuration.
    */
   constraint agents_cons {
      clk_i_agent_cfg.enabled     == 1;
      clk_i_agent_cfg.is_active   == UVM_ACTIVE;
      clk_i_agent_cfg.bypass_mode == 0;
      reset_type                  == UVMX_RESET_SYNC;
      reset_agent_cfg.reset_type  == reset_type;
      reset_agent_cfg.polarity    == UVMX_RESET_ACTIVE_LOW;
      reset_agent_cfg.bypass_mode == 0;
      reset_agent_cfg.enabled     == 1;
      reset_agent_cfg.is_active   == UVM_ACTIVE;
   }


   /**
    * Default constructor.
    */
   function new(string name="uvmt_tcounter_b_test_cfg");
      super.new(name);
   endfunction


   /**
    * Creates configuration objects.
    */
   virtual function void create_objects();
      clk_i_agent_cfg = uvma_clk_cfg_c::type_id::create("clk_i_agent_cfg");
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

endclass : uvmt_tcounter_b_test_cfg_c


`endif // __UVMT_TCOUNTER_B_TEST_CFG_SV__