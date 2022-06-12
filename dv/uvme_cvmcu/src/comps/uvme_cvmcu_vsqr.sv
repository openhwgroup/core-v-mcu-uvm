// Copyright 2022 Datum Technology Corporation
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVME_CVMCU_VSQR_SV__
`define __UVME_CVMCU_VSQR_SV__


/**
 * Component on which all CORE-V MCU virtual sequences are run.
 */
class uvme_cvmcu_vsqr_c extends uvm_sequencer #(
   .REQ(uvm_sequence_item),
   .RSP(uvm_sequence_item)
);

   // Objects
   uvme_cvmcu_cfg_c    cfg;
   uvme_cvmcu_cntxt_c  cntxt;

   // Sequencer handles
   uvma_clk_sqr_c         sys_clk_sequencer;
   uvma_reset_sqr_c       sys_reset_sequencer;
   uvma_obi_vsqr_c        obi_instr_sequencer;
   uvma_obi_vsqr_c        obi_data_sequencer;
   uvma_cvmcu_intr_sqr_c  intr_sequencer;
   uvme_cvmcu_dma_sqr_c   dma_sequencer;

   // TLM
   uvm_analysis_port #(uvme_cvmcu_dma_seq_item_c)  dma_egress_ap ; ///< TODO Describe dma_egress_ap
   uvm_analysis_port #(uvme_cvmcu_dma_seq_item_c)  dma_ingress_ap; ///< TODO Describe dma_ingress_ap


   `uvm_component_utils_begin(uvme_cvmcu_vsqr_c)
      `uvm_field_object(cfg  , UVM_DEFAULT)
      `uvm_field_object(cntxt, UVM_DEFAULT)
   `uvm_component_utils_end


   /**
    * Default constructor.
    */
   extern function new(string name="uvme_cvmcu_sqr", uvm_component parent=null);

   /**
    * Ensures cfg & cntxt handles are not null.
    */
   extern virtual function void build_phase(uvm_phase phase);

endclass : uvme_cvmcu_vsqr_c


function uvme_cvmcu_vsqr_c::new(string name="uvme_cvmcu_sqr", uvm_component parent=null);

   super.new(name, parent);

endfunction : new


function void uvme_cvmcu_vsqr_c::build_phase(uvm_phase phase);

   super.build_phase(phase);

   void'(uvm_config_db#(uvme_cvmcu_cfg_c)::get(this, "", "cfg", cfg));
   if (!cfg) begin
      `uvm_fatal("CFG", "Configuration handle is null")
   end
   uvm_config_db#(uvme_cvmcu_cfg_c)::set(this, "*", "cfg", cfg);

   void'(uvm_config_db#(uvme_cvmcu_cntxt_c)::get(this, "", "cntxt", cntxt));
   if (!cntxt) begin
      `uvm_fatal("CNTXT", "Context handle is null")
   end
   uvm_config_db#(uvme_cvmcu_cntxt_c)::set(this, "*", "cntxt", cntxt);

   dma_sequencer  = uvme_cvmcu_dma_sqr_c::type_id::create("dma_sequencer", this);
   dma_egress_ap  = new("dma_egress_ap" , this);
   dma_ingress_ap = new("dma_ingress_ap", this);

endfunction : build_phase


`endif // __UVME_CVMCU_VSQR_SV__
