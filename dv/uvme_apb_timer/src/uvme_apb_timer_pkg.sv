// Copyright 2022 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVME_APB_TIMER_PKG_SV__
`define __UVME_APB_TIMER_PKG_SV__


// Doxygen Groups
/**
 * @defgroup uvme_apb_timer_pkg APB Timer Sub-System UVM Environment
 * @{
 * @defgroup uvme_apb_timer_comps Components
 * @defgroup uvme_apb_timer_misc  Miscellaneous
 * @defgroup uvme_apb_timer_obj   Objects
 * @defgroup uvme_apb_timer_reg   Register Model
 * @defgroup uvme_apb_timer_seq   Sequences & Sequence Items
 * @}
 */


// Pre-processor macros
`include "uvm_macros.svh"
`include "uvmx_macros.svh"
`include "uvma_apb_macros.svh"
`include "uvme_apb_timer_macros.svh"


// Interface(s)
`include "uvme_apb_timer_probe_if.sv"


/**
 * Encapsulates all the types of the APB Timer Sub-System UVM environment.
 * @ingroup uvme_apb_timer_pkg
 */
package uvme_apb_timer_pkg;

   import uvm_pkg    ::*;
   import uvmx_pkg   ::*;
   import uvml_sb_pkg::*;
   import uvma_apb_pkg::*;

   // Constants / Structs / Enums
   `include "uvme_apb_timer_tdefs.sv"
   `include "uvme_apb_timer_constants.sv"

   // Register Abstraction Layer
   `include "uvme_apb_timer_reg_block.sv"
   `include "uvme_apb_timer_reg_ignore_lists.sv"

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
`include "uvme_apb_timer_chkr.sv"


`endif // __UVME_APB_TIMER_PKG_SV__