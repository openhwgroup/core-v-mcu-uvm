// Copyright 2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMA_ADV_TIMER_B_BASE_SEQ_SV__
`define __UVMA_ADV_TIMER_B_BASE_SEQ_SV__


/**
 * Abstract Sequence from which all Advanced timer counter Agent Sequences must extend.
 * @ingroup uvma_adv_timer_b_seq
 */
class uvma_adv_timer_b_base_seq_c extends uvmx_agent_seq_c #(
   .T_CFG     (uvma_adv_timer_b_cfg_c     ),
   .T_CNTXT   (uvma_adv_timer_b_cntxt_c   ),
   .T_SQR     (uvma_adv_timer_b_sqr_c     ),
   .T_SEQ_ITEM(uvma_adv_timer_b_seq_item_c)
);

   `uvm_object_utils(uvma_adv_timer_b_base_seq_c)

   /**
    * Default constructor.
    */
   function new(string name="uvma_adv_timer_b_base_seq");
      super.new(name);
   endfunction

endclass


`endif // __UVMA_ADV_TIMER_B_BASE_SEQ_SV__