// Copyright 2023 Acme Enterprises
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

   /// @name SYS
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

   /// @name CORE
   /// @{
   uvma_cvmcu_event_per_events_i_l_t  per_events_i    ; ///< Peripherals event
   logic                              cl_event_ready_i; ///< Chip-level event ready
   logic                              pr_event_ready_i; ///< Peripherals event ready
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
      `uvm_field_int(per_events_i, UVM_DEFAULT)
      `uvm_field_int(cl_event_ready_i, UVM_DEFAULT)
      `uvm_field_int(pr_event_ready_i, UVM_DEFAULT)
   `uvm_object_utils_end


   /**
    * Default constructor.
    */
   function new(string name="uvma_cvmcu_event_core_phy_mon_trn");
      super.new(name);
   endfunction

   /**
    * Describes transaction as metadata for uvml_logs_metadata_logger_c.
    */
   virtual function uvmx_metadata_t get_metadata();
      string timer_event_lo_o_str;
      string timer_event_hi_o_str;
      string err_event_o_str;
      string fc_events_o_str;
      string event_fifo_valid_o_str;
      string cl_event_valid_o_str;
      string cl_event_data_o_str;
      string pr_event_valid_o_str;
      string pr_event_data_o_str;
      string per_events_i_str;
      string cl_event_ready_i_str;
      string pr_event_ready_i_str;
      timer_event_lo_o_str = $sformatf("%b", timer_event_lo_o);
      timer_event_hi_o_str = $sformatf("%b", timer_event_hi_o);
      err_event_o_str = $sformatf("%b", err_event_o);
      fc_events_o_str = $sformatf("%h", fc_events_o);
      event_fifo_valid_o_str = $sformatf("%b", event_fifo_valid_o);
      cl_event_valid_o_str = $sformatf("%b", cl_event_valid_o);
      cl_event_data_o_str = $sformatf("%h", cl_event_data_o);
      pr_event_valid_o_str = $sformatf("%b", pr_event_valid_o);
      pr_event_data_o_str = $sformatf("%h", pr_event_data_o);
      per_events_i_str = $sformatf("%h", per_events_i);
      cl_event_ready_i_str = $sformatf("%b", cl_event_ready_i);
      pr_event_ready_i_str = $sformatf("%b", pr_event_ready_i);
      `uvmx_metadata_field("timer_event_lo_o", timer_event_lo_o_str)
      `uvmx_metadata_field("timer_event_hi_o", timer_event_hi_o_str)
      `uvmx_metadata_field("err_event_o", err_event_o_str)
      `uvmx_metadata_field("fc_events_o", fc_events_o_str)
      `uvmx_metadata_field("event_fifo_valid_o", event_fifo_valid_o_str)
      `uvmx_metadata_field("cl_event_valid_o", cl_event_valid_o_str)
      `uvmx_metadata_field("cl_event_data_o", cl_event_data_o_str)
      `uvmx_metadata_field("pr_event_valid_o", pr_event_valid_o_str)
      `uvmx_metadata_field("pr_event_data_o", pr_event_data_o_str)
      `uvmx_metadata_field("per_events_i", per_events_i_str)
      `uvmx_metadata_field("cl_event_ready_i", cl_event_ready_i_str)
      `uvmx_metadata_field("pr_event_ready_i", pr_event_ready_i_str)
   endfunction

endclass : uvma_cvmcu_event_phy_mon_trn_c


`endif // __UVMA_CVMCU_EVENT_PHY_MON_TRN_SV__