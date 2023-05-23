// Copyright 2023 Acme Enterprises
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMA_TPRESCALER_B_DPI_MON_SV__
`define __UVMA_TPRESCALER_B_DPI_MON_SV__


/**
 * Monitor sampling Data Plane Input monitor transactions (uvma_tprescaler_b_dpi_mon_trn_c) from uvma_tprescaler_b_if.
 * @ingroup uvma_tprescaler_b_comps
 */
class uvma_tprescaler_b_dpi_mon_c extends uvmx_mp_mon_c #(
   .T_MP     (virtual uvma_tprescaler_b_if.dpi_mon_mp),
   .T_CFG    (uvma_tprescaler_b_cfg_c                ),
   .T_CNTXT  (uvma_tprescaler_b_cntxt_c              ),
   .T_MON_TRN(uvma_tprescaler_b_dpi_mon_trn_c        )
);

   `uvm_component_utils(uvma_tprescaler_b_dpi_mon_c)
   `uvmx_mp_mon(dpi_mon_mp, dpi_mon_cb)


   /**
    * Default constructor.
    */
   function new(string name="uvma_tprescaler_b_dpi_mon", uvm_component parent=null);
      super.new(name, parent);
   endfunction

   /**
    * Samples #trn from the Data Plane Input monitor clocking block (dpi_mon_cb) on each clock cycle.
    */
   virtual task sample_trn(ref uvma_tprescaler_b_dpi_mon_trn_c trn);
      trn.write_counter_i = mp.dpi_mon_cb.write_counter_i;
      trn.counter_value_i = mp.dpi_mon_cb.counter_value_i;
   endtask


endclass : uvma_tprescaler_b_dpi_mon_c


`endif // __UVMA_TPRESCALER_B_DPI_MON_SV__