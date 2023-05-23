// Copyright 2023 Acme Enterprises
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMA_TPRESCALER_B_DPI_DRV_SV__
`define __UVMA_TPRESCALER_B_DPI_DRV_SV__


/**
 * Driver driving uvma_tprescaler_b_if with Data Plane Input Sequence Items (uvma_tprescaler_b_dpi_seq_item_c).
 * @ingroup uvma_tprescaler_b_comps
 */
class uvma_tprescaler_b_dpi_drv_c extends uvmx_mp_drv_c #(
   .T_MP      (virtual uvma_tprescaler_b_if.dpi_drv_mp),
   .T_CFG     (uvma_tprescaler_b_cfg_c                ),
   .T_CNTXT   (uvma_tprescaler_b_cntxt_c              ),
   .T_SEQ_ITEM(uvma_tprescaler_b_dpi_seq_item_c       )
);

   `uvm_component_utils(uvma_tprescaler_b_dpi_drv_c)
   `uvmx_mp_drv(dpi_drv_mp, dpi_drv_cb)


   /**
    * Default constructor.
    */
   function new(string name="uvma_tprescaler_b_dpi_drv", uvm_component parent=null);
      super.new(name, parent);
   endfunction

   /**
    * Drives the Data Plane Input driver clocking block (dpi_drv_cb) on each clock cycle.
    */
   virtual task drive_item(ref uvma_tprescaler_b_dpi_seq_item_c item);
      mp.dpi_drv_cb.write_counter_i <= item.write_counter_i;
      mp.dpi_drv_cb.counter_value_i <= item.counter_value_i;
   endtask


endclass : uvma_tprescaler_b_dpi_drv_c


`endif // __UVMA_TPRESCALER_B_DPI_DRV_SV__