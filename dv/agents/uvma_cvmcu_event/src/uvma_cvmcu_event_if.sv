// Copyright 2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMA_CVMCU_EVENT_IF_SV__
`define __UVMA_CVMCU_EVENT_IF_SV__


/**
 * Encapsulates all signals and clocking of the CORE-V-MCU Event Interface.
 * @ingroup uvma_cvmcu_event_misc
 */
interface uvma_cvmcu_event_if(

   input  low_speed_clk_i, ///< Low speed clock
   input  HRESETn          ///< System reset
);

   /// @name 'PHY' signals
   /// @{
   wire         timer_event_lo_o  ; ///< Timer event low
   wire         timer_event_hi_o  ; ///< Timer event high
   wire         err_event_o       ; ///< Error event
   wire  [1:0]  fc_events_o       ; ///< Full chip event
   wire         event_fifo_valid_o; ///< FIFO valid
   wire         cl_event_valid_o  ; ///< Chip-level event valid
   wire  [7:0]  cl_event_data_o   ; ///< Chip-level event data
   wire         pr_event_valid_o  ; ///< Peripherals event valid
   wire  [7:0]  pr_event_data_o   ; ///< Peripherals event data
   wire         cl_event_ready_i  ; ///< Chip-level event ready
   wire         pr_event_ready_i  ; ///< Peripherals event ready
   wire [16:0]  per_events_i      ; ///< Peripherals event
   /// @}


   /// @name Used by uvma_cvmcu_event_sys_phy_drv_c
   /// @{
   clocking sys_phy_drv_cb @(posedge low_speed_clk_i);
      output timer_event_lo_o, timer_event_hi_o, err_event_o, fc_events_o, event_fifo_valid_o, cl_event_valid_o, cl_event_data_o, pr_event_valid_o, pr_event_data_o;
      input cl_event_ready_i, pr_event_ready_i, per_events_i;
   endclocking
   modport sys_phy_drv_mp (clocking sys_phy_drv_cb);
   /// @}

   /// @name Used by uvma_cvmcu_event_core_phy_drv_c
   /// @{
   clocking core_phy_drv_cb @(posedge low_speed_clk_i);
      output cl_event_ready_i, pr_event_ready_i, per_events_i;
      input timer_event_lo_o, timer_event_hi_o, err_event_o, fc_events_o, event_fifo_valid_o, cl_event_valid_o, cl_event_data_o, pr_event_valid_o, pr_event_data_o;
   endclocking
   modport core_phy_drv_mp (clocking core_phy_drv_cb);
   /// @}

   /// @name Used by uvma_cvmcu_event_phy_mon_c
   /// @{
   clocking phy_mon_cb @(posedge low_speed_clk_i);
      input timer_event_lo_o, timer_event_hi_o, err_event_o, fc_events_o, event_fifo_valid_o, cl_event_valid_o, cl_event_data_o, pr_event_valid_o, pr_event_data_o, cl_event_ready_i, pr_event_ready_i, per_events_i;
   endclocking
   modport phy_mon_mp (clocking phy_mon_cb);
   /// @}


   /// @name Accessors
   /// @{
   `uvmx_if_reset(HRESETn)
   `uvmx_if_cb(sys_phy_drv_mp, sys_phy_drv_cb)
   `uvmx_if_cb(core_phy_drv_mp, core_phy_drv_cb)
   `uvmx_if_cb(phy_mon_mp, phy_mon_cb)
   `uvmx_if_signal_out(timer_event_lo_o, , phy_mon_mp.phy_mon_cb, sys_phy_drv_mp.sys_phy_drv_cb)
   `uvmx_if_signal_out(timer_event_hi_o, , phy_mon_mp.phy_mon_cb, sys_phy_drv_mp.sys_phy_drv_cb)
   `uvmx_if_signal_out(err_event_o, , phy_mon_mp.phy_mon_cb, sys_phy_drv_mp.sys_phy_drv_cb)
   `uvmx_if_signal_out(fc_events_o, [1:0], phy_mon_mp.phy_mon_cb, sys_phy_drv_mp.sys_phy_drv_cb)
   `uvmx_if_signal_out(event_fifo_valid_o, , phy_mon_mp.phy_mon_cb, sys_phy_drv_mp.sys_phy_drv_cb)
   `uvmx_if_signal_out(cl_event_valid_o, , phy_mon_mp.phy_mon_cb, sys_phy_drv_mp.sys_phy_drv_cb)
   `uvmx_if_signal_out(cl_event_data_o, [7:0], phy_mon_mp.phy_mon_cb, sys_phy_drv_mp.sys_phy_drv_cb)
   `uvmx_if_signal_out(pr_event_valid_o, , phy_mon_mp.phy_mon_cb, sys_phy_drv_mp.sys_phy_drv_cb)
   `uvmx_if_signal_out(pr_event_data_o, [7:0], phy_mon_mp.phy_mon_cb, sys_phy_drv_mp.sys_phy_drv_cb)
   `uvmx_if_signal_out(cl_event_ready_i, , phy_mon_mp.phy_mon_cb, core_phy_drv_mp.core_phy_drv_cb)
   `uvmx_if_signal_out(pr_event_ready_i, , phy_mon_mp.phy_mon_cb, core_phy_drv_mp.core_phy_drv_cb)
   `uvmx_if_signal_out(per_events_i, [16:0], phy_mon_mp.phy_mon_cb, core_phy_drv_mp.core_phy_drv_cb)
   /// @}

endinterface


`endif // __UVMA_CVMCU_EVENT_IF_SV__