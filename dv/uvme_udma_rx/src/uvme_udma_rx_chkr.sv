// Copyright 2022 Datum Technology Corporation
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVME_UDMA_RX_CHKR_SV__
`define __UVME_UDMA_RX_CHKR_SV__


/**
 * Encapsulates assertions targeting uvme_udma_rx interfaces.
 * This module must be bound to interfaces in a test bench.
 * @ingroup uvme_udma_rx_misc
 */
module uvme_udma_rx_chkr (
   uvma_udma_rx_cp_if      cp_if    , ///< Control plane interface
   uvma_udma_rx_dp_in_if   dp_in_if , ///< Data plane input interface
   uvma_udma_rx_dp_out_if  dp_out_if  ///< Data plane output interface
);

   // TODO Add assertions to uvme_$[name}_chkr

endmodule : uvme_udma_rx_chkr


`endif // __UVME_UDMA_RX_CHKR_SV__
