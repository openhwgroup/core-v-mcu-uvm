// Copyright 2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMA_TPRESCALER_B_BASE_VSEQ_SV__
`define __UVMA_TPRESCALER_B_BASE_VSEQ_SV__


/**
 * Abstract Virtual Sequence from which all Timer unit prescaler Agent Sequences must extend.
 * @ingroup uvma_tprescaler_b_seq
 */
class uvma_tprescaler_b_base_vseq_c extends uvmx_agent_seq_c #(
   .T_CFG     (uvma_tprescaler_b_cfg_c     ),
   .T_CNTXT   (uvma_tprescaler_b_cntxt_c   ),
   .T_SQR     (uvma_tprescaler_b_vsqr_c    ),
   .T_SEQ_ITEM(uvma_tprescaler_b_seq_item_c)
);

   `uvm_object_utils(uvma_tprescaler_b_base_vseq_c)

   /**
    * Default constructor.
    */
   function new(string name="uvma_tprescaler_b_base_vseq");
      super.new(name);
   endfunction

endclass : uvma_tprescaler_b_base_vseq_c


`endif // __UVMA_TPRESCALER_B_BASE_VSEQ_SV__