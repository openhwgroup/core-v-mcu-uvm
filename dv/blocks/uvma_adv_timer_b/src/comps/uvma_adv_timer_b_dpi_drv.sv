// Copyright 2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMA_ADV_TIMER_B_DPI_DRV_SV__
`define __UVMA_ADV_TIMER_B_DPI_DRV_SV__


/**
 * Driver driving uvma_adv_timer_b_if with Data Plane Input Sequence Items (uvma_adv_timer_b_dpi_seq_item_c).
 * @ingroup uvma_adv_timer_b_comps
 */
class uvma_adv_timer_b_dpi_drv_c extends uvmx_mp_drv_c #(
   .T_MP      (virtual uvma_adv_timer_b_if.dpi_drv_mp),
   .T_CFG     (uvma_adv_timer_b_cfg_c                ),
   .T_CNTXT   (uvma_adv_timer_b_cntxt_c              ),
   .T_SEQ_ITEM(uvma_adv_timer_b_dpi_seq_item_c       )
);

   `uvm_component_utils(uvma_adv_timer_b_dpi_drv_c)
   `uvmx_mp_drv(dpi_drv_mp, dpi_drv_cb)


   /**
    * Default constructor.
    */
   function new(string name="uvma_adv_timer_b_dpi_drv", uvm_component parent=null);
      super.new(name, parent);
   endfunction
   /**
    * Trims data outside configured widths.
    */
   virtual function void process_item(ref uvma_adv_timer_b_dpi_seq_item_c item);
      `uvmx_trim(item.signal_i, cfg.n_extsig)
   endfunction

   /**
    * Drives the Data Plane Input driver clocking block (dpi_drv_cb) on each clock cycle.
    */
   virtual task drive_item(ref uvma_adv_timer_b_dpi_seq_item_c item);
      `uvmx_mp_drv_signal(item, signal_i)
   endtask


endclass : uvma_adv_timer_b_dpi_drv_c


`endif // __UVMA_ADV_TIMER_B_DPI_DRV_SV__