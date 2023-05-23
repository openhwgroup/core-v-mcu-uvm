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
   wire [16:0]  per_events_i      ; ///< Peripherals event
   wire         cl_event_ready_i  ; ///< Chip-level event ready
   wire         pr_event_ready_i  ; ///< Peripherals event ready
   /// @}


   /**
    * Used by uvma_cvmcu_event_sys_phy_drv_c.
    */
   clocking sys_phy_drv_cb @(posedge low_speed_clk_i);
      output timer_event_lo_o, timer_event_hi_o, err_event_o, fc_events_o, event_fifo_valid_o, cl_event_valid_o, cl_event_data_o, pr_event_valid_o, pr_event_data_o;
      input per_events_i, cl_event_ready_i, pr_event_ready_i;
   endclocking

   /**
    * Used by uvma_cvmcu_event_core_phy_drv_c.
    */
   clocking core_phy_drv_cb @(posedge low_speed_clk_i);
      output per_events_i, cl_event_ready_i, pr_event_ready_i;
   endclocking

   /**
    * Used by uvma_cvmcu_event_phy_mon_c.
    */
   clocking phy_mon_cb @(posedge low_speed_clk_i);
      input timer_event_lo_o, timer_event_hi_o, per_events_i, err_event_o, fc_events_o, event_fifo_valid_o, cl_event_valid_o, cl_event_data_o, cl_event_ready_i, pr_event_valid_o, pr_event_data_o, pr_event_ready_i;
   endclocking


   /**
    * Used by uvma_cvmcu_event_sys_phy_drv_c.
    */
   modport sys_phy_drv_mp (
      clocking sys_phy_drv_cb,
      input    low_speed_clk_i,
      input    HRESETn
   );

   /**
    * Used by uvma_cvmcu_event_core_phy_drv_c.
    */
   modport core_phy_drv_mp (
      clocking core_phy_drv_cb,
      input    low_speed_clk_i,
      input    HRESETn
   );

   /**
    * Used by uvma_cvmcu_event_phy_mon_c.
    */
   modport phy_mon_mp (
      clocking phy_mon_cb,
      input    low_speed_clk_i,
      input    HRESETn
   );

endinterface : uvma_cvmcu_event_if


`endif // __UVMA_CVMCU_EVENT_IF_SV__