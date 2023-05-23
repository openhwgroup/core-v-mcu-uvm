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
 * @defgroup uvme_cvmcu_io_st_seq   Sequences & Sequence Items
 * @}
 */


// Pre-processor macros
`include "uvm_macros.svh"
`include "uvmx_macros.svh"
`include "uvma_i2c_macros.svh"
`include "uvma_sdio_macros.svh"
`include "uvma_uart_macros.svh"
`include "uvma_spi_macros.svh"
`include "uvma_cvmcu_cpi_macros.svh"
`include "uvml_sb_macros.svh"
`include "uvma_cvmcu_io_macros.svh"
`include "uvme_cvmcu_io_st_macros.svh"

// Interface(s)


 /**
 * Encapsulates all the types of the CORE-V-MCU IO UVM Agent Self-Test environment.
 * @ingroup uvme_cvmcu_io_st_pkg
 */
package uvme_cvmcu_io_st_pkg;

   import uvm_pkg    ::*;
   import uvmx_pkg   ::*;
   import uvma_i2c_pkg::*;
   import uvma_sdio_pkg::*;
   import uvma_uart_pkg::*;
   import uvma_spi_pkg::*;
   import uvma_cvmcu_cpi_pkg::*;
   import uvml_sb_pkg::*;
   import uvma_cvmcu_io_pkg::*;

   // Constants / Structs / Enums
   `include "uvme_cvmcu_io_st_tdefs.sv"
   `include "uvme_cvmcu_io_st_constants.sv"

   // Objects
   `include "uvme_cvmcu_io_st_cfg.sv"
   `include "uvme_cvmcu_io_st_cntxt.sv"

   // Environment components
   `include "uvme_cvmcu_io_st_cov_model.sv"
   `include "uvme_cvmcu_io_st_prd.sv"
   `include "uvme_cvmcu_io_st_sb.sv"
   `include "uvme_cvmcu_io_st_vsqr.sv"
   `include "uvme_cvmcu_io_st_env.sv"

   // Sequences
   `include "uvme_cvmcu_io_st_vseq_lib.sv"

endpackage : uvme_cvmcu_io_st_pkg


`endif // __UVME_CVMCU_IO_ST_PKG_SV__