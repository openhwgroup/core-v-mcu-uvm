// Copyright 2022 Datum Technology Corporation
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVME_UDMA_CTRL_COV_MODEL_SV__
`define __UVME_UDMA_CTRL_COV_MODEL_SV__


/**
 * Component encapsulating uDMA Controller Sub-Sytem's functional coverage model.
 * @ingroup uvme_udma_ctrl_comps
 */
class uvme_udma_ctrl_cov_model_c extends uvm_component;

   /// @name Objects
   /// @{
   uvme_udma_ctrl_cfg_c             cfg       ; ///< Environment configuration handle
   uvme_udma_ctrl_cntxt_c           cntxt     ; ///< Environment context handle
   uvma_udma_ctrl_cp_mon_trn_c      cp_trn    ; ///< Control plane transaction being sampled
   uvma_udma_ctrl_dp_in_mon_trn_c   dp_in_trn ; ///< Data plane input transaction being sampled
   uvma_udma_ctrl_dp_out_mon_trn_c  dp_out_trn; ///< Data plane output transaction being sampled
   /// @}

   /// @name TLM
   /// @{
   uvm_tlm_analysis_fifo #(uvma_udma_ctrl_cp_mon_trn_c    )  cp_fifo      ; ///< Queue of control plane transactions
   uvm_tlm_analysis_fifo #(uvma_udma_ctrl_dp_in_mon_trn_c )  dp_in_fifo   ; ///< Queue of data plane input transactions
   uvm_tlm_analysis_fifo #(uvma_udma_ctrl_dp_out_mon_trn_c)  dp_out_fifo  ; ///< Queue of data plane outut transactions
   uvm_analysis_port     #(uvma_udma_ctrl_cp_mon_trn_c    )  cp_export    ; ///< Port taking in control plane transactions
   uvm_analysis_port     #(uvma_udma_ctrl_dp_in_mon_trn_c )  dp_in_export ; ///< Port taking in control plane transactions
   uvm_analysis_port     #(uvma_udma_ctrl_dp_out_mon_trn_c)  dp_out_export; ///< Port taking in control plane transactions
   /// @}


   `uvm_component_utils_begin(uvme_udma_ctrl_cov_model_c)
      `uvm_field_object(cfg  , UVM_DEFAULT)
      `uvm_field_object(cntxt, UVM_DEFAULT)
   `uvm_component_utils_end


   /**
    * Coverage for #cfg
    */
   covergroup udma_ctrl_cfg_cg;
      // TODO Implement udma_ctrl_cfg_cg
      //      Ex: abc_cp : coverpoint cfg.abc;
   endgroup : udma_ctrl_cfg_cg

   /**
    * Coverage for #cntxt
    */
   covergroup udma_ctrl_cntxt_cg;
      // TODO Implement udma_ctrl_cntxt_cg
      //      Ex: abc_cp : coverpoint cntxt.abc;
   endgroup : udma_ctrl_cntxt_cg

   /**
    * Coverage for control plane transactions
    */
   covergroup udma_ctrl_cp_trn_cg;
      // TODO Implement udma_ctrl_cp_trn_cg
      //      Ex: abc_cp : coverpoint cp_trn.abc;
   endgroup : udma_ctrl_cp_trn_cg

   /**
    * Coverage for data plane input transactions
    */
   covergroup udma_ctrl_dp_in_trn_cg;
      // TODO Implement udma_ctrl_dp_in_trn_cg
      //      Ex: abc_cp : coverpoint dp_in_trn.abc;
   endgroup : udma_ctrl_dp_in_trn_cg

   /**
    * Coverage for data plane output transactions
    */
   covergroup udma_ctrl_dp_out_trn_cg;
      // TODO Implement udma_ctrl_dp_out_trn_cg
      //      Ex: abc_cp : coverpoint dp_out_trn.abc;
   endgroup : udma_ctrl_dp_out_trn_cg


   /**
    * Creates covergroups.
    */
   extern function new(string name="uvme_udma_ctrl_cov_model", uvm_component parent=null);

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
    * Samples #udma_ctrl_cfg_cg
    */
   extern function void sample_cfg();

   /**
    * Samples #udma_ctrl_cntxt_cg
    */
   extern function void sample_cntxt();

   /**
    * Samples #udma_ctrl_cp_trn_cg
    */
   extern function void sample_cp_trn();

   /**
    * Samples #udma_ctrl_dp_in_trn_cg
    */
   extern function void sample_dp_in_trn();

   /**
    * Samples #udma_ctrl_dp_out_trn_cg
    */
   extern function void sample_dp_out_trn();

endclass : uvme_udma_ctrl_cov_model_c


function uvme_udma_ctrl_cov_model_c::new(string name="uvme_udma_ctrl_cov_model", uvm_component parent=null);

   super.new(name, parent);
   udma_ctrl_cfg_cg        = new();
   udma_ctrl_cntxt_cg      = new();
   udma_ctrl_cp_trn_cg     = new();
   udma_ctrl_dp_in_trn_cg  = new();
   udma_ctrl_dp_out_trn_cg = new();

endfunction : new


function void uvme_udma_ctrl_cov_model_c::build_phase(uvm_phase phase);

   super.build_phase(phase);
   get_cfg           ();
   get_cntxt         ();
   create_tlm_objects();

endfunction : build_phase


function void uvme_udma_ctrl_cov_model_c::connect_phase(uvm_phase phase);

   super.connect_phase(phase);
   connect_ports();

endfunction : connect_phase


task uvme_udma_ctrl_cov_model_c::run_phase(uvm_phase phase);

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
      // Control plane
      forever begin
         cp_fifo.get(cp_trn);
         sample_cp_trn();
      end
      // Data plane input
      forever begin
         dp_in_fifo.get(dp_in_trn);
         sample_dp_in_trn();
      end
      // Data plane output
      forever begin
         dp_out_fifo.get(dp_out_trn);
         sample_dp_out_trn();
      end
   join_none

endtask : run_phase


function void uvme_udma_ctrl_cov_model_c::get_cfg();

   void'(uvm_config_db#(uvme_udma_ctrl_cfg_c)::get(this, "", "cfg", cfg));
   if (!cfg) begin
      `uvm_fatal("UDMA_CTRL_COV_MODEL", "Configuration handle is null")
   end

