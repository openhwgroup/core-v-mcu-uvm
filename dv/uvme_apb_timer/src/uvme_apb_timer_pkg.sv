// Copyright 2022 Datum Technology Corporation
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVME_APB_TIMER_PKG_SV__
`define __UVME_APB_TIMER_PKG_SV__


// Pre-processor macros
`include "uvm_macros.svh"
`include "uvml_macros.svh"
`include "uvml_sb_macros.svh"
`include "uvml_ral_macros.svh"
`include "uvma_clk_macros.svh"
`include "uvma_reset_macros.svh"
`include "uvma_apb_macros.svh"
`include "uvme_apb_timer_macros.svh"

// Interface(s)


 /**
 * Encapsulates all the types of the APB Timer Sub-System UVM environment.
 */
package uvme_apb_timer_pkg;

   import uvm_pkg       ::*;
   import uvml_pkg      ::*;
   import uvml_sb_pkg   ::*;
   import uvml_ral_pkg  ::*;
   import uvma_clk_pkg  ::*;
   import uvma_reset_pkg::*;
   import uvma_apb_pkg::*;

   // Constants / Structs / Enums
   `include "uvme_apb_timer_tdefs.sv"
   `include "uvme_apb_timer_constants.sv"

   // Register Abstraction Layer
   `include "uvme_apb_timer_reg_block.sv"

   // Objects
   `include "uvme_apb_timer_cfg.sv"
   `include "uvme_apb_timer_cntxt.sv"

   // Components
   `include "uvme_apb_timer_vsqr.sv"
   `include "uvme_apb_timer_prd.sv"
   `include "uvme_apb_timer_sb.sv"
   `include "uvme_apb_timer_cov_model.sv"
   `include "uvme_apb_timer_env.sv"

   // Sequences
   `include "uvme_apb_timer_vseq_lib.sv"

endpackage : uvme_apb_timer_pkg


// Module(s) / Checker(s)
`ifdef UVME_APB_TIMER_INC_CHKR
`include "uvme_apb_timer_chkr.sv"
`endif


`endif // __UVME_APB_TIMER_PKG_SV__
