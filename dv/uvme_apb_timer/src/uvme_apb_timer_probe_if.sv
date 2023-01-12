// Copyright 2022-2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVME_APB_TIMER_PROBE_IF_SV__
`define __UVME_APB_TIMER_PROBE_IF_SV__


/**
 * Interface encapsulating all extra signals to/from APB Timer Sub-System design hierarchy.
 * @ingroup uvme_apb_timer_misc
 */
interface uvme_apb_timer_probe_if (
   input  clk    ,
   input  reset_n
);

   logic stoptimer_i = 0;
   logic event_lo_i  = 0;
   logic event_hi_i  = 0;
   logic irq_lo_o       ;
   logic irq_hi_o       ;
   logic busy_o         ;

   clocking cb @(posedge clk);
      input   irq_lo_o, irq_hi_o, busy_o;
      output  stoptimer_i, event_lo_i, event_hi_i;
   endclocking

   modport mp (
      clocking cb     ,
      input    clk    ,
      input    reset_n
   );

endinterface : uvme_apb_timer_probe_if


`endif // __UVME_APB_TIMER_PROBE_IF_SV__
