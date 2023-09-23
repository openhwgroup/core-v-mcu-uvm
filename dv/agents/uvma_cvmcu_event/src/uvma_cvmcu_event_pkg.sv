// Copyright 2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMA_CVMCU_EVENT_PKG_SV__
`define __UVMA_CVMCU_EVENT_PKG_SV__


/**
 * @defgroup uvma_cvmcu_event_pkg CORE-V-MCU Event Interface UVM Agent
 * @{
 * @defgroup uvma_cvmcu_event_comps Components
 * @defgroup uvma_cvmcu_event_misc  Miscellaneous
 * @defgroup uvma_cvmcu_event_obj   Objects
 * @defgroup uvma_cvmcu_event_seq   Sequences & Sequence Items
 * @}
 */


// Pre-processor macros
`include "uvm_macros.svh"
`include "uvmx_macros.svh"
`include "uvma_cvmcu_event_macros.svh"

// Interface(s)
`include "uvma_cvmcu_event_if.sv"


/**
 * Encapsulates all the types needed for an UVM agent capable of driving and/or monitoring CORE-V-MCU Event Interface Interface.
 * @ingroup uvma_cvmcu_event_pkg
 */
package uvma_cvmcu_event_pkg;

   import uvm_pkg ::*;
   import uvmx_pkg::*;

   // Constants / Structs / Enums
   `include "uvma_cvmcu_event_ftdecs.sv"
   `include "uvma_cvmcu_event_tdefs.sv"
   `include "uvma_cvmcu_event_constants.sv"

   // Objects
   `include "uvma_cvmcu_event_cfg.sv"
   `include "uvma_cvmcu_event_cntxt.sv"

   // Transactions
   `include "uvma_cvmcu_event_mon_trn.sv"
   `include "uvma_cvmcu_event_phy_mon_trn.sv"
   `include "uvma_cvmcu_event_seq_item.sv"
   `include "uvma_cvmcu_event_core_phy_seq_item.sv"
   `include "uvma_cvmcu_event_sys_phy_seq_item.sv"

   // Driver
   `include "uvma_cvmcu_event_core_phy_drv.sv"
   `include "uvma_cvmcu_event_sys_phy_drv.sv"

   // Monitor
   `include "uvma_cvmcu_event_phy_mon.sv"

   // Agent-Level Components
   `include "uvma_cvmcu_event_mon.sv"
   `include "uvma_cvmcu_event_drv.sv"
   `include "uvma_cvmcu_event_vsqr.sv"
   `include "uvma_cvmcu_event_logger.sv"
   `include "uvma_cvmcu_event_cov_model.sv"
   `include "uvma_cvmcu_event_agent.sv"

   // Sequences
   `include "uvma_cvmcu_event_base_vseq.sv"
   `include "uvma_cvmcu_event_mon_vseq.sv"
   `include "uvma_cvmcu_event_core_drv_vseq.sv"
   `include "uvma_cvmcu_event_sys_drv_vseq.sv"
   `include "uvma_cvmcu_event_idle_vseq.sv"
   `include "uvma_cvmcu_event_vseq_lib.sv"

endpackage : uvma_cvmcu_event_pkg


// Module(s) / Checker(s)
`include "uvma_cvmcu_event_if_chkr.sv"


`endif // __UVMA_CVMCU_EVENT_PKG_SV__