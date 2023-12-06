// Copyright 2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMA_CVMCU_CPI_CFG_SV__
`define __UVMA_CVMCU_CPI_CFG_SV__


/**
 * Object encapsulating all parameters for creating, connecting and running all CORE-V-MCU Camera Parallel Interface Agent (uvma_cvmcu_cpi_agent_c) components.
 * @ingroup uvma_cvmcu_cpi_obj
 */
class uvma_cvmcu_cpi_cfg_c extends uvmx_agent_cfg_c;

   /// @name Settings
   /// @{
   rand uvma_cvmcu_cpi_mode_enum  drv_mode; ///< Specifies which data stream to drive when in active mode.
   rand bit  drv_idle_random; ///< Specifies the type of data to send during idle cycles
   /// @}

   /// @name Bus Widths
   /// @{
   rand int unsigned  data_width; ///< Data
   /// @}

   /// @name Sequence Types
   /// @{
   uvm_object_wrapper  tx_drv_seq_type; ///< Type for TX Driver Sequence started by agent during run_phase().
   uvm_object_wrapper  rx_drv_seq_type; ///< Type for RX Driver Sequence started by agent during run_phase().
   /// @}


   `uvm_object_utils_begin(uvma_cvmcu_cpi_cfg_c)
      `uvm_field_int(enabled, UVM_DEFAULT)
      `uvm_field_int(bypass_mode, UVM_DEFAULT)
      `uvm_field_enum(uvm_active_passive_enum, is_active, UVM_DEFAULT)
      `uvm_field_enum(uvmx_reset_type_enum, reset_type, UVM_DEFAULT)
      `uvm_field_enum(uvma_cvmcu_cpi_mode_enum, drv_mode, UVM_DEFAULT)
      `uvm_field_int(drv_idle_random, UVM_DEFAULT)
      `uvm_field_enum(uvm_sequencer_arb_mode, sqr_arb_mode, UVM_DEFAULT)
      `uvm_field_int(data_width, UVM_DEFAULT + UVM_DEC)
   `uvm_object_utils_end



   /**
    * Rules for signal widths.
    */
   constraint bw_space_cons {
      data_width inside {[`UVMA_CVMCU_CPI_DATA_MIN_WIDTH:`UVMA_CVMCU_CPI_DATA_MAX_WIDTH]};
   }

   /**
    * Restricts settings randomization space.
    */
   constraint rules_cons {
      soft drv_idle_random == 0;
   }


   /**
    * Default constructor.
    */
   function new(string name="uvma_cvmcu_cpi_cfg");
      super.new(name);
   endfunction

   /**
    * Specifies agent sequence types for driving and monitoring.
    */
   virtual function void set_seq_types();
      mon_seq_type  = uvma_cvmcu_cpi_mon_seq_c ::get_type();
      idle_seq_type = uvma_cvmcu_cpi_idle_seq_c::get_type();
      tx_drv_seq_type = uvma_cvmcu_cpi_tx_drv_seq_c::get_type();
      rx_drv_seq_type = uvma_cvmcu_cpi_rx_drv_seq_c::get_type();
   endfunction

   /**
    * Implement or remove uvma_cvmcu_cpi_cfg_c::post_randomize()
    */
   virtual function void post_randomize_work();
   endfunction

endclass


`endif // __UVMA_CVMCU_CPI_CFG_SV__