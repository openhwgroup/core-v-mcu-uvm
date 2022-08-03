// Copyright 2022 Datum Technology Corporation
// Copyright 2022 Low Power Futures
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVME_APB_ADV_TIMER_CNTXT_SV__
`define __UVME_APB_ADV_TIMER_CNTXT_SV__


/**
 * Object encapsulating all state variables for CORE-V MCU APB Advanced Timer Sub-System environment (uvme_apb_adv_timer_env_c) components.
 * @ingroup uvme_apb_adv_timer_obj
 */
class uvme_apb_adv_timer_cntxt_c extends uvml_cntxt_c;

   virtual uvme_apb_adv_timer_probe_if  probe_vif; ///< Handle to DUT probe interface

   /// @defgroup Integrals
   /// @{
   uvml_reset_state_enum  reset_state = UVML_RESET_STATE_PRE_RESET; ///< Predicted Pre/In/Post reset state of the DUT
   /// @}

   /// @defgroup Sub-environments
   /// @{
   // TODO Add sub-environments context handles
   //      Ex: uvme_sub_env_cntxt_c  sub_env_cntxt; ///< Describe me!
   /// @}

   /// @defgroup Agents
   /// @{
   uvma_clk_cntxt_c  sys_clk_cntxt; ///< Clock agent context
   uvma_reset_cntxt_c  sys_reset_cntxt; ///< Reset agent context
   uvma_apb_cntxt_c  apb_cntxt; ///< Register access agent content
   /// @}

   /// @defgroup Objects
   /// @{
   uvm_event  sample_cfg_e  ; ///< Triggers sampling of environment configuration by the functional coverage model.
   uvm_event  sample_cntxt_e; ///< Triggers sampling of environment context by the functional coverage model.
   // TODO Add scoreboard context handles
   //      Ex: uvml_sb_simplex_cntxt_c  sb_egress_cntxt ; ///< Describe me!
   //          uvml_sb_simplex_cntxt_c  sb_ingress_cntxt; ///< Describe me!
   /// @}


   `uvm_object_utils_begin(uvme_apb_adv_timer_cntxt_c)
      `uvm_field_enum(uvml_reset_state_enum, reset_state, UVM_DEFAULT)
       // TODO: Add sub-environments context field macros
       //       Ex: `uvm_field_object(sub_env_cntxt, UVM_DEFAULT)
      `uvm_field_object(sys_clk_cntxt, UVM_DEFAULT)
      `uvm_field_object(sys_reset_cntxt, UVM_DEFAULT)
      `uvm_field_object(apb_cntxt, UVM_DEFAULT)
      `uvm_field_event(sample_cfg_e  , UVM_DEFAULT)
      `uvm_field_event(sample_cntxt_e, UVM_DEFAULT)
      // TODO Add scoreboard context field macros
      //      Ex: `uvm_field_object(sb_egress_cntxt , UVM_DEFAULT)
      //          `uvm_field_object(sb_ingress_cntxt, UVM_DEFAULT)
   `uvm_object_utils_end


   /**
    * Builds events and sub-context objects.
    */
   extern function new(string name="uvme_apb_adv_timer_cntxt");


   /**
    * Returns all state variables to initial values.
    */
   extern function void reset();

endclass : uvme_apb_adv_timer_cntxt_c


function uvme_apb_adv_timer_cntxt_c::new(string name="uvme_apb_adv_timer_cntxt");

   super.new(name);

   // TODO Create environment cntxt objects
   //      Ex: sub_env_cntxt  = uvme_sub_env_cntxt_c::type_id::create("sub_env_cntxt");
   sys_clk_cntxt = uvma_clk_cntxt_c::type_id::create("sys_clk_cntxt");
   sys_reset_cntxt = uvma_reset_cntxt_c::type_id::create("sys_reset_cntxt");
   apb_cntxt = uvma_apb_cntxt_c::type_id::create("apb_cntxt");
   sample_cfg_e   = new("sample_cfg_e"  );
   sample_cntxt_e = new("sample_cntxt_e");
   // TODO Create uvme_apb_adv_timer_cntxt_c scoreboard context objects
   //      Ex: sb_egress_cntxt  = uvml_sb_simplex_cntxt_c::type_id::create("sb_egress_cntxt" );
   //          sb_ingress_cntxt = uvml_sb_simplex_cntxt_c::type_id::create("sb_ingress_cntxt");

endfunction : new


function void uvme_apb_adv_timer_cntxt_c::reset();

   apb_cntxt.reset();

endfunction : reset


`endif // __UVME_APB_ADV_TIMER_CNTXT_SV__
