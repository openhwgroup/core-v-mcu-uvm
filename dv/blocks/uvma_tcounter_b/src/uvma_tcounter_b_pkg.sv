// Copyright 2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMA_TCOUNTER_B_PKG_SV__
`define __UVMA_TCOUNTER_B_PKG_SV__


/**
 * @defgroup uvma_tcounter_b_pkg Timer unit counter Block UVM Agent
 * @{
 * @defgroup uvma_tcounter_b_comps Components
 * @defgroup uvma_tcounter_b_misc  Miscellaneous
 * @defgroup uvma_tcounter_b_obj   Objects
 * @defgroup uvma_tcounter_b_seq   Sequences & Sequence Items
 * @}
 */


// Pre-processor macros
`include "uvm_macros.svh"
`include "uvmx_macros.svh"
`include "uvma_tcounter_b_macros.svh"

// Interface(s)
`include "uvma_tcounter_b_if.sv"


/**
 * Encapsulates all the types needed for a UVM agent capable of driving and monitoring a Timer unit counter interface.
 * @ingroup uvma_tcounter_b_pkg
 */
package uvma_tcounter_b_pkg;

   import uvm_pkg ::*;
   import uvmx_pkg::*;

   // Constants / Structs / Enums
   `include "uvma_tcounter_b_tdefs.sv"
   `include "uvma_tcounter_b_constants.sv"

   // Objects
   `include "uvma_tcounter_b_cfg.sv"
   `include "uvma_tcounter_b_cntxt.sv"

   // Sequence Items and Monitor Transactions
   `include "uvma_tcounter_b_seq_item.sv"
   `include "uvma_tcounter_b_cp_seq_item.sv"
   `include "uvma_tcounter_b_dpi_seq_item.sv"
   `include "uvma_tcounter_b_dpo_seq_item.sv"
   `include "uvma_tcounter_b_mon_trn.sv"
   `include "uvma_tcounter_b_cp_mon_trn.sv"
   `include "uvma_tcounter_b_dpi_mon_trn.sv"
   `include "uvma_tcounter_b_dpo_mon_trn.sv"

   // Components
   `include "uvma_tcounter_b_cp_drv.sv"
   `include "uvma_tcounter_b_dpi_drv.sv"
   `include "uvma_tcounter_b_dpo_drv.sv"
   `include "uvma_tcounter_b_cp_mon.sv"
   `include "uvma_tcounter_b_dpi_mon.sv"
   `include "uvma_tcounter_b_dpo_mon.sv"
   `include "uvma_tcounter_b_vsqr.sv"
   `include "uvma_tcounter_b_drv.sv"
   `include "uvma_tcounter_b_mon.sv"
   `include "uvma_tcounter_b_logger.sv"
   `include "uvma_tcounter_b_agent.sv"

   // Sequences
   `include "uvma_tcounter_b_base_vseq.sv"
   `include "uvma_tcounter_b_trn_base_vseq.sv"
   `include "uvma_tcounter_b_mon_vseq.sv"
   `include "uvma_tcounter_b_in_drv_vseq.sv"
   `include "uvma_tcounter_b_out_drv_vseq.sv"
   `include "uvma_tcounter_b_idle_vseq.sv"

endpackage : uvma_tcounter_b_pkg


// Module(s) / Checker(s)
`include "uvma_tcounter_b_if_chkr.sv"


`endif // __UVMA_TCOUNTER_B_PKG_SV__