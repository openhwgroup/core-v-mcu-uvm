// Copyright 2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVME_APB_ADV_TIMER_SS_BASE_SEQ_SV__
`define __UVME_APB_ADV_TIMER_SS_BASE_SEQ_SV__


/**
 * Abstract Sequence from which all other APB Advanced Timer Sub-System environment Sequences extend.
 * Subclasses must be run on uvme_apb_adv_timer_ss_sqr_c.
 * @ingroup uvme_apb_adv_timer_ss_seq
 */
class uvme_apb_adv_timer_ss_base_seq_c extends uvmx_ss_env_seq_c #(
   .T_CFG  (uvme_apb_adv_timer_ss_cfg_c  ),
   .T_CNTXT(uvme_apb_adv_timer_ss_cntxt_c),
   .T_SQR  (uvme_apb_adv_timer_ss_sqr_c  )
);

   `uvm_object_utils(uvme_apb_adv_timer_ss_base_seq_c)

   /**
    * Default constructor.
    */
   function new(string name="uvme_apb_adv_timer_ss_base_seq");
      super.new(name);
   endfunction

endclass


`endif // __UVME_APB_ADV_TIMER_SS_BASE_SEQ_SV__