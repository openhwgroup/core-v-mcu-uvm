// Copyright 2023 Acme Enterprises
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMA_ADV_TIMER_B_CP_MON_SV__
`define __UVMA_ADV_TIMER_B_CP_MON_SV__


/**
 * Monitor sampling Control Plane monitor transactions (uvma_adv_timer_b_cp_mon_trn_c) from uvma_adv_timer_b_if.
 * @ingroup uvma_adv_timer_b_comps
 */
class uvma_adv_timer_b_cp_mon_c extends uvmx_mp_mon_c #(
   .T_MP     (virtual uvma_adv_timer_b_if.cp_mon_mp),
   .T_CFG    (uvma_adv_timer_b_cfg_c               ),
   .T_CNTXT  (uvma_adv_timer_b_cntxt_c             ),
   .T_MON_TRN(uvma_adv_timer_b_cp_mon_trn_c        )
);

   `uvm_component_utils(uvma_adv_timer_b_cp_mon_c)
   `uvmx_mp_mon(cp_mon_mp, cp_mon_cb)


   /**
    * Default constructor.
    */
   function new(string name="uvma_adv_timer_b_cp_mon", uvm_component parent=null);
      super.new(name, parent);
   endfunction

   /**
    * Samples #trn from the Control Plane monitor clocking block (cp_mon_cb) on each clock cycle.
    */
   virtual task sample_trn(ref uvma_adv_timer_b_cp_mon_trn_c trn);
      trn.cfg_start_i = mp.cp_mon_cb.cfg_start_i;
      trn.cfg_stop_i = mp.cp_mon_cb.cfg_stop_i;
      trn.cfg_rst_i = mp.cp_mon_cb.cfg_rst_i;
      trn.cfg_update_i = mp.cp_mon_cb.cfg_update_i;
      trn.cfg_arm_i = mp.cp_mon_cb.cfg_arm_i;
      trn.cfg_sel_i = mp.cp_mon_cb.cfg_sel_i;
      trn.cfg_sel_clk_i = mp.cp_mon_cb.cfg_sel_clk_i;
      trn.cfg_mode_i = mp.cp_mon_cb.cfg_mode_i;
      trn.cfg_presc_i = mp.cp_mon_cb.cfg_presc_i;
      trn.cfg_sawtooth_i = mp.cp_mon_cb.cfg_sawtooth_i;
      trn.cfg_cnt_start_i = mp.cp_mon_cb.cfg_cnt_start_i;
      trn.cfg_cnt_end_i = mp.cp_mon_cb.cfg_cnt_end_i;
      trn.cfg_comp_ch0_i = mp.cp_mon_cb.cfg_comp_ch0_i;
      trn.cfg_comp_op_ch0_i = mp.cp_mon_cb.cfg_comp_op_ch0_i;
      trn.cfg_comp_ch1_i = mp.cp_mon_cb.cfg_comp_ch1_i;
      trn.cfg_comp_op_ch1_i = mp.cp_mon_cb.cfg_comp_op_ch1_i;
      trn.cfg_comp_ch2_i = mp.cp_mon_cb.cfg_comp_ch2_i;
      trn.cfg_comp_op_ch2_i = mp.cp_mon_cb.cfg_comp_op_ch2_i;
      trn.cfg_comp_ch3_i = mp.cp_mon_cb.cfg_comp_ch3_i;
      trn.cfg_comp_op_ch3_i = mp.cp_mon_cb.cfg_comp_op_ch3_i;
   endtask

   /**
    * Trims data outside configured widths.
    */
   virtual function void process_trn(ref uvma_adv_timer_b_cp_mon_trn_c trn);
      `uvmx_trim(trn.cfg_cnt_start_i, cfg.num_bits)
      `uvmx_trim(trn.cfg_cnt_end_i, cfg.num_bits)
      `uvmx_trim(trn.cfg_comp_ch0_i, cfg.num_bits)
      `uvmx_trim(trn.cfg_comp_ch1_i, cfg.num_bits)
      `uvmx_trim(trn.cfg_comp_ch2_i, cfg.num_bits)
      `uvmx_trim(trn.cfg_comp_ch3_i, cfg.num_bits)


   endfunction

endclass : uvma_adv_timer_b_cp_mon_c


`endif // __UVMA_ADV_TIMER_B_CP_MON_SV__