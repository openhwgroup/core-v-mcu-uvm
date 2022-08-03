// Copyright 2022 Datum Technology Corporation
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVME_CVMCU_INTR_ST_COV_MODEL_SV__
`define __UVME_CVMCU_INTR_ST_COV_MODEL_SV__


/**
 * Component encapsulating CORE-V MCU Interrupt UVM Agent Self-Test functional coverage model.
 * @ingroup uvma_cvmcu_intr_st_comps
 */
class uvme_cvmcu_intr_st_cov_model_c extends uvma_cvmcu_intr_cov_model_c;

   `uvm_component_utils(uvme_cvmcu_intr_st_cov_model_c)


   /**
    * Agent configuration functional coverage.
    */
   covergroup cvmcu_intr_st_cfg_cg;
      enabled_cpt   : coverpoint cfg.enabled  ;
      is_active_cpt : coverpoint cfg.is_active;
   endgroup : cvmcu_intr_st_cfg_cg

   /**
    * Agent context functional coverage.
    */
   covergroup cvmcu_intr_st_cntxt_cg;
      reset_state_cpt : coverpoint cntxt.reset_state;
   endgroup : cvmcu_intr_st_cntxt_cg

   /**
    * Agent sequence item functional coverage.
    */
   covergroup cvmcu_intr_st_seq_item_cg;
      // TODO Implement cvmcu_intr_st_seq_item_cg
      //      Ex: abc_cpt : coverpoint seq_item.abc;
      //          xyz_cpt : coverpoint seq_item.xyz;
   endgroup : cvmcu_intr_st_seq_item_cg

   /**
    * Agent monitored transactions functional coverage.
    */
   covergroup cvmcu_intr_st_mon_trn_cg;
      // TODO Implement cvmcu_intr_st_mon_trn_cg
      //      Ex: abc_cpt : coverpoint mon_trn.abc;
      //          xyz_cpt : coverpoint mon_trn.xyz;
   endgroup : cvmcu_intr_st_mon_trn_cg


   /**
    * Creates all covergroups.
    */
   extern function new(string name="uvme_cvmcu_intr_st_cov_model", uvm_component parent=null);

   /**
    * Samples #cvmcu_intr_st_cfg_cg
    */
   extern virtual function void sample_cfg();

   /**
    * Samples #cvmcu_intr_st_cntxt_cg
    */
   extern virtual function void sample_cntxt();

   /**
    * Samples cvmcu_intr_st_seq_item_cg
    */
   extern virtual function void sample_cvmcu_intr_seq_item();

   /**
    * Samples cvmcu_intr_st_mon_trn_cg
    */
   extern virtual function void sample_cvmcu_intr_mon_trn();

endclass : uvme_cvmcu_intr_st_cov_model_c


function uvme_cvmcu_intr_st_cov_model_c::new(string name="uvme_cvmcu_intr_st_cov_model", uvm_component parent=null);

   super.new(name, parent);
   cvmcu_intr_st_cfg_cg      = new();
   cvmcu_intr_st_cntxt_cg    = new();
   cvmcu_intr_st_seq_item_cg = new();
   cvmcu_intr_st_mon_trn_cg  = new();

endfunction : new


function void uvme_cvmcu_intr_st_cov_model_c::sample_cfg();

  cvmcu_intr_st_cfg_cg.sample();

endfunction : sample_cfg


function void uvme_cvmcu_intr_st_cov_model_c::sample_cntxt();

   cvmcu_intr_st_cntxt_cg.sample();

endfunction : sample_cntxt


function void uvme_cvmcu_intr_st_cov_model_c::sample_cvmcu_intr_seq_item();

   cvmcu_intr_st_seq_item_cg.sample();

endfunction : sample_cvmcu_intr_seq_item


function void uvme_cvmcu_intr_st_cov_model_c::sample_cvmcu_intr_mon_trn();

   cvmcu_intr_st_mon_trn_cg.sample();

endfunction : sample_cvmcu_intr_mon_trn


`endif // __UVME_CVMCU_INTR_ST_COV_MODEL_SV__
