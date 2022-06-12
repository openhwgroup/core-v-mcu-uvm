// Copyright 2022 Datum Technology Corporation
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVME_CVMCU_DMA_SQR_SV__
`define __UVME_CVMCU_DMA_SQR_SV__


/**
 * Component running CORE-V MCU DMA sequences of uvme_cvmcu_dma_seq_item_c sequence items.
 */
class uvme_cvmcu_dma_sqr_c extends uvm_sequencer #(
   .REQ(uvme_cvmcu_dma_seq_item_c),
   .RSP(uvme_cvmcu_dma_seq_item_c)
);

   /// @defgroup Objects
   /// @{
   uvme_cvmcu_cfg_c    cfg  ; ///< Environment configuration handle
   uvme_cvmcu_cntxt_c  cntxt; ///< Environment context handle
   /// @}


   `uvm_component_utils_begin(uvme_cvmcu_dma_sqr_c)
      `uvm_field_object(cfg  , UVM_DEFAULT)
      `uvm_field_object(cntxt, UVM_DEFAULT)
   `uvm_component_utils_end


   /**
    * Default constructor.
    */
   extern function new(string name="uvme_cvmcu_dma_sqr", uvm_component parent=null);

   /**
    * Ensures cfg & cntxt handles are not null
    */
   extern virtual function void build_phase(uvm_phase phase);

endclass : uvme_cvmcu_dma_sqr_c


function uvme_cvmcu_dma_sqr_c::new(string name="uvme_cvmcu_dma_sqr", uvm_component parent=null);

   super.new(name, parent);

endfunction : new


function void uvme_cvmcu_dma_sqr_c::build_phase(uvm_phase phase);

   super.build_phase(phase);

   void'(uvm_config_db#(uvme_cvmcu_cfg_c)::get(this, "", "cfg", cfg));
   if (!cfg) begin
      `uvm_fatal("CVMCU_DMA_SQR", "Configuration handle is null")
   end

   void'(uvm_config_db#(uvme_cvmcu_cntxt_c)::get(this, "", "cntxt", cntxt));
   if (!cntxt) begin
      `uvm_fatal("CVMCU_DMA_SQR", "Context handle is null")
   end

endfunction : build_phase


`endif // __UVME_CVMCU_DMA_SQR_SV__
