// Copyright 2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMA_TPRESCALER_B_PKG_SV__
`define __UVMA_TPRESCALER_B_PKG_SV__


/**
 * @defgroup uvma_tprescaler_b_pkg Timer unit prescaler Block UVM Agent
 * @{
 * @defgroup uvma_tprescaler_b_comps Components
 * @defgroup uvma_tprescaler_b_misc  Miscellaneous
 * @defgroup uvma_tprescaler_b_obj   Objects
 * @defgroup uvma_tprescaler_b_seq   Sequences & Sequence Items
 * @}
 */


// Pre-processor macros
`include "uvm_macros.svh"
`include "uvmx_macros.svh"
`include "uvma_tprescaler_b_macros.svh"

// Interface(s)
`include "uvma_tprescaler_b_if.sv"


/**
 * Encapsulates all the types needed for a UVM agent capable of driving and monitoring a Timer unit prescaler interface.
 * @ingroup uvma_tprescaler_b_pkg
 */
package uvma_tprescaler_b_pkg;

   import uvm_pkg ::*;
   import uvmx_pkg::*;

   // Constants / Structs / Enums
   `include "uvma_tprescaler_b_ftdecs.sv"
   `include "uvma_tprescaler_b_tdefs.sv"
   `include "uvma_tprescaler_b_constants.sv"

   // Objects
   `include "uvma_tprescaler_b_cfg.sv"
   `include "uvma_tprescaler_b_cntxt.sv"

   // Sequence Items and Monitor Transactions
   `include "uvma_tprescaler_b_seq_item.sv"
   `include "uvma_tprescaler_b_cp_seq_item.sv"
   `include "uvma_tprescaler_b_dpi_seq_item.sv"
   `include "uvma_tprescaler_b_dpo_seq_item.sv"
   `include "uvma_tprescaler_b_mon_trn.sv"
   `include "uvma_tprescaler_b_cp_mon_trn.sv"
   `include "uvma_tprescaler_b_dpi_mon_trn.sv"
   `include "uvma_tprescaler_b_dpo_mon_trn.sv"

   // Components
   `include "uvma_tprescaler_b_cp_drv.sv"
   `include "uvma_tprescaler_b_dpi_drv.sv"
   `include "uvma_tprescaler_b_dpo_drv.sv"
   `include "uvma_tprescaler_b_cp_mon.sv"
   `include "uvma_tprescaler_b_dpi_mon.sv"
   `include "uvma_tprescaler_b_dpo_mon.sv"
   `include "uvma_tprescaler_b_sqr.sv"
   `include "uvma_tprescaler_b_drv.sv"
   `include "uvma_tprescaler_b_mon.sv"
   `include "uvma_tprescaler_b_logger.sv"
   `include "uvma_tprescaler_b_agent.sv"

   // Sequences
   `include "uvma_tprescaler_b_base_seq.sv"
   `include "uvma_tprescaler_b_mon_seq.sv"
   `include "uvma_tprescaler_b_in_drv_seq.sv"
   `include "uvma_tprescaler_b_out_drv_seq.sv"
   `include "uvma_tprescaler_b_idle_seq.sv"

endpackage : uvma_tprescaler_b_pkg


// Module(s) / Checker(s)
`include "uvma_tprescaler_b_if_chkr.sv"


`endif // __UVMA_TPRESCALER_B_PKG_SV__