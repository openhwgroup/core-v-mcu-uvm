// Copyright 2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVME_APB_ADV_TIMER_SS_PKG_SV__
`define __UVME_APB_ADV_TIMER_SS_PKG_SV__


/**
 * @defgroup uvme_apb_adv_timer_ss_pkg APB Advanced Timer Sub-System UVM Environment
 * @{
 * @defgroup uvme_apb_adv_timer_ss_comps Components
 * @defgroup uvme_apb_adv_timer_ss_misc  Miscellaneous
 * @defgroup uvme_apb_adv_timer_ss_obj   Objects
 * @defgroup uvme_apb_adv_timer_ss_reg   Register Model
 * @defgroup uvme_apb_adv_timer_ss_seq   Sequences & Sequence Items
 * @}
 */


// Pre-processor macros
`include "uvm_macros.svh"
`include "uvmx_macros.svh"
`include "uvma_irq_macros.svh"
`include "uvma_adv_timer_b_macros.svh"
`include "uvme_adv_timer_b_macros.svh"
`include "uvma_apb_macros.svh"
`include "uvme_apb_adv_timer_ss_macros.svh"

// Interface(s)
`include "uvme_apb_adv_timer_ss_probe_if.sv"


/**
 * Encapsulates all the types of the APB Advanced Timer Sub-System UVM environment.
 * @ingroup uvme_apb_adv_timer_ss_pkg
 */
package uvme_apb_adv_timer_ss_pkg;

   import uvm_pkg    ::*;
   import uvmx_pkg   ::*;
   import uvma_irq_pkg::*;
   import uvma_adv_timer_b_pkg::*;
   import uvme_adv_timer_b_pkg::*;
   import uvma_apb_pkg::*;

   // Constants / Structs / Enums
   `include "uvme_apb_adv_timer_ss_ftdecs.sv"
   `include "uvme_apb_adv_timer_ss_tdefs.sv"
   `include "uvme_apb_adv_timer_ss_constants.sv"

   // Register Abstraction Layer
   `include "uvme_apb_adv_timer_ss_reg_block.sv"
   `include "uvme_apb_adv_timer_ss_reg_ignore_lists.sv"

   // Objects
   `include "uvme_apb_adv_timer_ss_cfg.sv"
   `include "uvme_apb_adv_timer_ss_cntxt.sv"

   // Components
   `include "uvme_apb_adv_timer_ss_vsqr.sv"
   `include "uvme_apb_adv_timer_ss_prd.sv"
   `include "uvme_apb_adv_timer_ss_sb.sv"
   `include "uvme_apb_adv_timer_ss_cov_model.sv"
   `include "uvme_apb_adv_timer_ss_env.sv"

   // Sequences
   `include "uvme_apb_adv_timer_ss_base_vseq.sv"
   `include "uvme_apb_adv_timer_ss_init_vseq.sv"
   `include "uvme_apb_adv_timer_ss_cfg_vseq.sv"
   `include "uvme_apb_adv_timer_ss_vseq_lib.sv"

endpackage : uvme_apb_adv_timer_ss_pkg


// Module(s) / Checker(s)
`include "uvme_apb_adv_timer_ss_chkr.sv"


`endif // __UVME_APB_ADV_TIMER_SS_PKG_SV__