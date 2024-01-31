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
   input  jtag_trst_i, ///< JTAG reset
   uvma_spi_if  qspi_s0_if, ///< QSPI slave 0
   uvma_spi_if  qspi_s1_if, ///< QSPI slave 1
   uvma_cvmcu_cpi_if  camera_if, ///< Camera Parallel Interface transmitter
   uvma_i2c_if  i2c_s0_if, ///< I2C slave 0
   uvma_i2c_if  i2c_s1_if, ///< I2C slave 1
   uvma_uart_if  uart0_if, ///< UART 0
   uvma_uart_if  uart1_if, ///< UART 1
   uvma_sdio_if  sdio_if, ///< Flash card
   uvma_i2c_if  i2c_m_if ///< I2C master
);

   /// @name Inputs
   /// @{
   wire  bootsel_i; ///< Boot select
   wire  stm_i; ///< Structural Test Mode
   wire [47:0]  io_in_i; ///< Port’s input signal
   /// @}

   /// @name Outputs
   /// @{
   wire [47:0]  io_out_o; ///< Port's output signal
   wire [47:0][5:0]  pad_cfg_o; ///< PAD configuration (implementation dependent)
   wire [47:0]  io_oe_o; ///< Port’s Output Enable 1: IO = io_out_o. 0: io_in_i = IO.
   wire  slow_clk_o; ///< Output clock generated from ref_clk_i. Frequency is implementation dependent.
   /// @}


   /**
    * Assigns 1 to UARTs Rx.
    */
   initial begin
      force uart0_if.rx = 1;
      force uart1_if.rx = 1;
   end

   /**
    * Assigns UART0 interface signals to pins
    */
   function void assign_uart0();
      release uart0_if.rx;
      force io_in_i[ 7] = uart0_if.tx;
      force uart0_if.rx = io_out_o[8];
   endfunction

   /**
    * Assigns UART1 interface signals to pins
    */
   function void assign_uart1();
      release uart1_if.rx;
      force io_in_i[10] = uart1_if.tx;
      force uart1_if.rx = io_out_o[9];
   endfunction


   /// @name Signals clocked to 'ref_clk_i'
   /// @{
   clocking sys_clk_cb @(posedge ref_clk_i);
      output bootsel_i, stm_i, io_in_i;
      input io_out_o, pad_cfg_o, io_oe_o, slow_clk_o;
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
   `uvmx_if_signal_probe_out(bootsel_i,  , sys_clk_mp.sys_clk_cb)
   `uvmx_if_signal_probe_out(stm_i,  , sys_clk_mp.sys_clk_cb)
   `uvmx_if_signal_probe_out(io_in_i,  [47:0] , sys_clk_mp.sys_clk_cb)
   `uvmx_if_signal_probe_in(io_out_o,  [47:0] , sys_clk_mp.sys_clk_cb)
   `uvmx_if_signal_probe_in(pad_cfg_o,  [47:0][5:0] , sys_clk_mp.sys_clk_cb)
   `uvmx_if_signal_probe_in(io_oe_o,  [47:0] , sys_clk_mp.sys_clk_cb)
   `uvmx_if_signal_probe_in(slow_clk_o,  , sys_clk_mp.sys_clk_cb)
   /// @}

endinterface


`endif // __UVME_CVMCU_CHIP_PROBE_IF_SV__
