// Copyright 2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMT_TCOUNTER_B_TEST_CFG_SV__
`define __UVMT_TCOUNTER_B_TEST_CFG_SV__


/**
 * Object encapsulating common configuration parameters for Timer unit counter Block Tests.
 * @ingroup uvmt_tcounter_b_tests
 */
class uvmt_tcounter_b_test_cfg_c extends uvmx_block_test_cfg_c;

   /// @name Knobs
   /// @{
   rand int unsigned  num_items; ///< Number of sequence items to be generated.
   rand int unsigned  min_gap; ///< Minimum number of cycles between items.
   rand int unsigned  max_gap; ///< Maximum number of cycles between items.
   rand int unsigned  num_errors; ///< Number of errored sequence items to be generated.
   rand int unsigned  clk_i_frequency; ///< Input clock frequency (Hz).
   /// @}

   /// @name Command Line Interface arguments
   /// @{
   bit  cli_num_items_override; ///< Set to '1' if argument was found for 'NITEMS'
   int unsigned  cli_num_items; ///< Parsed CLI value for 'NITEMS'
   bit  cli_min_gap_override; ///< Set to '1' if argument was found for 'MING'
   int unsigned  cli_min_gap; ///< Parsed CLI value for 'MING'
   bit  cli_max_gap_override; ///< Set to '1' if argument was found for 'MAXG'
   int unsigned  cli_max_gap; ///< Parsed CLI value for 'MAXG'
   bit  cli_num_errors_override; ///< Set to '1' if argument was found for 'NERRORS'
   int unsigned  cli_num_errors; ///< Parsed CLI value for 'NERRORS'
   /// @}

   /// @name Agents
   /// @{
   rand uvma_clk_cfg_c  clk_i_agent_cfg  ; ///< Input clock agent configuration.
   rand uvma_reset_cfg_c  reset_agent_cfg; ///< Reset Agent configuration.
   /// @}


   `uvm_object_utils_begin(uvmt_tcounter_b_test_cfg_c)
      `uvm_field_int(num_items, UVM_DEFAULT + UVM_DEC)
      `uvm_field_int(min_gap, UVM_DEFAULT + UVM_DEC)
      `uvm_field_int(max_gap, UVM_DEFAULT + UVM_DEC)
      `uvm_field_int(num_errors, UVM_DEFAULT + UVM_DEC)
      `uvm_field_int(clk_i_frequency, UVM_DEFAULT + UVM_DEC)
      `uvm_field_int(cli_num_items_override, UVM_DEFAULT)
      `uvm_field_int(cli_num_items, UVM_DEFAULT)
      `uvm_field_int(cli_min_gap_override, UVM_DEFAULT)
      `uvm_field_int(cli_min_gap, UVM_DEFAULT)
      `uvm_field_int(cli_max_gap_override, UVM_DEFAULT)
      `uvm_field_int(cli_max_gap, UVM_DEFAULT)
      `uvm_field_int(cli_num_errors_override, UVM_DEFAULT)
      `uvm_field_int(cli_num_errors, UVM_DEFAULT)
      `uvm_field_enum(uvmx_reset_type_enum, reset_type, UVM_DEFAULT)
      `uvm_field_int(startup_timeout, UVM_DEFAULT + UVM_DEC)
      `uvm_field_int(heartbeat_period, UVM_DEFAULT + UVM_DEC)
      `uvm_field_int(heartbeat_refresh_period, UVM_DEFAULT + UVM_DEC)
      `uvm_field_int(simulation_timeout, UVM_DEFAULT + UVM_DEC)
      `uvm_field_object(clk_i_agent_cfg, UVM_DEFAULT)
      `uvm_field_object(reset_agent_cfg, UVM_DEFAULT)
   `uvm_object_utils_end


   /**
    * Describes randomization space for knobs.
    */
   constraint knobs_cons {
      num_items inside {[1:'d1000]};
      min_gap inside {[0:'d100]};
      max_gap inside {[0:'d100]};
      num_errors inside {[1:'d1000]};
   }


   /**
    * Sets safe defaults parameters.
    */
   constraint defaults_cons {
      clk_i_frequency == uvmt_tcounter_b_default_clk_i_frequency;
      startup_timeout == uvmt_tcounter_b_default_startup_timeout;
      heartbeat_period == uvmt_tcounter_b_default_heartbeat_period;
      heartbeat_refresh_period == uvmt_tcounter_b_default_heartbeat_refresh_period;
      simulation_timeout == uvmt_tcounter_b_default_simulation_timeout;
   }

   /**
    * Sets agents configuration.
    */
   constraint agents_cons {
      clk_i_agent_cfg.enabled == 1;
      clk_i_agent_cfg.is_active == UVM_ACTIVE;
      reset_type == UVMX_RESET_SYNC;
      reset_agent_cfg.reset_type == reset_type;
      reset_agent_cfg.polarity == UVMX_RESET_ACTIVE_LOW;
      reset_agent_cfg.enabled == 1;
      reset_agent_cfg.is_active == UVM_ACTIVE;
   }

   /**
    * Restricts randomization space for knobs.
    */
   constraint rules_cons {
      num_errors inside {['d1:num_items]};
      min_gap    inside {['d0:max_gap  ]};
   }


   /**
    * Default constructor.
    */
   function new(string name="uvmt_tcounter_b_test_cfg");
      super.new(name);
   endfunction

   /**
    * Initializes objects and arrays.
    */
   virtual function void build();
      clk_i_agent_cfg = uvma_clk_cfg_c::type_id::create("clk_i_agent_cfg");
      reset_agent_cfg = uvma_reset_cfg_c::type_id::create("reset_agent_cfg");
   endfunction

   /**
    * Processes Command Line Interface arguments 'NITEMS', 'MING', 'MAXG', 'NERRORS'.
    */
   virtual function void process_cli_args();
      `uvmx_cli_arg_parse("NITEMS", cli_num_items_override)
      if (cli_num_items_override) begin
         `uvmx_cli_int_val(cli_arg_str, cli_num_items)
      end
      `uvmx_cli_arg_parse("MING", cli_min_gap_override)
      if (cli_min_gap_override) begin
         `uvmx_cli_int_val(cli_arg_str, cli_min_gap)
      end
      `uvmx_cli_arg_parse("MAXG", cli_max_gap_override)
      if (cli_max_gap_override) begin
         `uvmx_cli_int_val(cli_arg_str, cli_max_gap)
      end
      `uvmx_cli_arg_parse("NERRORS", cli_num_errors_override)
      if (cli_num_errors_override) begin
         `uvmx_cli_int_val(cli_arg_str, cli_num_errors)
      end
   endfunction

   /**
    * TODO Implement or remove uvmt_tcounter_b_test_cfg_c::post_randomize_work()
    */
   virtual function void post_randomize_work();
   endfunction

endclass


`endif // __UVMT_TCOUNTER_B_TEST_CFG_SV__