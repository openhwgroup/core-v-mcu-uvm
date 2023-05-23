// Copyright 2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMA_TCOUNTER_B_DPO_DRV_SV__
`define __UVMA_TCOUNTER_B_DPO_DRV_SV__


/**
 * Driver driving uvma_tcounter_b_if with Data Plane Output Sequence Items (uvma_tcounter_b_dpo_seq_item_c).
 * @ingroup uvma_tcounter_b_comps
 */
class uvma_tcounter_b_dpo_drv_c extends uvmx_mp_drv_c #(
   .T_MP      (virtual uvma_tcounter_b_if.dpo_drv_mp),
   .T_CFG     (uvma_tcounter_b_cfg_c                ),
   .T_CNTXT   (uvma_tcounter_b_cntxt_c              ),
   .T_SEQ_ITEM(uvma_tcounter_b_dpo_seq_item_c       )
);

   `uvm_component_utils(uvma_tcounter_b_dpo_drv_c)
   `uvmx_mp_drv(dpo_drv_mp, dpo_drv_cb)


   /**
    * Default constructor.
    */
   function new(string name="uvma_tcounter_b_dpo_drv", uvm_component parent=null);
      super.new(name, parent);
   endfunction

   /**
    * Drives the Data Plane Output driver clocking block (dpo_drv_cb) on each clock cycle.
    */
   virtual task drive_item(ref uvma_tcounter_b_dpo_seq_item_c item);
   endtask

   /**
    * Samples the Data Plane Output driver clocking block (dpo_drv_cb) after each clock cycle.
    */
   virtual task sample_post_clk(ref uvma_tcounter_b_dpo_seq_item_c item);
      item.counter_value_o = mp.dpo_drv_cb.counter_value_o;
      item.target_reached_o = mp.dpo_drv_cb.target_reached_o;
      item.target_greater_o = mp.dpo_drv_cb.target_greater_o;
   endtask

endclass : uvma_tcounter_b_dpo_drv_c


`endif // __UVMA_TCOUNTER_B_DPO_DRV_SV__