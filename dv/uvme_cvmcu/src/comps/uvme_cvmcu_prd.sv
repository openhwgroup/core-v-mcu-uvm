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


`ifndef __UVME_CVMCU_PRD_SV__
`define __UVME_CVMCU_PRD_SV__


/**
 * Component implementing transaction-based software model of CORE-V MCU DUT.
 */
class uvme_cvmcu_prd_c extends uvm_component;
   
   // Objects
   uvme_cvmcu_cfg_c    cfg;
   uvme_cvmcu_cntxt_c  cntxt;
   
   // Input TLM
   uvm_analysis_export  #(uvma_clk_mon_trn_c  )  sys_clk_export   ;
   uvm_tlm_analysis_fifo#(uvma_clk_mon_trn_c  )  sys_clk_fifo     ;
   uvm_analysis_export  #(uvma_reset_mon_trn_c)  sys_reset_export ;
   uvm_tlm_analysis_fifo#(uvma_reset_mon_trn_c)  sys_reset_fifo   ;
   uvm_analysis_export  #(uvma_obi_mon_trn_c  )  obi_master_export;
   uvm_tlm_analysis_fifo#(uvma_obi_mon_trn_c  )  obi_master_fifo  ;
   
   // Output TLM
   // TODO Add TLM outputs to uvme_cvmcu_prd_c
   //      Ex: uvm_analysis_port#(uvma_packet_trn_c)  pkts_out_ap;
   
   
   `uvm_component_utils_begin(uvme_cvmcu_prd_c)
      `uvm_field_object(cfg  , UVM_DEFAULT)
      `uvm_field_object(cntxt, UVM_DEFAULT)
   `uvm_component_utils_end
   
   
   /**
    * Default constructor.
    */
   extern function new(string name="uvme_cvmcu_prd", uvm_component parent=null);
   
   /**
    * TODO Describe uvme_cvmcu_prd_c::build_phase()
    */
   extern virtual function void build_phase(uvm_phase phase);
   
   /**
    * TODO Describe uvme_cvmcu_prd_c::connect_phase()
    */
   extern virtual function void connect_phase(uvm_phase phase);
   
   /**
    * TODO Describe uvme_cvmcu_prd_c::run_phase()
    */
   extern virtual task run_phase(uvm_phase phase);
   
   /**
    * TODO Describe uvme_cvmcu_prd_c::process_sys_clk()
    */
   extern task process_sys_clk();
   
   /**
    * TODO Describe uvme_cvmcu_prd_c::process_sys_reset()
    */
   extern task process_sys_reset();
   
   /**
    * TODO Describe uvme_cvmcu_prd_c::process_obi_master()
    */
   extern task process_obi_master();
   
endclass : uvme_cvmcu_prd_c


function uvme_cvmcu_prd_c::new(string name="uvme_cvmcu_prd", uvm_component parent=null);
   
   super.new(name, parent);
   
endfunction : new


function void uvme_cvmcu_prd_c::build_phase(uvm_phase phase);
   
   super.build_phase(phase);
   
   void'(uvm_config_db#(uvme_cvmcu_cfg_c)::get(this, "", "cfg", cfg));
   if (!cfg) begin
      `uvm_fatal("CFG", "Configuration handle is null")
   end
   
   void'(uvm_config_db#(uvme_cvmcu_cntxt_c)::get(this, "", "cntxt", cntxt));
   if (!cntxt) begin
      `uvm_fatal("CNTXT", "Context handle is null")
   end
   
   // Build Input TLM objects
   sys_clk_export = new("sys_clk_export", this);
   sys_clk_fifo   = new("sys_clk_fifo"  , this);
   sys_reset_export = new("sys_reset_export", this);
   sys_reset_fifo   = new("sys_reset_fifo"  , this);
   obi_master_export = new("obi_master_export", this);
   obi_master_fifo   = new("obi_master_fifo"  , this);
   
   // Build Output TLM objects
   // TODO Create Output TLM objects for uvme_cvmcu_prd_c
   //      Ex: pkts_out_ap = new("pkts_out_ap", this);
   
endfunction : build_phase


function void uvme_cvmcu_prd_c::connect_phase(uvm_phase phase);
   
   super.connect_phase(phase);
   
   // Connect TLM objects
   sys_clk_export   .connect(sys_clk_fifo   .analysis_export);
   sys_reset_export .connect(sys_reset_fifo .analysis_export);
   obi_master_export.connect(obi_master_fifo.analysis_export);
   
endfunction: connect_phase


task uvme_cvmcu_prd_c::run_phase(uvm_phase phase);
   
   super.run_phase(phase);
   
   fork
      process_sys_clk   ();
      process_sys_reset ();
      process_obi_master();
   join_none
   
endtask: run_phase


task uvme_cvmcu_prd_c::process_sys_clk();
   
   uvma_clk_mon_trn_c  sys_clk_trn;
   
   forever begin
      sys_clk_fifo.get(sys_clk_trn);
      
      // TODO Implement uvme_cvmcu_prd_c::process_sys_clk()
   end
   
endtask : process_sys_clk


task uvme_cvmcu_prd_c::process_sys_reset();
   
   uvma_reset_mon_trn_c  sys_reset_trn;
   
   forever begin
      sys_reset_fifo.get(sys_reset_trn);
      
      // TODO Implement uvme_cvmcu_prd_c::process_sys_reset()
   end
   
endtask : process_sys_reset


task uvme_cvmcu_prd_c::process_obi_master();
   
   uvma_obi_mon_trn_c  obi_trn;
   
   forever begin
      obi_master_fifo.get(obi_trn);
      
      // TODO Implement uvme_cvmcu_prd_c::process_obi_master()
   end
   
endtask : process_obi_master


`endif // __UVME_CVMCU_PRD_SV__
