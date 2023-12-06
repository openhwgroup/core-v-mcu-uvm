// Copyright 2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMT_CVMCU_EVENT_ST_DUT_WRAP_SV__
`define __UVMT_CVMCU_EVENT_ST_DUT_WRAP_SV__


/**
 * Module wrapper connecting CORE-V-MCU Event Interface UVM Agent Self-Test Bench interfaces.  All ports are SV interfaces.
 * @ingroup uvmt_cvmcu_event_st_tb
 */
module uvmt_cvmcu_event_st_dut_wrap(
   uvma_cvmcu_event_if  core_if, ///< CORE Agent interface
   uvma_cvmcu_event_if  sys_if, ///< SYS Agent interface
   uvma_cvmcu_event_if  passive_if, ///< Passive Agent interface
   uvma_clk_if    low_speed_clk_i_if  , ///< Low speed clock interface
   uvma_reset_if  reset_if  ///< System reset interface
);

   assign core_if.timer_event_lo_o = sys_if.timer_event_lo_o;
   assign passive_if.timer_event_lo_o = sys_if.timer_event_lo_o;
   assign core_if.timer_event_hi_o = sys_if.timer_event_hi_o;
   assign passive_if.timer_event_hi_o = sys_if.timer_event_hi_o;
   assign core_if.err_event_o = sys_if.err_event_o;
   assign passive_if.err_event_o = sys_if.err_event_o;
   assign core_if.fc_events_o = sys_if.fc_events_o;
   assign passive_if.fc_events_o = sys_if.fc_events_o;
   assign core_if.event_fifo_valid_o = sys_if.event_fifo_valid_o;
   assign passive_if.event_fifo_valid_o = sys_if.event_fifo_valid_o;
   assign core_if.cl_event_valid_o = sys_if.cl_event_valid_o;
   assign passive_if.cl_event_valid_o = sys_if.cl_event_valid_o;
   assign core_if.cl_event_data_o = sys_if.cl_event_data_o;
   assign passive_if.cl_event_data_o = sys_if.cl_event_data_o;
   assign core_if.pr_event_valid_o = sys_if.pr_event_valid_o;
   assign passive_if.pr_event_valid_o = sys_if.pr_event_valid_o;
   assign core_if.pr_event_data_o = sys_if.pr_event_data_o;
   assign passive_if.pr_event_data_o = sys_if.pr_event_data_o;
   assign sys_if.cl_event_ready_i = core_if.cl_event_ready_i;
   assign passive_if.cl_event_ready_i = core_if.cl_event_ready_i;
   assign sys_if.pr_event_ready_i = core_if.pr_event_ready_i;
   assign passive_if.pr_event_ready_i = core_if.pr_event_ready_i;
   assign sys_if.per_events_i = core_if.per_events_i;
   assign passive_if.per_events_i = core_if.per_events_i;

endmodule


`endif // __UVMT_CVMCU_EVENT_ST_DUT_WRAP_SV__