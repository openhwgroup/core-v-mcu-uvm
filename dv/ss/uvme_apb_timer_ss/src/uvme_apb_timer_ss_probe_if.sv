// Copyright 2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVME_APB_TIMER_SS_PROBE_IF_SV__
`define __UVME_APB_TIMER_SS_PROBE_IF_SV__


/**
 * Interface encapsulating all extra signals to/from APB simple timer unit Sub-System design hierarchy.
 * @ingroup uvme_apb_timer_ss_misc
 */
interface uvme_apb_timer_ss_probe_if (
   input  HCLK, ///< Processor clock
   input  ref_clk_i, ///< Reference clock
   input  HRESETn ///< System reset
);

   /// @name Inputs
   /// @{
   wire   stoptimer_i; ///< Stop timer input
   wire   event_lo_i; ///< Event low input
   wire   event_hi_i; ///< Event high input
   /// @}

   /// @name Outputs
   /// @{
   wire   busy_o; ///< Busy output
   /// @}


   /**
    * Signals clocked to 'HCLK'.
    */
   clocking sys_clk_cb @(posedge HCLK);
      output stoptimer_i, event_lo_i, event_hi_i;
      input busy_o;
   endclocking
   /**
    * Signals clocked to 'ref_clk_i'.
    */
   clocking ref_clk_cb @(posedge ref_clk_i);
   endclocking


   /**
    * Signals clocked to 'HCLK'.
    */
   modport sys_clk_mp (
      clocking sys_clk_cb,
      input    HCLK   );
   /**
    * Signals clocked to 'ref_clk_i'.
    */
   modport ref_clk_mp (
      clocking ref_clk_cb,
      input    ref_clk_i   );

endinterface : uvme_apb_timer_ss_probe_if


`endif // __UVME_APB_TIMER_SS_PROBE_IF_SV__