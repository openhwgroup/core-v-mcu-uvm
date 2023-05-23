// Copyright 2023 Acme Enterprises
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMA_TPRESCALER_B_CNTXT_SV__
`define __UVMA_TPRESCALER_B_CNTXT_SV__


/**
 * Object encapsulating all state variables for all  Agent (uvma_tprescaler_b_agent_c) components.
 * @ingroup uvma_tprescaler_b_obj
 */
class uvma_tprescaler_b_cntxt_c extends uvmx_block_agent_cntxt_c #(
   .T_VIF(virtual uvma_tprescaler_b_if)
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


   `uvm_object_utils_begin(uvma_tprescaler_b_cntxt_c)
      `uvm_field_enum(uvmx_reset_state_enum, reset_state, UVM_DEFAULT)
      `uvm_field_object(in_drv_vseq , UVM_DEFAULT)
      `uvm_field_object(out_drv_vseq, UVM_DEFAULT)
   `uvm_object_utils_end


   /**
    * Creates event objects.
    */
   function new(string name="uvma_tprescaler_b_cntxt");
      super.new(name);
   endfunction

   /**
    * Returns all state variables to initial values.
    */
   virtual function void reset();
      // TODO Implement uvma_tprescaler_b_cntxt_c::reset()
      //      Ex: abc = 0;
   endfunction

endclass : uvma_tprescaler_b_cntxt_c


`endif // __UVMA_TPRESCALER_B_CNTXT_SV__