// Copyright 2023 Acme Enterprises
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMA_CVMCU_DBG_CORE_PHY_DRV_SV__
`define __UVMA_CVMCU_DBG_CORE_PHY_DRV_SV__


/**
 * Driver driving CORE-V-MCU Debug Interface Virtual Interface (uvma_cvmcu_dbg_if) CORE PHY.
 * @ingroup uvma_cvmcu_dbg_comps
 */
class uvma_cvmcu_dbg_core_phy_drv_c extends uvmx_mp_drv_c #(
   .T_MP      (virtual uvma_cvmcu_dbg_if.core_phy_drv_mp),
   .T_CFG     (uvma_cvmcu_dbg_cfg_c  ),
   .T_CNTXT   (uvma_cvmcu_dbg_cntxt_c),
   .T_SEQ_ITEM(uvma_cvmcu_dbg_core_phy_seq_item_c)
);

   `uvm_component_utils(uvma_cvmcu_dbg_core_phy_drv_c)
   `uvmx_mp_drv(core_phy_drv_mp, core_phy_drv_cb)

   /**
    * Default constructor.
    */
   function new(string name="uvma_cvmcu_dbg_core_phy_drv", uvm_component parent=null);
      super.new(name, parent);
   endfunction


   /**
    * Drives CORE PHY Driver clocking block (core_phy_drv_cb) on each clock cycle.
    */
   virtual task drive_item(ref uvma_cvmcu_dbg_core_phy_seq_item_c item);
      mp.core_phy_drv_cb.stoptimer_o <= item.stoptimer_o;
   endtask

endclass : uvma_cvmcu_dbg_core_phy_drv_c


`endif // __UVMA_CVMCU_DBG_CORE_PHY_DRV_SV__