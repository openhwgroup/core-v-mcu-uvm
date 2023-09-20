// Copyright 2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMA_CVMCU_DBG_PKG_SV__
`define __UVMA_CVMCU_DBG_PKG_SV__


/**
 * @defgroup uvma_cvmcu_dbg_pkg CORE-V-MCU Debug Interface UVM Agent
 * @{
 * @defgroup uvma_cvmcu_dbg_comps Components
 * @defgroup uvma_cvmcu_dbg_misc  Miscellaneous
 * @defgroup uvma_cvmcu_dbg_obj   Objects
 * @defgroup uvma_cvmcu_dbg_seq   Sequences & Sequence Items
 * @}
 */


// Pre-processor macros
`include "uvm_macros.svh"
`include "uvmx_macros.svh"
`include "uvma_cvmcu_dbg_macros.svh"

// Interface(s)
`include "uvma_cvmcu_dbg_if.sv"


/**
 * Encapsulates all the types needed for an UVM agent capable of driving and/or monitoring CORE-V-MCU Debug Interface Interface.
 * @ingroup uvma_cvmcu_dbg_pkg
 */
package uvma_cvmcu_dbg_pkg;

   import uvm_pkg ::*;
   import uvmx_pkg::*;

   // Constants / Structs / Enums
   `include "uvma_cvmcu_dbg_tdefs.sv"
   `include "uvma_cvmcu_dbg_constants.sv"

   // Objects
   `include "uvma_cvmcu_dbg_cfg.sv"
   `include "uvma_cvmcu_dbg_cntxt.sv"

   // Transactions
   `include "uvma_cvmcu_dbg_mon_trn.sv"
   `include "uvma_cvmcu_dbg_phy_mon_trn.sv"
   `include "uvma_cvmcu_dbg_seq_item.sv"
   `include "uvma_cvmcu_dbg_core_phy_seq_item.sv"
   `include "uvma_cvmcu_dbg_sys_phy_seq_item.sv"

   // Driver
   `include "uvma_cvmcu_dbg_core_phy_drv.sv"
   `include "uvma_cvmcu_dbg_sys_phy_drv.sv"

   // Monitor
   `include "uvma_cvmcu_dbg_phy_mon.sv"

   // Agent-Level Components
   `include "uvma_cvmcu_dbg_mon.sv"
   `include "uvma_cvmcu_dbg_drv.sv"
   `include "uvma_cvmcu_dbg_vsqr.sv"
   `include "uvma_cvmcu_dbg_logger.sv"
   `include "uvma_cvmcu_dbg_cov_model.sv"
   `include "uvma_cvmcu_dbg_agent.sv"

   // Sequences
   `include "uvma_cvmcu_dbg_base_vseq.sv"
   `include "uvma_cvmcu_dbg_mon_vseq.sv"
   `include "uvma_cvmcu_dbg_core_drv_vseq.sv"
   `include "uvma_cvmcu_dbg_sys_drv_vseq.sv"
   `include "uvma_cvmcu_dbg_idle_vseq.sv"
   `include "uvma_cvmcu_dbg_vseq_lib.sv"

endpackage : uvma_cvmcu_dbg_pkg


// Module(s) / Checker(s)
`include "uvma_cvmcu_dbg_if_chkr.sv"


`endif // __UVMA_CVMCU_DBG_PKG_SV__