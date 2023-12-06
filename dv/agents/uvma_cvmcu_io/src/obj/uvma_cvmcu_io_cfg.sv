// Copyright 2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMA_CVMCU_IO_CFG_SV__
`define __UVMA_CVMCU_IO_CFG_SV__


/**
 * Object encapsulating all parameters for creating, connecting and running all CORE-V-MCU IO Agent (uvma_cvmcu_io_agent_c) components.
 * @ingroup uvma_cvmcu_io_obj
 */
class uvma_cvmcu_io_cfg_c extends uvmx_agent_cfg_c;

   /// @name Settings
   /// @{
   rand uvma_cvmcu_io_mode_enum  drv_mode; ///< Specifies which data stream to drive when in active mode.
   rand bit  drv_idle_random; ///< Specifies the type of data to send during idle cycles
   /// @}

   /// @name Sequence Types
   /// @{
   uvm_object_wrapper  board_drv_seq_type; ///< Type for BOARD Driver Sequence started by agent during run_phase().
   uvm_object_wrapper  chip_drv_seq_type; ///< Type for CHIP Driver Sequence started by agent during run_phase().
   /// @}


   `uvm_object_utils_begin(uvma_cvmcu_io_cfg_c)
      `uvm_field_int(enabled, UVM_DEFAULT)
      `uvm_field_int(bypass_mode, UVM_DEFAULT)
      `uvm_field_enum(uvm_active_passive_enum, is_active, UVM_DEFAULT)
      `uvm_field_enum(uvmx_reset_type_enum, reset_type, UVM_DEFAULT)
      `uvm_field_enum(uvma_cvmcu_io_mode_enum, drv_mode, UVM_DEFAULT)
      `uvm_field_int(drv_idle_random, UVM_DEFAULT)
      `uvm_field_enum(uvm_sequencer_arb_mode, sqr_arb_mode, UVM_DEFAULT)
   `uvm_object_utils_end



   /**
    * Restricts settings randomization space.
    */
   constraint rules_cons {
      soft drv_idle_random == 0;
   }


   /**
    * Default constructor.
    */
   function new(string name="uvma_cvmcu_io_cfg");
      super.new(name);
   endfunction

   /**
    * Specifies agent sequence types for driving and monitoring.
    */
   virtual function void set_seq_types();
      mon_seq_type  = uvma_cvmcu_io_mon_seq_c ::get_type();
      idle_seq_type = uvma_cvmcu_io_idle_seq_c::get_type();
      board_drv_seq_type = uvma_cvmcu_io_board_drv_seq_c::get_type();
      chip_drv_seq_type = uvma_cvmcu_io_chip_drv_seq_c::get_type();
   endfunction

   /**
    * Implement or remove uvma_cvmcu_io_cfg_c::post_randomize()
    */
   virtual function void post_randomize_work();
   endfunction

endclass


`endif // __UVMA_CVMCU_IO_CFG_SV__