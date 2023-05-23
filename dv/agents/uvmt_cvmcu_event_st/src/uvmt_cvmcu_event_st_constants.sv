// Copyright 2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMT_CVMCU_EVENT_ST_CONSTANTS_SV__
`define __UVMT_CVMCU_EVENT_ST_CONSTANTS_SV__


const int unsigned uvmt_cvmcu_event_st_default_low_speed_clk_i_frequency = 100_000_000; ///< Default Low speed clock frequency (100.0Mhz)
const int unsigned uvmt_cvmcu_event_st_default_startup_timeout          =      10_000; ///< Default Heartbeat Monitor startup timeout in ns
const int unsigned uvmt_cvmcu_event_st_default_heartbeat_period         =       1_000; ///< Default Heartbeat Monitor period in ns
const int unsigned uvmt_cvmcu_event_st_default_heartbeat_refresh_period =       5_000; ///< Default Heartbeat Monitor refresh period in ns
const int unsigned uvmt_cvmcu_event_st_default_simulation_timeout       =   1_000_000; ///< Default Watchdog Timer simulation timeout in ns


`endif // __UVMT_CVMCU_EVENT_ST_CONSTANTS_SV__