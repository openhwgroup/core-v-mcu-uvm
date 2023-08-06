// Copyright 2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMT_APB_ADV_TIMER_SS_PKG_SV__
`define __UVMT_APB_ADV_TIMER_SS_PKG_SV__


/**
 * @defgroup uvmt_apb_adv_timer_ss_pkg APB Advanced Timer Sub-System UVM Test Bench
 * @{
 * @defgroup uvmt_apb_adv_timer_ss_misc   Miscellaneous
 * @defgroup uvmt_apb_adv_timer_ss_tb     Test Bench
 * @defgroup uvmt_apb_adv_timer_ss_tests  Tests
 * @}
 */


// Pre-processor macros
`include "uvm_macros.svh"
`include "uvmx_macros.svh"
`include "uvma_clk_macros.svh"
`include "uvma_reset_macros.svh"
`include "uvme_apb_adv_timer_ss_macros.svh"
`include "uvmt_apb_adv_timer_ss_macros.svh"

// Interface(s)


/**
 * Encapsulates all the types of the APB Advanced Timer Sub-System UVM Test Bench.
 * @ingroup uvmt_apb_adv_timer_ss_pkg
 */
package uvmt_apb_adv_timer_ss_pkg;

   import uvm_pkg       ::*;
   import uvmx_pkg      ::*;
   import uvma_clk_pkg  ::*;
   import uvma_reset_pkg::*;
   import uvme_apb_adv_timer_ss_pkg::*;

   // Constants / Structs / Enums
   `include "uvmt_apb_adv_timer_ss_tdefs.sv"
   `include "uvmt_apb_adv_timer_ss_constants.sv"

   // Tests
   `include "uvmt_apb_adv_timer_ss_test_cfg.sv"
   `include "uvmt_apb_adv_timer_ss_base_test.sv"
   `include "uvmt_apb_adv_timer_ss_reg_hw_reset_test.sv"
   `include "uvmt_apb_adv_timer_ss_reg_bit_bash_test.sv"
   `include "uvmt_apb_adv_timer_ss_reg_access_test.sv"
   `include "uvmt_apb_adv_timer_ss_mem_access_test.sv"
   `include "uvmt_apb_adv_timer_ss_shared_access_test.sv"
   `include "uvmt_apb_adv_timer_ss_mem_walk_test.sv"

endpackage : uvmt_apb_adv_timer_ss_pkg


// Module(s) / Checker(s)
`include "uvmt_apb_adv_timer_ss_dut_wrap.sv"
`include "uvmt_apb_adv_timer_ss_tb.sv"


`endif // __UVMT_APB_ADV_TIMER_SS_PKG_SV__