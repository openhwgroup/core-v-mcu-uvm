// Copyright 2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMA_CVMCU_IO_TDEFS_SV__
`define __UVMA_CVMCU_IO_TDEFS_SV__


/**
 * Driving modes for uvma_cvmcu_io_agent_c when active.
 */
typedef enum {
   UVMA_CVMCU_IO_DRV_MODE_BOARD, ///< Drives BOARD
   UVMA_CVMCU_IO_DRV_MODE_CHIP  ///< Drives CHIP
} uvma_cvmcu_io_mode_enum;



/// @name Logic vectors
/// @{
typedef logic [47:0]  uvma_cvmcu_io_io_in_i_l_t; ///< Port’s input signal logic vector
typedef logic [47:0]  uvma_cvmcu_io_io_out_o_l_t; ///< Port's output signal logic vector
typedef logic [5:0]  uvma_cvmcu_io_pad_cfg_o_l_t[48]; ///< PAD configuration (implementation dependent) logic vector
typedef logic [47:0]  uvma_cvmcu_io_io_oe_o_l_t; ///< Port’s Output Enable 1: IO = io_out_o. 0: io_in_i = IO. logic vector
/// @}

/// @name Bit vectors
/// @{
typedef bit [47:0]  uvma_cvmcu_io_io_in_i_b_t; ///< Port’s input signal bit vector
typedef bit [47:0]  uvma_cvmcu_io_io_out_o_b_t; ///< Port's output signal bit vector
typedef bit [5:0]  uvma_cvmcu_io_pad_cfg_o_b_t[48]; ///< PAD configuration (implementation dependent) bit vector
typedef bit [47:0]  uvma_cvmcu_io_io_oe_o_b_t; ///< Port’s Output Enable 1: IO = io_out_o. 0: io_in_i = IO. bit vector
/// @}


`endif // __UVMA_CVMCU_IO_TDEFS_SV__