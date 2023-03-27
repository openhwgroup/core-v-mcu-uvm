// Copyright 2022-2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVME_CVMCU_CNTXT_SV__
`define __UVME_CVMCU_CNTXT_SV__


/**
 * Object encapsulating all state variables for CORE-V MCU environment (uvme_cvmcu_env_c) components.
 * @ingroup uvme_cvmcu_obj
 */
class uvme_cvmcu_cntxt_c extends uvmx_env_cntxt_c #(
   .T_REG_MODEL(uvme_cvmcu_reg_block_c)
);

   virtual uvme_cvmcu_probe_if   probe_vif ; ///< Handle to DUT probe interface
   virtual uvme_cvmcu_io_sel_if  io_sel_vif; ///< Handle to IO selector interface

   /// @name Integrals
   /// @{
   /// @}

   /// @name Sub-environments
   /// @{
   // TODO Add sub-environments context handles
   //      Ex: uvme_sub_cntxt_c  sub_env_cntxt; ///< Describe me!
   /// @}

   /// @name Agents
   /// @{
   uvma_obi_cntxt_c  obi_instr_cntxt; ///< Instruction OBI agent context
   uvma_obi_cntxt_c  obi_data_cntxt ; ///< Data OBI agent context
   uvma_apb_cntxt_c  apb_cntxt      ; ///< APB agent context
   uvma_irq_cntxt_c  irq_cntxt      ; ///< Interrupt request agent context
   /// @}

   /// @name Objects
   /// @{
   // TODO Add scoreboard context handles
   //      Ex: uvml_sb_simplex_cntxt_c  sb_egress_cntxt ; ///< Describe me!
   //          uvml_sb_simplex_cntxt_c  sb_ingress_cntxt; ///< Describe me!
   /// @}


   `uvm_object_utils_begin(uvme_cvmcu_cntxt_c)
      `uvm_field_enum(uvmx_reset_state_enum, reset_state, UVM_DEFAULT)
       // TODO: Add sub-environments context field macros
       //       Ex: `uvm_field_object(sub_env_cntxt, UVM_DEFAULT)
      `uvm_field_object(obi_instr_cntxt, UVM_DEFAULT)
      `uvm_field_object(obi_data_cntxt , UVM_DEFAULT)
      `uvm_field_object(apb_cntxt      , UVM_DEFAULT)
      `uvm_field_object(irq_cntxt      , UVM_DEFAULT)
      // TODO Add scoreboard context field macros
      //      Ex: `uvm_field_object(sb_egress_cntxt , UVM_DEFAULT)
      //          `uvm_field_object(sb_ingress_cntxt, UVM_DEFAULT)
   `uvm_object_utils_end


   /**
    * Default constructor.
    */
   function new(string name="uvme_cvmcu_cntxt");
      super.new(name);
   endfunction

   /**
    *
    */
   virtual function void create_objects();
      // TODO Create environment cntxt objects
      //      Ex: sub_env_cntxt  = uvme_sub_env_cntxt_c::type_id::create("sub_env_cntxt");
      obi_instr_cntxt = uvma_obi_cntxt_c::type_id::create("obi_instr_cntxt");
      obi_data_cntxt  = uvma_obi_cntxt_c::type_id::create("obi_data_cntxt" );
      apb_cntxt       = uvma_apb_cntxt_c::type_id::create("apb_cntxt"      );
      irq_cntxt       = uvma_irq_cntxt_c::type_id::create("irq_cntxt"      );
      // TODO Create uvme_cvmcu_cntxt_c scoreboard context objects
      //      Ex: sb_egress_cntxt  = uvml_sb_simplex_cntxt_c::type_id::create("sb_egress_cntxt" );
      //          sb_ingress_cntxt = uvml_sb_simplex_cntxt_c::type_id::create("sb_ingress_cntxt");
   endfunction


   /**
    * Returns all state variables to initial values.
    */
   virtual function void reset();
   endfunction

endclass : uvme_cvmcu_cntxt_c


`endif // __UVME_CVMCU_CNTXT_SV__
