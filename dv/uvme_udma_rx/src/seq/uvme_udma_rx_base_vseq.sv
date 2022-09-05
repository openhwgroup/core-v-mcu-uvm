// Copyright 2022 Datum Technology Corporation
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVME_UDMA_RX_BASE_VSEQ_SV__
`define __UVME_UDMA_RX_BASE_VSEQ_SV__


/**
 * Abstract virtual sequence from which all other uDMA Rx Channels Block environment virtual sequences extend.
 * Subclasses must be run on uvme_udma_rx_vsqr_c.
 * @note Does not generate any sequence items of its own.
 * @ingroup uvme_udma_rx_seq
 */
class uvme_udma_rx_base_vseq_c extends uvml_vseq_c #(
   .REQ(uvm_sequence_item),
   .RSP(uvm_sequence_item)
);

   /// @name Objects
   /// @{
   uvme_udma_rx_cfg_c    cfg  ; ///< Environment configuration handle
   uvme_udma_rx_cntxt_c  cntxt; ///< Environment context handle
   /// @}


   `uvm_object_utils(uvme_udma_rx_base_vseq_c)
   `uvm_declare_p_sequencer(uvme_udma_rx_vsqr_c)


   /**
    * Default constructor.
    */
   extern function new(string name="uvme_udma_rx_base_vseq");

   /**
    * Retrieve #cfg and #cntxt handles from p_sequencer.
    */
   extern virtual task pre_start();

endclass : uvme_udma_rx_base_vseq_c


function uvme_udma_rx_base_vseq_c::new(string name="uvme_udma_rx_base_vseq");

   super.new(name);

endfunction : new


task uvme_udma_rx_base_vseq_c::pre_start();

   cfg   = p_sequencer.cfg;
   cntxt = p_sequencer.cntxt;

endtask : pre_start


`endif // __UVME_UDMA_RX_BASE_VSEQ_SV__
