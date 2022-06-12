// Copyright 2022 Datum Technology Corporation
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
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
   uvm_analysis_export   #(uvma_clk_mon_trn_c       )  sys_clk_export  ;
   uvm_tlm_analysis_fifo #(uvma_clk_mon_trn_c       )  sys_clk_fifo    ;
   uvm_analysis_export   #(uvma_reset_mon_trn_c     )  sys_reset_export;
   uvm_tlm_analysis_fifo #(uvma_reset_mon_trn_c     )  sys_reset_fifo  ;
   uvm_analysis_export   #(uvma_obi_mon_trn_c       )  obi_instr_export;
   uvm_tlm_analysis_fifo #(uvma_obi_mon_trn_c       )  obi_instr_fifo  ;
   uvm_analysis_export   #(uvma_obi_mon_trn_c       )  obi_data_export ;
   uvm_tlm_analysis_fifo #(uvma_obi_mon_trn_c       )  obi_data_fifo   ;
   uvm_analysis_export   #(uvma_cvmcu_intr_mon_trn_c)  intr_export     ;
   uvm_tlm_analysis_fifo #(uvma_cvmcu_intr_mon_trn_c)  intr_fifo       ;
   uvm_analysis_export   #(uvme_cvmcu_dma_seq_item_c)  dma_in_export   ;
   uvm_tlm_analysis_fifo #(uvme_cvmcu_dma_seq_item_c)  dma_in_fifo     ;

   // Output TLM
   uvm_analysis_port #(uvme_cvmcu_dma_seq_item_c)  dma_out_ap;


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
    * TODO Describe uvme_cvmcu_prd_c::process_obi_instr()
    */
   extern task process_obi_instr();

   /**
    * TODO Describe uvme_cvmcu_prd_c::process_obi_data()
    */
   extern task process_obi_data();

   /**
    * TODO Describe uvme_cvmcu_prd_c::process_intr()
    */
   extern task process_intr();

   /**
    * TODO Describe uvme_cvmcu_prd_c::process_dma()
    */
   extern task process_dma();

endclass : uvme_cvmcu_prd_c


function uvme_cvmcu_prd_c::new(string name="uvme_cvmcu_prd", uvm_component parent=null);

   super.new(name, parent);

endfunction : new


function void uvme_cvmcu_prd_c::build_phase(uvm_phase phase);

   super.build_phase(phase);

   void'(uvm_config_db#(uvme_cvmcu_cfg_c)::get(this, "", "cfg", cfg));
   if (!cfg) begin
      `uvm_fatal("UVME_CVMCU_PRD", "Configuration handle is null")
   end

   void'(uvm_config_db#(uvme_cvmcu_cntxt_c)::get(this, "", "cntxt", cntxt));
   if (!cntxt) begin
      `uvm_fatal("UVME_CVMCU_PRD", "Context handle is null")
   end

   // Build Input TLM objects
   sys_clk_export   = new("sys_clk_export"  , this);
   sys_clk_fifo     = new("sys_clk_fifo"    , this);
   sys_reset_export = new("sys_reset_export", this);
   sys_reset_fifo   = new("sys_reset_fifo"  , this);
   obi_instr_export = new("obi_instr_export", this);
   obi_instr_fifo   = new("obi_instr_fifo"  , this);
   obi_data_export  = new("obi_data_export" , this);
   obi_data_fifo    = new("obi_data_fifo"   , this);
   intr_export      = new("intr_export"     , this);
   intr_fifo        = new("intr_fifo"       , this);
   dma_in_export    = new("dma_in_export"   , this);
   dma_in_fifo      = new("dma_in_fifo"     , this);

   // Build Output TLM objects
   dma_out_ap = new("dma_out_ap", this);

endfunction : build_phase


function void uvme_cvmcu_prd_c::connect_phase(uvm_phase phase);

   super.connect_phase(phase);

   // Connect TLM objects
   sys_clk_export  .connect(sys_clk_fifo  .analysis_export);
   sys_reset_export.connect(sys_reset_fifo.analysis_export);
   obi_instr_export.connect(obi_instr_fifo.analysis_export);
   obi_data_export .connect(obi_data_fifo .analysis_export);
   intr_export     .connect(intr_fifo     .analysis_export);
   dma_in_export   .connect(dma_in_fifo   .analysis_export);

endfunction: connect_phase


task uvme_cvmcu_prd_c::run_phase(uvm_phase phase);

   super.run_phase(phase);

   fork
      process_sys_clk  ();
      process_sys_reset();
      process_obi_instr();
      process_obi_data ();
      process_intr     ();
      process_dma      ();
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


task uvme_cvmcu_prd_c::process_obi_instr();

   uvma_obi_mon_trn_c  obi_trn;

   forever begin
      obi_instr_fifo.get(obi_trn);

      // TODO Implement uvme_cvmcu_prd_c::process_obi_instr()
   end

endtask : process_obi_instr


task uvme_cvmcu_prd_c::process_obi_data();

   uvma_obi_mon_trn_c  obi_trn;

   forever begin
      obi_data_fifo.get(obi_trn);

      // TODO Implement uvme_cvmcu_prd_c::process_obi_data()
   end

endtask : process_obi_data


task uvme_cvmcu_prd_c::process_intr();

   uvma_cvmcu_intr_mon_trn_c  obi_trn;

   forever begin
      intr_fifo.get(obi_trn);

      // TODO Implement uvme_cvmcu_prd_c::process_intr()
   end

endtask : process_intr


task uvme_cvmcu_prd_c::process_dma();

   uvme_cvmcu_dma_seq_item_c  dma_trn;

   forever begin
      dma_fifo.get(dma_trn);

      // TODO Implement uvme_cvmcu_prd_c::process_dma()

      dma_out_ap.write(dma_trn);
   end

endtask : process_dma


`endif // __UVME_CVMCU_PRD_SV__
