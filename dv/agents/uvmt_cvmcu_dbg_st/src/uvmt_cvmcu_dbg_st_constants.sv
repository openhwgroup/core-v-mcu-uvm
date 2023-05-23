// Copyright 2023 Acme Enterprises
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMT_CVMCU_DBG_ST_CONSTANTS_SV__
`define __UVMT_CVMCU_DBG_ST_CONSTANTS_SV__


const int unsigned uvmt_cvmcu_dbg_st_default_clk_frequency = 100_000_000; ///< Default Slow frequency (100.0Mhz)
const int unsigned uvmt_cvmcu_dbg_st_default_startup_timeout          =      10_000; ///< Default Heartbeat Monitor startup timeout in ns
const int unsigned uvmt_cvmcu_dbg_st_default_heartbeat_period         =       1_000; ///< Default Heartbeat Monitor period in ns
const int unsigned uvmt_cvmcu_dbg_st_default_heartbeat_refresh_period =       5_000; ///< Default Heartbeat Monitor refresh period in ns
const int unsigned uvmt_cvmcu_dbg_st_default_simulation_timeout       =   1_000_000; ///< Default Watchdog Timer simulation timeout in ns


`endif // __UVMT_CVMCU_DBG_ST_CONSTANTS_SV__