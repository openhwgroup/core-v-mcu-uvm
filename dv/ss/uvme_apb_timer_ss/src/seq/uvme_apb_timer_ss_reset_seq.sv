// Copyright 2024 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVME_APB_TIMER_SS_RESET_SEQ_SV__
`define __UVME_APB_TIMER_SS_RESET_SEQ_SV__


/**
 * Performs APB simple timer unit Sub-System software reset.
 * @ingroup uvme_apb_timer_ss_seq
 */
class uvme_apb_timer_ss_reset_seq_c extends uvme_apb_timer_ss_base_seq_c;

   /// @name State
   /// @{
   /// @}


   `uvm_object_utils_begin(uvme_apb_timer_ss_reset_seq_c)
   `uvm_object_utils_end


   /**
    * Default constructor.
    */
   function new(string name="uvme_apb_timer_ss_reset_seq");
      super.new(name);
   endfunction

   /**
    * Steps through pre, in, and post reset tasks.
    */
   virtual task body();
      pre_reset ();
      in_reset  ();
      post_reset();
   endtask

   /**
    * TODO Describe uvme_apb_timer_ss_reset_seq_c::pre_reset()
    */
   virtual task pre_reset();
      // TODO Implement uvme_apb_timer_ss_reset_seq_c::pre_reset()
      //      Ex: `uvmx_set_field(abc.def.xyz, 1)
   endtask

   /**
    * TODO Describe uvme_apb_timer_ss_reset_seq_c::in_reset()
    */
   virtual task in_reset();
      // TODO Implement uvme_apb_timer_ss_reset_seq_c::in_reset()
      //      Ex: `uvmx_update_reg(abc.def)
   endtask

   /**
    * TODO Describe uvme_apb_timer_ss_reset_seq_c::post_reset()
    */
   virtual task post_reset();
      // TODO Implement uvme_apb_timer_ss_reset_seq_c::post_reset()
      //      Ex: `uvmx_set_field(abc.def.xyz, 0)
      //          `uvmx_update_reg(abc.def)
   endtask

endclass


`endif // __UVME_APB_TIMER_SS_RESET_SEQ_SV__