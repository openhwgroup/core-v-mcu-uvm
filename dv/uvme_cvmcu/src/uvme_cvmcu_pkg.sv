// Copyright 2022 Datum Technology Corporation
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVME_CVMCU_PKG_SV__
`define __UVME_CVMCU_PKG_SV__


// Pre-processor macros
`include "uvm_macros.svh"
`include "uvml_macros.svh"
`include "uvml_sb_macros.svh"
`include "uvml_ral_macros.svh"
`include "uvma_clk_macros.svh"
`include "uvma_reset_macros.svh"
`include "uvma_obi_macros.svh"
`include "uvma_cvmcu_intr_macros.svh"
`include "uvme_cvmcu_macros.svh"

// Interface(s)


 /**
 * Encapsulates all the types needed for an UVM environment capable of driving/monitoring and verifying the behavior of
 * a CORE-V MCU design.
 */
package uvme_cvmcu_pkg;

   import uvm_pkg       ::*;
   import uvml_pkg      ::*;
   import uvml_sb_pkg   ::*;
   import uvml_ral_pkg  ::*;
   import uvma_clk_pkg  ::*;
   import uvma_reset_pkg::*;
   import uvma_obi_pkg  ::*;
   import uvma_cvmcu_intr_pkg ::*;

   // Constants / Structs / Enums
   `include "uvme_cvmcu_tdefs.sv"
   `include "uvme_cvmcu_constants.sv"

   // Register Abstraction Layer
   `include "uvme_cvmcu_reg_block.sv"

   // Objects
   `include "uvme_cvmcu_cfg.sv"
   `include "uvme_cvmcu_cntxt.sv"

   // Predictor
   `include "uvme_cvmcu_prd.sv"

   // Environment components
   `include "uvme_cvmcu_cov_model.sv"
   `include "uvme_cvmcu_sb.sv"
   `include "uvme_cvmcu_vsqr.sv"
   `include "uvme_cvmcu_env.sv"

   // Sequences
   `include "uvme_cvmcu_vseq_lib.sv"

endpackage : uvme_cvmcu_pkg


// Module(s) / Checker(s)
`ifdef UVME_CVMCU_INC_CHKR
`include "uvme_cvmcu_chkr.sv"
`endif


`endif // __UVME_CVMCU_PKG_SV__
