// Copyright 2022 Datum Technology Corporation
// Copyright 2022 Low Power Futures
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVME_APB_TIMER_CONSTANTS_SV__
`define __UVME_APB_TIMER_CONSTANTS_SV__


const int unsigned      uvme_apb_timer_default_sys_clk_frequency = 100_000_000; ///< Clock agent frequency (Hz)
const longint unsigned  uvme_apb_timer_default_reg_block_base_address      = 64'h0000_0000_0000_0000; ///< Register block base address
const int unsigned      uvme_apb_timer_reg_block_reg_n_bytes               = 4; ///< Width of registers (bytes)


`endif // __UVME_APB_TIMER_CONSTANTS_SV__
