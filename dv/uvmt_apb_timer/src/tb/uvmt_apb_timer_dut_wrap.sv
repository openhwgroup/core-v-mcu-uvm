// Copyright 2022 Datum Technology Corporation
// Copyright 2022 Low Power Futures
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
      .HCLK        (apb_if.clk          ),
      .HRESETn     (apb_if.reset_n      ),
      .PADDR       (apb_if.paddr        ),
      .PWDATA      (apb_if.pwdata       ),
      .PWRITE      (apb_if.pwrite       ),
      .PSEL        (apb_if.psel         ),
      .PENABLE     (apb_if.penable      ),
      .PRDATA      (apb_if.prdata       ),
      .PREADY      (apb_if.pready       ),
      .PSLVERR     (apb_if.pslverr      ),
      .ref_clk_i   (apb_if.clk          ),
      .stoptimer_i (probe_if.stoptimer_i),
      .event_lo_i  (probe_if.event_lo_i ),
      .event_hi_i  (probe_if.event_hi_i ),
      .irq_lo_o    (probe_if.irq_lo_o   ),
      .irq_hi_o    (probe_if.irq_hi_o   ),
      .busy_o      (probe_if.busy_o     )
   );

   // /\ CODE ABOVE IS RESPONSABILITY OF DESIGNERS /\

endmodule : uvmt_apb_timer_dut_wrap


`endif // __UVMT_APB_TIMER_DUT_WRAP_SV__
