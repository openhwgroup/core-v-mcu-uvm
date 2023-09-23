// Copyright 2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMT_ADV_TIMER_B_PKG_SV__
`define __UVMT_ADV_TIMER_B_PKG_SV__


/**
 * @defgroup uvmt_adv_timer_b_pkg Advanced timer counter Block UVM Test Bench
 * @{
 * @defgroup uvmt_adv_timer_b_misc   Miscellaneous
 * @defgroup uvmt_adv_timer_b_tb     Test Bench
 * @defgroup uvmt_adv_timer_b_tests  Tests
 * @}
 */


// Pre-processor macros
`include "uvm_macros.svh"
`include "uvmx_macros.svh"
`include "uvma_clk_macros.svh"
`include "uvma_reset_macros.svh"
`include "uvma_adv_timer_b_macros.svh"
`include "uvme_adv_timer_b_macros.svh"
`include "uvmt_adv_timer_b_macros.svh"

// Interface(s)


/**
 * Encapsulates the test library of the Advanced timer counter Block Self-Test Bench.
 * @ingroup uvmt_adv_timer_b_st_pkg
 */
package uvmt_adv_timer_b_pkg;

   import uvm_pkg       ::*;
   import uvmx_pkg      ::*;
   import uvma_clk_pkg  ::*;
   import uvma_reset_pkg::*;
   import uvma_adv_timer_b_pkg::*;
   import uvme_adv_timer_b_pkg::*;

   // Constants / Structs / Enums
   `include "uvmt_adv_timer_b_ftdecs.sv"
   `include "uvmt_adv_timer_b_tdefs.sv"
   `include "uvmt_adv_timer_b_constants.sv"

   // Base test
   `include "uvmt_adv_timer_b_test_cfg.sv"
   `include "uvmt_adv_timer_b_base_test.sv"

   // Tests
   `include "uvmt_adv_timer_b_fix_stim_test.sv"
   `include "uvmt_adv_timer_b_fix_ill_stim_test.sv"
   `include "uvmt_adv_timer_b_rand_stim_test.sv"
   `include "uvmt_adv_timer_b_rand_ill_stim_test.sv"

endpackage : uvmt_adv_timer_b_pkg


// Module(s) / Checker(s)
`include "uvmt_adv_timer_b_dut_wrap.sv"
`include "uvmt_adv_timer_b_tb.sv"


`endif // __UVMT_ADV_TIMER_B_PKG_SV__