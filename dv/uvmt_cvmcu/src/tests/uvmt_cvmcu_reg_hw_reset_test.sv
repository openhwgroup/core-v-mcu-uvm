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


`ifndef __UVMT_CVMCU_REG_HW_RESET_TEST_SV__
`define __UVMT_CVMCU_REG_HW_RESET_TEST_SV__


/**
 * Checks that the reset value specified for registers in the RAL matches what is in the DUT.
 */
class uvmt_cvmcu_reg_hw_reset_test_c extends uvmt_cvmcu_reg_base_test_c;
   
   // Sequences
   rand uvme_cvmcu_reg_hw_reset_vseq_c  hw_reset_vseq;
   
   
   `uvm_component_utils(uvmt_cvmcu_reg_hw_reset_test_c)
   
   
   constraint defaults_cons {
      soft hw_reset_vseq.single_block_mode == 1;
   }
   
   
   /**
    * Creates hw_reset_vseq.
    */
   extern function new(string name="uvmt_cvmcu_reg_hw_reset_test", uvm_component parent=null);
   
   /**
    * Runs hw_reset_vseq on vsequencer.
    */
   extern virtual task configure_phase(uvm_phase phase);
   
endclass : uvmt_cvmcu_reg_hw_reset_test_c


function uvmt_cvmcu_reg_hw_reset_test_c::new(string name="uvmt_cvmcu_reg_hw_reset_test", uvm_component parent=null);
   
   super.new(name, parent);
   hw_reset_vseq = uvme_cvmcu_reg_hw_reset_vseq_c::type_id::create("hw_reset_vseq");
   
endfunction : new


task uvmt_cvmcu_reg_hw_reset_test_c::configure_phase(uvm_phase phase);
   
   super.configure_phase(phase);
   
   `uvm_info("TEST", $sformatf("Starting hw_reset virtual sequence:\n%s", hw_reset_vseq.sprint()), UVM_NONE)
   hw_reset_vseq.single_block = test_cfg.selected_reg_block;
   hw_reset_vseq.start(vsequencer);
   `uvm_info("TEST", "Finished hw_reset virtual sequence", UVM_NONE)
   
endtask : configure_phase


`endif // __UVMT_CVMCU_REG_HW_RESET_TEST_SV__
