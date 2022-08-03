// Copyright 2022 Datum Technology Corporation
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMT_CVMCU_INTR_ST_PKG_SV__
`define __UVMT_CVMCU_INTR_ST_PKG_SV__


// Doxygen Groups
/**
 * @defgroup uvmt_cvmcu_intr_st_pkg CORE-V MCU Interrupt UVM Agent Self-Test Bench
 * @{
 * @defgroup uvmt_cvmcu_intr_st_misc   Miscellaneous
 * @defgroup uvmt_cvmcu_intr_st_tb     Test Bench
 * @defgroup uvmt_cvmcu_intr_st_tests  Tests
 * @}
 */


// Pre-processor macros
`include "uvm_macros.svh"
`include "uvml_macros.svh"
`include "uvml_logs_macros.svh"
`include "uvml_sb_macros.svh"
`include "uvma_cvmcu_intr_macros.svh"
`include "uvme_cvmcu_intr_st_macros.svh"
`include "uvmt_cvmcu_intr_st_macros.svh"

// Time units and precision for this test bench
timeunit       1ns;
timeprecision  1ps;

// Interface(s)
`include "uvmt_cvmcu_intr_st_clknrst_gen_if.sv"


/**
 * Encapsulates the test library of the CORE-V MCU Interrupt UVM Agent Self-Test Bench.
 * @ingroup uvmt_cvmcu_intr_st_pkg
 */
package uvmt_cvmcu_intr_st_pkg;

   import uvm_pkg      ::*;
   import uvml_pkg     ::*;
   import uvml_logs_pkg::*;
   import uvml_sb_pkg  ::*;
   import uvma_cvmcu_intr_pkg::*;
   import uvme_cvmcu_intr_st_pkg::*;

   // Constants / Structs / Enums
   `include "uvmt_cvmcu_intr_st_tdefs.sv"
   `include "uvmt_cvmcu_intr_st_constants.sv"

   // Tests
   `include "uvmt_cvmcu_intr_st_test_cfg.sv"
   `include "uvmt_cvmcu_intr_st_base_test.sv"
   `include "uvmt_cvmcu_intr_st_rand_stim_test.sv"

endpackage : uvmt_cvmcu_intr_st_pkg


// Module(s) / Checker(s)
`include "uvmt_cvmcu_intr_st_dut_wrap.sv"
`include "uvmt_cvmcu_intr_st_dut_chkr.sv"
`include "uvmt_cvmcu_intr_st_tb.sv"


`endif // __UVMT_CVMCU_INTR_ST_PKG_SV__
