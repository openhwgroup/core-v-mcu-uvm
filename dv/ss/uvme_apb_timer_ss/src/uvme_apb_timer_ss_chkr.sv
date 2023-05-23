// Copyright 2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVME_APB_TIMER_SS_CHKR_SV__
`define __UVME_APB_TIMER_SS_CHKR_SV__


/**
 * Encapsulates assertions targeting APB simple timer unit Sub-System interfaces.
 * This module must be bound to interfaces in a test bench.
 * @ingroup uvme_apb_timer_ss_misc
 */
module uvme_apb_timer_ss_chkr (
   uvma_apb_if  proc_if, ///< Processor interface interface
   uvme_apb_timer_ss_probe_if  probe_if ///< Misc. signals interface
);

   // TODO Add assertions to uvme_apb_timer_ss_chkr

endmodule : uvme_apb_timer_ss_chkr


`endif // __UVME_APB_TIMER_SS_CHKR_SV__