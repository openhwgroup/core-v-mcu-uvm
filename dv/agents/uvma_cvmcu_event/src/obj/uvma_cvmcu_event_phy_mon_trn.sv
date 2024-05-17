// Copyright 2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMA_CVMCU_EVENT_PHY_MON_TRN_SV__
`define __UVMA_CVMCU_EVENT_PHY_MON_TRN_SV__


/**
 * PHY Monitor Transaction sampled by monitor (uvma_cvmcu_event_phy_mon_c).
 * @ingroup uvma_cvmcu_event_obj
 */
class uvma_cvmcu_event_phy_mon_trn_c extends uvmx_mon_trn_c #(
   .T_CFG  (uvma_cvmcu_event_cfg_c  ),
   .T_CNTXT(uvma_cvmcu_event_cntxt_c)
);

   /// @name Sys
   /// @{
   logic                                 timer_event_lo_o  ; ///< Timer event low
   logic                                 timer_event_hi_o  ; ///< Timer event high
   logic                                 err_event_o       ; ///< Error event
   uvma_cvmcu_event_fc_events_o_l_t      fc_events_o       ; ///< Full chip event
   logic                                 event_fifo_valid_o; ///< FIFO valid
   logic                                 cl_event_valid_o  ; ///< Chip-level event valid
   uvma_cvmcu_event_cl_event_data_o_l_t  cl_event_data_o   ; ///< Chip-level event data
   logic                                 pr_event_valid_o  ; ///< Peripherals event valid
   uvma_cvmcu_event_pr_event_data_o_l_t  pr_event_data_o   ; ///< Peripherals event data
   /// @}

   /// @name Core
   /// @{
   logic                              cl_event_ready_i; ///< Chip-level event ready
   logic                              pr_event_ready_i; ///< Peripherals event ready
   uvma_cvmcu_event_per_events_i_l_t  per_events_i    ; ///< Peripherals event
   /// @}


   `uvm_object_utils_begin(uvma_cvmcu_event_phy_mon_trn_c)
      `uvm_field_int(timer_event_lo_o, UVM_DEFAULT)
      `uvm_field_int(timer_event_hi_o, UVM_DEFAULT)
      `uvm_field_int(err_event_o, UVM_DEFAULT)
      `uvm_field_int(fc_events_o, UVM_DEFAULT)
      `uvm_field_int(event_fifo_valid_o, UVM_DEFAULT)
      `uvm_field_int(cl_event_valid_o, UVM_DEFAULT)
      `uvm_field_int(cl_event_data_o, UVM_DEFAULT)
      `uvm_field_int(pr_event_valid_o, UVM_DEFAULT)
      `uvm_field_int(pr_event_data_o, UVM_DEFAULT)
      `uvm_field_int(cl_event_ready_i, UVM_DEFAULT)
      `uvm_field_int(pr_event_ready_i, UVM_DEFAULT)
      `uvm_field_int(per_events_i, UVM_DEFAULT)
   `uvm_object_utils_end


   /**
    * Default constructor.
    */
   function new(string name="uvma_cvmcu_event_core_phy_mon_trn");
      super.new(name);
   endfunction

   /**
    * Describes sequence item for logger.
    */
   virtual function uvmx_metadata_t get_metadata();
      string  val_str;
      val_str = $sformatf("%b", timer_event_lo_o);
      `uvmx_metadata_field("timer_event_lo_o", val_str)
      val_str = $sformatf("%b", timer_event_hi_o);
      `uvmx_metadata_field("timer_event_hi_o", val_str)
      val_str = $sformatf("%b", err_event_o);
      `uvmx_metadata_field("err_event_o", val_str)
      val_str = $sformatf("%h", fc_events_o);
      `uvmx_metadata_field("fc_events_o", val_str)
      val_str = $sformatf("%b", event_fifo_valid_o);
      `uvmx_metadata_field("event_fifo_valid_o", val_str)
      val_str = $sformatf("%b", cl_event_valid_o);
      `uvmx_metadata_field("cl_event_valid_o", val_str)
      val_str = $sformatf("%h", cl_event_data_o);
      `uvmx_metadata_field("cl_event_data_o", val_str)
      val_str = $sformatf("%b", pr_event_valid_o);
      `uvmx_metadata_field("pr_event_valid_o", val_str)
      val_str = $sformatf("%h", pr_event_data_o);
      `uvmx_metadata_field("pr_event_data_o", val_str)
      val_str = $sformatf("%b", cl_event_ready_i);
      `uvmx_metadata_field("cl_event_ready_i", val_str)
      val_str = $sformatf("%b", pr_event_ready_i);
      `uvmx_metadata_field("pr_event_ready_i", val_str)
      val_str = $sformatf("%h", per_events_i);
      `uvmx_metadata_field("per_events_i", val_str)
   endfunction

endclass


`endif // __UVMA_CVMCU_EVENT_PHY_MON_TRN_SV__