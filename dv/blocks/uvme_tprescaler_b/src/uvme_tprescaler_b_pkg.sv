// Copyright 2023 Acme Enterprises
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVME_TPRESCALER_B_PKG_SV__
`define __UVME_TPRESCALER_B_PKG_SV__


/**
 * @defgroup uvme_tprescaler_b_pkg  Block UVM Environment
 * @{
 * @defgroup uvme_tprescaler_b_comps Components
 * @defgroup uvme_tprescaler_b_misc  Miscellaneous
 * @defgroup uvme_tprescaler_b_obj   Objects
 * @defgroup uvme_tprescaler_b_seq   Sequences & Sequence Items
 * @}
 */


// Pre-processor macros
`include "uvm_macros.svh"
`include "uvmx_macros.svh"
`include "uvml_sb_macros.svh"
`include "uvma_tprescaler_b_macros.svh"
`include "uvme_tprescaler_b_macros.svh"

// Interface(s)


 /**
 * Encapsulates all the types of the  Block UVM environment.
 * @ingroup uvme_tprescaler_b_st_pkg
 */
package uvme_tprescaler_b_pkg;

   import uvm_pkg    ::*;
   import uvmx_pkg   ::*;
   import uvml_sb_pkg::*;
   import uvma_tprescaler_b_pkg::*;

   // Constants / Structs / Enums
   `include "uvme_tprescaler_b_tdefs.sv"
   `include "uvme_tprescaler_b_constants.sv"

   // Objects
   `include "uvme_tprescaler_b_cfg.sv"
   `include "uvme_tprescaler_b_cntxt.sv"

   // Components
   `include "uvme_tprescaler_b_vsqr.sv"
   `include "uvme_tprescaler_b_prd.sv"
   `include "uvme_tprescaler_b_cov_model.sv"
   `include "uvme_tprescaler_b_env.sv"

   // Sequences
   `include "uvme_tprescaler_b_vseq_lib.sv"

endpackage : uvme_tprescaler_b_pkg


// Module(s) / Checker(s)


`endif // __UVME_TPRESCALER_B_PKG_SV__