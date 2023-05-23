// Copyright 2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMT_ADV_TIMER_B_DUT_WRAP_SV__
`define __UVMT_ADV_TIMER_B_DUT_WRAP_SV__


/**
 * Module wrapper for  Block DUT.  All ports are SV interfaces.
 * @ingroup uvmt_adv_timer_b_tb
 */
module uvmt_adv_timer_b_dut_wrap (
   uvma_adv_timer_b_if  agent_if, ///< Block signals
   uvma_clk_if    clk_i_if, ///<  interface
   uvma_clk_if    ls_clk_i_if, ///<  interface
   uvma_reset_if  reset_if  ///< Reset assertion interface
);

   /**
    *  Device Under Test from IP '/'.
    */
   timer_module #(
      .NUM_BITS_WIDTH (`UVMT_ADV_TIMER_B_NUM_BITS_WIDTH),
      .N_EXTSIG_WIDTH (`UVMT_ADV_TIMER_B_N_EXTSIG_WIDTH)
   ) dut (
      // Control Plane
      .cfg_start_i       (agent_if.cfg_start_i      ),
      .cfg_stop_i        (agent_if.cfg_stop_i       ),
      .cfg_rst_i         (agent_if.cfg_rst_i        ),
      .cfg_update_i      (agent_if.cfg_update_i     ),
      .cfg_arm_i         (agent_if.cfg_arm_i        ),
      .cfg_sel_i         (agent_if.cfg_sel_i        ),
      .cfg_sel_clk_i     (agent_if.cfg_sel_clk_i    ),
      .cfg_mode_i        (agent_if.cfg_mode_i       ),
      .cfg_presc_i       (agent_if.cfg_presc_i      ),
      .cfg_sawtooth_i    (agent_if.cfg_sawtooth_i   ),
      .cfg_cnt_start_i   (agent_if.cfg_cnt_start_i  ),
      .cfg_cnt_end_i     (agent_if.cfg_cnt_end_i    ),
      .cfg_comp_ch0_i    (agent_if.cfg_comp_ch0_i   ),
      .cfg_comp_op_ch0_i (agent_if.cfg_comp_op_ch0_i),
      .cfg_comp_ch1_i    (agent_if.cfg_comp_ch1_i   ),
      .cfg_comp_op_ch1_i (agent_if.cfg_comp_op_ch1_i),
      .cfg_comp_ch2_i    (agent_if.cfg_comp_ch2_i   ),
      .cfg_comp_op_ch2_i (agent_if.cfg_comp_op_ch2_i),
      .cfg_comp_ch3_i    (agent_if.cfg_comp_ch3_i   ),
      .cfg_comp_op_ch3_i (agent_if.cfg_comp_op_ch3_i),
      // Data Plane Input
      .signal_i (agent_if.signal_i),
      // Data Plane Output
      .counter_o (agent_if.counter_o),
      .pwm_o     (agent_if.pwm_o    ),
      .status_o  (agent_if.status_o ),
      // Clock & Reset
      .clk_i    (clk_i_if.clk),
      .ls_clk_i (ls_clk_i_if.clk),
      .rstn_i   (reset_if.reset_n)
   );

endmodule : uvmt_adv_timer_b_dut_wrap


`endif // __UVMT_ADV_TIMER_B_DUT_WRAP_SV__