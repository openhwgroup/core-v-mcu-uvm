// Copyright 2022 Datum Technology Corporation
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVME_CVMCU_CONSTANTS_SV__
`define __UVME_CVMCU_CONSTANTS_SV__


const int unsigned      uvme_cvmcu_default_sys_clk_frequency = 100_000_000; // 100 Mhz
const longint unsigned  uvme_cvmcu_default_reg_block_base_address = 64'h0000_0000_0000_0000;
const int unsigned      uvme_cvmcu_reg_block_reg_n_bytes  = 4; // bytes (B)


`endif // __UVME_CVMCU_CONSTANTS_SV__
