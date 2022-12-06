// Copyright 2022 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMT_APB_ADV_TIMER_DUT_WRAP_SV__
`define __UVMT_APB_ADV_TIMER_DUT_WRAP_SV__


/**
 * Module wrapper for APB Advanced Timer Sub-System DUT.  All ports are SV interfaces.
 * @ingroup uvmt_apb_adv_timer_tb
 */
module uvmt_apb_adv_timer_dut_wrap (
   uvma_clk_if       sys_clk_if, ///< Clock generating interface
   uvma_reset_if     sys_reset_if, ///< Reset assertion interface
   uvma_apb_if  apb_if, ///< Register access interface
   uvme_apb_adv_timer_probe_if  probe_if ///< Misc. signals
);

   apb_adv_timer  dut (
      .HCLK            (sys_clk_if.clk          ),
      .HRESETn         (sys_reset_if.reset_n    ),
      .PADDR           (apb_if.paddr            ),
      .PWDATA          (apb_if.pwdata           ),
      .PWRITE          (apb_if.pwrite           ),
      .PSEL            (apb_if.psel             ),
      .PENABLE         (apb_if.penable          ),
      .PRDATA          (apb_if.prdata           ),
      .PREADY          (apb_if.pready           ),
      .PSLVERR         (apb_if.pslverr          ),
      .low_speed_clk_i (sys_clk_if.clk          ),
      .dft_cg_enable_i (probe_if.dft_cg_enable_i),
      .ext_sig_i       (probe_if.ext_sig_i      ),
      .events_o        (probe_if.events_o       ),
      .ch_0_o          (probe_if.ch_0_o         ),
      .ch_1_o          (probe_if.ch_1_o         ),
      .ch_2_o          (probe_if.ch_2_o         ),
      .ch_3_o          (probe_if.ch_3_o         )
   );

   // TODO Connect probe interface signals to design
   //      Ex: assign probe_if.abc = dut.abc;

endmodule : uvmt_apb_adv_timer_dut_wrap


`endif // __UVMT_APB_ADV_TIMER_DUT_WRAP_SV__
