// Copyright 2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMA_CVMCU_IO_PKG_SV__
`define __UVMA_CVMCU_IO_PKG_SV__


/**
 * @defgroup uvma_cvmcu_io_pkg CORE-V-MCU IO UVM Agent
 * @{
 * @defgroup uvma_cvmcu_io_comps Components
 * @defgroup uvma_cvmcu_io_misc  Miscellaneous
 * @defgroup uvma_cvmcu_io_obj   Objects
 * @defgroup uvma_cvmcu_io_seq   Sequences & Sequence Items
 * @}
 */


// Pre-processor macros
`include "uvm_macros.svh"
`include "uvmx_macros.svh"
`include "uvma_cvmcu_io_macros.svh"

// Interface(s)
`include "uvma_cvmcu_io_if.sv"


/**
 * Encapsulates all the types needed for an UVM agent capable of driving and/or monitoring CORE-V-MCU IO Interface.
 * @ingroup uvma_cvmcu_io_pkg
 */
package uvma_cvmcu_io_pkg;

   import uvm_pkg ::*;
   import uvmx_pkg::*;

   // Constants / Structs / Enums
   `include "uvma_cvmcu_io_ftdecs.sv"
   `include "uvma_cvmcu_io_tdefs.sv"
   `include "uvma_cvmcu_io_constants.sv"

   // Objects
   `include "uvma_cvmcu_io_cfg.sv"
   `include "uvma_cvmcu_io_cntxt.sv"

   // Transactions
   `include "uvma_cvmcu_io_mon_trn.sv"
   `include "uvma_cvmcu_io_padi_mon_trn.sv"
   `include "uvma_cvmcu_io_pado_mon_trn.sv"
   `include "uvma_cvmcu_io_seq_item.sv"
   `include "uvma_cvmcu_io_board_padi_seq_item.sv"
   `include "uvma_cvmcu_io_board_pado_seq_item.sv"
   `include "uvma_cvmcu_io_chip_padi_seq_item.sv"
   `include "uvma_cvmcu_io_chip_pado_seq_item.sv"

   // Driver
   `include "uvma_cvmcu_io_board_padi_drv.sv"
   `include "uvma_cvmcu_io_board_pado_drv.sv"
   `include "uvma_cvmcu_io_chip_padi_drv.sv"
   `include "uvma_cvmcu_io_chip_pado_drv.sv"

   // Monitor
   `include "uvma_cvmcu_io_padi_mon.sv"
   `include "uvma_cvmcu_io_pado_mon.sv"

   // Agent-Level Components
   `include "uvma_cvmcu_io_mon.sv"
   `include "uvma_cvmcu_io_drv.sv"
   `include "uvma_cvmcu_io_vsqr.sv"
   `include "uvma_cvmcu_io_logger.sv"
   `include "uvma_cvmcu_io_cov_model.sv"
   `include "uvma_cvmcu_io_agent.sv"

   // Sequences
   `include "uvma_cvmcu_io_base_vseq.sv"
   `include "uvma_cvmcu_io_mon_vseq.sv"
   `include "uvma_cvmcu_io_board_drv_vseq.sv"
   `include "uvma_cvmcu_io_chip_drv_vseq.sv"
   `include "uvma_cvmcu_io_idle_vseq.sv"
   `include "uvma_cvmcu_io_vseq_lib.sv"

endpackage : uvma_cvmcu_io_pkg


// Module(s) / Checker(s)
`include "uvma_cvmcu_io_if_chkr.sv"


`endif // __UVMA_CVMCU_IO_PKG_SV__