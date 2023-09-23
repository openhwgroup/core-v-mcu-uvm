// Copyright 2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMT_TPRESCALER_B_PKG_SV__
`define __UVMT_TPRESCALER_B_PKG_SV__


/**
 * @defgroup uvmt_tprescaler_b_pkg Timer unit prescaler Block UVM Test Bench
 * @{
 * @defgroup uvmt_tprescaler_b_misc   Miscellaneous
 * @defgroup uvmt_tprescaler_b_tb     Test Bench
 * @defgroup uvmt_tprescaler_b_tests  Tests
 * @}
 */


// Pre-processor macros
`include "uvm_macros.svh"
`include "uvmx_macros.svh"
`include "uvma_clk_macros.svh"
`include "uvma_reset_macros.svh"
`include "uvma_tprescaler_b_macros.svh"
`include "uvme_tprescaler_b_macros.svh"
`include "uvmt_tprescaler_b_macros.svh"

// Interface(s)


/**
 * Encapsulates the test library of the Timer unit prescaler Block Self-Test Bench.
 * @ingroup uvmt_tprescaler_b_st_pkg
 */
package uvmt_tprescaler_b_pkg;

   import uvm_pkg       ::*;
   import uvmx_pkg      ::*;
   import uvma_clk_pkg  ::*;
   import uvma_reset_pkg::*;
   import uvma_tprescaler_b_pkg::*;
   import uvme_tprescaler_b_pkg::*;

   // Constants / Structs / Enums
   `include "uvmt_tprescaler_b_ftdecs.sv"
   `include "uvmt_tprescaler_b_tdefs.sv"
   `include "uvmt_tprescaler_b_constants.sv"

   // Base test
   `include "uvmt_tprescaler_b_test_cfg.sv"
   `include "uvmt_tprescaler_b_base_test.sv"

   // Tests
   `include "uvmt_tprescaler_b_fix_stim_test.sv"
   `include "uvmt_tprescaler_b_fix_ill_stim_test.sv"
   `include "uvmt_tprescaler_b_rand_stim_test.sv"
   `include "uvmt_tprescaler_b_rand_ill_stim_test.sv"

endpackage : uvmt_tprescaler_b_pkg


// Module(s) / Checker(s)
`include "uvmt_tprescaler_b_dut_wrap.sv"
`include "uvmt_tprescaler_b_tb.sv"


`endif // __UVMT_TPRESCALER_B_PKG_SV__