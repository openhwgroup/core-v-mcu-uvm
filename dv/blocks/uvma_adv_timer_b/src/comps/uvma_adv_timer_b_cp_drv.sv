// Copyright 2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMA_ADV_TIMER_B_CP_DRV_SV__
`define __UVMA_ADV_TIMER_B_CP_DRV_SV__


/**
 * Driver driving uvma_adv_timer_b_if with Control Plane Sequence Items (uvma_adv_timer_b_cp_seq_item_c).
 * @ingroup uvma_adv_timer_b_comps
 */
class uvma_adv_timer_b_cp_drv_c extends uvmx_mp_drv_c #(
   .T_MP      (virtual uvma_adv_timer_b_if.cp_drv_mp),
   .T_CFG     (uvma_adv_timer_b_cfg_c               ),
   .T_CNTXT   (uvma_adv_timer_b_cntxt_c             ),
   .T_SEQ_ITEM(uvma_adv_timer_b_cp_seq_item_c       )
);

   `uvm_component_utils(uvma_adv_timer_b_cp_drv_c)
   `uvmx_mp_drv(cp_drv_mp, cp_drv_cb)


   /**
    * Default constructor.
    */
   function new(string name="uvma_adv_timer_b_cp_drv", uvm_component parent=null);
      super.new(name, parent);
   endfunction
   /**
    * Trims data outside configured widths.
    */
   virtual function void process_item(ref uvma_adv_timer_b_cp_seq_item_c item);
      `uvmx_trim(item.cfg_cnt_start_i, cfg.num_bits)
      `uvmx_trim(item.cfg_cnt_end_i, cfg.num_bits)
      `uvmx_trim(item.cfg_comp_ch0_i, cfg.num_bits)
      `uvmx_trim(item.cfg_comp_ch1_i, cfg.num_bits)
      `uvmx_trim(item.cfg_comp_ch2_i, cfg.num_bits)
      `uvmx_trim(item.cfg_comp_ch3_i, cfg.num_bits)
   endfunction

   /**
    * Drives Control Plane driver clocking block (cp_drv_cb) on each clock cycle.
    */
   virtual task drive_item(ref uvma_adv_timer_b_cp_seq_item_c item);
      mp.cp_drv_cb.cfg_start_i <= item.cfg_start_i;
      mp.cp_drv_cb.cfg_stop_i <= item.cfg_stop_i;
      mp.cp_drv_cb.cfg_rst_i <= item.cfg_rst_i;
      mp.cp_drv_cb.cfg_update_i <= item.cfg_update_i;
      mp.cp_drv_cb.cfg_arm_i <= item.cfg_arm_i;
      mp.cp_drv_cb.cfg_sel_i <= item.cfg_sel_i;
      mp.cp_drv_cb.cfg_sel_clk_i <= item.cfg_sel_clk_i;
      mp.cp_drv_cb.cfg_mode_i <= item.cfg_mode_i;
      mp.cp_drv_cb.cfg_presc_i <= item.cfg_presc_i;
      mp.cp_drv_cb.cfg_sawtooth_i <= item.cfg_sawtooth_i;
      mp.cp_drv_cb.cfg_cnt_start_i <= item.cfg_cnt_start_i;
      mp.cp_drv_cb.cfg_cnt_end_i <= item.cfg_cnt_end_i;
      mp.cp_drv_cb.cfg_comp_ch0_i <= item.cfg_comp_ch0_i;
      mp.cp_drv_cb.cfg_comp_op_ch0_i <= item.cfg_comp_op_ch0_i;
      mp.cp_drv_cb.cfg_comp_ch1_i <= item.cfg_comp_ch1_i;
      mp.cp_drv_cb.cfg_comp_op_ch1_i <= item.cfg_comp_op_ch1_i;
      mp.cp_drv_cb.cfg_comp_ch2_i <= item.cfg_comp_ch2_i;
      mp.cp_drv_cb.cfg_comp_op_ch2_i <= item.cfg_comp_op_ch2_i;
      mp.cp_drv_cb.cfg_comp_ch3_i <= item.cfg_comp_ch3_i;
      mp.cp_drv_cb.cfg_comp_op_ch3_i <= item.cfg_comp_op_ch3_i;
   endtask


endclass : uvma_adv_timer_b_cp_drv_c


`endif // __UVMA_ADV_TIMER_B_CP_DRV_SV__