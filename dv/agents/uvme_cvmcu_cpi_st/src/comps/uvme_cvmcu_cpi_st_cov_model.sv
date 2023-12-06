// Copyright 2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVME_CVMCU_CPI_ST_COV_MODEL_SV__
`define __UVME_CVMCU_CPI_ST_COV_MODEL_SV__


/**
 * Component encapsulating CORE-V-MCU Camera Parallel Interface Agent Self-Test Environment functional coverage model.
 * @ingroup uvme_cvmcu_cpi_st_comps
 */
class uvme_cvmcu_cpi_st_cov_model_c extends uvma_cvmcu_cpi_cov_model_c;

   `uvm_component_utils(uvme_cvmcu_cpi_st_cov_model_c)


   /**
    * Agent configuration functional coverage.
    */
   covergroup cvmcu_cpi_st_cfg_cg;
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
   covergroup cvmcu_cpi_st_cntxt_cg;
      reset_state_cpt : coverpoint cntxt.reset_state;
   endgroup

   /**
    * Sequence item functional coverage.
    */
   covergroup cvmcu_cpi_st_seq_item_cg;
      // TODO Implement cvmcu_cpi_st_seq_item_cg
      //      Ex: abc_cpt : coverpoint seq_item.abc;
   endgroup

   /**
    * Monitor Transaction functional coverage.
    */
   covergroup cvmcu_cpi_st_mon_trn_cg;
      // TODO Implement cvmcu_cpi_st_mon_trn_cg
      //      Ex: abc_cpt : coverpoint mon_trn.abc;
   endgroup

   /**
    * TX PHY Sequence Item functional coverage.
    */
   covergroup cvmcu_cpi_st_tx_phy_seq_item_cg;
      // TODO Implement cvmcu_cpi_st_tx_phy_seq_item_cg
      //      Ex: abc_cpt : coverpoint tx_phy_seq_item.abc;
   endgroup

   /**
    * TX PHY Sequence Item functional coverage.
    */
   covergroup cvmcu_cpi_st_rx_phy_seq_item_cg;
      // TODO Implement cvmcu_cpi_st_rx_phy_seq_item_cg
      //      Ex: abc_cpt : coverpoint rx_phy_seq_item.abc;
   endgroup

   /**
    * PHY Monitor Transaction functional coverage.
    */
   covergroup cvmcu_cpi_st_phy_mon_trn_cg;
      // TODO Implement cvmcu_cpi_st_phy_mon_trn_cg
      //      Ex: abc_cpt : coverpoint phy_mon_trn.abc;
   endgroup


   /**
    * Creates covergroups.
    */
   function new(string name="uvme_cvmcu_cpi_st_cov_model", uvm_component parent=null);
      super.new(name, parent);
      cvmcu_cpi_st_cfg_cg      = new();
      cvmcu_cpi_st_cntxt_cg    = new();
      cvmcu_cpi_st_seq_item_cg = new();
      cvmcu_cpi_st_mon_trn_cg  = new();
      cvmcu_cpi_st_tx_phy_seq_item_cg = new();
      cvmcu_cpi_st_rx_phy_seq_item_cg = new();
      cvmcu_cpi_st_phy_mon_trn_cg  = new();
   endfunction

   /// @name Sampling Functions
   /// @{
   virtual function void sample_cfg     (); cvmcu_cpi_st_cfg_cg     .sample(); endfunction
   virtual function void sample_cntxt   (); cvmcu_cpi_st_cntxt_cg   .sample(); endfunction
   virtual function void sample_seq_item(); cvmcu_cpi_st_seq_item_cg.sample(); endfunction

   virtual function void sample_mon_trn(); cvmcu_cpi_st_mon_trn_cg.sample(); endfunction
   virtual function void sample_tx_phy_seq_item(); cvmcu_cpi_st_tx_phy_seq_item_cg.sample(); endfunction
   virtual function void sample_rx_phy_seq_item(); cvmcu_cpi_st_rx_phy_seq_item_cg.sample(); endfunction
   virtual function void sample_phy_mon_trn(); cvmcu_cpi_st_phy_mon_trn_cg.sample(); endfunction
/// @}

endclass


`endif // __UVME_CVMCU_CPI_ST_COV_MODEL_SV__