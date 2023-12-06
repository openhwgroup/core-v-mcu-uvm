// Copyright 2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMA_TCOUNTER_B_BASE_SEQ_SV__
`define __UVMA_TCOUNTER_B_BASE_SEQ_SV__


/**
 * Abstract Sequence from which all Timer unit counter Agent Sequences must extend.
 * @ingroup uvma_tcounter_b_seq
 */
class uvma_tcounter_b_base_seq_c extends uvmx_agent_seq_c #(
   .T_CFG     (uvma_tcounter_b_cfg_c     ),
   .T_CNTXT   (uvma_tcounter_b_cntxt_c   ),
   .T_SQR     (uvma_tcounter_b_sqr_c     ),
   .T_SEQ_ITEM(uvma_tcounter_b_seq_item_c)
);

   `uvm_object_utils(uvma_tcounter_b_base_seq_c)

   /**
    * Default constructor.
    */
   function new(string name="uvma_tcounter_b_base_seq");
      super.new(name);
   endfunction

endclass


`endif // __UVMA_TCOUNTER_B_BASE_SEQ_SV__