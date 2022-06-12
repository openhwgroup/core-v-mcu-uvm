// Copyright 2022 Datum Technology Corporation
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMT_CVMCU_DUT_WRAP_SV__
`define __UVMT_CVMCU_DUT_WRAP_SV__


/**
 * Module wrapper for CORE-V MCU RTL DUT.  All ports are SV interfaces.
 */
module uvmt_cvmcu_dut_wrap(
   uvma_obi_if          obi_instr_if,
   uvma_obi_if          obi_data_if,
   uvma_cvmcu_intr_if   intr_if,
   uvmt_cvmcu_probe_if  probe_if
);

   // \/ CODE BELOW IS RESPONSABILITY OF DESIGNERS \/

   core_v_mcu #() dut (
     /*.jtag_tck_i(jtag_tck_i),
     .jtag_tdi_i(jtag_tdi_i),
     .jtag_tdo_o(jtag_tdo_o),
     .jtag_tms_i(jtag_tms_i),
     .jtag_trst_i(jtag_trst_i),
     .ref_clk_i(ref_clk),
     .rstn_i(rstn_i),
     .bootsel_i(bootsel_i),
     .stm_i(1'b0),
     .io_in_i(io_in_i),
     .io_out_o(io_out_o),
     .pad_cfg_o(pad_cfg_o),
     .io_oe_o(io_oe_o)*/
   );

   // /\ CODE ABOVE IS RESPONSABILITY OF DESIGNERS /\

endmodule : uvmt_cvmcu_dut_wrap


`endif // __UVMT_CVMCU_DUT_WRAP_SV__
