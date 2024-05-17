// Copyright 2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMA_TPRESCALER_B_IF_SV__
`define __UVMA_TPRESCALER_B_IF_SV__


/**
 * Encapsulates all signals and clocking of Timer unit prescaler Block interface.
 * Assertions must be captured within uvma_tprescaler_b_if_chkr.
 * @ingroup uvma_tprescaler_b_pkg
 */
interface uvma_tprescaler_b_if(

   input  clk_i , ///< 
   input  rst_ni  ///< 
);

   /// @name Control Plane signals
   /// @{
   wire         reset_count_i  ; ///< 
   wire         enable_count_i ; ///< 
   wire [31:0]  compare_value_i; ///< 
   /// @}

   /// @name Data Plane Input signals
   /// @{
   wire         write_counter_i; ///< 
   wire [31:0]  counter_value_i; ///< 
   /// @}

   /// @name Data Plane Output signals
   /// @{
   wire [31:0]  counter_value_o ; ///< 
   wire         target_reached_o; ///< 
   /// @}


   /// @name Used by uvma_tprescaler_b_cp_mon_c
   /// @{
   clocking cp_mon_cb @(posedge clk_i);
      input reset_count_i, enable_count_i, compare_value_i;
   endclocking
   modport cp_mon_mp (clocking cp_mon_cb);
   /// @}

   /// @name Used by uvma_tprescaler_b_cp_drv_c
   /// @{
   clocking cp_drv_cb @(posedge clk_i);
      output reset_count_i, enable_count_i, compare_value_i;
   endclocking
   modport cp_drv_mp (clocking cp_drv_cb);
   /// @}

   /// @name Used by uvma_tprescaler_b_dpi_mon_c
   /// @{
   clocking dpi_mon_cb @(posedge clk_i);
      input write_counter_i, counter_value_i;
   endclocking
   modport dpi_mon_mp (clocking dpi_mon_cb);
   /// @}

   /// @name Used by uvma_tprescaler_b_dpi_drv_c
   /// @{
   clocking dpi_drv_cb @(posedge clk_i);
      output write_counter_i, counter_value_i;
   endclocking
   modport dpi_drv_mp (clocking dpi_drv_cb);
   /// @}

   /// @name Used by uvma_tprescaler_b_dpo_mon_c
   /// @{
   clocking dpo_mon_cb @(posedge clk_i);
      input counter_value_o, target_reached_o;
   endclocking
   modport dpo_mon_mp (clocking dpo_mon_cb);
   /// @}

   /// @name Used by uvma_tprescaler_b_dpo_drv_c
   /// @{
   clocking dpo_drv_cb @(posedge clk_i);
      input counter_value_o, target_reached_o;
   endclocking
   modport dpo_drv_mp (clocking dpo_drv_cb);
   /// @}


   /// @name Accessors
   /// @{
   `uvmx_if_reset(rst_ni)
   `uvmx_if_cb(cp_mon_mp , cp_mon_cb )
   `uvmx_if_cb(cp_drv_mp , cp_drv_cb )
   `uvmx_if_cb(dpi_mon_mp, dpi_mon_cb)
   `uvmx_if_cb(dpi_drv_mp, dpi_drv_cb)
   `uvmx_if_cb(dpo_mon_mp, dpo_mon_cb)
   `uvmx_if_cb(dpo_drv_mp, dpo_drv_cb)
   `uvmx_if_signal_out(reset_count_i, , cp_mon_mp.cp_mon_cb, cp_drv_mp.cp_drv_cb)
   `uvmx_if_signal_out(enable_count_i, , cp_mon_mp.cp_mon_cb, cp_drv_mp.cp_drv_cb)
   `uvmx_if_signal_out(compare_value_i, [31:0], cp_mon_mp.cp_mon_cb, cp_drv_mp.cp_drv_cb)
   `uvmx_if_signal_out(write_counter_i, , dpi_mon_mp.dpi_mon_cb, dpi_drv_mp.dpi_drv_cb)
   `uvmx_if_signal_out(counter_value_i, [31:0], dpi_mon_mp.dpi_mon_cb, dpi_drv_mp.dpi_drv_cb)
   `uvmx_if_signal_in(counter_value_o, [31:0], dpo_mon_mp.dpo_mon_cb)
   `uvmx_if_signal_in(target_reached_o, , dpo_mon_mp.dpo_mon_cb)
   /// @}

endinterface


`endif // __UVMA_TPRESCALER_B_IF_SV__