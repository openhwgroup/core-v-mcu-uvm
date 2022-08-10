// Copyright 2022 Datum Technology Corporation
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMT_UDMA_TX_TEST_CFG_SV__
`define __UVMT_UDMA_TX_TEST_CFG_SV__


/**
 * Object encapsulating common configuration parameters for uDMA Tx Channels UVM Agent Self-Tests.
 * @ingroup uvmt_udma_tx_tests
 */
class uvmt_udma_tx_test_cfg_c extends uvml_test_cfg_c;

   /// @defparam Knobs
   /// @{
   rand int unsigned  startup_timeout   ; ///< Timer ending test if no heartbeat is detected from start of simulation (ns)
   rand int unsigned  heartbeat_period  ; ///< Timer ending phase if no heartbeat is detected from start of a phase (ns)
   rand int unsigned  simulation_timeout; ///< Timer ending simulation (ns)
   /// @}

   /// @defgroup Command line arguments
   /// @{
   bit           cli_num_items_override = 0; ///< Set to '1' if argument was found for num_items
   int unsigned  cli_num_items_parsed      ; ///< Parsed integer value from the CLI for num_items
   /// @}


   `uvm_object_utils_begin(uvmt_udma_tx_test_cfg_c)
      `uvm_field_int(startup_timeout   , UVM_DEFAULT + UVM_DEC)
      `uvm_field_int(heartbeat_period  , UVM_DEFAULT + UVM_DEC)
      `uvm_field_int(simulation_timeout, UVM_DEFAULT + UVM_DEC)

      `uvm_field_int(cli_num_items_override, UVM_DEFAULT)
      `uvm_field_int(cli_num_items_parsed  , UVM_DEFAULT + UVM_DEC)
   `uvm_object_utils_end


   /**
    * Sets safe defaults for all simulation timing parameters.
    */
   constraint defaults_cons {
      startup_timeout    == uvmt_udma_tx_default_startup_timeout   ;
      heartbeat_period   == uvmt_udma_tx_default_heartbeat_period  ;
      simulation_timeout == uvmt_udma_tx_default_simulation_timeout;
   }


   /**
    * Default constructor.
    */
   extern function new(string name="uvmt_udma_tx_test_cfg");

   /**
    * Processes command line interface arguments.
    */
   extern function void process_cli_args();

endclass : uvmt_udma_tx_test_cfg_c


function uvmt_udma_tx_test_cfg_c::new(string name="uvmt_udma_tx_test_cfg");

   super.new(name);

endfunction : new


function void uvmt_udma_tx_test_cfg_c::process_cli_args();

   string  cli_num_items_parsed_str  = "";
   if ($value$plusargs("NUM_ITEMS=", cli_num_items_parsed_str)) begin
      if (cli_num_items_parsed_str != "") begin
         cli_num_items_override = 1;
         cli_num_items_parsed = cli_num_items_parsed_str.atoi();
      end
      else begin
         cli_num_items_override = 0;
      end
   end
   else begin
      cli_num_items_override = 0;
   end

endfunction : process_cli_args


`endif // __UVMT_UDMA_TX_TEST_CFG_SV__
