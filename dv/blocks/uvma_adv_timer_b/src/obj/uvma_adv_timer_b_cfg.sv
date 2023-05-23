// Copyright 2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMA_ADV_TIMER_B_CFG_SV__
`define __UVMA_ADV_TIMER_B_CFG_SV__


/**
 * Object encapsulating all parameters for creating, connecting and running all  Agent (uvma_adv_timer_b_agent_c) components.
 * @ingroup uvma_adv_timer_b_obj
 */
class uvma_adv_timer_b_cfg_c extends uvmx_block_agent_cfg_c;

   /// @name Bus Widths
   /// @{
   rand int unsigned  num_bits; ///< 
   rand int unsigned  n_extsig; ///< 
   /// @}

/// @name Virtual Sequence Types
   /// @{
   uvm_object_wrapper  in_drv_vseq_type ; ///< Virtual Sequence Type driving data into the DUT.
   uvm_object_wrapper  out_drv_vseq_type; ///< Virtual Sequence Type driving data out of the DUT.
   /// @}


   `uvm_object_utils_begin(uvma_adv_timer_b_cfg_c)
      `uvm_field_int (                         enabled        , UVM_DEFAULT)
      `uvm_field_enum(uvm_active_passive_enum, is_active      , UVM_DEFAULT)
      `uvm_field_int (                         num_bits, UVM_DEFAULT + UVM_DEC)
      `uvm_field_int (                         n_extsig, UVM_DEFAULT + UVM_DEC)
      `uvm_field_int (                         bypass_mode    , UVM_DEFAULT)
      `uvm_field_enum(uvmx_reset_type_enum   , reset_type     , UVM_DEFAULT)
      `uvm_field_enum(uvm_sequencer_arb_mode , sqr_arb_mode   , UVM_DEFAULT)
      `uvm_field_int (                         trn_log_enabled, UVM_DEFAULT)
   `uvm_object_utils_end


   /**
    * Sets usual values for generic options and default values for all variable width buses.
    */
   constraint bw_defaults_cons {
      soft num_bits == uvma_adv_timer_b_default_num_bits;
      soft n_extsig == uvma_adv_timer_b_default_n_extsig;
   }

   /**
    * Rules for signal widths.
    */
   constraint bw_limits_cons {
      num_bits inside {[`UVMA_ADV_TIMER_B_NUM_BITS_MIN:`UVMA_ADV_TIMER_B_NUM_BITS_MAX]};

      n_extsig inside {[`UVMA_ADV_TIMER_B_N_EXTSIG_MIN:`UVMA_ADV_TIMER_B_N_EXTSIG_MAX]};
   }


   /**
    * Default constructor.
    */
   function new(string name="uvma_adv_timer_b_cfg");
      super.new(name);
   endfunction

   /**
    * Sets default Virtual Sequence types.
    */
   virtual function void create_objects();
      mon_vseq_type     = uvma_adv_timer_b_mon_vseq_c    ::get_type();
      idle_vseq_type    = uvma_adv_timer_b_idle_vseq_c   ::get_type();
      in_drv_vseq_type  = uvma_adv_timer_b_in_drv_vseq_c ::get_type();
      out_drv_vseq_type = uvma_adv_timer_b_out_drv_vseq_c::get_type();
   endfunction

endclass : uvma_adv_timer_b_cfg_c


`endif // __UVMA_ADV_TIMER_B_CFG_SV__