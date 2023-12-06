// Copyright 2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMA_TCOUNTER_B_CP_MON_SV__
`define __UVMA_TCOUNTER_B_CP_MON_SV__


/**
 * Monitor sampling Control Plane monitor transactions (uvma_tcounter_b_cp_mon_trn_c) from uvma_tcounter_b_if.
 * @ingroup uvma_tcounter_b_comps
 */
class uvma_tcounter_b_cp_mon_c extends uvmx_mp_mon_c #(
   .T_MP     (virtual uvma_tcounter_b_if.cp_mon_mp),
   .T_CFG    (uvma_tcounter_b_cfg_c               ),
   .T_CNTXT  (uvma_tcounter_b_cntxt_c             ),
   .T_MON_TRN(uvma_tcounter_b_cp_mon_trn_c        )
);

   `uvm_component_utils(uvma_tcounter_b_cp_mon_c)
   `uvmx_mp_mon(cp_mon_mp, cp_mon_cb)


   /**
    * Default constructor.
    */
   function new(string name="uvma_tcounter_b_cp_mon", uvm_component parent=null);
      super.new(name, parent);
   endfunction

   /**
    * Samples #trn from the Control Plane monitor clocking block (cp_mon_cb) on each clock cycle.
    */
   virtual task sample_trn(ref uvma_tcounter_b_cp_mon_trn_c trn);
      `uvmx_mp_mon_signal(trn, reset_count_i)
      `uvmx_mp_mon_signal(trn, enable_count_i)
      `uvmx_mp_mon_signal(trn, compare_value_i)
   endtask


endclass


`endif // __UVMA_TCOUNTER_B_CP_MON_SV__