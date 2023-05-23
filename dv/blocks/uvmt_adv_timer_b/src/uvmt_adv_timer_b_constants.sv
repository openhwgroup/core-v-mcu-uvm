// Copyright 2023 Acme Enterprises
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMT_ADV_TIMER_B_CONSTANTS_SV__
`define __UVMT_ADV_TIMER_B_CONSTANTS_SV__


const int unsigned uvmt_adv_timer_b_default_clk_i_frequency = 100_000_000; ///< Default  frequency (100.0Mhz)
const int unsigned uvmt_adv_timer_b_default_ls_clk_i_frequency = 50_000_000; ///< Default  frequency (50.0Mhz)
const int unsigned uvmt_adv_timer_b_default_startup_timeout          =      10_000; ///< Default Heartbeat Monitor startup timeout in ns
const int unsigned uvmt_adv_timer_b_default_heartbeat_period         =       1_000; ///< Default Heartbeat Monitor period in ns
const int unsigned uvmt_adv_timer_b_default_heartbeat_refresh_period =       5_000; ///< Default Heartbeat Monitor refresh period in ns
const int unsigned uvmt_adv_timer_b_default_simulation_timeout       =   1_000_000; ///< Default Watchdog Timer simulation timeout in ns


`endif // __UVMT_ADV_TIMER_B_CONSTANTS_SV__