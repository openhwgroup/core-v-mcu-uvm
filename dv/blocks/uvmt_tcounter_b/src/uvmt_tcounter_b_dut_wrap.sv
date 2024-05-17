// Copyright 2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMT_TCOUNTER_B_DUT_WRAP_SV__
`define __UVMT_TCOUNTER_B_DUT_WRAP_SV__


/**
 * Module wrapper for Timer unit counter Block DUT.  All ports are SV interfaces.
 * @ingroup uvmt_tcounter_b_tb
 */
module uvmt_tcounter_b_dut_wrap (
   uvma_tcounter_b_if  agent_if, ///< Block signals
   uvma_clk_if    clk_i_if, ///< Input clock interface
   uvma_reset_if  reset_if  ///< Reset assertion interface
);

   /**
    * Timer unit counter Device Under Test from IP '/'.
    */
   timer_unit_counter  dut (
      // Control Plane
      .reset_count_i   (agent_if.reset_count_i  ),
      .enable_count_i  (agent_if.enable_count_i ),
      .compare_value_i (agent_if.compare_value_i),
      // Data Plane Input
      .write_counter_i (agent_if.write_counter_i),
      .counter_value_i (agent_if.counter_value_i),
      // Data Plane Output
      .counter_value_o  (agent_if.counter_value_o ),
      .target_reached_o (agent_if.target_reached_o),
      .target_greater_o (agent_if.target_greater_o),
      // Clock & Reset
      .clk_i  (clk_i_if.clk),
      .rst_ni (reset_if.reset_n)
   );

endmodule


`endif // __UVMT_TCOUNTER_B_DUT_WRAP_SV__