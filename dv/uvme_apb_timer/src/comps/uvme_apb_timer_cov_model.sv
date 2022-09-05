// Copyright 2022 Datum Technology Corporation
// Copyright 2022 Low Power Futures
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVME_APB_TIMER_COV_MODEL_SV__
`define __UVME_APB_TIMER_COV_MODEL_SV__


/**
 * Component encapsulating CORE-V MCU APB Timer Sub-Sytem's functional coverage model.
 * @ingroup uvme_apb_timer_comps
 */
class uvme_apb_timer_cov_model_c extends uvm_component;

   /// @name Objects
   /// @{
   uvme_apb_timer_cfg_c    cfg  ; ///< Environment configuration handle
   uvme_apb_timer_cntxt_c  cntxt; ///< Environment context handle
   // TODO Add covergoup sampling variable(s)
   //      Ex: uvma_pkt_mon_trn_c  pkt_trn; ///< Describe me!
   /// @}

   /// @name TLM
   /// @{
   // TODO Add Input TLM to uvme_apb_timer_cov_model_c
   //      Ex: uvm_tlm_analysis_fifo #(uvma_pkt_mon_trn_c)  pkt_fifo  ; ///< Describe me!
   //          uvm_analysis_port     #(uvma_pkt_mon_trn_c)  pkt_export; ///< Describe me!
   /// @}


   `uvm_component_utils_begin(uvme_apb_timer_cov_model_c)
      `uvm_field_object(cfg  , UVM_DEFAULT)
      `uvm_field_object(cntxt, UVM_DEFAULT)
   `uvm_component_utils_end


   /**
    * Coverage for #cfg
    */
   covergroup apb_timer_cfg_cg;
      // TODO Implement apb_timer_cfg_cg
      //      Ex: abc_cp : coverpoint cfg.abc;
   endgroup : apb_timer_cfg_cg

   /**
    * Coverage for #cntxt
    */
   covergroup apb_timer_cntxt_cg;
      // TODO Implement apb_timer_cntxt_cg
      //      Ex: abc_cp : coverpoint cntxt.abc;
   endgroup : apb_timer_cntxt_cg

   // TODO Add covergroup(s) to uvme_apb_timer_cov_model_c
   //      Ex: covergroup apb_timer_pkt_trn_cg;
   //             address_cp : coverpoint pkt_trn.payload_size {
   //                bins small  = {0   ,   64};
   //                bins medium = {65  , 1024};
   //                bins large  = {1024, 2048};
   //             }
   //          endgroup : apb_timer_pkt_trn_cg


   /**
    * Creates covergroups.
    */
   extern function new(string name="uvme_apb_timer_cov_model", uvm_component parent=null);

   /**
    * 1. Ensures #cfg & #cntxt handles are not null.
    * 2. Creates fifos.
    */
   extern virtual function void build_phase(uvm_phase phase);

   /**
    * Connects exports to fifos.
    */
   extern virtual function void connect_phase(uvm_phase phase);

   /**
    * Forks all sampling loops.
    */
   extern virtual task run_phase(uvm_phase phase);

   /**
    * Uses uvm_config_db to retrieve cfg.
    */
   extern function void get_cfg();

   /**
    * Uses uvm_config_db to retrieve cntxt.
    */
   extern function void get_cntxt();

   /**
    * Creates TLM FIFOs and Analysis Ports.
    */
   extern function void create_tlm_objects();

   /**
    * Connects Exports to FIFOs.
    */
   extern function void connect_ports();

   /**
    * Samples #apb_timer_cfg_cg
    */
   extern function void sample_cfg();

   /**
    * Samples #apb_timer_cntxt_cg
    */
   extern function void sample_cntxt();

   // TODO Add coverage functions to uvme_apb_timer_cov_model_c
   //      Ex: /**
   //           * Samples #apb_timer_pkt_cg
   //           */
   //          extern function void sample_pkt();

endclass : uvme_apb_timer_cov_model_c


function uvme_apb_timer_cov_model_c::new(string name="uvme_apb_timer_cov_model", uvm_component parent=null);

   super.new(name, parent);
   apb_timer_cfg_cg   = new();
   apb_timer_cntxt_cg = new();
   // TODO Create coverage groups for uvme_apb_timer_cov_model_c
   //      Ex: apb_timer_pkt_cg = new();

endfunction : new


function void uvme_apb_timer_cov_model_c::build_phase(uvm_phase phase);

   super.build_phase(phase);
   get_cfg           ();
   get_cntxt         ();
   create_tlm_objects();

endfunction : build_phase


function void uvme_apb_timer_cov_model_c::connect_phase(uvm_phase phase);

   super.connect_phase(phase);
   connect_ports();

endfunction : connect_phase


task uvme_apb_timer_cov_model_c::run_phase(uvm_phase phase);

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
      // TODO Implement uvme_apb_timer_cov_model_c::run_phase()
      //      Ex: forever begin
      //             pkt_fifo.get(pkt_trn);
      //             sample_pkt();
      //          end
   join_none

endtask : run_phase


function void uvme_apb_timer_cov_model_c::get_cfg();

   void'(uvm_config_db#(uvme_apb_timer_cfg_c)::get(this, "", "cfg", cfg));
   if (!cfg) begin
      `uvm_fatal("APB_TIMER_COV_MODEL", "Configuration handle is null")
   end

endfunction : get_cfg


function void uvme_apb_timer_cov_model_c::get_cntxt();

   void'(uvm_config_db#(uvme_apb_timer_cntxt_c)::get(this, "", "cntxt", cntxt));
   if (!cntxt) begin
      `uvm_fatal("APB_TIMER_COV_MODEL", "Context handle is null")
   end

endfunction : get_cntxt


function void uvme_apb_timer_cov_model_c::create_tlm_objects();

   // TODO Build Input TLM
   //      Ex: pkt_fifo = new("pkt_fifo", this);

endfunction : create_tlm_objects


function void uvme_apb_timer_cov_model_c::connect_ports();

   // TODO Connect Input TLM
   //      Ex: pkt_export = pkt_trn_fifo.analysis_export;

endfunction : connect_ports


function void uvme_apb_timer_cov_model_c::sample_cfg();

   apb_timer_cfg_cg.sample();

endfunction : sample_cfg


function void uvme_apb_timer_cov_model_c::sample_cntxt();

   apb_timer_cntxt_cg.sample();

endfunction : sample_cntxt


// TODO Implement coverage function(s) to uvme_apb_timer_cov_model_c
//      Ex: function void uvme_apb_timer_cov_model_c::sample_pkt();
//
//             apb_timer_pkt_trn_cg.sample();
//
//          endfunction : sample_pkt


`endif // __UVME_APB_TIMER_COV_MODEL_SV__
