// Copyright 2023 Acme Enterprises
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMA_TPRESCALER_B_CP_MON_SV__
`define __UVMA_TPRESCALER_B_CP_MON_SV__


/**
 * Monitor sampling Control Plane monitor transactions (uvma_tprescaler_b_cp_mon_trn_c) from uvma_tprescaler_b_if.
 * @ingroup uvma_tprescaler_b_comps
 */
class uvma_tprescaler_b_cp_mon_c extends uvmx_mp_mon_c #(
   .T_MP     (virtual uvma_tprescaler_b_if.cp_mon_mp),
   .T_CFG    (uvma_tprescaler_b_cfg_c               ),
   .T_CNTXT  (uvma_tprescaler_b_cntxt_c             ),
   .T_MON_TRN(uvma_tprescaler_b_cp_mon_trn_c        )
);

   `uvm_component_utils(uvma_tprescaler_b_cp_mon_c)
   `uvmx_mp_mon(cp_mon_mp, cp_mon_cb)


   /**
    * Default constructor.
    */
   function new(string name="uvma_tprescaler_b_cp_mon", uvm_component parent=null);
      super.new(name, parent);
   endfunction

   /**
    * Samples #trn from the Control Plane monitor clocking block (cp_mon_cb) on each clock cycle.
    */
   virtual task sample_trn(ref uvma_tprescaler_b_cp_mon_trn_c trn);
      trn.reset_count_i = mp.cp_mon_cb.reset_count_i;
      trn.enable_count_i = mp.cp_mon_cb.enable_count_i;
      trn.compare_value_i = mp.cp_mon_cb.compare_value_i;
   endtask


endclass : uvma_tprescaler_b_cp_mon_c


`endif // __UVMA_TPRESCALER_B_CP_MON_SV__