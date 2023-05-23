// Copyright 2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMA_TCOUNTER_B_DPO_MON_SV__
`define __UVMA_TCOUNTER_B_DPO_MON_SV__


/**
 * Monitor sampling Data Plane Output monitor transactions (uvma_tcounter_b_dpo_mon_trn_c) from uvma_tcounter_b_if.
 * @ingroup uvma_tcounter_b_comps
 */
class uvma_tcounter_b_dpo_mon_c extends uvmx_mp_mon_c #(
   .T_MP     (virtual uvma_tcounter_b_if.dpo_mon_mp),
   .T_CFG    (uvma_tcounter_b_cfg_c                ),
   .T_CNTXT  (uvma_tcounter_b_cntxt_c              ),
   .T_MON_TRN(uvma_tcounter_b_dpo_mon_trn_c        )
);

   `uvm_component_utils(uvma_tcounter_b_dpo_mon_c)
   `uvmx_mp_mon(dpo_mon_mp, dpo_mon_cb)


   /**
    * Default constructor.
    */
   function new(string name="uvma_tcounter_b_dpo_mon", uvm_component parent=null);
      super.new(name, parent);
   endfunction

   /**
    * Samples #trn from the Data Plane Output monitor clocking block (dpi_mon_cb) on each clock cycle.
    */
   virtual task sample_trn(ref uvma_tcounter_b_dpo_mon_trn_c trn);
      trn.counter_value_o = mp.dpo_mon_cb.counter_value_o;
      trn.target_reached_o = mp.dpo_mon_cb.target_reached_o;
      trn.target_greater_o = mp.dpo_mon_cb.target_greater_o;
   endtask


endclass : uvma_tcounter_b_dpo_mon_c


`endif // __UVMA_TCOUNTER_B_DPO_MON_SV__