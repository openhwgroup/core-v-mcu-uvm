// Copyright 2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMA_ADV_TIMER_B_DPO_MON_SV__
`define __UVMA_ADV_TIMER_B_DPO_MON_SV__


/**
 * Monitor sampling Data Plane Output monitor transactions (uvma_adv_timer_b_dpo_mon_trn_c) from uvma_adv_timer_b_if.
 * @ingroup uvma_adv_timer_b_comps
 */
class uvma_adv_timer_b_dpo_mon_c extends uvmx_mp_mon_c #(
   .T_MP     (virtual uvma_adv_timer_b_if.dpo_mon_mp),
   .T_CFG    (uvma_adv_timer_b_cfg_c                ),
   .T_CNTXT  (uvma_adv_timer_b_cntxt_c              ),
   .T_MON_TRN(uvma_adv_timer_b_dpo_mon_trn_c        )
);

   `uvm_component_utils(uvma_adv_timer_b_dpo_mon_c)
   `uvmx_mp_mon(dpo_mon_mp, dpo_mon_cb)


   /**
    * Default constructor.
    */
   function new(string name="uvma_adv_timer_b_dpo_mon", uvm_component parent=null);
      super.new(name, parent);
   endfunction

   /**
    * Samples #trn from the Data Plane Output monitor clocking block (dpi_mon_cb) on each clock cycle.
    */
   virtual task sample_trn(ref uvma_adv_timer_b_dpo_mon_trn_c trn);
      `uvmx_mp_mon_signal(trn, counter_o)
      `uvmx_mp_mon_signal(trn, pwm_o)
      `uvmx_mp_mon_signal(trn, status_o)
   endtask

   /**
    * Trims data outside configured widths.
    */
   virtual function void process_trn(ref uvma_adv_timer_b_dpo_mon_trn_c trn);

      `uvmx_trim(trn.counter_o, cfg.num_bits)

   endfunction

endclass


`endif // __UVMA_ADV_TIMER_B_DPO_MON_SV__