// Copyright 2023 Datum Technology Corporation
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
    * Drives SYS PHY Driver clocking block (sys_phy_drv_cb) at the beginning of each clock cycle.
    */
   virtual task drive_item(ref uvma_cvmcu_event_sys_phy_seq_item_c item);
      `uvmx_mp_drv_signal(item, timer_event_lo_o)
      `uvmx_mp_drv_signal(item, timer_event_hi_o)
      `uvmx_mp_drv_signal(item, err_event_o)
      `uvmx_mp_drv_signal(item, fc_events_o)
      `uvmx_mp_drv_signal(item, event_fifo_valid_o)
      `uvmx_mp_drv_signal(item, cl_event_valid_o)
      `uvmx_mp_drv_signal(item, cl_event_data_o)
      `uvmx_mp_drv_signal(item, pr_event_valid_o)
      `uvmx_mp_drv_signal(item, pr_event_data_o)
   endtask

   /**
    * Samples SYS PHY Driver clocking block (sys_phy_drv_cb) at the end of each clock cycle.
    */
   virtual task sample_post_clk(ref uvma_cvmcu_event_sys_phy_seq_item_c item);
      `uvmx_mp_mon_signal(item, cl_event_ready_i)
      `uvmx_mp_mon_signal(item, pr_event_ready_i)
      `uvmx_mp_mon_signal(item, per_events_i)
   endtask

endclass


`endif // __UVMA_CVMCU_EVENT_SYS_PHY_DRV_SV__