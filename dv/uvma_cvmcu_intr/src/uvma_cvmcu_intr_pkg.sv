// Copyright 2022 Datum Technology Corporation
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMA_CVMCU_INTR_PKG_SV__
`define __UVMA_CVMCU_INTR_PKG_SV__


// Pre-processor macros
`include "uvm_macros.svh"
`include "uvml_macros.svh"
`include "uvml_logs_macros.svh"
`include "uvma_cvmcu_intr_macros.svh"

// Interface(s)
`ifndef UVMA_CVMCU_INTR_NO_IF
`include "uvma_cvmcu_intr_if.sv"
`endif


/**
 * Encapsulates all the types needed for a UVM agent capable of driving and monitoring a CORE-V MCU Interrupt interface.
 */
package uvma_cvmcu_intr_pkg;

   import uvm_pkg      ::*;
   import uvml_pkg     ::*;
   import uvml_logs_pkg::*;

   // Constants / Structs / Enums
   `include "uvma_cvmcu_intr_tdefs.sv"
   `include "uvma_cvmcu_intr_constants.sv"

   // Objects
   `include "uvma_cvmcu_intr_cfg.sv"
   `include "uvma_cvmcu_intr_cntxt.sv"

   // High-level transactions
   `include "uvma_cvmcu_intr_seq_item.sv"
   `include "uvma_cvmcu_intr_mon_trn.sv"

   // Agent components
   `include "uvma_cvmcu_intr_sqr.sv"
   `include "uvma_cvmcu_intr_drv.sv"
   `include "uvma_cvmcu_intr_mon.sv"
   `include "uvma_cvmcu_intr_cov_model.sv"
   `include "uvma_cvmcu_intr_logger.sv"
   `include "uvma_cvmcu_intr_agent.sv"

   // Sequences
   `include "uvma_cvmcu_intr_seq_lib.sv"

endpackage : uvma_cvmcu_intr_pkg


// Module(s) / Checker(s)
`ifdef UVMA_CVMCU_INTR_INC_IF_CHKR
`include "uvma_cvmcu_intr_if_chkr.sv"
`endif


`endif // __UVMA_CVMCU_INTR_PKG_SV__
