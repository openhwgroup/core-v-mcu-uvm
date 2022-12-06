// Copyright 2022 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMT_APB_TIMER_PKG_SV__
`define __UVMT_APB_TIMER_PKG_SV__


// Pre-processor macros
`include "uvm_macros.svh"
`include "uvmx_macros.svh"
`include "uvma_clk_macros.svh"
`include "uvma_reset_macros.svh"
`include "uvma_apb_macros.svh"
`include "uvme_apb_timer_macros.svh"
`include "uvmt_apb_timer_macros.svh"

// Time units and precision for this test bench
timeunit       1ns;
timeprecision  1ps;


/**
 * Encapsulates all the types of the APB Timer Sub-System UVM Test Bench.
 */
package uvmt_apb_timer_pkg;

   import uvm_pkg       ::*;
   import uvmx_pkg      ::*;
   import uvml_sb_pkg   ::*;
   import uvma_clk_pkg  ::*;
   import uvma_reset_pkg::*;
   import uvma_apb_pkg::*;
   import uvme_apb_timer_pkg::*;

   // Constants / Structs / Enums
   `include "uvmt_apb_timer_tdefs.sv"
   `include "uvmt_apb_timer_constants.sv"

   // Tests
   `include "uvmt_apb_timer_test_cfg.sv"
   `include "uvmt_apb_timer_base_test.sv"
   `include "uvmt_apb_timer_smoke_test.sv"
   `include "uvmt_apb_timer_reg_hw_reset_test.sv"
   `include "uvmt_apb_timer_reg_bit_bash_test.sv"
   `include "uvmt_apb_timer_reg_access_test.sv"
   `include "uvmt_apb_timer_mem_access_test.sv"
   `include "uvmt_apb_timer_shared_access_test.sv"
   `include "uvmt_apb_timer_mem_walk_test.sv"

endpackage : uvmt_apb_timer_pkg


// Module(s) / Checker(s)
`include "uvmt_apb_timer_dut_wrap.sv"
`include "uvmt_apb_timer_tb.sv"


`endif // __UVMT_APB_TIMER_PKG_SV__
