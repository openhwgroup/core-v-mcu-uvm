// Copyright 2022 Datum Technology Corporation
// Copyright 2022 Low Power Futures
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVME_APB_TIMER_CHKR_SV__
`define __UVME_APB_TIMER_CHKR_SV__


/**
 * Encapsulates assertions targeting uvme_apb_timer interfaces.
 * This module must be bound to interfaces in a test bench.
 * @ingroup uvme_apb_timer_misc
 */
module uvme_apb_timer_chkr (
   uvma_apb_if  apb_if ///< Register access interface
);

   // TODO Add assertions to uvme_$[name}_chkr

endmodule : uvme_apb_timer_chkr


`endif // __UVME_APB_TIMER_CHKR_SV__
