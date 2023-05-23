// Copyright 2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMA_CVMCU_IO_IF_SV__
`define __UVMA_CVMCU_IO_IF_SV__


/**
 * Encapsulates all signals and clocking of the CORE-V-MCU IO.
 * @ingroup uvma_cvmcu_io_misc
 */
interface uvma_cvmcu_io_if(
   input  ref_clk_i, ///< Reference Clock
   input  rstn_i     ///< Active-low asynchronous reset
);

   /// @name 'PADI' signals
   /// @{
   wire [47:0]  io_in_i; ///< Port’s input signal
   /// @}

   /// @name 'PADO' signals
   /// @{
   wire      [47:0]  io_out_o  ; ///< Port's output signal
   wire [47:0][5:0]  pad_cfg_o ; ///< PAD configuration (implementation dependent)
   wire      [47:0]  io_oe_o   ; ///< Port’s Output Enable 1: IO = io_out_o. 0: io_in_i = IO.
   wire              slow_clk_o; ///< Output clock generated from ref_clk_i. Frequency is implementation dependent.
   /// @}


   /**
    * Used by uvma_cvmcu_io_board_padi_drv_c.
    */
   clocking board_padi_drv_cb @(posedge ref_clk_i);
      output io_in_i;
   endclocking

   /**
    * Used by uvma_cvmcu_io_chip_pado_drv_c.
    */
   clocking chip_pado_drv_cb @(posedge ref_clk_i);
      output io_out_o, pad_cfg_o, io_oe_o, slow_clk_o;
   endclocking

   /**
    * Used by uvma_cvmcu_io_chip_padi_drv_c.
    */
   clocking chip_padi_drv_cb @(posedge ref_clk_i);
   endclocking

   /**
    * Used by uvma_cvmcu_io_board_pado_drv_c.
    */
   clocking board_pado_drv_cb @(posedge ref_clk_i);
   endclocking

   /**
    * Used by uvma_cvmcu_io_padi_mon_c.
    */
   clocking padi_mon_cb @(posedge ref_clk_i);
      input io_in_i;
   endclocking

   /**
    * Used by uvma_cvmcu_io_pado_mon_c.
    */
   clocking pado_mon_cb @(posedge ref_clk_i);
      input io_out_o, pad_cfg_o, io_oe_o, slow_clk_o;
   endclocking


   /**
    * Used by uvma_cvmcu_io_board_padi_drv_c.
    */
   modport board_padi_drv_mp (
      clocking board_padi_drv_cb,
      input    ref_clk_i,
      input    rstn_i
   );

   /**
    * Used by uvma_cvmcu_io_chip_pado_drv_c.
    */
   modport chip_pado_drv_mp (
      clocking chip_pado_drv_cb,
      input    ref_clk_i,
      input    rstn_i
   );

   /**
    * Used by uvma_cvmcu_io_chip_padi_drv_c.
    */
   modport chip_padi_drv_mp (
      clocking chip_padi_drv_cb,
      input    ref_clk_i,
      input    rstn_i
   );

   /**
    * Used by uvma_cvmcu_io_board_pado_drv_c.
    */
   modport board_pado_drv_mp (
      clocking board_pado_drv_cb,
      input    ref_clk_i,
      input    rstn_i
   );

   /**
    * Used by uvma_cvmcu_io_padi_mon_c.
    */
   modport padi_mon_mp (
      clocking padi_mon_cb,
      input    ref_clk_i,
      input    rstn_i
   );

   /**
    * Used by uvma_cvmcu_io_pado_mon_c.
    */
   modport pado_mon_mp (
      clocking pado_mon_cb,
      input    ref_clk_i,
      input    rstn_i
   );

endinterface : uvma_cvmcu_io_if


`endif // __UVMA_CVMCU_IO_IF_SV__