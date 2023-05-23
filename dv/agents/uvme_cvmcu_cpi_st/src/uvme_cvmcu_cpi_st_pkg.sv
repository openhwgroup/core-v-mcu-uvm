// Copyright 2023 Acme Enterprises
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVME_CVMCU_CPI_ST_PKG_SV__
`define __UVME_CVMCU_CPI_ST_PKG_SV__


/**
 * @defgroup uvme_cvmcu_cpi_st_pkg CORE-V-MCU Camera Parallel Interface UVM Agent Self-Test Environment
 * @{
 * @defgroup uvme_cvmcu_cpi_st_comps Components
 * @defgroup uvme_cvmcu_cpi_st_misc  Miscellaneous
 * @defgroup uvme_cvmcu_cpi_st_obj   Objects
 * @defgroup uvme_cvmcu_cpi_st_seq   Sequences & Sequence Items
 * @}
 */


// Pre-processor macros
`include "uvm_macros.svh"
`include "uvmx_macros.svh"
`include "uvml_sb_macros.svh"
`include "uvma_cvmcu_cpi_macros.svh"
`include "uvme_cvmcu_cpi_st_macros.svh"

// Interface(s)


 /**
 * Encapsulates all the types of the CORE-V-MCU Camera Parallel Interface UVM Agent Self-Test environment.
 * @ingroup uvme_cvmcu_cpi_st_pkg
 */
package uvme_cvmcu_cpi_st_pkg;

   import uvm_pkg    ::*;
   import uvmx_pkg   ::*;
   import uvml_sb_pkg::*;
   import uvma_cvmcu_cpi_pkg::*;

   // Constants / Structs / Enums
   `include "uvme_cvmcu_cpi_st_tdefs.sv"
   `include "uvme_cvmcu_cpi_st_constants.sv"

   // Objects
   `include "uvme_cvmcu_cpi_st_cfg.sv"
   `include "uvme_cvmcu_cpi_st_cntxt.sv"

   // Environment components
   `include "uvme_cvmcu_cpi_st_cov_model.sv"
   `include "uvme_cvmcu_cpi_st_prd.sv"
   `include "uvme_cvmcu_cpi_st_sb.sv"
   `include "uvme_cvmcu_cpi_st_vsqr.sv"
   `include "uvme_cvmcu_cpi_st_env.sv"

   // Sequences
   `include "uvme_cvmcu_cpi_st_vseq_lib.sv"

endpackage : uvme_cvmcu_cpi_st_pkg


`endif // __UVME_CVMCU_CPI_ST_PKG_SV__