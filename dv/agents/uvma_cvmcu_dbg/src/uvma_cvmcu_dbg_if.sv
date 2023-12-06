// Copyright 2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMA_CVMCU_DBG_IF_SV__
`define __UVMA_CVMCU_DBG_IF_SV__


/**
 * Encapsulates all signals and clocking of the CORE-V-MCU Debug Interface.
 * @ingroup uvma_cvmcu_dbg_misc
 */
interface uvma_cvmcu_dbg_if(

   input  clk    , ///< Slow
   input  reset_n  ///< System
);

   /// @name 'PHY' signals
   /// @{
   wire   debug_req_i; ///< Request input
   wire   stoptimer_o; ///< Timer stop output
   /// @}


   /// @name Used by uvma_cvmcu_dbg_sys_phy_drv_c
   /// @{
   clocking sys_phy_drv_cb @(posedge clk);
      output debug_req_i;
      input stoptimer_o;
   endclocking
   modport sys_phy_drv_mp (clocking sys_phy_drv_cb);
   /// @}

   /// @name Used by uvma_cvmcu_dbg_core_phy_drv_c
   /// @{
   clocking core_phy_drv_cb @(posedge clk);
      output stoptimer_o;
      input debug_req_i;
   endclocking
   modport core_phy_drv_mp (clocking core_phy_drv_cb);
   /// @}

   /// @name Used by uvma_cvmcu_dbg_phy_mon_c
   /// @{
   clocking phy_mon_cb @(posedge clk);
      input debug_req_i, stoptimer_o;
   endclocking
   modport phy_mon_mp (clocking phy_mon_cb);
   /// @}


   /// @name Accessors
   /// @{
   `uvmx_if_reset(reset_n)
   `uvmx_if_cb(sys_phy_drv_mp, sys_phy_drv_cb)
   `uvmx_if_cb(core_phy_drv_mp, core_phy_drv_cb)
   `uvmx_if_cb(phy_mon_mp, phy_mon_cb)
   `uvmx_if_signal_out(debug_req_i, , phy_mon_mp.phy_mon_cb, sys_phy_drv_mp.sys_phy_drv_cb)
   `uvmx_if_signal_out(stoptimer_o, , phy_mon_mp.phy_mon_cb, core_phy_drv_mp.core_phy_drv_cb)
   /// @}

endinterface


`endif // __UVMA_CVMCU_DBG_IF_SV__