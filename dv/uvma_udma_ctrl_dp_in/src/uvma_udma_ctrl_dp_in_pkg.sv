// Copyright 2022 Datum Technology Corporation
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMA_UDMA_CTRL_DP_IN_PKG_SV__
`define __UVMA_UDMA_CTRL_DP_IN_PKG_SV__


// Doxygen Groups
/**
 * @defgroup uvma_udma_ctrl_dp_in_pkg uDMA Controller Block Data Plane Input UVM Agent
 * @{
 * @defgroup uvma_udma_ctrl_dp_in_comps Components
 * @defgroup uvma_udma_ctrl_dp_in_misc  Miscellaneous
 * @defgroup uvma_udma_ctrl_dp_in_obj   Objects
 * @defgroup uvma_udma_ctrl_dp_in_seq   Sequences & Sequence Items
 * @}
 */


// Pre-processor macros
`include "uvm_macros.svh"
`include "uvml_macros.svh"
`include "uvml_logs_macros.svh"
`include "uvma_udma_ctrl_dp_in_macros.svh"

// Interface(s)
`ifndef UVMA_UDMA_CTRL_DP_IN_NO_IF
`include "uvma_udma_ctrl_dp_in_if.sv"
`endif


/**
 * Encapsulates all the types needed for a UVM agent capable of driving and monitoring a uDMA Controller Block Data Plane Input interface.
 * @ingroup uvma_udma_ctrl_dp_in_pkg
 */
package uvma_udma_ctrl_dp_in_pkg;

   import uvm_pkg      ::*;
   import uvml_pkg     ::*;
   import uvml_logs_pkg::*;

   // Constants / Structs / Enums
   `include "uvma_udma_ctrl_dp_in_tdefs.sv"
   `include "uvma_udma_ctrl_dp_in_constants.sv"

   // Objects
   `include "uvma_udma_ctrl_dp_in_cfg.sv"
   `include "uvma_udma_ctrl_dp_in_cntxt.sv"

   // High-level transactions
   `include "uvma_udma_ctrl_dp_in_seq_item.sv"
   `include "uvma_udma_ctrl_dp_in_mon_trn.sv"

   // Agent components
   `include "uvma_udma_ctrl_dp_in_sqr.sv"
   `include "uvma_udma_ctrl_dp_in_drv.sv"
   `include "uvma_udma_ctrl_dp_in_mon.sv"
   `include "uvma_udma_ctrl_dp_in_cov_model.sv"
   `include "uvma_udma_ctrl_dp_in_logger.sv"
   `include "uvma_udma_ctrl_dp_in_agent.sv"

   // Sequences
   `include "uvma_udma_ctrl_dp_in_seq_lib.sv"

endpackage : uvma_udma_ctrl_dp_in_pkg


// Module(s) / Checker(s)
`ifdef UVMA_UDMA_CTRL_DP_IN_INC_IF_CHKR
`include "uvma_udma_ctrl_dp_in_if_chkr.sv"
`endif


`endif // __UVMA_UDMA_CTRL_DP_IN_PKG_SV__
