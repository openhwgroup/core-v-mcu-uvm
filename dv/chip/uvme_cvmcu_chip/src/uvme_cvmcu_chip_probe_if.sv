// Copyright 2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVME_CVMCU_CHIP_PROBE_IF_SV__
`define __UVME_CVMCU_CHIP_PROBE_IF_SV__


/**
 * Interface encapsulating all extra signals to/from CORE-V-MCU Chip design hierarchy.
 * @ingroup uvme_cvmcu_chip_misc
 */
interface uvme_cvmcu_chip_probe_if (
   input  ref_clk_i, ///< System clock
   input  jtag_tck_i, ///< JTAG clock
   input  rstn_i, ///< System reset
   input  jtag_trst_i ///< JTAG reset
);

   /// @name Inputs
   /// @{
   wire [0:0] bootsel_i; ///< Boot select
   wire [0:0] stm_i; ///< Structural Test Mode
   /// @}

   /// @name Outputs
   /// @{
   /// @}


   /// @name Signals clocked to 'ref_clk_i'
   /// @{
   clocking sys_clk_cb @(posedge ref_clk_i);
      output bootsel_i, stm_i;
   endclocking
   modport sys_clk_mp (clocking sys_clk_cb);
   /// @}

   /// @name Signals clocked to 'jtag_tck_i'
   /// @{
   clocking jtag_clk_cb @(posedge jtag_tck_i);
   endclocking
   modport jtag_clk_mp (clocking jtag_clk_cb);
   /// @}



   /// @name Accessors
   /// @{
   `uvmx_if_reset(rstn_i)
   `uvmx_if_reset(jtag_trst_i)
   `uvmx_if_cb(sys_clk_mp, sys_clk_cb)
   `uvmx_if_cb(jtag_clk_mp, jtag_clk_cb)
   `uvmx_if_signal_probe_out(bootsel_i, , sys_clk_mp.sys_clk_cb)
   `uvmx_if_signal_probe_out(stm_i, , sys_clk_mp.sys_clk_cb)
   /// @}

endinterface


`endif // __UVME_CVMCU_CHIP_PROBE_IF_SV__