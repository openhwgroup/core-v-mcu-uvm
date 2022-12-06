// Copyright 2022 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMT_APB_ADV_TIMER_CONSTANTS_SV__
`define __UVMT_APB_ADV_TIMER_CONSTANTS_SV__


const int unsigned uvmt_apb_adv_timer_default_sys_clk_frequency = 100_000_000; ///< Default clock frequency (100Mhz)
const int unsigned uvmt_apb_adv_timer_default_startup_timeout          =      10_000; ///< Default Heartbeat Monitor startup timeout in ns
const int unsigned uvmt_apb_adv_timer_default_heartbeat_period         =       1_000; ///< Default Heartbeat Monitor period in ns
const int unsigned uvmt_apb_adv_timer_default_heartbeat_refresh_period =       5_000; ///< Default Heartbeat Monitor refresh period in ns
const int unsigned uvmt_apb_adv_timer_default_simulation_timeout       =   1_000_000; ///< Default Watchdog Timer simulation timeout in ns


`endif // __UVMT_APB_ADV_TIMER_CONSTANTS_SV__