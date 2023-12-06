// Copyright 2023 Datum Technology Corporation
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
      drv_mode_cpt        : coverpoint cfg.drv_mode       ;
      drv_idle_random_cpt : coverpoint cfg.drv_idle_random;
   endgroup

   /**
    * Agent context functional coverage.
    */
   covergroup cvmcu_dbg_st_cntxt_cg;
      reset_state_cpt : coverpoint cntxt.reset_state;
   endgroup

   /**
    * Sequence item functional coverage.
    */
   covergroup cvmcu_dbg_st_seq_item_cg;
      // TODO Implement cvmcu_dbg_st_seq_item_cg
      //      Ex: abc_cpt : coverpoint seq_item.abc;
   endgroup

   /**
    * Monitor Transaction functional coverage.
    */
   covergroup cvmcu_dbg_st_mon_trn_cg;
      // TODO Implement cvmcu_dbg_st_mon_trn_cg
      //      Ex: abc_cpt : coverpoint mon_trn.abc;
   endgroup

   /**
    * CORE PHY Sequence Item functional coverage.
    */
   covergroup cvmcu_dbg_st_core_phy_seq_item_cg;
      // TODO Implement cvmcu_dbg_st_core_phy_seq_item_cg
      //      Ex: abc_cpt : coverpoint core_phy_seq_item.abc;
   endgroup

   /**
    * CORE PHY Sequence Item functional coverage.
    */
   covergroup cvmcu_dbg_st_sys_phy_seq_item_cg;
      // TODO Implement cvmcu_dbg_st_sys_phy_seq_item_cg
      //      Ex: abc_cpt : coverpoint sys_phy_seq_item.abc;
   endgroup

   /**
    * PHY Monitor Transaction functional coverage.
    */
   covergroup cvmcu_dbg_st_phy_mon_trn_cg;
      // TODO Implement cvmcu_dbg_st_phy_mon_trn_cg
      //      Ex: abc_cpt : coverpoint phy_mon_trn.abc;
   endgroup


   /**
    * Creates covergroups.
    */
   function new(string name="uvme_cvmcu_dbg_st_cov_model", uvm_component parent=null);
      super.new(name, parent);
      cvmcu_dbg_st_cfg_cg      = new();
      cvmcu_dbg_st_cntxt_cg    = new();
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
   virtual function void sample_seq_item(); cvmcu_dbg_st_seq_item_cg.sample(); endfunction

   virtual function void sample_mon_trn(); cvmcu_dbg_st_mon_trn_cg.sample(); endfunction
   virtual function void sample_core_phy_seq_item(); cvmcu_dbg_st_core_phy_seq_item_cg.sample(); endfunction
   virtual function void sample_sys_phy_seq_item(); cvmcu_dbg_st_sys_phy_seq_item_cg.sample(); endfunction
   virtual function void sample_phy_mon_trn(); cvmcu_dbg_st_phy_mon_trn_cg.sample(); endfunction
/// @}

endclass


`endif // __UVME_CVMCU_DBG_ST_COV_MODEL_SV__