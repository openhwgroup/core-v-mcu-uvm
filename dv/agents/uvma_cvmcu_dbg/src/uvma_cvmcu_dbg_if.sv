// Copyright 2023 Acme Enterprises
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


   /**
    * Used by uvma_cvmcu_dbg_sys_phy_drv_c.
    */
   clocking sys_phy_drv_cb @(posedge clk);
      output debug_req_i;
      input stoptimer_o;
   endclocking

   /**
    * Used by uvma_cvmcu_dbg_core_phy_drv_c.
    */
   clocking core_phy_drv_cb @(posedge clk);
      output stoptimer_o;
   endclocking

   /**
    * Used by uvma_cvmcu_dbg_phy_mon_c.
    */
   clocking phy_mon_cb @(posedge clk);
      input debug_req_i, stoptimer_o;
   endclocking


   /**
    * Used by uvma_cvmcu_dbg_sys_phy_drv_c.
    */
   modport sys_phy_drv_mp (
      clocking sys_phy_drv_cb,
      input    clk,
      input    reset_n
   );

   /**
    * Used by uvma_cvmcu_dbg_core_phy_drv_c.
    */
   modport core_phy_drv_mp (
      clocking core_phy_drv_cb,
      input    clk,
      input    reset_n
   );

   /**
    * Used by uvma_cvmcu_dbg_phy_mon_c.
    */
   modport phy_mon_mp (
      clocking phy_mon_cb,
      input    clk,
      input    reset_n
   );

endinterface : uvma_cvmcu_dbg_if


`endif // __UVMA_CVMCU_DBG_IF_SV__