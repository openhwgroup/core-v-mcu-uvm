// Copyright 2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMA_TCOUNTER_B_CP_DRV_SV__
`define __UVMA_TCOUNTER_B_CP_DRV_SV__


/**
 * Driver driving uvma_tcounter_b_if with Control Plane Sequence Items (uvma_tcounter_b_cp_seq_item_c).
 * @ingroup uvma_tcounter_b_comps
 */
class uvma_tcounter_b_cp_drv_c extends uvmx_mp_drv_c #(
   .T_MP      (virtual uvma_tcounter_b_if.cp_drv_mp),
   .T_CFG     (uvma_tcounter_b_cfg_c               ),
   .T_CNTXT   (uvma_tcounter_b_cntxt_c             ),
   .T_SEQ_ITEM(uvma_tcounter_b_cp_seq_item_c       )
);

   `uvm_component_utils(uvma_tcounter_b_cp_drv_c)
   `uvmx_mp_drv(cp_drv_mp, cp_drv_cb)


   /**
    * Default constructor.
    */
   function new(string name="uvma_tcounter_b_cp_drv", uvm_component parent=null);
      super.new(name, parent);
   endfunction

   /**
    * Drives Control Plane driver clocking block (cp_drv_cb) at the beginning of each clock cycle.
    */
   virtual task drive_item(ref uvma_tcounter_b_cp_seq_item_c item);
      `uvmx_mp_drv_signal(item, reset_count_i)
      `uvmx_mp_drv_signal(item, enable_count_i)
      `uvmx_mp_drv_signal(item, compare_value_i)
   endtask


endclass


`endif // __UVMA_TCOUNTER_B_CP_DRV_SV__