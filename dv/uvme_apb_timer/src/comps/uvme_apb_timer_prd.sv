// Copyright 2022 Datum Technology Corporation
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVME_APB_TIMER_PRD_SV__
`define __UVME_APB_TIMER_PRD_SV__


/**
 * Component implementing transaction-based model of APB Timer Sub-System.
 */
class uvme_apb_timer_prd_c extends uvm_component;

   /// @defgroup Objects
   /// @{
   uvme_apb_timer_cfg_c    cfg  ; ///< Environment configuration handle
   uvme_apb_timer_cntxt_c  cntxt; ///< Environment context handle
   /// @}

   /// @defgroup Input TLM
   /// @{
   uvm_tlm_analysis_fifo #(uvma_clk_mon_trn_c)  sys_clk_fifo  ; ///< Queue of sys_clk transactions
   uvm_tlm_analysis_fifo #(uvma_reset_mon_trn_c)  sys_reset_fifo  ; ///< Queue of sys_reset transactions
   uvm_tlm_analysis_fifo #(uvma_apb_mon_trn_c)  apb_fifo  ; ///< Queue of apb transactions
   uvm_analysis_export   #(uvma_clk_mon_trn_c)  sys_clk_export; ///< Port taking in sys_clk transactions
   uvm_analysis_export   #(uvma_reset_mon_trn_c)  sys_reset_export; ///< Port taking in sys_reset transactions
   uvm_analysis_export   #(uvma_apb_mon_trn_c)  apb_export; ///< Port taking in apb transactions
   /// @}

   /// @defgroup Output TLM
   /// @{
   // TODO Add TLM outputs to uvme_apb_timer_prd_c
   //      Ex: uvm_analysis_port #(uvma_pkt_trn_c)  pkt_out_ap; ///< Describe me!
   /// @}


   `uvm_component_utils_begin(uvme_apb_timer_prd_c)
      `uvm_field_object(cfg  , UVM_DEFAULT)
      `uvm_field_object(cntxt, UVM_DEFAULT)
   `uvm_component_utils_end


   /**
    * Default constructor.
    */
   extern function new(string name="uvme_apb_timer_prd", uvm_component parent=null);

   /**
    * 1. Ensures #cfg & #cntxt handles are not null
    * 2. Creates TLM objects
    */
   extern virtual function void build_phase(uvm_phase phase);

   /**
    * Connects exports to fifos.
    */
   extern virtual function void connect_phase(uvm_phase phase);

   /**
    * Takes in transactions from fifos and processes them.
    */
   extern virtual task run_phase(uvm_phase phase);

   /**
    * Processes input sys_clk monitor transactions.
    */
   extern task process_sys_clk();

   /**
    * Processes input sys_reset monitor transactions.
    */
   extern task process_sys_reset();

   /**
    * Processes input apb monitor transactions.
    */
   extern task process_apb();

   /**
    * Prediction handler for register access.
    */
   extern virtual task predict_reg(ref uvma_apb_mon_trn_c trn);

endclass : uvme_apb_timer_prd_c


function uvme_apb_timer_prd_c::new(string name="uvme_apb_timer_prd", uvm_component parent=null);

   super.new(name, parent);

endfunction : new


function void uvme_apb_timer_prd_c::build_phase(uvm_phase phase);

   super.build_phase(phase);

   void'(uvm_config_db#(uvme_apb_timer_cfg_c)::get(this, "", "cfg", cfg));
   if (!cfg) begin
      `uvm_fatal("APB_TIMER_PRD", "Configuration handle is null")
   end

   void'(uvm_config_db#(uvme_apb_timer_cntxt_c)::get(this, "", "cntxt", cntxt));
   if (!cntxt) begin
      `uvm_fatal("APB_TIMER_PRD", "Context handle is null")
   end

   // Build Input TLM objects
   sys_clk_fifo   = new("sys_clk_fifo"  , this);
   sys_reset_fifo = new("sys_reset_fifo"  , this);
   apb_fifo = new("apb_fifo"  , this);
   sys_clk_export = new("sys_clk_export", this);
   sys_reset_export = new("sys_reset_export", this);
   apb_export = new("apb_export", this);

   // Build Output TLM objects
   // TODO Create Output TLM objects for uvme_apb_timer_prd_c
   //      Ex: pkt_out_ap = new("pkt_out_ap", this);

endfunction : build_phase


function void uvme_apb_timer_prd_c::connect_phase(uvm_phase phase);

   super.connect_phase(phase);

   // Connect TLM objects
   sys_clk_export.connect(sys_clk_fifo.analysis_export);
   sys_reset_export.connect(sys_reset_fifo.analysis_export);
   apb_export.connect(apb_fifo.analysis_export);

endfunction: connect_phase


task uvme_apb_timer_prd_c::run_phase(uvm_phase phase);

   super.run_phase(phase);

   fork
      process_sys_clk();
      process_sys_reset();
      process_apb();
   join_none

endtask: run_phase


task uvme_apb_timer_prd_c::process_sys_clk();

   uvma_clk_mon_trn_c  sys_clk_trn;

   forever begin
      sys_clk_fifo.get(sys_clk_trn);
      // TODO Implement uvme_apb_timer_prd_c::process_sys_clk()
   end

endtask : process_sys_clk


task uvme_apb_timer_prd_c::process_sys_reset();

   uvma_reset_mon_trn_c  trn;

   forever begin
      sys_reset_fifo.get(trn);
      case (trn.transition)
         UVML_EDGE_ASSERTED: begin
            cntxt.reset_state = UVML_RESET_STATE_IN_RESET;
            cntxt.reset();
         end
         UVML_EDGE_DEASSERTED: begin
            cntxt.reset_state = UVML_RESET_STATE_POST_RESET;
         end
      endcase
   end

endtask : process_sys_reset


task uvme_apb_timer_prd_c::process_apb();

   uvma_apb_mon_trn_c  trn;

   forever begin
      apb_fifo.get(trn);
      predict_reg(trn);
   end

endtask : process_apb


task uvme_apb_timer_prd_c::predict_reg(ref uvma_apb_mon_trn_c trn);

   // TODO Implement uvme_apb_timer_prd_c::process_apb()
   //      Ex: uvm_reg  accessed_reg = cfg.apb_timer_reg_block.get_reg_by_offset(trn.address-cfg.reg_block_base_address);

endtask : predict_reg


`endif // __UVME_APB_TIMER_PRD_SV__
