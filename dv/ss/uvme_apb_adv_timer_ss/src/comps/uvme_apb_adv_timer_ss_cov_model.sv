// Copyright 2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVME_APB_ADV_TIMER_SS_COV_MODEL_SV__
`define __UVME_APB_ADV_TIMER_SS_COV_MODEL_SV__


/**
 * Component encapsulating APB Advanced Timer Sub-System's functional coverage model.
 * @ingroup uvme_apb_adv_timer_ss_comps
 */
class uvme_apb_adv_timer_ss_cov_model_c extends uvmx_ss_env_cov_model_c #(
   .T_CFG  (uvme_apb_adv_timer_ss_cfg_c  ),
   .T_CNTXT(uvme_apb_adv_timer_ss_cntxt_c)
);

   /// @name Objects
   /// @{
   /// @}

   /// @name TLM
   /// @{
   /// @}


   `uvm_component_utils(uvme_apb_adv_timer_ss_cov_model_c)


   /**
    * Coverage for #cfg
    */
   covergroup apb_adv_timer_ss_cfg_cg;
      // TODO Implement apb_adv_timer_ss_cfg_cg
      //      Ex: abc_cp : coverpoint cfg.abc;
   endgroup : apb_adv_timer_ss_cfg_cg

   /**
    * Coverage for #cntxt
    */
   covergroup apb_adv_timer_ss_cntxt_cg;
      // TODO Implement apb_adv_timer_ss_cntxt_cg
      //      Ex: abc_cp : coverpoint cntxt.abc;
   endgroup : apb_adv_timer_ss_cntxt_cg

   /**
    * Coverage for probe virtual interface signals clocked to sys_clk.
    */
   covergroup apb_adv_timer_ss_probe_vif_sys_clk_cg;
      // TODO Implement apb_adv_timer_ss_probe_vif_sys_clk_cg
      //      Ex: abc_cp : coverpoint cntxt.probe_vif.abc;
   endgroup

   /**
    * Coverage for probe virtual interface signals clocked to low_speed_clk.
    */
   covergroup apb_adv_timer_ss_probe_vif_low_speed_clk_cg;
      // TODO Implement apb_adv_timer_ss_probe_vif_low_speed_clk_cg
      //      Ex: abc_cp : coverpoint cntxt.probe_vif.abc;
   endgroup

   /**
    * Creates covergroups.
    */
   function new(string name="uvme_apb_adv_timer_ss_cov_model", uvm_component parent=null);
      super.new(name, parent);
      apb_adv_timer_ss_cfg_cg   = new();
      apb_adv_timer_ss_cntxt_cg = new();
      apb_adv_timer_ss_probe_vif_sys_clk_cg = new();
      apb_adv_timer_ss_probe_vif_low_speed_clk_cg = new();
   endfunction

   /**
    * Creates TLM FIFOs.
    */
   virtual function void create_fifos();
   endfunction

   /// @name Sampling functions
   /// @{
   virtual function void sample_cfg();
      apb_adv_timer_ss_cfg_cg.sample();
   endfunction

   virtual function void sample_cntxt();
      apb_adv_timer_ss_cntxt_cg.sample();
   endfunction

   virtual task sample_vifs();
      fork
         forever begin
            @(cntxt.probe_vif.sys_clk_mp.sys_clk_cb);
            apb_adv_timer_ss_probe_vif_sys_clk_cg.sample();
         end
         forever begin
            @(cntxt.probe_vif.low_speed_clk_mp.low_speed_clk_cb);
            apb_adv_timer_ss_probe_vif_low_speed_clk_cg.sample();
         end
      join
   endtask

   virtual task sample_tlm();
      fork
      join
   endtask
   /// @}

endclass : uvme_apb_adv_timer_ss_cov_model_c


`endif // __UVME_APB_ADV_TIMER_SS_COV_MODEL_SV__