// Copyright 2022 Datum Technology Corporation
// Copyright 2022 Low Power Futures
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVME_APB_TIMER_PROBE_IF_SV__
`define __UVME_APB_TIMER_PROBE_IF_SV__


/**
 * Interface encapsulating all extra signals to/from CORE-V MCU APB Timer Sub-System design hierarchy.
 * @ingroup uvme_apb_timer_misc
 */
interface uvme_apb_timer_probe_if;

   import uvme_apb_timer_pkg::*;

   logic stoptimer_i = 0;
   logic event_lo_i  = 0;
   logic event_hi_i  = 0;
   logic irq_lo_o       ;
   logic irq_hi_o       ;
   logic busy_o         ;

endinterface : uvme_apb_timer_probe_if


`endif // __UVME_APB_TIMER_PROBE_IF_SV__
