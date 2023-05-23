// Copyright 2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMA_ADV_TIMER_B_BASE_VSEQ_SV__
`define __UVMA_ADV_TIMER_B_BASE_VSEQ_SV__


/**
 * Abstract Virtual Sequence from which all  Agent Sequences must extend.
 * @ingroup uvma_adv_timer_b_seq
 */
class uvma_adv_timer_b_base_vseq_c extends uvmx_agent_seq_c #(
   .T_CFG     (uvma_adv_timer_b_cfg_c     ),
   .T_CNTXT   (uvma_adv_timer_b_cntxt_c   ),
   .T_SQR     (uvma_adv_timer_b_vsqr_c    ),
   .T_SEQ_ITEM(uvma_adv_timer_b_seq_item_c)
);

   `uvm_object_utils(uvma_adv_timer_b_base_vseq_c)

   /**
    * Default constructor.
    */
   function new(string name="uvma_adv_timer_b_base_vseq");
      super.new(name);
   endfunction

endclass : uvma_adv_timer_b_base_vseq_c


`endif // __UVMA_ADV_TIMER_B_BASE_VSEQ_SV__