// Copyright 2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMA_TCOUNTER_B_DPI_MON_SV__
`define __UVMA_TCOUNTER_B_DPI_MON_SV__


/**
 * Monitor sampling Data Plane Input monitor transactions (uvma_tcounter_b_dpi_mon_trn_c) from uvma_tcounter_b_if.
 * @ingroup uvma_tcounter_b_comps
 */
class uvma_tcounter_b_dpi_mon_c extends uvmx_mp_mon_c #(
   .T_MP     (virtual uvma_tcounter_b_if.dpi_mon_mp),
   .T_CFG    (uvma_tcounter_b_cfg_c                ),
   .T_CNTXT  (uvma_tcounter_b_cntxt_c              ),
   .T_MON_TRN(uvma_tcounter_b_dpi_mon_trn_c        )
);

   `uvm_component_utils(uvma_tcounter_b_dpi_mon_c)
   `uvmx_mp_mon(dpi_mon_mp, dpi_mon_cb)


   /**
    * Default constructor.
    */
   function new(string name="uvma_tcounter_b_dpi_mon", uvm_component parent=null);
      super.new(name, parent);
   endfunction

   /**
    * Samples #trn from the Data Plane Input monitor clocking block (dpi_mon_cb) on each clock cycle.
    */
   virtual task sample_trn(ref uvma_tcounter_b_dpi_mon_trn_c trn);
      trn.write_counter_i = mp.dpi_mon_cb.write_counter_i;
      trn.counter_value_i = mp.dpi_mon_cb.counter_value_i;
   endtask


endclass : uvma_tcounter_b_dpi_mon_c


`endif // __UVMA_TCOUNTER_B_DPI_MON_SV__