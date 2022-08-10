// Copyright 2022 Datum Technology Corporation
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVME_UDMA_RX_PKG_SV__
`define __UVME_UDMA_RX_PKG_SV__


// Doxygen Groups
/**
 * @defgroup uvme_udma_rx_pkg uDMA Rx Channels Sub-System UVM Environment
 * @{
 * @defgroup uvme_udma_rx_comps Components
 * @defgroup uvme_udma_rx_misc  Miscellaneous
 * @defgroup uvme_udma_rx_obj   Objects
 * @defgroup uvme_udma_rx_seq   Sequences & Sequence Items
 * @}
 */


// Pre-processor macros
`include "uvm_macros.svh"
`include "uvml_macros.svh"
`include "uvml_sb_macros.svh"
`include "uvml_ral_macros.svh"
`include "uvma_clk_macros.svh"
`include "uvma_reset_macros.svh"
`include "uvma_udma_rx_cp_macros.svh"
`include "uvma_udma_rx_dp_in_macros.svh"
`include "uvma_udma_rx_dp_out_macros.svh"
`include "uvme_udma_rx_macros.svh"

// Interface(s)


 /**
 * Encapsulates all the types of the uDMA Rx Channels Block UVM environment.
 */
package uvme_udma_rx_pkg;

   import uvm_pkg       ::*;
   import uvml_pkg      ::*;
   import uvml_sb_pkg   ::*;
   import uvml_ral_pkg  ::*;
   import uvma_clk_pkg  ::*;
   import uvma_reset_pkg::*;
   import uvma_udma_rx_cp_pkg    ::*;
   import uvma_udma_rx_dp_in_pkg ::*;
   import uvma_udma_rx_dp_out_pkg::*;

   // Constants / Structs / Enums
   `include "uvme_udma_rx_tdefs.sv"
   `include "uvme_udma_rx_constants.sv"

   // Objects
   `include "uvme_udma_rx_cfg.sv"
   `include "uvme_udma_rx_cntxt.sv"

   // Components
   `include "uvme_udma_rx_vsqr.sv"
   `include "uvme_udma_rx_prd.sv"
   `include "uvme_udma_rx_cov_model.sv"
   `include "uvme_udma_rx_env.sv"

   // Sequences
   `include "uvme_udma_rx_vseq_lib.sv"

endpackage : uvme_udma_rx_pkg


// Module(s) / Checker(s)
`ifdef UVME_UDMA_RX_INC_CHKR
`include "uvme_udma_rx_chkr.sv"
`endif


`endif // __UVME_UDMA_RX_PKG_SV__
