// Copyright 2023 Acme Enterprises
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMA_CVMCU_EVENT_CORE_PHY_SEQ_ITEM_SV__
`define __UVMA_CVMCU_EVENT_CORE_PHY_SEQ_ITEM_SV__


/**
 * Sequence Item created by CORE-V-MCU Event Interface Virtual Sequences for driving uvma_cvmcu_event_core_phy_drv_c.
 * @ingroup uvma_cvmcu_event_seq
 */
class uvma_cvmcu_event_core_phy_seq_item_c extends uvmx_seq_item_c #(
   .T_CFG  (uvma_cvmcu_event_cfg_c  ),
   .T_CNTXT(uvma_cvmcu_event_cntxt_c)
);

   /// @name Data
   /// @{
   rand uvma_cvmcu_event_per_events_i_b_t  per_events_i    ; ///< Peripherals event
   rand bit                                cl_event_ready_i; ///< Chip-level event ready
   rand bit                                pr_event_ready_i; ///< Peripherals event ready
   /// @}


   `uvm_object_utils_begin(uvma_cvmcu_event_core_phy_seq_item_c)
      `uvm_field_int(per_events_i, UVM_DEFAULT)
      `uvm_field_int(cl_event_ready_i, UVM_DEFAULT)
      `uvm_field_int(pr_event_ready_i, UVM_DEFAULT)
   `uvm_object_utils_end


   /**
    * Default constructor.
    */
   function new(string name="uvma_cvmcu_event_core_phy_seq_item");
      super.new(name);
   endfunction

   /**
    * Describes transaction as metadata for uvml_logs_metadata_logger_c.
    */
   virtual function uvmx_metadata_t get_metadata();
      string per_events_i_str;
      string cl_event_ready_i_str;
      string pr_event_ready_i_str;
      per_events_i_str = $sformatf("%h", per_events_i);
      cl_event_ready_i_str = $sformatf("%b", cl_event_ready_i);
      pr_event_ready_i_str = $sformatf("%b", pr_event_ready_i);
      `uvmx_metadata_field("per_events_i", per_events_i_str)
      `uvmx_metadata_field("cl_event_ready_i", cl_event_ready_i_str)
      `uvmx_metadata_field("pr_event_ready_i", pr_event_ready_i_str)
   endfunction

endclass : uvma_cvmcu_event_core_phy_seq_item_c


`endif // __UVMA_CVMCU_EVENT_CORE_PHY_SEQ_ITEM_SV__