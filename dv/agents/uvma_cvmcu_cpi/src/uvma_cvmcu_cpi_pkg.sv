// Copyright 2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMA_CVMCU_CPI_PKG_SV__
`define __UVMA_CVMCU_CPI_PKG_SV__


/**
 * @defgroup uvma_cvmcu_cpi_pkg CORE-V-MCU Camera Parallel Interface UVM Agent
 * @{
 * @defgroup uvma_cvmcu_cpi_agent_seq   Agent Sequences
 * @defgroup uvma_cvmcu_cpi_comps Components
 * @defgroup uvma_cvmcu_cpi_misc  Miscellaneous
 * @defgroup uvma_cvmcu_cpi_obj   Objects
 * @defgroup uvma_cvmcu_cpi_seq_stim   Stimulus Sequences
 * @defgroup uvma_cvmcu_cpi_seq_item   Sequence Items
 * @}
 */


// Pre-processor macros
`include "uvm_macros.svh"
`include "uvmx_macros.svh"
`include "uvma_cvmcu_cpi_macros.svh"

// Interface(s)
`include "uvma_cvmcu_cpi_if.sv"


/**
 * Encapsulates all the types needed for an UVM agent capable of driving and/or monitoring CORE-V-MCU Camera Parallel Interface Interface.
 * @ingroup uvma_cvmcu_cpi_pkg
 */
package uvma_cvmcu_cpi_pkg;

   import uvm_pkg ::*;
   import uvmx_pkg::*;

   // Constants / Structs / Enums
   `include "uvma_cvmcu_cpi_ftdecs.sv"
   `include "uvma_cvmcu_cpi_tdefs.sv"
   `include "uvma_cvmcu_cpi_constants.sv"

   // Objects
   `include "uvma_cvmcu_cpi_cfg.sv"
   `include "uvma_cvmcu_cpi_cntxt.sv"

   // Transactions
   `include "uvma_cvmcu_cpi_mon_trn.sv"
   `include "uvma_cvmcu_cpi_phy_mon_trn.sv"
   `include "uvma_cvmcu_cpi_seq_item.sv"
   `include "uvma_cvmcu_cpi_tx_phy_seq_item.sv"
   `include "uvma_cvmcu_cpi_rx_phy_seq_item.sv"

   // Driver
   `include "uvma_cvmcu_cpi_tx_phy_drv.sv"
   `include "uvma_cvmcu_cpi_rx_phy_drv.sv"

   // Monitor
   `include "uvma_cvmcu_cpi_phy_mon.sv"

   // Agent-Level Components
   `include "uvma_cvmcu_cpi_mon.sv"
   `include "uvma_cvmcu_cpi_drv.sv"
   `include "uvma_cvmcu_cpi_sqr.sv"
   `include "uvma_cvmcu_cpi_logger.sv"
   `include "uvma_cvmcu_cpi_cov_model.sv"
   `include "uvma_cvmcu_cpi_agent.sv"

   // Sequences
   `include "uvma_cvmcu_cpi_base_seq.sv"
   `include "uvma_cvmcu_cpi_mon_seq.sv"
   `include "uvma_cvmcu_cpi_tx_drv_seq.sv"
   `include "uvma_cvmcu_cpi_rx_drv_seq.sv"
   `include "uvma_cvmcu_cpi_idle_seq.sv"
   `include "uvma_cvmcu_cpi_seq_lib.sv"

endpackage


// Module(s) / Checker(s)
`include "uvma_cvmcu_cpi_if_chkr.sv"


`endif // __UVMA_CVMCU_CPI_PKG_SV__