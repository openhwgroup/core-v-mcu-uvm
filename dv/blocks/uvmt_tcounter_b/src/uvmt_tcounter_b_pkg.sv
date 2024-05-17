// Copyright 2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMT_TCOUNTER_B_PKG_SV__
`define __UVMT_TCOUNTER_B_PKG_SV__


/**
 * @defgroup uvmt_tcounter_b_pkg Timer unit counter Block UVM Test Bench
 * @{
 * @defgroup uvmt_tcounter_b_misc   Miscellaneous
 * @defgroup uvmt_tcounter_b_tb     Test Bench
 * @defgroup uvmt_tcounter_b_tests  Tests
 * @{
 * @defgroup uvmt_tcounter_b_tests_functional   Functional
 * @defgroup uvmt_tcounter_b_tests_error   Error
 * @}
 * @}
 */


// Pre-processor macros
`include "uvm_macros.svh"
`include "uvmx_macros.svh"
`include "uvma_clk_macros.svh"
`include "uvma_reset_macros.svh"
`include "uvma_tcounter_b_macros.svh"
`include "uvme_tcounter_b_macros.svh"
`include "uvmt_tcounter_b_macros.svh"


/**
 * Encapsulates the test library of the Timer unit counter Block Self-Test Bench.
 * @ingroup uvmt_tcounter_b_st_pkg
 */
package uvmt_tcounter_b_pkg;

   import uvm_pkg       ::*;
   import uvmx_pkg      ::*;
   import uvma_clk_pkg  ::*;
   import uvma_reset_pkg::*;
   import uvma_tcounter_b_pkg::*;
   import uvme_tcounter_b_pkg::*;

   // Constants / Structs / Enums
   `include "uvmt_tcounter_b_ftdecs.sv"
   `include "uvmt_tcounter_b_tdefs.sv"
   `include "uvmt_tcounter_b_constants.sv"

   // Base test
   `include "uvmt_tcounter_b_test_cfg.sv"
   `include "uvmt_tcounter_b_base_test.sv"

   // Tests

endpackage


// Module(s) / Checker(s)
`include "uvmt_tcounter_b_dut_wrap.sv"
`include "uvmt_tcounter_b_tb.sv"


`endif // __UVMT_TCOUNTER_B_PKG_SV__