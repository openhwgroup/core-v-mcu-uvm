// Copyright 2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVME_APB_ADV_TIMER_SS_PROBE_IF_SV__
`define __UVME_APB_ADV_TIMER_SS_PROBE_IF_SV__


/**
 * Interface encapsulating all extra signals to/from APB Advanced Timer Sub-System design hierarchy.
 * @ingroup uvme_apb_adv_timer_ss_misc
 */
interface uvme_apb_adv_timer_ss_probe_if (
   input  HCLK, ///< System clock
   input  low_speed_clk_i, ///< Low speed clock
   input  HRESETn ///< System reset
);

   /// @name Inputs
   /// @{
   wire   dft_cg_enable_i; ///< Design-for-test enable
   wire [31:0]  ext_sig_i; ///< External signal
   /// @}

   /// @name Outputs
   /// @{
   /// @}


   /**
    * Signals clocked to 'HCLK'.
    */
   clocking sys_clk_cb @(posedge HCLK);
      output dft_cg_enable_i, ext_sig_i;
   endclocking
   /**
    * Signals clocked to 'low_speed_clk_i'.
    */
   clocking low_speed_clk_cb @(posedge low_speed_clk_i);
   endclocking


   /**
    * Signals clocked to 'HCLK'.
    */
   modport sys_clk_mp (
      clocking sys_clk_cb,
      input    HCLK,
      input    HRESETn
   );
   /**
    * Signals clocked to 'low_speed_clk_i'.
    */
   modport low_speed_clk_mp (
      clocking low_speed_clk_cb,
      input    low_speed_clk_i   );

endinterface : uvme_apb_adv_timer_ss_probe_if


`endif // __UVME_APB_ADV_TIMER_SS_PROBE_IF_SV__