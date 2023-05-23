// Copyright 2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMT_CVMCU_DBG_ST_DUT_WRAP_SV__
`define __UVMT_CVMCU_DBG_ST_DUT_WRAP_SV__


/**
 * Module wrapper connecting CORE-V-MCU Debug Interface UVM Agent Self-Test Bench interfaces.  All ports are SV interfaces.
 * @ingroup uvmt_cvmcu_dbg_st_tb
 */
module uvmt_cvmcu_dbg_st_dut_wrap(
   uvma_cvmcu_dbg_if  core_if, ///< CORE Agent interface
   uvma_cvmcu_dbg_if  sys_if, ///< SYS Agent interface
   uvma_cvmcu_dbg_if  passive_if, ///< Passive Agent interface
   uvma_clk_if    clk_if  , ///< Slow interface
   uvma_reset_if  reset_if  ///< System interface
);

   assign sys_if.debug_req_i = core_if.debug_req_i;
   assign passive_if.debug_req_i = core_if.debug_req_i;
   assign core_if.stoptimer_o = sys_if.stoptimer_o;
   assign passive_if.stoptimer_o = sys_if.stoptimer_o;

endmodule : uvmt_cvmcu_dbg_st_dut_wrap


`endif // __UVMT_CVMCU_DBG_ST_DUT_WRAP_SV__