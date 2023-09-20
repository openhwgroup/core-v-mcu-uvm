// Copyright 2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMA_ADV_TIMER_B_DPI_MON_SV__
`define __UVMA_ADV_TIMER_B_DPI_MON_SV__


/**
 * Monitor sampling Data Plane Input monitor transactions (uvma_adv_timer_b_dpi_mon_trn_c) from uvma_adv_timer_b_if.
 * @ingroup uvma_adv_timer_b_comps
 */
class uvma_adv_timer_b_dpi_mon_c extends uvmx_mp_mon_c #(
   .T_MP     (virtual uvma_adv_timer_b_if.dpi_mon_mp),
   .T_CFG    (uvma_adv_timer_b_cfg_c                ),
   .T_CNTXT  (uvma_adv_timer_b_cntxt_c              ),
   .T_MON_TRN(uvma_adv_timer_b_dpi_mon_trn_c        )
);

   `uvm_component_utils(uvma_adv_timer_b_dpi_mon_c)
   `uvmx_mp_mon(dpi_mon_mp, dpi_mon_cb)


   /**
    * Default constructor.
    */
   function new(string name="uvma_adv_timer_b_dpi_mon", uvm_component parent=null);
      super.new(name, parent);
   endfunction

   /**
    * Samples #trn from the Data Plane Input monitor clocking block (dpi_mon_cb) on each clock cycle.
    */
   virtual task sample_trn(ref uvma_adv_timer_b_dpi_mon_trn_c trn);
      `uvmx_mp_mon_signal(trn, signal_i)
   endtask

   /**
    * Trims data outside configured widths.
    */
   virtual function void process_trn(ref uvma_adv_timer_b_dpi_mon_trn_c trn);
      `uvmx_trim(trn.signal_i, cfg.n_extsig)


   endfunction

endclass : uvma_adv_timer_b_dpi_mon_c


`endif // __UVMA_ADV_TIMER_B_DPI_MON_SV__