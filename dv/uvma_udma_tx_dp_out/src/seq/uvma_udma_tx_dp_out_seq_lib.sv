// Copyright 2022 Datum Technology Corporation
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMA_UDMA_TX_DP_OUT_SEQ_LIB_SV__
`define __UVMA_UDMA_TX_DP_OUT_SEQ_LIB_SV__


`include "uvma_udma_tx_dp_out_base_seq.sv"


/**
 * Object cataloging the uDMA Tx Channels Block Data Plane Output UVM Agent sequences.
 * @ingroup uvma_udma_tx_dp_out_seq
 */
class uvma_udma_tx_dp_out_seq_lib_c extends uvml_seq_lib_c #(
   .REQ(uvm_sequence_item),
   .RSP(uvm_sequence_item)
);

   `uvm_object_utils          (uvma_udma_tx_dp_out_seq_lib_c)
   `uvm_sequence_library_utils(uvma_udma_tx_dp_out_seq_lib_c)


   /**
    * 1. Initializes sequence library
    * 2. Adds sequences to library
    */
   extern function new(string name="uvma_udma_tx_dp_out_seq_lib");

endclass : uvma_udma_tx_dp_out_seq_lib_c


function uvma_udma_tx_dp_out_seq_lib_c::new(string name="uvma_udma_tx_dp_out_seq_lib");

   super.new(name);
   init_sequence_library();

endfunction : new


`endif // __UVMA_UDMA_TX_DP_OUT_SEQ_LIB_SV__
