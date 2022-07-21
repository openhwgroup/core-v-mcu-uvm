// Copyright 2022 Datum Technology Corporation
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMT_APB_TIMER_DUT_WRAP_SV__
`define __UVMT_APB_TIMER_DUT_WRAP_SV__


/**
 * Module wrapper for APB Timer Sub-System DUT.  All ports are SV interfaces.
 */
module uvmt_apb_timer_dut_wrap (
   uvma_apb_if  apb_if, ///< Register access interface
   uvmt_apb_timer_probe_if  probe_if ///< Misc. signals
);

   // \/ CODE BELOW IS RESPONSABILITY OF DESIGNERS \/

   apb_timer_unit  dut (
      .HCLK       (apb_if.clk    ),
      .HRESETn    (apb_if.reset_n),
      .PADDR      (apb_if.paddr  ),
      .PWDATA     (apb_if.pwdata ),
      .PWRITE     (apb_if.pwrite ),
      .PSEL       (apb_if.psel   ),
      .PENABLE    (apb_if.penable),
      .PRDATA     (apb_if.prdata ),
      .PREADY     (apb_if.pready ),
      .PSLVERR    (apb_if.pslverr),
      .ref_clk_i  (apb_if.clk),
      .stoptimer_i(1'b0),
      .event_lo_i (1'b0),
      .event_hi_i (1'b0),
      .irq_lo_o   (probe_if.irq_lo_o),
      .irq_hi_o   (probe_if.irq_hi_o),
      .busy_o     (probe_if.busy_o  )
   );

   // TODO Connect probe interface signals to design
   //      Ex: assign probe_if.abc = dut.abc;

   // /\ CODE ABOVE IS RESPONSABILITY OF DESIGNERS /\

endmodule : uvmt_apb_timer_dut_wrap


`endif // __UVMT_APB_TIMER_DUT_WRAP_SV__
