// Copyright 2022 Datum Technology Corporation
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMT_UDMA_CTRL_DUT_CHKR_SV__
`define __UVMT_UDMA_CTRL_DUT_CHKR_SV__


/**
 * Module encapsulating assertions for uDMA Controller Block DUT wrapper.  All ports are SV interfaces.
 * This module must be bound to the design in a test bench.
 * @ingroup uvmt_udma_ctrl_tb
 */
module uvmt_udma_ctrl_dut_chkr (
   uvma_udma_ctrl_cp_if      cp_if    , ///< Control plane interface
   uvma_udma_ctrl_dp_in_if   dp_in_if , ///< Data plane input interface
   uvma_udma_ctrl_dp_out_if  dp_out_if, ///< Data plane output interface
   uvmt_udma_ctrl_probe_if   probe_if   ///< Misc. signals
);

   // TODO Add assertions to uvmt_udma_ctrl_dut_chkr

endmodule : uvmt_udma_ctrl_dut_chkr


`endif // __UVMT_UDMA_CTRL_DUT_CHKR_SV__
