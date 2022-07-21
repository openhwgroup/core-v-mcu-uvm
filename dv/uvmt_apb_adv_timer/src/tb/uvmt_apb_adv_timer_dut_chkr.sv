// Copyright 2022 Datum Technology Corporation
// Copyright 2022 Low Power Futures
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMT_APB_ADV_TIMER_DUT_CHKR_SV__
`define __UVMT_APB_ADV_TIMER_DUT_CHKR_SV__


/**
 * Module encapsulating assertions for APB Advanced Timer Sub-System DUT wrapper.  All ports are SV interfaces.
 * This module must be bound to the design in a test bench.
 */
module uvmt_apb_adv_timer_dut_chkr (
   uvma_apb_if  apb_if, ///< Register access interface
   uvmt_apb_adv_timer_probe_if  probe_if ///< Misc. signals
);

   // TODO Add assertions to uvmt_apb_adv_timer_dut_chkr

endmodule : uvmt_apb_adv_timer_dut_chkr


`endif // __UVMT_APB_ADV_TIMER_DUT_CHKR_SV__
