// Copyright 2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMA_CVMCU_EVENT_CNTXT_SV__
`define __UVMA_CVMCU_EVENT_CNTXT_SV__


/**
 * Object encapsulating all state variables for all CORE-V-MCU Event Interface agent (uvma_cvmcu_event_agent_c) components.
 * @ingroup uvma_cvmcu_event_obj
 */
class uvma_cvmcu_event_cntxt_c extends uvmx_agent_cntxt_c #(
   .T_CFG(uvma_cvmcu_event_cfg_c     ),
   .T_VIF(virtual uvma_cvmcu_event_if)
);

   /// @name Integrals
   /// @{
   /// @}

   /// @name Objects
   /// @{
   // TODO Add state variables
   //      Ex: uvma_cvmcu_event_word_b_t  drv_data_q[$]; ///< TODO Describe uvma_cvmcu_event_cntxt_c::drv_data_q
   //          uvma_cvmcu_event_core_phy_mon_trn_c  mon_q[$]; ///< TODO Describe uvma_cvmcu_event_cntxt_c::mon_q
   /// @}

   /// @name Virtual Sequences
   /// @{
   uvm_sequence_base  core_drv_vseq; ///< CORE Driver Virtual Sequence instance.
   uvm_sequence_base  sys_drv_vseq; ///< SYS Driver Virtual Sequence instance.
   /// @}


   `uvm_object_utils_begin(uvma_cvmcu_event_cntxt_c)
      `uvm_field_enum(uvmx_reset_state_enum, reset_state, UVM_DEFAULT)
   `uvm_object_utils_end


   /**
    * Default constructor.
    */
   function new(string name="uvma_cvmcu_event_cntxt");
      super.new(name);
   endfunction

   /**
    * Builds objects.
    */
   virtual function void create_objects(uvma_cvmcu_event_cfg_c cfg);
   endfunction

   /**
    * Returns all state variables to initial values.
    */
   virtual function void reset();
      // TODO Reset state variables
      //       Ex: drv_data_q.delete();
      //          mon_core_q.delete();
      //          mon_sys_q.delete();
   endfunction

endclass : uvma_cvmcu_event_cntxt_c


`endif // __UVMA_CVMCU_EVENT_CNTXT_SV__