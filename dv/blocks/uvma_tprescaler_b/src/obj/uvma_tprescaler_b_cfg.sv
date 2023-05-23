// Copyright 2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMA_TPRESCALER_B_CFG_SV__
`define __UVMA_TPRESCALER_B_CFG_SV__


/**
 * Object encapsulating all parameters for creating, connecting and running all Timer unit prescaler Agent (uvma_tprescaler_b_agent_c) components.
 * @ingroup uvma_tprescaler_b_obj
 */
class uvma_tprescaler_b_cfg_c extends uvmx_block_agent_cfg_c;

/// @name Virtual Sequence Types
   /// @{
   uvm_object_wrapper  in_drv_vseq_type ; ///< Virtual Sequence Type driving data into the DUT.
   uvm_object_wrapper  out_drv_vseq_type; ///< Virtual Sequence Type driving data out of the DUT.
   /// @}


   `uvm_object_utils_begin(uvma_tprescaler_b_cfg_c)
      `uvm_field_int (                         enabled        , UVM_DEFAULT)
      `uvm_field_enum(uvm_active_passive_enum, is_active      , UVM_DEFAULT)
      `uvm_field_int (                         bypass_mode    , UVM_DEFAULT)
      `uvm_field_enum(uvmx_reset_type_enum   , reset_type     , UVM_DEFAULT)
      `uvm_field_enum(uvm_sequencer_arb_mode , sqr_arb_mode   , UVM_DEFAULT)
      `uvm_field_int (                         trn_log_enabled, UVM_DEFAULT)
   `uvm_object_utils_end


   /**
    * Default constructor.
    */
   function new(string name="uvma_tprescaler_b_cfg");
      super.new(name);
   endfunction

   /**
    * Sets default Virtual Sequence types.
    */
   virtual function void create_objects();
      mon_vseq_type     = uvma_tprescaler_b_mon_vseq_c    ::get_type();
      idle_vseq_type    = uvma_tprescaler_b_idle_vseq_c   ::get_type();
      in_drv_vseq_type  = uvma_tprescaler_b_in_drv_vseq_c ::get_type();
      out_drv_vseq_type = uvma_tprescaler_b_out_drv_vseq_c::get_type();
   endfunction

endclass : uvma_tprescaler_b_cfg_c


`endif // __UVMA_TPRESCALER_B_CFG_SV__