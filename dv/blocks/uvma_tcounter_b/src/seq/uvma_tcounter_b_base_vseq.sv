// Copyright 2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMA_TCOUNTER_B_BASE_VSEQ_SV__
`define __UVMA_TCOUNTER_B_BASE_VSEQ_SV__


/**
 * Abstract Virtual Sequence from which all  Agent Sequences must extend.
 * @ingroup uvma_tcounter_b_seq
 */
class uvma_tcounter_b_base_vseq_c extends uvmx_agent_seq_c #(
   .T_CFG     (uvma_tcounter_b_cfg_c     ),
   .T_CNTXT   (uvma_tcounter_b_cntxt_c   ),
   .T_SQR     (uvma_tcounter_b_vsqr_c    ),
   .T_SEQ_ITEM(uvma_tcounter_b_seq_item_c)
);

   `uvm_object_utils(uvma_tcounter_b_base_vseq_c)

   /**
    * Default constructor.
    */
   function new(string name="uvma_tcounter_b_base_vseq");
      super.new(name);
   endfunction

endclass : uvma_tcounter_b_base_vseq_c


`endif // __UVMA_TCOUNTER_B_BASE_VSEQ_SV__