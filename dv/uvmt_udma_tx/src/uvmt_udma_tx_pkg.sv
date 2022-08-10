// Copyright 2022 Datum Technology Corporation
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMT_UDMA_TX_PKG_SV__
`define __UVMT_UDMA_TX_PKG_SV__


// Doxygen Groups
/**
 * @defgroup uvmt_udma_tx_pkg uDMA Tx Channels Block UVM Test Bench
 * @{
 * @defgroup uvmt_udma_tx_misc   Miscellaneous
 * @defgroup uvmt_udma_tx_tb     Test Bench
 * @defgroup uvmt_udma_tx_tests  Tests
 * @}
 */


// Pre-processor macros
`include "uvm_macros.svh"
`include "uvml_macros.svh"
`include "uvml_logs_macros.svh"
`include "uvma_clk_macros.svh"
`include "uvma_reset_macros.svh"
`include "uvma_udma_tx_cp_macros.svh"
`include "uvma_udma_tx_dp_in_macros.svh"
`include "uvma_udma_tx_dp_out_macros.svh"
`include "uvme_udma_tx_macros.svh"
`include "uvmt_udma_tx_macros.svh"

// Time units and precision for this test bench
timeunit       1ns;
timeprecision  1ps;

// Interface(s)
`include "uvmt_udma_tx_probe_if.sv"


/**
 * Encapsulates all the types of the uDMA Tx Channels Block UVM Test Bench.
 */
package uvmt_udma_tx_pkg;

   import uvm_pkg       ::*;
   import uvml_pkg      ::*;
   import uvml_logs_pkg ::*;
   import uvml_sb_pkg   ::*;
   import uvml_ral_pkg  ::*;
   import uvma_clk_pkg  ::*;
   import uvma_reset_pkg::*;
   import uvma_udma_tx_cp_pkg    ::*;
   import uvma_udma_tx_dp_in_pkg ::*;
   import uvma_udma_tx_dp_out_pkg::*;
   import uvme_udma_tx_pkg       ::*;

   // Constants / Structs / Enums
   `include "uvmt_udma_tx_tdefs.sv"
   `include "uvmt_udma_tx_constants.sv"

   // Tests
   `include "uvmt_udma_tx_test_cfg.sv"
   `include "uvmt_udma_tx_base_test.sv"
   `include "uvmt_udma_tx_rand_stim_test.sv"

endpackage : uvmt_udma_tx_pkg


// Module(s) / Checker(s)
`include "uvmt_udma_tx_dut_wrap.sv"
`include "uvmt_udma_tx_dut_chkr.sv"
`include "uvmt_udma_tx_tb.sv"


`endif // __UVMT_UDMA_TX_PKG_SV__