endfunction : get_cfg


function void uvme_udma_ctrl_cov_model_c::get_cntxt();

   void'(uvm_config_db#(uvme_udma_ctrl_cntxt_c)::get(this, "", "cntxt", cntxt));
   if (!cntxt) begin
      `uvm_fatal("UDMA_CTRL_COV_MODEL", "Context handle is null")
   end

endfunction : get_cntxt


function void uvme_udma_ctrl_cov_model_c::create_tlm_objects();

   cp_fifo     = new("cp_fifo"    , this);
   dp_in_fifo  = new("dp_in_fifo" , this);
   dp_out_fifo = new("dp_out_fifo", this);

endfunction : create_tlm_objects


function void uvme_udma_ctrl_cov_model_c::connect_ports();

   cp_export     = cp_fifo    .analysis_export;
   dp_in_export  = dp_in_fifo .analysis_export;
   dp_out_export = dp_out_fifo.analysis_export;

endfunction : connect_ports


function void uvme_udma_ctrl_cov_model_c::sample_cfg();

   udma_ctrl_cfg_cg.sample();

endfunction : sample_cfg


function void uvme_udma_ctrl_cov_model_c::sample_cntxt();

   udma_ctrl_cntxt_cg.sample();

endfunction : sample_cntxt


function void uvme_udma_ctrl_cov_model_c::sample_cp_trn();

   udma_ctrl_cp_trn_cg.sample();

endfunction : sample_cp_trn


function void uvme_udma_ctrl_cov_model_c::sample_dp_in_trn();

   udma_ctrl_dp_in_trn_cg.sample();

endfunction : sample_dp_in_trn


function void uvme_udma_ctrl_cov_model_c::sample_dp_out_trn();

   udma_ctrl_dp_out_trn_cg.sample();

endfunction : sample_dp_out_trn


`endif // __UVME_UDMA_CTRL_COV_MODEL_SV__
