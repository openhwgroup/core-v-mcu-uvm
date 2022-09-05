// Copyright 2022 Datum Technology Corporation
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMA_CVMCU_INTR_COV_MODEL_SV__
`define __UVMA_CVMCU_INTR_COV_MODEL_SV__


/**
 * Component encapsulating abstract CORE-V MCU Interrupt functional coverage model.
 * Sub-classes must extend this class, add covergroups of their own and override the sample_x() functions.
 * @ingroup uvma_cvmcu_intr_comps
 */
class uvma_cvmcu_intr_cov_model_c extends uvm_component;

   /// @name Objects
   /// @{
   uvma_cvmcu_intr_cfg_c       cfg     ; ///< Agent configuration handle
   uvma_cvmcu_intr_cntxt_c     cntxt   ; ///< Agent context handle
   uvma_cvmcu_intr_seq_item_c  seq_item; ///< Sequence item currently being sampled
   uvma_cvmcu_intr_mon_trn_c   mon_trn ; ///< Monitored transaction being sampled
   /// @}

   /// @name TLM
   /// @{
   uvm_tlm_analysis_fifo #(uvma_cvmcu_intr_seq_item_c)  seq_item_fifo  ; ///< Queue of sequence items waiting to be sampled.
   uvm_tlm_analysis_fifo #(uvma_cvmcu_intr_mon_trn_c )  mon_trn_fifo   ; ///< Queue of monitored transactions waiting to be sampled.
   uvm_analysis_export   #(uvma_cvmcu_intr_seq_item_c)  seq_item_export; ///< Port receiving sequence items.
   uvm_analysis_export   #(uvma_cvmcu_intr_mon_trn_c )  mon_trn_export ; ///< Port receiving monitored transactions.
   /// @}


   `uvm_component_utils_begin(uvma_cvmcu_intr_cov_model_c)
      `uvm_field_object(cfg  , UVM_DEFAULT)
      `uvm_field_object(cntxt, UVM_DEFAULT)
   `uvm_component_utils_end


   /**
    * Default constructor.
    */
   extern function new(string name="uvma_cvmcu_intr_cov_model", uvm_component parent=null);

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
    * Forks all sampling loops
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
    * Pure virtual function
    */
   extern virtual function void sample_cfg();

   /**
    * Pure virtual function
    */
   extern virtual function void sample_cntxt();

   /**
    * Pure virtual function
    */
   extern virtual function void sample_seq_item();

   /**
    * Pure virtual function
    */
   extern virtual function void sample_mon_trn();

endclass : uvma_cvmcu_intr_cov_model_c


function uvma_cvmcu_intr_cov_model_c::new(string name="uvma_cvmcu_intr_cov_model", uvm_component parent=null);

   super.new(name, parent);

endfunction : new


function void uvma_cvmcu_intr_cov_model_c::build_phase(uvm_phase phase);

   super.build_phase(phase);
   get_cfg           ();
   get_cntxt         ();
   create_tlm_objects();

endfunction : build_phase


function void uvma_cvmcu_intr_cov_model_c::connect_phase(uvm_phase phase);

   super.connect_phase(phase);
   connect_ports();

endfunction : connect_phase


task uvma_cvmcu_intr_cov_model_c::run_phase(uvm_phase phase);

   super.run_phase(phase);
   if (cfg.enabled && cfg.cov_model_enabled) begin
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
         // Sequence items
         forever begin
            seq_item_fifo.get(seq_item);
            sample_seq_item();
         end
         // Monitor transactions
         forever begin
            mon_trn_fifo.get(mon_trn);
            sample_mon_trn();
         end
      join_none
   end

endtask : run_phase


function void uvma_cvmcu_intr_cov_model_c::get_cfg();

   void'(uvm_config_db#(uvma_cvmcu_intr_cfg_c)::get(this, "", "cfg", cfg));
   if (!cfg) begin
      `uvm_fatal("CVMCU_INTR_COV_MODEL", "Configuration handle is null")
   end

endfunction : get_cfg


function void uvma_cvmcu_intr_cov_model_c::get_cntxt();

   void'(uvm_config_db#(uvma_cvmcu_intr_cntxt_c)::get(this, "", "cntxt", cntxt));
   if (!cntxt) begin
      `uvm_fatal("CVMCU_INTR_COV_MODEL", "Context handle is null")
   end

endfunction : get_cntxt


function void uvma_cvmcu_intr_cov_model_c::create_tlm_objects();

   seq_item_fifo = new("seq_item_fifo", this);
   mon_trn_fifo  = new("mon_trn_fifo" , this);

endfunction : create_tlm_objects


function void uvma_cvmcu_intr_cov_model_c::connect_ports();

   seq_item_export = seq_item_fifo.analysis_export;
   mon_trn_export  = mon_trn_fifo .analysis_export;

endfunction : connect_ports


function void uvma_cvmcu_intr_cov_model_c::sample_cfg();
   // Implementation left to sub-classes
endfunction : sample_cfg


function void uvma_cvmcu_intr_cov_model_c::sample_cntxt();
   // Implementation left to sub-classes
endfunction : sample_cntxt


function void uvma_cvmcu_intr_cov_model_c::sample_seq_item();
   // Implementation left to sub-classes
endfunction : sample_seq_item


function void uvma_cvmcu_intr_cov_model_c::sample_mon_trn();
   // Implementation left to sub-classes
endfunction : sample_mon_trn


`endif // __UVMA_CVMCU_INTR_COV_MODEL_SV__
