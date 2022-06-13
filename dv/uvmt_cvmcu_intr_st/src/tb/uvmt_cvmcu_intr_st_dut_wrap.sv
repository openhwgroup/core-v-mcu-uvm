// Copyright 2022 Datum Technology Corporation
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMT_CVMCU_INTR_ST_DUT_WRAP_SV__
`define __UVMT_CVMCU_INTR_ST_DUT_WRAP_SV__


/**
 * Module implementing buffer connecting active and passive CORE-V MCU Interrupt UVM Agent interfaces.
 */
module uvmt_cvmcu_intr_st_dut_wrap (
   uvma_cvmcu_intr_if  active_if , ///< Active agent interface
   uvma_cvmcu_intr_if  passive_if ///< Passive agent interface
);

   // TODO Connect interfaces via buffers to avoid race condition at scoreboard.
   //      Ex: reg abc;
   //          passive_if.abc = abc;
   //          always @(active_if.clk) begin
   //             abc = active_if.abc;
   //          end

endmodule : uvmt_cvmcu_intr_st_dut_wrap


`endif // __UVMT_CVMCU_INTR_ST_DUT_WRAP_SV__
