// Copyright 2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVME_APB_ADV_TIMER_SS_CHKR_SV__
`define __UVME_APB_ADV_TIMER_SS_CHKR_SV__


/**
 * Encapsulates assertions targeting APB Advanced Timer Sub-System interfaces.
 * This module must be bound to interfaces in a test bench.
 * @ingroup uvme_apb_adv_timer_ss_misc
 */
module uvme_apb_adv_timer_ss_chkr (
   uvma_apb_if  proc_if, ///< Processor access interface
   uvma_irq_if  irq_events_if, ///< Events IRQ interface
   uvma_adv_timer_b_if  adv_timer0_if, ///< Advanced timer 0 block agent interface
   uvma_adv_timer_b_if  adv_timer1_if, ///< Advanced timer 1 block agent interface
   uvma_adv_timer_b_if  adv_timer2_if, ///< Advanced timer 2 block agent interface
   uvma_adv_timer_b_if  adv_timer3_if, ///< Advanced timer 3 block agent interface
   uvme_apb_adv_timer_ss_probe_if  probe_if ///< Misc. signals interface
);

   // TODO Add assertions and/or functional coverage to uvme_apb_adv_timer_ss_chkr

endmodule


`endif // __UVME_APB_ADV_TIMER_SS_CHKR_SV__