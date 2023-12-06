// Copyright 2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMA_CVMCU_EVENT_PHY_MON_SV__
`define __UVMA_CVMCU_EVENT_PHY_MON_SV__


/**
 * Monitor sampling PHY Monitor Transactions (uvma_cvmcu_event_phy_mon_trn_c).
 * @ingroup uvma_cvmcu_event_comps
 */
class uvma_cvmcu_event_phy_mon_c extends uvmx_mp_mon_c #(
   .T_MP     (virtual uvma_cvmcu_event_if.phy_mon_mp),
   .T_CFG    (uvma_cvmcu_event_cfg_c  ),
   .T_CNTXT  (uvma_cvmcu_event_cntxt_c),
   .T_MON_TRN(uvma_cvmcu_event_phy_mon_trn_c)
);

   `uvm_component_utils(uvma_cvmcu_event_phy_mon_c)
   `uvmx_mp_mon(phy_mon_mp, phy_mon_cb)


   /**
    * Default constructor.
    */
   function new(string name="uvma_cvmcu_event_phy_mon", uvm_component parent=null);
      super.new(name, parent);
   endfunction

   /**
    * Samples #trn from the PHY Monitor modport (phy_mon_cb) on each clock cycle.
    */
   virtual task sample_trn(ref uvma_cvmcu_event_phy_mon_trn_c trn);
      `uvmx_mp_mon_signal(trn, timer_event_lo_o)
      `uvmx_mp_mon_signal(trn, timer_event_hi_o)
      `uvmx_mp_mon_signal(trn, err_event_o)
      `uvmx_mp_mon_signal(trn, fc_events_o)
      `uvmx_mp_mon_signal(trn, event_fifo_valid_o)
      `uvmx_mp_mon_signal(trn, cl_event_valid_o)
      `uvmx_mp_mon_signal(trn, cl_event_data_o)
      `uvmx_mp_mon_signal(trn, pr_event_valid_o)
      `uvmx_mp_mon_signal(trn, pr_event_data_o)
      `uvmx_mp_mon_signal(trn, cl_event_ready_i)
      `uvmx_mp_mon_signal(trn, pr_event_ready_i)
      `uvmx_mp_mon_signal(trn, per_events_i)
   endtask


endclass


`endif // __UVMA_CVMCU_EVENT_PHY_MON_SV__