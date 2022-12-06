// Copyright 2022 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVME_APB_ADV_TIMER_CNTXT_SV__
`define __UVME_APB_ADV_TIMER_CNTXT_SV__


/**
 * Object encapsulating all state variables for APB Advanced Timer Sub-System environment (uvme_apb_adv_timer_env_c) components.
 * @ingroup uvme_apb_adv_timer_obj
 */
class uvme_apb_adv_timer_cntxt_c extends uvmx_env_cntxt_c #(
   .T_REG_MODEL(uvme_apb_adv_timer_reg_block_c)
);

   virtual uvme_apb_adv_timer_probe_if  probe_vif; ///< Handle to DUT probe interface

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
   uvma_apb_cntxt_c  apb_cntxt; ///< Register access agent content
   /// @}

   /// @name Objects
   /// @{
   // TODO Add scoreboard context handles
   //      Ex: uvml_sb_simplex_cntxt_c  sb_egress_cntxt ; ///< Describe me!
   //          uvml_sb_simplex_cntxt_c  sb_ingress_cntxt; ///< Describe me!
   /// @}


   `uvm_object_utils_begin(uvme_apb_adv_timer_cntxt_c)
      `uvm_field_enum(uvmx_reset_state_enum, reset_state, UVM_DEFAULT)
       // TODO: Add sub-environments context field macros
       //       Ex: `uvm_field_object(sub_env_cntxt, UVM_DEFAULT)
      `uvm_field_object(apb_cntxt, UVM_DEFAULT)
      // TODO Add scoreboard context field macros
      //      Ex: `uvm_field_object(sb_egress_cntxt , UVM_DEFAULT)
      //          `uvm_field_object(sb_ingress_cntxt, UVM_DEFAULT)
   `uvm_object_utils_end


   /**
    * Builds events and sub-context objects.
    */
   function new(string name="uvme_apb_adv_timer_cntxt");
      super.new(name);
      // TODO Create environment cntxt objects
      //      Ex: sub_env_cntxt  = uvme_sub_env_cntxt_c::type_id::create("sub_env_cntxt");
      apb_cntxt = uvma_apb_cntxt_c::type_id::create("apb_cntxt");
      // TODO Create uvme_apb_adv_timer_cntxt_c scoreboard context objects
      //      Ex: sb_egress_cntxt  = uvml_sb_simplex_cntxt_c::type_id::create("sb_egress_cntxt" );
      //          sb_ingress_cntxt = uvml_sb_simplex_cntxt_c::type_id::create("sb_ingress_cntxt");
   endfunction


   /**
    * Returns all state variables to initial values.
    */
   virtual function void reset();
      apb_cntxt.reset();
   endfunction

endclass : uvme_apb_adv_timer_cntxt_c


`endif // __UVME_APB_ADV_TIMER_CNTXT_SV__