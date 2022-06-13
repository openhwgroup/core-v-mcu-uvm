// Copyright 2022 Datum Technology Corporation
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMT_CVMCU_TEST_CFG_SV__
`define __UVMT_CVMCU_TEST_CFG_SV__


/**
 * Object encapsulating configuration parameters common to most if not all tests extending from uvmt_cvmcu_base_test_c.
 */
class uvmt_cvmcu_test_cfg_c extends uvm_object;

   // Generic knobs
   rand int unsigned  startup_timeout   ; // Specified in nanoseconds (ns)
   rand int unsigned  heartbeat_period  ; // Specified in nanoseconds (ns)
   rand int unsigned  simulation_timeout; // Specified in nanoseconds (ns)

   // Test-specific knobs
   uvm_reg_block  selected_reg_block;

   // Command line arguments
   bit     cli_block_name_override = 0;
   string  cli_block_name_parsed_str;


   `uvm_object_utils_begin(uvmt_cvmcu_test_cfg_c)
      `uvm_field_int(startup_timeout   , UVM_DEFAULT + UVM_DEC)
      `uvm_field_int(heartbeat_period  , UVM_DEFAULT + UVM_DEC)
      `uvm_field_int(simulation_timeout, UVM_DEFAULT + UVM_DEC)

      `uvm_field_object(selected_reg_block, UVM_DEFAULT)
   `uvm_object_utils_end


   constraint timeouts_default_cons {
      startup_timeout    == uvmt_cvmcu_default_startup_timeout   ;
      heartbeat_period   == uvmt_cvmcu_default_heartbeat_period  ;
      simulation_timeout == uvmt_cvmcu_default_simulation_timeout;
   }


   /**
    * Default constructor.
    */
   extern function new(string name="uvmt_cvmcu_test_cfg");

   /**
    * TODO Describe uvmt_cvmcu_test_cfg_c::process_cli_args()
    */
   extern function void process_cli_args();

endclass : uvmt_cvmcu_test_cfg_c


function uvmt_cvmcu_test_cfg_c::new(string name="uvmt_cvmcu_test_cfg");

   super.new(name);

endfunction : new


function void uvmt_cvmcu_test_cfg_c::process_cli_args();

   if (uvm_cmdline_proc.get_arg_value("BLKNM=", cli_block_name_parsed_str)) begin
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


`endif // __UVMT_CVMCU_TEST_CFG_SV__
