// Copyright 2022 Datum Technology Corporation
// Copyright 2022 Low Power Futures
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMT_APB_TIMER_TEST_CFG_SV__
`define __UVMT_APB_TIMER_TEST_CFG_SV__


/**
 * Object encapsulating common configuration parameters for CORE-V MCU APB Timer Sub-System tests.
 * @ingroup uvmt_apb_timer_tests
 */
class uvmt_apb_timer_test_cfg_c extends uvml_test_cfg_c;

   /// @defparam Generic knobs
   /// @{
   rand int unsigned  startup_timeout   ; ///< Timer ending test if no heartbeat is detected from start of simulation (ns)
   rand int unsigned  heartbeat_period  ; ///< Timer ending phase if no heartbeat is detected from start of a phase (ns)
   rand int unsigned  simulation_timeout; ///< Timer ending simulation (ns)
   /// @}

   /// @defparam Register tests knobs
   /// @{
   rand bit       auto_ral_update   ; ///< Gates updating the DUT with the contents of the RAL during configure_phase()
   uvm_reg_block  selected_reg_block; ///< Register block to be tested.
   /// @}

   /// @name Command line arguments
   /// @{
   bit     cli_block_name_override = 0; ///< Set to '1' if argument was found for #selected_reg_block
   string  cli_block_name_parsed_str  ; ///< Parsed string value from the CLI for #selected_reg_block
   /// @}


   `uvm_object_utils_begin(uvmt_apb_timer_test_cfg_c)
      `uvm_field_int(startup_timeout   , UVM_DEFAULT + UVM_DEC)
      `uvm_field_int(heartbeat_period  , UVM_DEFAULT + UVM_DEC)
      `uvm_field_int(simulation_timeout, UVM_DEFAULT + UVM_DEC)

      `uvm_field_object(selected_reg_block, UVM_DEFAULT)

      `uvm_field_int   (cli_block_name_override  , UVM_DEFAULT)
      `uvm_field_string(cli_block_name_parsed_str, UVM_DEFAULT)
   `uvm_object_utils_end


   /**
    * Sets safe defaults for all simulation timing parameters.
    */
   constraint timeouts_default_cons {
      startup_timeout    == uvmt_apb_timer_default_startup_timeout   ;
      heartbeat_period   == uvmt_apb_timer_default_heartbeat_period  ;
      simulation_timeout == uvmt_apb_timer_default_simulation_timeout;
   }

   /**
    * Configuration for the register model.
    */
   constraint ral_defaults_cons {
      soft auto_ral_update == 1;
   }

   /**
    * Default constructor.
    */
   extern function new(string name="uvmt_apb_timer_test_cfg");

   /**
    * Processes command line interface arguments.
    */
   extern function void process_cli_args();

endclass : uvmt_apb_timer_test_cfg_c


function uvmt_apb_timer_test_cfg_c::new(string name="uvmt_apb_timer_test_cfg");

   super.new(name);

endfunction : new


function void uvmt_apb_timer_test_cfg_c::process_cli_args();

   if (uvm_cmdline_proc.get_arg_value("BLKNM=%s", cli_block_name_parsed_str)) begin
      if (cli_block_name_parsed_str != "") begin
         cli_block_name_override = 1;
      end
      else begin
         cli_block_name_override = 0;
      end
   end
   else begin
      cli_block_name_override = 0;
   end

endfunction : process_cli_args


`endif // __UVMT_APB_TIMER_TEST_CFG_SV__
