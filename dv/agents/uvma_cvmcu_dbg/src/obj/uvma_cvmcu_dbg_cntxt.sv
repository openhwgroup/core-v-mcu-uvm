// Copyright 2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMA_CVMCU_DBG_CNTXT_SV__
`define __UVMA_CVMCU_DBG_CNTXT_SV__


/**
 * Object encapsulating all state variables for all CORE-V-MCU Debug Interface agent (uvma_cvmcu_dbg_agent_c) components.
 * @ingroup uvma_cvmcu_dbg_obj
 */
class uvma_cvmcu_dbg_cntxt_c extends uvmx_agent_cntxt_c #(
   .T_CFG(uvma_cvmcu_dbg_cfg_c     ),
   .T_VIF(virtual uvma_cvmcu_dbg_if)
);

   /// @name Sequences
   /// @{
   uvm_sequence_base  core_drv_seq; ///< CORE Driver Sequence instance.
   uvm_sequence_base  sys_drv_seq; ///< SYS Driver Sequence instance.
   /// @}


   `uvm_object_utils_begin(uvma_cvmcu_dbg_cntxt_c)
      `uvm_field_enum(uvmx_reset_state_enum, reset_state, UVM_DEFAULT)
   `uvm_object_utils_end


   /**
    * Default constructor.
    */
   function new(string name="uvma_cvmcu_dbg_cntxt");
      super.new(name);
   endfunction

   /**
    * Creates objects.
    */
   virtual function void build(uvma_cvmcu_dbg_cfg_c cfg);
   endfunction

   /**
    * Returns all state variables to initial values.
    */
   virtual function void do_reset(uvma_cvmcu_dbg_cfg_c cfg);
   endfunction

endclass


`endif // __UVMA_CVMCU_DBG_CNTXT_SV__