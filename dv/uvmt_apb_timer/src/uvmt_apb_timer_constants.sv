// Copyright 2022 Datum Technology Corporation
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMT_APB_TIMER_CONSTANTS_SV__
`define __UVMT_APB_TIMER_CONSTANTS_SV__


const int unsigned uvmt_apb_timer_default_startup_timeout     =     10_000; ///< Default Heartbeat Monitor startup timeout in ns
const int unsigned uvmt_apb_timer_default_heartbeat_period    =     20_000; ///< Default Heartbeat Monitor period in ns
const int unsigned uvmt_apb_timer_default_simulation_timeout  = 20_000_000; ///< Default Watchdog Timer simulation timeout in ns


`endif // __UVMT_APB_TIMER_CONSTANTS_SV__
