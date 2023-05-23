// Copyright 2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMA_TCOUNTER_B_CNTXT_SV__
`define __UVMA_TCOUNTER_B_CNTXT_SV__


/**
 * Object encapsulating all state variables for all Timer unit counter Agent (uvma_tcounter_b_agent_c) components.
 * @ingroup uvma_tcounter_b_obj
 */
class uvma_tcounter_b_cntxt_c extends uvmx_block_agent_cntxt_c #(
   .T_VIF(virtual uvma_tcounter_b_if)
);
   /// @name Integrals
   /// @{
   /// @}

   /// @name Objects
   /// @{
   /// @}

   /// @name Virtual Sequences
   /// @{
   uvm_sequence_base  in_drv_vseq ; ///< Virtual Sequence driving data into the DUT.
   uvm_sequence_base  out_drv_vseq; ///< Virtual Sequence driving data out of the DUT.
   /// @}


   `uvm_object_utils_begin(uvma_tcounter_b_cntxt_c)
      `uvm_field_enum(uvmx_reset_state_enum, reset_state, UVM_DEFAULT)
      `uvm_field_object(in_drv_vseq , UVM_DEFAULT)
      `uvm_field_object(out_drv_vseq, UVM_DEFAULT)
   `uvm_object_utils_end


   /**
    * Creates event objects.
    */
   function new(string name="uvma_tcounter_b_cntxt");
      super.new(name);
   endfunction

   /**
    * Returns all state variables to initial values.
    */
   virtual function void reset();
      // TODO Implement uvma_tcounter_b_cntxt_c::reset()
      //      Ex: abc = 0;
   endfunction

endclass : uvma_tcounter_b_cntxt_c


`endif // __UVMA_TCOUNTER_B_CNTXT_SV__