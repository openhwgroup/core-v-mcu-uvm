// Copyright 2022 Datum Technology Corporation
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMT_UDMA_CTRL_DUT_WRAP_SV__
`define __UVMT_UDMA_CTRL_DUT_WRAP_SV__


/**
 * Module wrapper for uDMA Controller Block DUT.  All ports are SV interfaces.
 * @ingroup uvmt_udma_ctrl_tb
 */
module uvmt_udma_ctrl_dut_wrap (
   uvma_udma_ctrl_cp_if      cp_if    , ///< Control plane interface
   uvma_udma_ctrl_dp_in_if   dp_in_if , ///< Data plane input interface
   uvma_udma_ctrl_dp_out_if  dp_out_if, ///< Data plane output interface
   uvmt_udma_ctrl_probe_if   probe_if   ///< Misc. signals
);

   // \/ CODE BELOW IS RESPONSABILITY OF DESIGNERS \/

   // TODO Instantiate Device Under Test (DUT) and connect it to the interfaces signals
   //      Ex: udma_ctrl_top  dut (
   //             .clk    (cp_if.clk),
   //             .reset_n(cp_if.reset_n),
   //             .i_data(dp_in_if.data),
   //             .o_data(dp_out_if.data),
   //             ...
   //          );

   // TODO Connect probe interface signals to design
   //      Ex: assign probe_if.abc = dut.abc;

   // /\ CODE ABOVE IS RESPONSABILITY OF DESIGNERS /\

endmodule : uvmt_udma_ctrl_dut_wrap


`endif // __UVMT_UDMA_CTRL_DUT_WRAP_SV__
