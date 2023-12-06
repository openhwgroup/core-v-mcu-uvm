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
   uvma_irq_if  irq_events_if, ///< Events IRQ interface
   uvma_tcounter_b_if  counter_lo_if, ///< Counter block 0 block agent interface
   uvma_tcounter_b_if  counter_hi_if, ///< Counter block 1 block agent interface
   uvma_tprescaler_b_if  prescaler_lo_if, ///< Prescaler block 0 block agent interface
   uvma_tprescaler_b_if  prescaler_hi_if, ///< Prescaler block 1 block agent interface
   uvme_apb_timer_ss_probe_if  probe_if ///< Misc. signals interface
);

   // TODO Add assertions and/or functional coverage to uvme_apb_timer_ss_chkr

endmodule


`endif // __UVME_APB_TIMER_SS_CHKR_SV__