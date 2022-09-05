// Copyright 2022 Datum Technology Corporation
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVME_CVMCU_INTR_ST_PRD_SV__
`define __UVME_CVMCU_INTR_ST_PRD_SV__


/**
 * Component implementing transaction-based prediction for CORE-V MCU Interrupt Self-Testing.
 * Predicts how the passive agent will observe stimulus from the active agent.
 * @ingroup uvma_cvmcu_intr_st_comps
 */
class uvme_cvmcu_intr_st_prd_c extends uvm_component;

   /// @name Objects
   /// @{
   uvme_cvmcu_intr_st_cfg_c    cfg  ; ///< Environment configuration handle
   uvme_cvmcu_intr_st_cntxt_c  cntxt; ///< Environment context handle
   /// @}

   /// @name TLM
   /// @{
   uvm_tlm_analysis_fifo #(uvma_cvmcu_intr_mon_trn_c )  e2e_in_fifo    ; ///< Queue of passive agent monitor transactions
   uvm_tlm_analysis_fifo #(uvma_cvmcu_intr_seq_item_c)  agent_in_fifo  ; ///< Queue of active agent sequence items
   uvm_analysis_export   #(uvma_cvmcu_intr_mon_trn_c )  e2e_in_export  ; ///< Port taking in monitor transactions from passive agent monitor
   uvm_analysis_export   #(uvma_cvmcu_intr_seq_item_c)  agent_in_export; ///< Port taking in sequence items from active agent driver
   uvm_analysis_port     #(uvma_cvmcu_intr_mon_trn_c )  e2e_out_ap     ; ///< Port sending monitor transactions to end-to-end scoreboard
   uvm_analysis_port     #(uvma_cvmcu_intr_seq_item_c)  agent_out_ap   ; ///< Port sending sequence items to agent scoreboard
   /// @}


   `uvm_component_utils_begin(uvme_cvmcu_intr_st_prd_c)
      `uvm_field_object(cfg  , UVM_DEFAULT)
      `uvm_field_object(cntxt, UVM_DEFAULT)
   `uvm_component_utils_end


   /**
    * Default constructor.
    */
   extern function new(string name="uvme_cvmcu_intr_st_prd", uvm_component parent=null);

   /**
    * 1. Ensures #cfg & #cntxt handles are not null
    * 2. Creates TLM objects
    */
   extern virtual function void build_phase(uvm_phase phase);

   /**
    * Connects #in_export to #in_fifo.
    */
   extern virtual function void connect_phase(uvm_phase phase);

   /**
    * Takes in transactions from #in_fifo, processes them and sends them out #out_ap.
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
    * End-to-end Prediction handler.
    */
   extern virtual task predict_e2e();

   /**
    * Agent prediction handler.
    */
   extern virtual task predict_agent();

endclass : uvme_cvmcu_intr_st_prd_c


function uvme_cvmcu_intr_st_prd_c::new(string name="uvme_cvmcu_intr_st_prd", uvm_component parent=null);

   super.new(name, parent);

endfunction : new


function void uvme_cvmcu_intr_st_prd_c::build_phase(uvm_phase phase);

   super.build_phase(phase);
   get_cfg           ();
   get_cntxt         ();
   create_tlm_objects();

endfunction : build_phase


function void uvme_cvmcu_intr_st_prd_c::connect_phase(uvm_phase phase);

   super.connect_phase(phase);
   connect_ports();

endfunction: connect_phase


task uvme_cvmcu_intr_st_prd_c::run_phase(uvm_phase phase);

   super.run_phase(phase);
   fork
      predict_e2e  ();
      predict_agent();
   join_none

endtask: run_phase


function void uvme_cvmcu_intr_st_prd_c::get_cfg();

   void'(uvm_config_db#(uvme_cvmcu_intr_st_cfg_c)::get(this, "", "cfg", cfg));
   if (!cfg) begin
      `uvm_fatal("CVMCU_INTR_ST_PRD", "Configuration handle is null")
   end

endfunction : get_cfg


function void uvme_cvmcu_intr_st_prd_c::get_cntxt();

   void'(uvm_config_db#(uvme_cvmcu_intr_st_cntxt_c)::get(this, "", "cntxt", cntxt));
   if (!cntxt) begin
      `uvm_fatal("CVMCU_INTR_ST_PRD", "Context handle is null")
   end

endfunction : get_cntxt


function void uvme_cvmcu_intr_st_prd_c::create_tlm_objects();

   e2e_in_fifo     = new("e2e_in_fifo"    , this);
   agent_in_fifo   = new("agent_in_fifo"  , this);
   e2e_in_export   = new("e2e_in_export"  , this);
   agent_in_export = new("agent_in_export", this);
   e2e_out_ap      = new("e2e_out_ap"     , this);
   agent_out_ap    = new("agent_out_ap"   , this);

endfunction : create_tlm_objects


function void uvme_cvmcu_intr_st_prd_c::connect_ports();

   e2e_in_export  .connect(e2e_in_fifo  .analysis_export);
   agent_in_export.connect(agent_in_fifo.analysis_export);

endfunction : connect_ports


task uvme_cvmcu_intr_st_prd_c::predict_e2e();

   uvma_cvmcu_intr_mon_trn_c  in_trn, out_trn;

   if (cfg.enabled) begin
      forever begin
         // Get next transaction and copy it
         e2e_in_fifo.get(in_trn);
         out_trn = uvma_cvmcu_intr_mon_trn_c::type_id::create("out_trn");
         out_trn.copy(in_trn);
         // Can't expect passive agent to see transactions while in reset
         if (cntxt.passive_agent_cntxt.reset_state != UVML_RESET_STATE_POST_RESET) begin
            out_trn.set_may_drop(1);
         end
         // Send transaction to analysis port
         e2e_out_ap.write(out_trn);
      end
   end

endtask: predict_e2e


task uvme_cvmcu_intr_st_prd_c::predict_agent();

   uvma_cvmcu_intr_seq_item_c  in_trn ;
   uvma_cvmcu_intr_mon_trn_c   out_trn;

   if (cfg.enabled) begin
      forever begin
         // Get next transaction and copy it
         agent_in_fifo.get(in_trn);
         out_trn = uvma_cvmcu_intr_mon_trn_c::type_id::create("out_trn");

         // TODO Convert cvmcu_intr Agent Sequence Item into Monitor Transaction
         //      Ex: out_trn.data = in_trn.data;

         // Can't expect passive agent to see transactions while in reset
         if (cntxt.passive_agent_cntxt.reset_state != UVML_RESET_STATE_POST_RESET) begin
            out_trn.set_may_drop(1);
         end
         // Send transaction to analysis port
         agent_out_ap.write(out_trn);
      end
   end

endtask: predict_agent


`endif // __UVME_CVMCU_INTR_ST_PRD_SV__
