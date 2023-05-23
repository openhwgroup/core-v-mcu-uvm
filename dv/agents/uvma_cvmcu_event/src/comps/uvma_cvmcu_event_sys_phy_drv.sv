// Copyright 2023 Acme Enterprises
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMA_CVMCU_EVENT_SYS_PHY_DRV_SV__
`define __UVMA_CVMCU_EVENT_SYS_PHY_DRV_SV__


/**
 * Driver driving CORE-V-MCU Event Interface Virtual Interface (uvma_cvmcu_event_if) SYS PHY.
 * @ingroup uvma_cvmcu_event_comps
 */
class uvma_cvmcu_event_sys_phy_drv_c extends uvmx_mp_drv_c #(
   .T_MP      (virtual uvma_cvmcu_event_if.sys_phy_drv_mp),
   .T_CFG     (uvma_cvmcu_event_cfg_c  ),
   .T_CNTXT   (uvma_cvmcu_event_cntxt_c),
   .T_SEQ_ITEM(uvma_cvmcu_event_sys_phy_seq_item_c)
);

   `uvm_component_utils(uvma_cvmcu_event_sys_phy_drv_c)
   `uvmx_mp_drv(sys_phy_drv_mp, sys_phy_drv_cb)

   /**
    * Default constructor.
    */
   function new(string name="uvma_cvmcu_event_sys_phy_drv", uvm_component parent=null);
      super.new(name, parent);
   endfunction


   /**
    * Drives SYS PHY Driver clocking block (sys_phy_drv_cb) on each clock cycle.
    */
   virtual task drive_item(ref uvma_cvmcu_event_sys_phy_seq_item_c item);
      mp.sys_phy_drv_cb.timer_event_lo_o <= item.timer_event_lo_o;
      mp.sys_phy_drv_cb.timer_event_hi_o <= item.timer_event_hi_o;
      mp.sys_phy_drv_cb.err_event_o <= item.err_event_o;
      mp.sys_phy_drv_cb.fc_events_o <= item.fc_events_o;
      mp.sys_phy_drv_cb.event_fifo_valid_o <= item.event_fifo_valid_o;
      mp.sys_phy_drv_cb.cl_event_valid_o <= item.cl_event_valid_o;
      mp.sys_phy_drv_cb.cl_event_data_o <= item.cl_event_data_o;
      mp.sys_phy_drv_cb.pr_event_valid_o <= item.pr_event_valid_o;
      mp.sys_phy_drv_cb.pr_event_data_o <= item.pr_event_data_o;
   endtask

   /**
    * Samples SYS PHY Driver clocking block (sys_phy_drv_cb) after each clock cycle.
    */
   virtual task sample_post_clk(ref uvma_cvmcu_event_sys_phy_seq_item_c item);
      item.per_events_i = mp.sys_phy_drv_cb.per_events_i;
      item.cl_event_ready_i = mp.sys_phy_drv_cb.cl_event_ready_i;
      item.pr_event_ready_i = mp.sys_phy_drv_cb.pr_event_ready_i;
   endtask

endclass : uvma_cvmcu_event_sys_phy_drv_c


`endif // __UVMA_CVMCU_EVENT_SYS_PHY_DRV_SV__