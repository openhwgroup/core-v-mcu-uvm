// Copyright 2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVME_CVMCU_IO_ST_COV_MODEL_SV__
`define __UVME_CVMCU_IO_ST_COV_MODEL_SV__


/**
 * Component encapsulating CORE-V-MCU IO Agent Self-Test Environment functional coverage model.
 * @ingroup uvme_cvmcu_io_st_comps
 */
class uvme_cvmcu_io_st_cov_model_c extends uvma_cvmcu_io_cov_model_c;

   `uvm_component_utils(uvme_cvmcu_io_st_cov_model_c)


   /**
    * Agent configuration functional coverage.
    */
   covergroup cvmcu_io_st_cfg_cg;
      enabled_cpt         : coverpoint cfg.enabled        ;
      bypass_mode_cpt     : coverpoint cfg.bypass_mode    ;
      is_active_cpt       : coverpoint cfg.is_active      ;
      reset_type_cpt      : coverpoint cfg.reset_type     ;
      trn_log_enabled_cpt : coverpoint cfg.trn_log_enabled;
      drv_mode_cpt        : coverpoint cfg.drv_mode       ;
      drv_idle_random_cpt : coverpoint cfg.drv_idle_random;
   endgroup : cvmcu_io_st_cfg_cg

   /**
    * Agent context functional coverage.
    */
   covergroup cvmcu_io_st_cntxt_cg;
      reset_state_cpt : coverpoint cntxt.reset_state;
   endgroup : cvmcu_io_st_cntxt_cg

   /**
    * Agent Interface functional coverage.
    */
   covergroup cvmcu_io_st_vif_cg;
      // TODO Implement cvmcu_io_vif_cg
      //      Ex: abc_cp : coverpoint cntxt.vif.abc;
   endgroup

   /**
    * Sequence item functional coverage.
    */
   covergroup cvmcu_io_st_seq_item_cg;
      data_size_cpt : coverpoint seq_item.data_size;
   endgroup : cvmcu_io_st_seq_item_cg

   /**
    * IG Monitor Transaction functional coverage.
    */
   covergroup cvmcu_io_st_ig_mon_trn_cg;
      data_size_cpt : coverpoint ig_mon_trn.data_size;
   endgroup : cvmcu_io_st_ig_mon_trn_cg

   /**
    * EG Monitor Transaction functional coverage.
    */
   covergroup cvmcu_io_st_eg_mon_trn_cg;
      data_size_cpt : coverpoint eg_mon_trn.data_size;
   endgroup : cvmcu_io_st_eg_mon_trn_cg

   /**
    * BOARD PADI Sequence Item functional coverage.
    */
   covergroup cvmcu_io_st_board_padi_seq_item_cg;
      // TODO Implement cvmcu_io_st_board_padi_seq_item_cg
      //      Ex: abc_cpt : coverpoint board_padi_seq_item.abc;
   endgroup : cvmcu_io_st_board_padi_seq_item_cg

   /**
    * BOARD PADO Sequence Item functional coverage.
    */
   covergroup cvmcu_io_st_board_pado_seq_item_cg;
      // TODO Implement cvmcu_io_st_board_pado_seq_item_cg
      //      Ex: abc_cpt : coverpoint board_pado_seq_item.abc;
   endgroup : cvmcu_io_st_board_pado_seq_item_cg

   /**
    * BOARD PADI Sequence Item functional coverage.
    */
   covergroup cvmcu_io_st_chip_padi_seq_item_cg;
      // TODO Implement cvmcu_io_st_chip_padi_seq_item_cg
      //      Ex: abc_cpt : coverpoint chip_padi_seq_item.abc;
   endgroup : cvmcu_io_st_chip_padi_seq_item_cg

   /**
    * BOARD PADO Sequence Item functional coverage.
    */
   covergroup cvmcu_io_st_chip_pado_seq_item_cg;
      // TODO Implement cvmcu_io_st_chip_pado_seq_item_cg
      //      Ex: abc_cpt : coverpoint chip_pado_seq_item.abc;
   endgroup : cvmcu_io_st_chip_pado_seq_item_cg

   /**
    * PADI Monitor Transaction functional coverage.
    */
   covergroup cvmcu_io_st_padi_mon_trn_cg;
      // TODO Implement cvmcu_io_st_padi_mon_trn_cg
      //      Ex: abc_cpt : coverpoint padi_mon_trn.abc;
   endgroup : cvmcu_io_st_padi_mon_trn_cg

   /**
    * PADO Monitor Transaction functional coverage.
    */
   covergroup cvmcu_io_st_pado_mon_trn_cg;
      // TODO Implement cvmcu_io_st_pado_mon_trn_cg
      //      Ex: abc_cpt : coverpoint pado_mon_trn.abc;
   endgroup : cvmcu_io_st_pado_mon_trn_cg


   /**
    * Creates covergroups.
    */
   function new(string name="uvme_cvmcu_io_st_cov_model", uvm_component parent=null);
      super.new(name, parent);
      cvmcu_io_st_cfg_cg      = new();
      cvmcu_io_st_cntxt_cg    = new();
      cvmcu_io_st_vif_cg      = new();
      cvmcu_io_st_seq_item_cg = new();
      cvmcu_io_st_ig_mon_trn_cg = new();
      cvmcu_io_st_eg_mon_trn_cg = new();
      cvmcu_io_st_board_padi_seq_item_cg = new();
      cvmcu_io_st_board_pado_seq_item_cg = new();
      cvmcu_io_st_chip_padi_seq_item_cg = new();
      cvmcu_io_st_chip_pado_seq_item_cg = new();
      cvmcu_io_st_padi_mon_trn_cg  = new();
      cvmcu_io_st_pado_mon_trn_cg  = new();
   endfunction

   /// @name Sampling Functions
   /// @{
   virtual function void sample_cfg     (); cvmcu_io_st_cfg_cg     .sample(); endfunction
   virtual function void sample_cntxt   (); cvmcu_io_st_cntxt_cg   .sample(); endfunction
   virtual function void sample_vif     (); cvmcu_io_st_vif_cg     .sample(); endfunction
   virtual function void sample_seq_item(); cvmcu_io_st_seq_item_cg.sample(); endfunction
   virtual function void sample_ig_mon_trn(); cvmcu_io_st_ig_mon_trn_cg.sample(); endfunction
   virtual function void sample_eg_mon_trn(); cvmcu_io_st_eg_mon_trn_cg.sample(); endfunction
   virtual function void sample_board_padi_seq_item(); cvmcu_io_st_board_padi_seq_item_cg.sample(); endfunction
   virtual function void sample_board_pado_seq_item(); cvmcu_io_st_board_pado_seq_item_cg.sample(); endfunction
   virtual function void sample_chip_padi_seq_item(); cvmcu_io_st_chip_padi_seq_item_cg.sample(); endfunction
   virtual function void sample_chip_pado_seq_item(); cvmcu_io_st_chip_pado_seq_item_cg.sample(); endfunction
   virtual function void sample_padi_mon_trn(); cvmcu_io_st_padi_mon_trn_cg.sample(); endfunction
   virtual function void sample_pado_mon_trn(); cvmcu_io_st_pado_mon_trn_cg.sample(); endfunction
/// @}

endclass : uvme_cvmcu_io_st_cov_model_c


`endif // __UVME_CVMCU_IO_ST_COV_MODEL_SV__