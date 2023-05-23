// Copyright 2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVME_CVMCU_CHIP_PKG_SV__
`define __UVME_CVMCU_CHIP_PKG_SV__


/**
 * @defgroup uvme_cvmcu_chip_pkg CORE-V-MCU Chip UVM Environment
 * @{
 * @defgroup uvme_cvmcu_chip_comps Components
 * @defgroup uvme_cvmcu_chip_misc  Miscellaneous
 * @defgroup uvme_cvmcu_chip_obj   Objects
 * @defgroup uvme_cvmcu_chip_reg   Register Model
 * @defgroup uvme_cvmcu_chip_seq   Sequences & Sequence Items
 * @}
 */


// Pre-processor macros
`include "uvm_macros.svh"
`include "uvmx_macros.svh"
`include "uvml_sb_macros.svh"
`include "uvme_apb_timer_ss_macros.svh"
`include "uvme_apb_adv_timer_ss_macros.svh"
`include "uvma_jtag_macros.svh"
`include "uvma_spi_macros.svh"
`include "uvma_cvmcu_cpi_macros.svh"
`include "uvma_i2c_macros.svh"
`include "uvma_apb_macros.svh"
`include "uvma_uart_macros.svh"
`include "uvma_sdio_macros.svh"
`include "uvma_cvmcu_io_macros.svh"
`include "uvma_obi_macros.svh"
`include "uvma_cvmcu_event_macros.svh"
`include "uvma_cvmcu_dbg_macros.svh"
`include "uvme_cvmcu_chip_macros.svh"

// Interface(s)
`include "uvme_cvmcu_chip_probe_if.sv"


/**
 * Encapsulates all the types of the CORE-V-MCU Chip UVM environment.
 * @ingroup uvme_cvmcu_chip_pkg
 */
package uvme_cvmcu_chip_pkg;

   import uvm_pkg    ::*;
   import uvmx_pkg   ::*;
   import uvml_sb_pkg::*;
   import uvme_apb_timer_ss_pkg::*;
   import uvme_apb_adv_timer_ss_pkg::*;
   import uvma_jtag_pkg::*;
   import uvma_spi_pkg::*;
   import uvma_cvmcu_cpi_pkg::*;
   import uvma_i2c_pkg::*;
   import uvma_apb_pkg::*;
   import uvma_uart_pkg::*;
   import uvma_sdio_pkg::*;
   import uvma_cvmcu_io_pkg::*;
   import uvma_obi_pkg::*;
   import uvma_cvmcu_event_pkg::*;
   import uvma_cvmcu_dbg_pkg::*;

   // Constants / Structs / Enums
   `include "uvme_cvmcu_chip_tdefs.sv"
   `include "uvme_cvmcu_chip_constants.sv"

   // Register Abstraction Layer
   `include "uvme_cvmcu_chip_reg_block.sv"
   `include "uvme_cvmcu_chip_reg_ignore_lists.sv"

   // Objects
   `include "uvme_cvmcu_chip_cfg.sv"
   `include "uvme_cvmcu_chip_cntxt.sv"

   // Components
   `include "uvme_cvmcu_chip_vsqr.sv"
   `include "uvme_cvmcu_chip_prd.sv"
   `include "uvme_cvmcu_chip_sb.sv"
   `include "uvme_cvmcu_chip_cov_model.sv"
   `include "uvme_cvmcu_chip_env.sv"

   // Sequences
   `include "uvme_cvmcu_chip_vseq_lib.sv"

endpackage : uvme_cvmcu_chip_pkg


// Module(s) / Checker(s)
`include "uvme_cvmcu_chip_chkr.sv"


`endif // __UVME_CVMCU_CHIP_PKG_SV__