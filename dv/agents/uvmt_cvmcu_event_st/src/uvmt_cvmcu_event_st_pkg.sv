// Copyright 2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMT_CVMCU_EVENT_ST_PKG_SV__
`define __UVMT_CVMCU_EVENT_ST_PKG_SV__


/**
 * @defgroup uvmt_cvmcu_event_st_pkg CORE-V-MCU Event Interface UVM Agent Self-Test Bench
 * @{
 * @defgroup uvmt_cvmcu_event_st_misc   Miscellaneous
 * @defgroup uvmt_cvmcu_event_st_tb     Test Bench
 * @defgroup uvmt_cvmcu_event_st_tests  Tests
 * @}
 */


// Pre-processor macros
`include "uvm_macros.svh"
`include "uvmx_macros.svh"
`include "uvma_clk_macros.svh"
`include "uvma_reset_macros.svh"
`include "uvma_cvmcu_event_macros.svh"
`include "uvme_cvmcu_event_st_macros.svh"
`include "uvmt_cvmcu_event_st_macros.svh"

// Interface(s)


/**
 * Encapsulates the test library of the CORE-V-MCU Event Interface UVM Agent Self-Test Bench.
 * @ingroup uvmt_cvmcu_event_st_pkg
 */
package uvmt_cvmcu_event_st_pkg;

   import uvm_pkg       ::*;
   import uvmx_pkg      ::*;
   import uvma_clk_pkg  ::*;
   import uvma_reset_pkg::*;
   import uvma_cvmcu_event_pkg   ::*;
   import uvme_cvmcu_event_st_pkg::*;

   // Constants / Structs / Enums
   `include "uvmt_cvmcu_event_st_tdefs.sv"
   `include "uvmt_cvmcu_event_st_constants.sv"

   // Base test
   `include "uvmt_cvmcu_event_st_test_cfg.sv"
   `include "uvmt_cvmcu_event_st_base_test.sv"

   // Tests
   `include "uvmt_cvmcu_event_st_fix_stim_test.sv"
   `include "uvmt_cvmcu_event_st_rand_stim_test.sv"
   `include "uvmt_cvmcu_event_st_fix_ill_stim_test.sv"
   `include "uvmt_cvmcu_event_st_rand_ill_stim_test.sv"

endpackage : uvmt_cvmcu_event_st_pkg


// Module(s) / Checker(s)
`include "uvmt_cvmcu_event_st_dut_wrap.sv"
`include "uvmt_cvmcu_event_st_tb.sv"


`endif // __UVMT_CVMCU_EVENT_ST_PKG_SV__