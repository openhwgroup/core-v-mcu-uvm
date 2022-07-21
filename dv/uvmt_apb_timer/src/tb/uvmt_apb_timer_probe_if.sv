// Copyright 2022 Datum Technology Corporation
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMT_APB_TIMER_PROBE_IF_SV__
`define __UVMT_APB_TIMER_PROBE_IF_SV__


/**
 * Interface encapsulating all extra signals to/from APB Timer Sub-System design hierarchy.
 */
interface uvmt_apb_timer_probe_if;

   import uvme_apb_timer_pkg::*;

   logic stoptimer_i;
   logic event_lo_i ;
   logic event_hi_i ;
   logic irq_lo_o   ;
   logic irq_hi_o   ;
   logic busy_o     ;

endinterface : uvmt_apb_timer_probe_if


`endif // __UVMT_APB_TIMER_PROBE_IF_SV__
