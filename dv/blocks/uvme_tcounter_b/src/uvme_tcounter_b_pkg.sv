// Copyright 2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVME_TCOUNTER_B_PKG_SV__
`define __UVME_TCOUNTER_B_PKG_SV__


/**
 * @defgroup uvme_tcounter_b_pkg Timer unit counter Block UVM Environment
 * @{
 * @defgroup uvme_tcounter_b_comps Components
 * @defgroup uvme_tcounter_b_misc  Miscellaneous
 * @defgroup uvme_tcounter_b_obj   Objects
 * @defgroup uvme_tcounter_b_seq   Sequences
 * @{
 * @defgroup uvme_tcounter_b_seq_functional   Functional
 * @defgroup uvme_tcounter_b_seq_error   Error
 * @}
 * @}
 */


// Pre-processor macros
`include "uvm_macros.svh"
`include "uvmx_macros.svh"
`include "uvma_tcounter_b_macros.svh"
`include "uvme_tcounter_b_macros.svh"


 /**
 * Encapsulates all the types of the Timer unit counter Block UVM environment.
 * @ingroup uvme_tcounter_b_st_pkg
 */
package uvme_tcounter_b_pkg;

   import uvm_pkg    ::*;
   import uvmx_pkg   ::*;
   import uvma_tcounter_b_pkg::*;

   // Constants / Structs / Enums
   `include "uvme_tcounter_b_ftdecs.sv"
   `include "uvme_tcounter_b_tdefs.sv"
   `include "uvme_tcounter_b_constants.sv"

   // Objects
   `include "uvme_tcounter_b_cfg.sv"
   `include "uvme_tcounter_b_cntxt.sv"

   // Components
   `include "uvme_tcounter_b_sqr.sv"
   `include "uvme_tcounter_b_prd.sv"
   `include "uvme_tcounter_b_cov_model.sv"
   `include "uvme_tcounter_b_env.sv"

   // Sequences
   `include "uvme_tcounter_b_seq_lib.sv"

endpackage


`endif // __UVME_TCOUNTER_B_PKG_SV__