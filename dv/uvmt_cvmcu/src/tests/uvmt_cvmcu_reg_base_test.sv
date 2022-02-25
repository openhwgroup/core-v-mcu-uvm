// Copyright 2022 Datum Technology Corporation
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
// Licensed under the Solderpad Hardware License v 2.1 (the "License"); you may not use this file except in compliance
// with the License, or, at your option, the Apache License version 2.0.  You may obtain a copy of the License at
//                                        https://solderpad.org/licenses/SHL-2.1/
// Unless required by applicable law or agreed to in writing, any work distributed under the License is distributed on
// an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.  See the License for the
// specific language governing permissions and limitations under the License.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMT_CVMCU_REG_BASE_TEST_SV__
`define __UVMT_CVMCU_REG_BASE_TEST_SV__


/**
 * Test from which all other CORE-V MCU register-oriented tests must extend.
 */
class uvmt_cvmcu_reg_base_test_c extends uvmt_cvmcu_base_test_c;
   
   uvm_reg_block  selected_block;
   
   
   `uvm_component_utils_begin(uvmt_cvmcu_reg_base_test_c)
      `uvm_field_object(selected_block, UVM_DEFAULT)
   `uvm_component_utils_end
   
   
   /**
    * Default constructor.
    */
   extern function new(string name="uvmt_cvmcu_reg_base_test", uvm_component parent=null);
   
   /**
    * Sets target register block from CLI argument.
    */
   extern virtual function void connect_phase(uvm_phase phase);
   
endclass : uvmt_cvmcu_reg_base_test_c


function uvmt_cvmcu_reg_base_test_c::new(string name="uvmt_cvmcu_reg_base_test", uvm_component parent=null);
   
   super.new(name, parent);
   
endfunction : new


function void uvmt_cvmcu_reg_base_test_c::connect_phase(uvm_phase phase);
  
   super.connect_phase(phase);
   
   if (test_cfg.cli_block_name_override) begin
      test_cfg.selected_reg_block = reg_block.get_block_by_name(test_cfg.cli_block_name_parsed_str);
   end
   
endfunction : connect_phase


`endif // __UVMT_CVMCU_REG_BASE_TEST_SV__
