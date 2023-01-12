// Copyright 2022-2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVME_APB_ADV_TIMER_PROBE_IF_SV__
`define __UVME_APB_ADV_TIMER_PROBE_IF_SV__


/**
 * Interface encapsulating all extra signals to/from APB Advanced Timer Sub-System design hierarchy.
 * @ingroup uvme_apb_adv_timer_misc
 */
interface uvme_apb_adv_timer_probe_if (
   input  clk    ,
   input  reset_n
);

   logic         dft_cg_enable_i = 0;
   logic [31:0]  ext_sig_i       = 0;
   logic [ 3:0]  events_o           ;
   logic [ 3:0]  ch_0_o             ;
   logic [ 3:0]  ch_1_o             ;
   logic [ 3:0]  ch_2_o             ;
   logic [ 3:0]  ch_3_o             ;

   clocking cb @(posedge clk);
      input   events_o, ch_0_o, ch_1_o, ch_2_o, ch_3_o;
      output  dft_cg_enable_i, ext_sig_i;
   endclocking

   modport mp (
      clocking cb     ,
      input    clk    ,
      input    reset_n
   );

endinterface : uvme_apb_adv_timer_probe_if


`endif // __UVME_APB_ADV_TIMER_PROBE_IF_SV__
