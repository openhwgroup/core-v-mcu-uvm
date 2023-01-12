// Copyright 2022-2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMT_CVMCU_PKG_SV__
`define __UVMT_CVMCU_PKG_SV__


// Pre-processor macros
`include "uvm_macros.svh"
`include "uvmx_macros.svh"
`include "uvma_clk_macros.svh"
`include "uvma_reset_macros.svh"
`include "uvma_obi_macros.svh"
`include "uvme_cvmcu_macros.svh"
`include "uvmt_cvmcu_macros.svh"

// Time units and precision for this test bench
timeunit       1ns;
timeprecision  1ps;


/**
 * Encapsulates all the types of the CORE-V MCU Sub-System UVM Test Bench.
 */
package uvmt_cvmcu_pkg;

   import uvm_pkg       ::*;
   import uvmx_pkg      ::*;
   import uvml_sb_pkg   ::*;
   import uvma_clk_pkg  ::*;
   import uvma_reset_pkg::*;
   import uvma_obi_pkg  ::*;
   import uvme_cvmcu_pkg::*;

   // Constants / Structs / Enums
   `include "uvmt_cvmcu_tdefs.sv"
   `include "uvmt_cvmcu_constants.sv"

   // Tests
   `include "uvmt_cvmcu_test_cfg.sv"
   `include "uvmt_cvmcu_base_test.sv"
   `include "uvmt_cvmcu_smoke_test.sv"
   `include "uvmt_cvmcu_reg_hw_reset_test.sv"
   `include "uvmt_cvmcu_reg_bit_bash_test.sv"
   `include "uvmt_cvmcu_reg_access_test.sv"
   `include "uvmt_cvmcu_mem_access_test.sv"
   `include "uvmt_cvmcu_shared_access_test.sv"
   `include "uvmt_cvmcu_mem_walk_test.sv"

endpackage : uvmt_cvmcu_pkg


// Module(s) / Checker(s)
`include "uvmt_cvmcu_dut_wrap.sv"
`include "uvmt_cvmcu_tb.sv"


`endif // __UVMT_CVMCU_PKG_SV__
