// Copyright 2023 Acme Enterprises
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVME_APB_ADV_TIMER_SS_BASE_VSEQ_SV__
`define __UVME_APB_ADV_TIMER_SS_BASE_VSEQ_SV__


/**
 * Abstract virtual sequence from which all other APB Advanced Timer Sub-System environment virtual sequences extend.
 * Subclasses must be run on uvme_apb_adv_timer_ss_vsqr_c.
 * @note Does not generate any sequence items of its own.
 * @ingroup uvme_apb_adv_timer_ss_seq
 */
class uvme_apb_adv_timer_ss_base_vseq_c extends uvmx_ss_env_vseq_c #(
   .T_CFG  (uvme_apb_adv_timer_ss_cfg_c  ),
   .T_CNTXT(uvme_apb_adv_timer_ss_cntxt_c),
   .T_SQR  (uvme_apb_adv_timer_ss_vsqr_c )
);

   `uvm_object_utils(uvme_apb_adv_timer_ss_base_vseq_c)

   /**
    * Default constructor.
    */
   function new(string name="uvme_apb_adv_timer_ss_base_vseq");
      super.new(name);
   endfunction

endclass : uvme_apb_adv_timer_ss_base_vseq_c


`endif // __UVME_APB_ADV_TIMER_SS_BASE_VSEQ_SV__