// Copyright 2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMA_TPRESCALER_B_IF_SV__
`define __UVMA_TPRESCALER_B_IF_SV__


/**
 * Encapsulates all signals and clocking of  Block interface.
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


   /**
    * Used by uvma_tprescaler_b_cp_drv_c.
    */
   clocking cp_drv_cb @(posedge clk_i);
      output reset_count_i, enable_count_i, compare_value_i;
   endclocking

   /**
    * Used by uvma_tprescaler_b_cp_mon_c.
    */
   clocking cp_mon_cb @(posedge clk_i);
      input reset_count_i, enable_count_i, compare_value_i;
   endclocking

   /**
    * Used by uvma_tprescaler_b_dpi_drv_c.
    */
   clocking dpi_drv_cb @(posedge clk_i);
      output write_counter_i, counter_value_i;
   endclocking

   /**
    * Used by uvma_tprescaler_b_dpi_mon_c.
    */
   clocking dpi_mon_cb @(posedge clk_i);
      input write_counter_i, counter_value_i;
   endclocking

   /**
    * Used by uvma_tprescaler_b_dpo_drv_c.
    */
   clocking dpo_drv_cb @(posedge clk_i);
      input counter_value_o, target_reached_o;
   endclocking

   /**
    * Used by uvma_tprescaler_b_dpo_mon_c.
    */
   clocking dpo_mon_cb @(posedge clk_i);
      input counter_value_o, target_reached_o;
   endclocking


   /**
    * Used by uvma_tprescaler_b_cp_drv_c.
    */
   modport cp_drv_mp (
      clocking cp_drv_cb,
      input    clk_i,
      input    rst_ni
   );

   /**
    * Used by uvma_tprescaler_b_dpi_drv_c.
    */
   modport dpi_drv_mp (
      clocking dpi_drv_cb,
      input    clk_i,
      input    rst_ni
   );

   /**
    * Used by uvma_tprescaler_b_dpo_drv_c.
    */
   modport dpo_drv_mp (
      clocking dpo_drv_cb,
      input    clk_i,
      input    rst_ni
   );

   /**
    * Used by uvma_tprescaler_b_cp_mon_c.
    */
   modport cp_mon_mp (
      clocking cp_mon_cb,
      input    clk_i,
      input    rst_ni
   );

   /**
    * Used by uvma_tprescaler_b_dpi_mon_c.
    */
   modport dpi_mon_mp (
      clocking dpi_mon_cb,
      input    clk_i,
      input    rst_ni
   );

   /**
    * Used by uvma_tprescaler_b_dpo_mon_c.
    */
   modport dpo_mon_mp (
      clocking dpo_mon_cb,
      input    clk_i,
      input    rst_ni
   );

endinterface : uvma_tprescaler_b_if


`endif // __UVMA_TPRESCALER_B_IF_SV__