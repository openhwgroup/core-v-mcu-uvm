// Copyright 2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMA_TPRESCALER_B_CNTXT_SV__
`define __UVMA_TPRESCALER_B_CNTXT_SV__


/**
 * Object encapsulating all state variables for all Timer unit prescaler Agent (uvma_tprescaler_b_agent_c) components.
 * @ingroup uvma_tprescaler_b_obj
 */
class uvma_tprescaler_b_cntxt_c extends uvmx_block_agent_cntxt_c #(
   .T_CFG(uvma_tprescaler_b_cfg_c     ),
   .T_VIF(virtual uvma_tprescaler_b_if)
);

   /// @name Sequences
   /// @{
   uvm_sequence_base  in_drv_seq ; ///< Sequence driving data into the DUT.
   uvm_sequence_base  out_drv_seq; ///< Sequence driving data out of the DUT.
   /// @}


   `uvm_object_utils_begin(uvma_tprescaler_b_cntxt_c)
      `uvm_field_enum(uvmx_reset_state_enum, reset_state, UVM_DEFAULT)
   `uvm_object_utils_end


   /**
    * Creates event objects.
    */
   function new(string name="uvma_tprescaler_b_cntxt");
      super.new(name);
   endfunction

   /**
    * Sets all state variables to initial values.
    */
   virtual function void do_reset(uvma_tprescaler_b_cfg_c cfg);
   endfunction

endclass


`endif // __UVMA_TPRESCALER_B_CNTXT_SV__