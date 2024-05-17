// Copyright 2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVME_ADV_TIMER_B_PKG_SV__
`define __UVME_ADV_TIMER_B_PKG_SV__


/**
 * @defgroup uvme_adv_timer_b_pkg Advanced timer counter Block UVM Environment
 * @{
 * @defgroup uvme_adv_timer_b_comps Components
 * @defgroup uvme_adv_timer_b_misc  Miscellaneous
 * @defgroup uvme_adv_timer_b_obj   Objects
 * @defgroup uvme_adv_timer_b_seq   Sequences
 * @{
 * @defgroup uvme_adv_timer_b_seq_functional   Functional
 * @defgroup uvme_adv_timer_b_seq_error   Error
 * @}
 * @}
 */


// Pre-processor macros
`include "uvm_macros.svh"
`include "uvmx_macros.svh"
`include "uvma_adv_timer_b_macros.svh"
`include "uvme_adv_timer_b_macros.svh"


 /**
 * Encapsulates all the types of the Advanced timer counter Block UVM environment.
 * @ingroup uvme_adv_timer_b_st_pkg
 */
package uvme_adv_timer_b_pkg;

   import uvm_pkg    ::*;
   import uvmx_pkg   ::*;
   import uvma_adv_timer_b_pkg::*;

   // Constants / Structs / Enums
   `include "uvme_adv_timer_b_ftdecs.sv"
   `include "uvme_adv_timer_b_tdefs.sv"
   `include "uvme_adv_timer_b_constants.sv"

   // Objects
   `include "uvme_adv_timer_b_cfg.sv"
   `include "uvme_adv_timer_b_cntxt.sv"

   // Components
   `include "uvme_adv_timer_b_sqr.sv"
   `include "uvme_adv_timer_b_prd.sv"
   `include "uvme_adv_timer_b_cov_model.sv"
   `include "uvme_adv_timer_b_env.sv"

   // Sequences
   `include "uvme_adv_timer_b_seq_lib.sv"

endpackage


`endif // __UVME_ADV_TIMER_B_PKG_SV__