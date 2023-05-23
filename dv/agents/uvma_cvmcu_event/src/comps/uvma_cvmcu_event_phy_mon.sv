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
      trn.timer_event_lo_o = mp.phy_mon_cb.timer_event_lo_o;
      trn.timer_event_hi_o = mp.phy_mon_cb.timer_event_hi_o;
      trn.err_event_o = mp.phy_mon_cb.err_event_o;
      trn.fc_events_o = mp.phy_mon_cb.fc_events_o;
      trn.event_fifo_valid_o = mp.phy_mon_cb.event_fifo_valid_o;
      trn.cl_event_valid_o = mp.phy_mon_cb.cl_event_valid_o;
      trn.cl_event_data_o = mp.phy_mon_cb.cl_event_data_o;
      trn.pr_event_valid_o = mp.phy_mon_cb.pr_event_valid_o;
      trn.pr_event_data_o = mp.phy_mon_cb.pr_event_data_o;
      trn.per_events_i = mp.phy_mon_cb.per_events_i;
      trn.cl_event_ready_i = mp.phy_mon_cb.cl_event_ready_i;
      trn.pr_event_ready_i = mp.phy_mon_cb.pr_event_ready_i;
   endtask


endclass : uvma_cvmcu_event_phy_mon_c


`endif // __UVMA_CVMCU_EVENT_PHY_MON_SV__