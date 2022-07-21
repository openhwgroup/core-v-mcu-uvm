// Copyright 2022 Datum Technology Corporation
// Copyright 2022 Low Power Futures
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMT_APB_ADV_TIMER_PROBE_IF_SV__
`define __UVMT_APB_ADV_TIMER_PROBE_IF_SV__


/**
 * Interface encapsulating all extra signals to/from APB Advanced Timer Sub-System design hierarchy.
 */
interface uvmt_apb_adv_timer_probe_if;

   import uvme_apb_adv_timer_pkg::*;

   logic         dft_cg_enable_i = 0;
   logic [31:0]  ext_sig_i       = 0;
   logic [ 3:0]  events_o           ;
   logic [ 3:0]  ch_0_o             ;
   logic [ 3:0]  ch_1_o             ;
   logic [ 3:0]  ch_2_o             ;
   logic [ 3:0]  ch_3_o             ;

endinterface : uvmt_apb_adv_timer_probe_if


`endif // __UVMT_APB_ADV_TIMER_PROBE_IF_SV__
