// Copyright 2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMA_ADV_TIMER_B_DPO_DRV_SV__
`define __UVMA_ADV_TIMER_B_DPO_DRV_SV__


/**
 * Driver driving uvma_adv_timer_b_if with Data Plane Output Sequence Items (uvma_adv_timer_b_dpo_seq_item_c).
 * @ingroup uvma_adv_timer_b_comps
 */
class uvma_adv_timer_b_dpo_drv_c extends uvmx_mp_drv_c #(
   .T_MP      (virtual uvma_adv_timer_b_if.dpo_drv_mp),
   .T_CFG     (uvma_adv_timer_b_cfg_c                ),
   .T_CNTXT   (uvma_adv_timer_b_cntxt_c              ),
   .T_SEQ_ITEM(uvma_adv_timer_b_dpo_seq_item_c       )
);

   `uvm_component_utils(uvma_adv_timer_b_dpo_drv_c)
   `uvmx_mp_drv(dpo_drv_mp, dpo_drv_cb)


   /**
    * Default constructor.
    */
   function new(string name="uvma_adv_timer_b_dpo_drv", uvm_component parent=null);
      super.new(name, parent);
   endfunction

   /**
    * Trims data outside configured widths.
    */
   virtual function void process_item(ref uvma_adv_timer_b_dpo_seq_item_c item);

      `uvmx_trim(item.counter_o, cfg.num_bits)
   endfunction

   /**
    * Drives the Data Plane Output driver clocking block (dpo_drv_cb) on each clock cycle.
    */
   virtual task drive_item(ref uvma_adv_timer_b_dpo_seq_item_c item);
   endtask

   /**
    * Samples the Data Plane Output driver clocking block (dpo_drv_cb) after each clock cycle.
    */
   virtual task sample_post_clk(ref uvma_adv_timer_b_dpo_seq_item_c item);
      item.counter_o = mp.dpo_drv_cb.counter_o;
      item.pwm_o = mp.dpo_drv_cb.pwm_o;
      item.status_o = mp.dpo_drv_cb.status_o;
   endtask

endclass : uvma_adv_timer_b_dpo_drv_c


`endif // __UVMA_ADV_TIMER_B_DPO_DRV_SV__