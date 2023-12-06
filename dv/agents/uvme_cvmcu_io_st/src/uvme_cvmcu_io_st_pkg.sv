// Copyright 2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVME_CVMCU_IO_ST_PKG_SV__
`define __UVME_CVMCU_IO_ST_PKG_SV__


/**
 * @defgroup uvme_cvmcu_io_st_pkg CORE-V-MCU IO UVM Agent Self-Test Environment
 * @{
 * @defgroup uvme_cvmcu_io_st_comps Components
 * @defgroup uvme_cvmcu_io_st_misc  Miscellaneous
 * @defgroup uvme_cvmcu_io_st_obj   Objects
 * @defgroup uvme_cvmcu_io_st_seq   Sequences
 * @{
 * @defgroup uvme_cvmcu_io_st_seq_functional   Functional
 * @defgroup uvme_cvmcu_io_st_seq_error   Error
 * @}
 * @}
 */


// Pre-processor macros
`include "uvm_macros.svh"
`include "uvmx_macros.svh"
`include "uvma_cvmcu_io_macros.svh"
`include "uvme_cvmcu_io_st_macros.svh"


 /**
 * Encapsulates all the types of the CORE-V-MCU IO UVM Agent Self-Test environment.
 * @ingroup uvme_cvmcu_io_st_pkg
 */
package uvme_cvmcu_io_st_pkg;

   import uvm_pkg ::*;
   import uvmx_pkg::*;
   import uvma_cvmcu_io_pkg::*;

   // Constants / Structs / Enums
   `include "uvme_cvmcu_io_st_ftdecs.sv"
   `include "uvme_cvmcu_io_st_tdefs.sv"
   `include "uvme_cvmcu_io_st_constants.sv"

   // Objects
   `include "uvme_cvmcu_io_st_cfg.sv"
   `include "uvme_cvmcu_io_st_cntxt.sv"

   // Environment components
   `include "uvme_cvmcu_io_st_cov_model.sv"
   `include "uvme_cvmcu_io_st_prd.sv"
   `include "uvme_cvmcu_io_st_sb.sv"
   `include "uvme_cvmcu_io_st_sqr.sv"
   `include "uvme_cvmcu_io_st_env.sv"

   // Sequences
   `include "uvme_cvmcu_io_st_seq_lib.sv"

endpackage


`endif // __UVME_CVMCU_IO_ST_PKG_SV__