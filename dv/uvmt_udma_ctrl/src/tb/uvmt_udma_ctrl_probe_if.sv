// Copyright 2022 Datum Technology Corporation
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMT_UDMA_CTRL_PROBE_IF_SV__
`define __UVMT_UDMA_CTRL_PROBE_IF_SV__


/**
 * Interface encapsulating all extra signals to/from uDMA Controller Block design hierarchy.
 * @ingroup uvmt_udma_ctrl_tb
 */
interface uvmt_udma_ctrl_probe_if;

   import uvma_udma_ctrl_cp_pkg    ::*;
   import uvma_udma_ctrl_dp_in_pkg ::*;
   import uvma_udma_ctrl_dp_out_pkg::*;
   import uvme_udma_ctrl_pkg       ::*;

   // TODO Add signals to uvmt_udma_ctrl_probe_if
   //      Ex: logic  probed_wire_a; ///< Describe me!

endinterface : uvmt_udma_ctrl_probe_if


`endif // __UVMT_UDMA_CTRL_PROBE_IF_SV__
