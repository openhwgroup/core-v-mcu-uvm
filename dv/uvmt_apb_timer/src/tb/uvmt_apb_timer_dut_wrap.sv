// Copyright 2022-2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMT_APB_TIMER_DUT_WRAP_SV__
`define __UVMT_APB_TIMER_DUT_WRAP_SV__


/**
 * Module wrapper for APB Timer Sub-System DUT.  All ports are SV interfaces.
 * @ingroup uvmt_apb_timer_tb
 */
module uvmt_apb_timer_dut_wrap (
   uvma_clk_if              sys_clk_if  , ///< Clock generating interface
   uvma_reset_if            sys_reset_if, ///< Reset assertion interface
   uvma_apb_if              apb_if      , ///< Register access interface
   uvme_apb_timer_probe_if  probe_if      ///< Misc. signals
);

   apb_timer_unit  dut (
      .HCLK        (sys_clk_if.clk      ),
      .HRESETn     (sys_reset_if.reset_n),
      .PADDR       (apb_if.paddr        ),
      .PWDATA      (apb_if.pwdata       ),
      .PWRITE      (apb_if.pwrite       ),
      .PSEL        (apb_if.psel         ),
      .PENABLE     (apb_if.penable      ),
      .PRDATA      (apb_if.prdata       ),
      .PREADY      (apb_if.pready       ),
      .PSLVERR     (apb_if.pslverr      ),
      .ref_clk_i   (sys_clk_if.clk      ),
      .stoptimer_i (probe_if.stoptimer_i),
      .event_lo_i  (probe_if.event_lo_i ),
      .event_hi_i  (probe_if.event_hi_i ),
      .irq_lo_o    (probe_if.irq_lo_o   ),
      .irq_hi_o    (probe_if.irq_hi_o   ),
      .busy_o      (probe_if.busy_o     )
   );

   // TODO Connect probe interface signals to design
   //      Ex: assign probe_if.abc = dut.abc;

endmodule : uvmt_apb_timer_dut_wrap


`endif // __UVMT_APB_TIMER_DUT_WRAP_SV__
