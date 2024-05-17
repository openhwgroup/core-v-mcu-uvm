// Copyright 2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMT_CVMCU_CHIP_PKG_SV__
`define __UVMT_CVMCU_CHIP_PKG_SV__


/**
 * @defgroup uvmt_cvmcu_chip_pkg CORE-V-MCU Chip UVM Test Bench
 * @{
 * @defgroup uvmt_cvmcu_chip_misc   Miscellaneous
 * @defgroup uvmt_cvmcu_chip_tb     Test Bench
 * @defgroup uvmt_cvmcu_chip_tests  Tests
 * @{
 * @defgroup uvmt_cvmcu_chip_tests_functional   Functional
 * @}
 * @}
 */


// Pre-processor macros
`include "uvm_macros.svh"
`include "uvmx_macros.svh"
`include "uvma_clk_macros.svh"
`include "uvma_reset_macros.svh"
`include "uvme_cvmcu_chip_macros.svh"
`include "uvmt_cvmcu_chip_macros.svh"


/**
 * Encapsulates all the types of the CORE-V-MCU Chip UVM Test Bench.
 * @ingroup uvmt_cvmcu_chip_pkg
 */
package uvmt_cvmcu_chip_pkg;

   import uvm_pkg       ::*;
   import uvmx_pkg      ::*;
   import uvma_clk_pkg  ::*;
   import uvma_reset_pkg::*;
   import uvme_cvmcu_chip_pkg::*;

   // Constants / Structs / Enums
   `include "uvmt_cvmcu_chip_ftdecs.sv"
   `include "uvmt_cvmcu_chip_tdefs.sv"
   `include "uvmt_cvmcu_chip_constants.sv"

   // Tests
   `include "uvmt_cvmcu_chip_test_cfg.sv"
   `include "uvmt_cvmcu_chip_base_test.sv"
   `include "uvmt_cvmcu_chip_reg_hw_reset_test.sv"
   `include "uvmt_cvmcu_chip_reg_bit_bash_test.sv"
   `include "uvmt_cvmcu_chip_reg_access_test.sv"
   `include "uvmt_cvmcu_chip_shared_access_test.sv"
   `include "uvmt_cvmcu_chip_uart_eg_test.sv"
   `include "uvmt_cvmcu_chip_uart_ig_test.sv"

endpackage


// Module(s) / Checker(s)
`include "uvmt_cvmcu_chip_dut_wrap.sv"
`include "uvmt_cvmcu_chip_tb.sv"


`endif // __UVMT_CVMCU_CHIP_PKG_SV__