// Copyright 2022 Datum Technology Corporation
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVME_CVMCU_COV_MODEL_SV__
`define __UVME_CVMCU_COV_MODEL_SV__


/**
 * Component encapsulating CORE-V MCU environment's functional coverage model.
 */
class uvme_cvmcu_cov_model_c extends uvm_component;

   // Objects
   uvme_cvmcu_cfg_c    cfg;
   uvme_cvmcu_cntxt_c  cntxt;
   // TODO Add covergoup sampling variable(s)
   //      Ex: uvma_obi_mon_trn_c  obi_trn;

   // Input TLM
   // TODO Add Input TLM to uvme_cvmcu_cov_model_c
   //      Ex: uvm_analysis_port    #(uvma_obi_mon_trn_c)  obi_export;
   //          uvm_tlm_analysis_fifo#(uvma_obi_mon_trn_c)  obi_fifo;


   `uvm_component_utils_begin(uvme_cvmcu_cov_model_c)
      `uvm_field_object(cfg  , UVM_DEFAULT)
      `uvm_field_object(cntxt, UVM_DEFAULT)
   `uvm_component_utils_end


   // TODO Add covergroup(s) to uvme_cvmcu_cov_model_c
   //      Ex: covergroup cvmcu_cfg_cg;
   //             abc_cpt : coverpoint cfg.abc;
   //             xyz_cpt : coverpoint cfg.xyz;
   //          endgroup : cvmcu_cfg_cg
   //
   //          covergroup cvmcu_cntxt_cg;
   //             abc_cpt : coverpoint cntxt.abc;
   //             xyz_cpt : coverpoint cntxt.xyz;
   //          endgroup : cvmcu_cntxt_cg
   //
   //          covergroup obi_trn_cg;
   //             address : coverpoint obi_trn.address {
   //                bins low   = {32'h0000_0000, 32'h4FFF_FFFF};
   //                bins med   = {32'h5000_0000, 32'h9FFF_FFFF};
   //                bins high  = {32'hA000_0000, 32'hFFFF_FFFF};
   //             }
   //          endgroup : obi_trn_cg


   /**
    * Default constructor.
    */
   extern function new(string name="uvme_cvmcu_cov_model", uvm_component parent=null);

   /**
    * Ensures cfg & cntxt handles are not null.
    */
   extern virtual function void build_phase(uvm_phase phase);

   /**
    * Describe uvme_cvmcu_cov_model_c::run_phase()
    */
   extern virtual task run_phase(uvm_phase phase);

   /**
    * TODO Describe uvme_cvmcu_cov_model_c::sample_cfg()
    */
   extern function void sample_cfg();

   /**
    * TODO Describe uvme_cvmcu_cov_model_c::sample_cntxt()
    */
   extern function void sample_cntxt();

   // TODO Add coverage functions to uvme_cvmcu_cov_model_c
   //      Ex: /**
   //           * Samples trn via obi_cg
   //           */
   //          extern function void sample_obi();

endclass : uvme_cvmcu_cov_model_c


function uvme_cvmcu_cov_model_c::new(string name="uvme_cvmcu_cov_model", uvm_component parent=null);

   super.new(name, parent);

   // TODO Create coverage groups for uvme_cvmcu_cov_model_c
   //      Ex: obi_cg = new();

endfunction : new


function void uvme_cvmcu_cov_model_c::build_phase(uvm_phase phase);

   super.build_phase(phase);

   void'(uvm_config_db#(uvme_cvmcu_cfg_c)::get(this, "", "cfg", cfg));
   if (!cfg) begin
      `uvm_fatal("CFG", "Configuration handle is null")
   end

   void'(uvm_config_db#(uvme_cvmcu_cntxt_c)::get(this, "", "cntxt", cntxt));
   if (!cntxt) begin
      `uvm_fatal("CNTXT", "Context handle is null")
   end

   // TODO Build Input TLM
   //      Ex: obi_export = new("obi_export", this);
   //          obi_fifo   = new("obi_fifo"  , this);

endfunction : build_phase


task uvme_cvmcu_cov_model_c::run_phase(uvm_phase phase);

   super.run_phase(phase);

   fork
      // Configuration
      forever begin
         cntxt.sample_cfg_e.wait_trigger();
         sample_cfg();
      end

      // Context
      forever begin
         cntxt.sample_cntxt_e.wait_trigger();
         sample_cntxt();
      end

      // TODO Implement uvme_cvmcu_cov_model_c::run_phase()
      //      Ex: forever begin
      //             obi_fifo.get(obi_trn);
      //             sample_obi();
      //          end
   join_none

endtask : run_phase


function void uvme_cvmcu_cov_model_c::sample_cfg();

   // TODO Implement uvme_cvmcu_cov_model_c::sample_cfg();
   //      Ex: cvmcu_cfg_cg.sample();

endfunction : sample_cfg


function void uvme_cvmcu_cov_model_c::sample_cntxt();

   // TODO Implement uvme_cvmcu_cov_model_c::sample_cntxt();
   //      Ex: cvmcu_cntxt_cg.sample();

endfunction : sample_cntxt


// TODO Implement coverage function(s) to uvme_cvmcu_cov_model_c
//      Ex: function void uvme_cvmcu_cov_model_c::sample_obi();
//
//             obi_trn_cg.sample();
//
//          endfunction : sample_obi


`endif // __UVME_CVMCU_COV_MODEL_SV__
