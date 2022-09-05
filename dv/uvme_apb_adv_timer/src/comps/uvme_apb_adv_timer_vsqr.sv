// Copyright 2022 Datum Technology Corporation
// Copyright 2022 Low Power Futures
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVME_APB_ADV_TIMER_VSQR_SV__
`define __UVME_APB_ADV_TIMER_VSQR_SV__


/**
 * Component on which all CORE-V MCU APB Advanced Timer Sub-System environment (uvme_apb_adv_timer_env_c) virtual sequences are run.
 * @ingroup uvme_apb_adv_timer_comps
 */
class uvme_apb_adv_timer_vsqr_c extends uvml_vsqr_c #(
   .REQ(uvm_sequence_item),
   .RSP(uvm_sequence_item)
);

   /// @name Objects
   /// @{
   uvme_apb_adv_timer_cfg_c    cfg  ; ///< Environment configuration handle
   uvme_apb_adv_timer_cntxt_c  cntxt; ///< Environment context handle
   /// @}

   /// @name Sequencer handles
   /// @{
   uvma_clk_sqr_c    sys_clk_sequencer  ; ///< Clock agent sequencer
   uvma_reset_sqr_c  sys_reset_sequencer; ///< Reset agent sequener
   uvma_apb_vsqr_c   apb_vsequencer     ; ///< Register access agent sequencer
   // TODO: Add sub-environments (virtual) sequencer handles
   //       Ex: uvme_sub_vsqr_c  sub_vsequencer; ///< Describe me!
   /// @}


   `uvm_component_utils_begin(uvme_apb_adv_timer_vsqr_c)
      `uvm_field_object(cfg  , UVM_DEFAULT)
      `uvm_field_object(cntxt, UVM_DEFAULT)
   `uvm_component_utils_end


   /**
    * Default constructor.
    */
   extern function new(string name="uvme_apb_adv_timer_sqr", uvm_component parent=null);

   /**
    * Ensures #cfg & #cntxt handles are not null.
    */
   extern virtual function void build_phase(uvm_phase phase);

   /**
    * Uses uvm_config_db to retrieve cfg.
    */
   extern function void get_cfg();

   /**
    * Uses uvm_config_db to retrieve cntxt.
    */
   extern function void get_cntxt();

endclass : uvme_apb_adv_timer_vsqr_c


function uvme_apb_adv_timer_vsqr_c::new(string name="uvme_apb_adv_timer_sqr", uvm_component parent=null);

   super.new(name, parent);

endfunction : new


function void uvme_apb_adv_timer_vsqr_c::build_phase(uvm_phase phase);

   super.build_phase(phase);
   get_cfg  ();
   get_cntxt();

endfunction : build_phase


function void uvme_apb_adv_timer_vsqr_c::get_cfg();

   void'(uvm_config_db#(uvme_apb_adv_timer_cfg_c)::get(this, "", "cfg", cfg));
   if (cfg == null) begin
      `uvm_fatal("APB_ADV_TIMER_VSQR", "Configuration handle is null")
   end

endfunction : get_cfg


function void uvme_apb_adv_timer_vsqr_c::get_cntxt();

   void'(uvm_config_db#(uvme_apb_adv_timer_cntxt_c)::get(this, "", "cntxt", cntxt));
   if (cntxt == null) begin
      `uvm_fatal("APB_ADV_TIMER_VSQR", "Context handle is null")
   end

endfunction : get_cntxt


`endif // __UVME_APB_ADV_TIMER_VSQR_SV__
