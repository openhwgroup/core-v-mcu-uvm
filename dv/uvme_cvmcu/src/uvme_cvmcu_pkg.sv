// Copyright 2022-2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVME_CVMCU_PKG_SV__
`define __UVME_CVMCU_PKG_SV__


// Doxygen Groups
/**
 * @defgroup uvme_cvmcu_pkg CORE-V MCU UVM Environment
 * @{
 * @defgroup uvme_cvmcu_comps Components
 * @defgroup uvme_cvmcu_misc  Miscellaneous
 * @defgroup uvme_cvmcu_obj   Objects
 * @defgroup uvme_cvmcu_reg   Register Model
 * @defgroup uvme_cvmcu_seq   Sequences & Sequence Items
 * @}
 */


// Pre-processor macros
`include "uvm_macros.svh"
`include "uvmx_macros.svh"
`include "uvma_obi_macros.svh"
`include "uvma_apb_macros.svh"
`include "uvme_apb_timer_macros.svh"
`include "uvme_apb_adv_timer_macros.svh"
`include "uvme_cvmcu_macros.svh"


// Interface(s)
`include "uvme_cvmcu_probe_if.sv"


/**
 * Encapsulates all the types of the CORE-V MCU UVM environment.
 * @ingroup uvme_cvmcu_pkg
 */
package uvme_cvmcu_pkg;

   import uvm_pkg               ::*;
   import uvmx_pkg              ::*;
   import uvml_sb_pkg           ::*;
   import uvma_obi_pkg          ::*;
   import uvma_apb_pkg          ::*;
   import uvme_apb_timer_pkg    ::*;
   import uvme_apb_adv_timer_pkg::*;

   // Constants / Structs / Enums
   `include "uvme_cvmcu_tdefs.sv"
   `include "uvme_cvmcu_constants.sv"

   // Register Abstraction Layer
   `include "uvme_cvmcu_reg_block.sv"
   `include "uvme_cvmcu_reg_ignore_lists.sv"

   // Objects
   `include "uvme_cvmcu_cfg.sv"
   `include "uvme_cvmcu_cntxt.sv"

   // Components
   `include "uvme_cvmcu_vsqr.sv"
   `include "uvme_cvmcu_prd.sv"
   `include "uvme_cvmcu_sb.sv"
   `include "uvme_cvmcu_cov_model.sv"
   `include "uvme_cvmcu_env.sv"

   // Sequences
   `include "uvme_cvmcu_vseq_lib.sv"

endpackage : uvme_cvmcu_pkg


// Module(s) / Checker(s)
`include "uvme_cvmcu_chkr.sv"


`endif // __UVME_CVMCU_PKG_SV__
