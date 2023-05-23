// Copyright 2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMA_CVMCU_DBG_PHY_MON_SV__
`define __UVMA_CVMCU_DBG_PHY_MON_SV__


/**
 * Monitor sampling PHY Monitor Transactions (uvma_cvmcu_dbg_phy_mon_trn_c).
 * @ingroup uvma_cvmcu_dbg_comps
 */
class uvma_cvmcu_dbg_phy_mon_c extends uvmx_mp_mon_c #(
   .T_MP     (virtual uvma_cvmcu_dbg_if.phy_mon_mp),
   .T_CFG    (uvma_cvmcu_dbg_cfg_c  ),
   .T_CNTXT  (uvma_cvmcu_dbg_cntxt_c),
   .T_MON_TRN(uvma_cvmcu_dbg_phy_mon_trn_c)
);

   `uvm_component_utils(uvma_cvmcu_dbg_phy_mon_c)
   `uvmx_mp_mon(phy_mon_mp, phy_mon_cb)


   /**
    * Default constructor.
    */
   function new(string name="uvma_cvmcu_dbg_phy_mon", uvm_component parent=null);
      super.new(name, parent);
   endfunction

   /**
    * Samples #trn from the PHY Monitor modport (phy_mon_cb) on each clock cycle.
    */
   virtual task sample_trn(ref uvma_cvmcu_dbg_phy_mon_trn_c trn);
      trn.debug_req_i = mp.phy_mon_cb.debug_req_i;
      trn.stoptimer_o = mp.phy_mon_cb.stoptimer_o;
   endtask


endclass : uvma_cvmcu_dbg_phy_mon_c


`endif // __UVMA_CVMCU_DBG_PHY_MON_SV__