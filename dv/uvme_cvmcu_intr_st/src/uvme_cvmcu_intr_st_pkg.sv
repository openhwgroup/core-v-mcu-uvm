// Copyright 2022 Datum Technology Corporation
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVME_CVMCU_INTR_ST_PKG_SV__
`define __UVME_CVMCU_INTR_ST_PKG_SV__


// Doxygen Groups
/**
 * @defgroup uvme_cvmcu_intr_st_pkg CORE-V MCU Interrupt UVM Agent Self-Test Environment
 * @{
 * @defgroup uvme_cvmcu_intr_st_comps Components
 * @defgroup uvme_cvmcu_intr_st_misc  Miscellaneous
 * @defgroup uvme_cvmcu_intr_st_obj   Objects
 * @defgroup uvme_cvmcu_intr_st_seq   Sequences & Sequence Items
 * @}
 */


// Pre-processor macros
`include "uvm_macros.svh"
`include "uvml_macros.svh"
`include "uvml_logs_macros.svh"
`include "uvml_sb_macros.svh"
`include "uvma_cvmcu_intr_macros.svh"
`include "uvme_cvmcu_intr_st_macros.svh"

// Interface(s)


 /**
 * Encapsulates all the types of the CORE-V MCU Interrupt UVM Agent Self-Test environment.
 */
package uvme_cvmcu_intr_st_pkg;

   import uvm_pkg      ::*;
   import uvml_pkg     ::*;
   import uvml_logs_pkg::*;
   import uvml_sb_pkg  ::*;
   import uvma_cvmcu_intr_pkg::*;

   // Constants / Structs / Enums
   `include "uvme_cvmcu_intr_st_tdefs.sv"
   `include "uvme_cvmcu_intr_st_constants.sv"

   // Objects
   `include "uvme_cvmcu_intr_st_cfg.sv"
   `include "uvme_cvmcu_intr_st_cntxt.sv"

   // Components
   `include "uvme_cvmcu_intr_st_vsqr.sv"
   `include "uvme_cvmcu_intr_st_prd.sv"
   `include "uvme_cvmcu_intr_st_sb.sv"
   `include "uvme_cvmcu_intr_st_cov_model.sv"
   `include "uvme_cvmcu_intr_st_env.sv"

   // Sequences
   `include "uvme_cvmcu_intr_st_vseq_lib.sv"

endpackage : uvme_cvmcu_intr_st_pkg


// Module(s) / Checker(s)
`ifdef UVME_CVMCU_INTR_ST_INC_CHKR
`include "uvme_cvmcu_intr_st_chkr.sv"
`endif


`endif // __UVME_CVMCU_INTR_ST_PKG_SV__
