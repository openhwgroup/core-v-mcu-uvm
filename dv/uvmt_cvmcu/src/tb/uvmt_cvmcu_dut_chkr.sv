// Copyright 2022 Datum Technology Corporation
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMT_CVMCU_DUT_CHKR_SV__
`define __UVMT_CVMCU_DUT_CHKR_SV__


/**
 * Module encapsulating assertions for CORE-V MCU RTL DUT wrapper.  All ports are SV interfaces.
 */
module uvmt_cvmcu_dut_chkr(
   uvma_obi_if  obi_instr_if,
   uvma_obi_if  obi_data_if,
   uvma_cvmcu_intr_if  intr_if,
   uvmt_cvmcu_probe_if  probe_if
);

   // TODO Add assertions to uvmt_cvmcu_dut_chkr

endmodule : uvmt_cvmcu_dut_chkr


`endif // __UVMT_CVMCU_DUT_CHKR_SV__
