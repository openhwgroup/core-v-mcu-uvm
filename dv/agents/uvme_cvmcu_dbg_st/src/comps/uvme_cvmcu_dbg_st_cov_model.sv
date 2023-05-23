// Copyright 2023 Acme Enterprises
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVME_CVMCU_DBG_ST_COV_MODEL_SV__
`define __UVME_CVMCU_DBG_ST_COV_MODEL_SV__


/**
 * Component encapsulating CORE-V-MCU Debug Interface Agent Self-Test Environment functional coverage model.
 * @ingroup uvme_cvmcu_dbg_st_comps
 */
class uvme_cvmcu_dbg_st_cov_model_c extends uvma_cvmcu_dbg_cov_model_c;

   `uvm_component_utils(uvme_cvmcu_dbg_st_cov_model_c)


   /**
    * Agent configuration functional coverage.
    */
   covergroup cvmcu_dbg_st_cfg_cg;
      enabled_cpt         : coverpoint cfg.enabled        ;
      bypass_mode_cpt     : coverpoint cfg.bypass_mode    ;
      is_active_cpt       : coverpoint cfg.is_active      ;
      reset_type_cpt      : coverpoint cfg.reset_type     ;
      trn_log_enabled_cpt : coverpoint cfg.trn_log_enabled;
      drv_mode_cpt        : coverpoint cfg.drv_mode       ;
      drv_idle_random_cpt : coverpoint cfg.drv_idle_random;
   endgroup : cvmcu_dbg_st_cfg_cg

   /**
    * Agent context functional coverage.
    */
   covergroup cvmcu_dbg_st_cntxt_cg;
      reset_state_cpt : coverpoint cntxt.reset_state;
   endgroup : cvmcu_dbg_st_cntxt_cg

   /**
    * Agent Interface functional coverage.
    */
   covergroup cvmcu_dbg_st_vif_cg;
      // TODO Implement cvmcu_dbg_vif_cg
      //      Ex: abc_cp : coverpoint cntxt.vif.abc;
   endgroup

   /**
    * Sequence item functional coverage.
    */
   covergroup cvmcu_dbg_st_seq_item_cg;
      data_size_cpt : coverpoint seq_item.data_size;
   endgroup : cvmcu_dbg_st_seq_item_cg

   /**
    * Monitor Transaction functional coverage.
    */
   covergroup cvmcu_dbg_st_mon_trn_cg;
      data_size_cpt : coverpoint mon_trn.data_size;
   endgroup : cvmcu_dbg_st_mon_trn_cg

   /**
    * CORE PHY Sequence Item functional coverage.
    */
   covergroup cvmcu_dbg_st_core_phy_seq_item_cg;
      // TODO Implement cvmcu_dbg_st_core_phy_seq_item_cg
      //      Ex: abc_cpt : coverpoint core_phy_seq_item.abc;
   endgroup : cvmcu_dbg_st_core_phy_seq_item_cg

   /**
    * CORE PHY Sequence Item functional coverage.
    */
   covergroup cvmcu_dbg_st_sys_phy_seq_item_cg;
      // TODO Implement cvmcu_dbg_st_sys_phy_seq_item_cg
      //      Ex: abc_cpt : coverpoint sys_phy_seq_item.abc;
   endgroup : cvmcu_dbg_st_sys_phy_seq_item_cg

   /**
    * PHY Monitor Transaction functional coverage.
    */
   covergroup cvmcu_dbg_st_phy_mon_trn_cg;
      // TODO Implement cvmcu_dbg_st_phy_mon_trn_cg
      //      Ex: abc_cpt : coverpoint phy_mon_trn.abc;
   endgroup : cvmcu_dbg_st_phy_mon_trn_cg


   /**
    * Creates covergroups.
    */
   function new(string name="uvme_cvmcu_dbg_st_cov_model", uvm_component parent=null);
      super.new(name, parent);
      cvmcu_dbg_st_cfg_cg      = new();
      cvmcu_dbg_st_cntxt_cg    = new();
      cvmcu_dbg_st_vif_cg      = new();
      cvmcu_dbg_st_seq_item_cg = new();
      cvmcu_dbg_st_mon_trn_cg  = new();
      cvmcu_dbg_st_core_phy_seq_item_cg = new();
      cvmcu_dbg_st_sys_phy_seq_item_cg = new();
      cvmcu_dbg_st_phy_mon_trn_cg  = new();
   endfunction

   /// @name Sampling Functions
   /// @{
   virtual function void sample_cfg     (); cvmcu_dbg_st_cfg_cg     .sample(); endfunction
   virtual function void sample_cntxt   (); cvmcu_dbg_st_cntxt_cg   .sample(); endfunction
   virtual function void sample_vif     (); cvmcu_dbg_st_vif_cg     .sample(); endfunction
   virtual function void sample_seq_item(); cvmcu_dbg_st_seq_item_cg.sample(); endfunction

   virtual function void sample_mon_trn(); cvmcu_dbg_st_mon_trn_cg.sample(); endfunction
   virtual function void sample_core_phy_seq_item(); cvmcu_dbg_st_core_phy_seq_item_cg.sample(); endfunction
   virtual function void sample_sys_phy_seq_item(); cvmcu_dbg_st_sys_phy_seq_item_cg.sample(); endfunction
   virtual function void sample_phy_mon_trn(); cvmcu_dbg_st_phy_mon_trn_cg.sample(); endfunction
/// @}

endclass : uvme_cvmcu_dbg_st_cov_model_c


`endif // __UVME_CVMCU_DBG_ST_COV_MODEL_SV__