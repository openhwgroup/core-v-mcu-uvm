// Copyright 2022-2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVME_CVMCU_COV_MODEL_SV__
`define __UVME_CVMCU_COV_MODEL_SV__


/**
 * Component encapsulating CORE-V MCU's functional coverage model.
 * @ingroup uvme_cvmcu_comps
 */
class uvme_cvmcu_cov_model_c extends uvmx_env_cov_model_c #(
   .T_CFG  (uvme_cvmcu_cfg_c  ),
   .T_CNTXT(uvme_cvmcu_cntxt_c)
);

   /// @name Objects
   /// @{
   // TODO Add covergoup sampling variable(s)
   //      Ex: uvml_eth_pkt_mon_trn_c  pkt_trn; ///< Describe me!
   /// @}

   /// @name TLM
   /// @{
   // TODO Add Input TLM to uvme_cvmcu_cov_model_c
   //      Ex: uvm_tlm_analysis_fifo #(uvml_eth_pkt_mon_trn_c)  pkt_fifo; ///< Describe me!
   /// @}


   `uvm_component_utils(uvme_cvmcu_cov_model_c)


   /**
    * Coverage for #cfg
    */
   covergroup cvmcu_cfg_cg;
      // TODO Implement cvmcu_cfg_cg
      //      Ex: abc_cp : coverpoint cfg.abc;
   endgroup : cvmcu_cfg_cg

   /**
    * Coverage for #cntxt
    */
   covergroup cvmcu_cntxt_cg;
      // TODO Implement cvmcu_cntxt_cg
      //      Ex: abc_cp : coverpoint cntxt.abc;
   endgroup : cvmcu_cntxt_cg

   /**
    * Coverage for probe virtual interface.
    */
   covergroup cvmcu_probe_vif_cg;
      // TODO Implement cvmcu_cntxt_cg
      //      Ex: abc_cp : coverpoint cntxt.probe_vif.abc;
   endgroup

   // TODO Add covergroup(s) to uvme_cvmcu_cov_model_c
   //      Ex: covergroup cvmcu_pkt_trn_cg;
   //             address_cp : coverpoint pkt_trn.payload_size {
   //                bins small  = {0   ,   64};
   //                bins medium = {65  , 1024};
   //                bins large  = {1024, 2048};
   //             }
   //          endgroup : cvmcu_pkt_trn_cg


   /**
    * Creates covergroups.
    */
   function new(string name="uvme_cvmcu_cov_model", uvm_component parent=null);
      super.new(name, parent);
      cvmcu_cfg_cg       = new();
      cvmcu_cntxt_cg     = new();
      cvmcu_probe_vif_cg = new();
      // TODO Create coverage groups for uvme_cvmcu_cov_model_c
      //      Ex: cvmcu_pkt_cg = new();
   endfunction

   /**
    * Creates TLM FIFOs.
    */
   virtual function void create_fifos();
      // TODO Build Input TLM
      //      Ex: pkt_fifo = new("pkt_fifo", this);
   endfunction

   /// @name Sampling functions
   /// @{
   virtual function void sample_cfg();
      cvmcu_cfg_cg.sample();
   endfunction

   virtual function void sample_cntxt();
      cvmcu_cntxt_cg.sample();
   endfunction

   virtual task sample_vifs();
      fork
         forever begin
            @(cntxt.probe_vif.mp.cb);
            cvmcu_probe_vif_cg.sample();
         end
      join
   endtask

   virtual task sample_tlm();
      fork
         // TODO Implement uvme_cvmcu_cov_model_c::run_phase()
         //      Ex: forever begin
         //             pkt_fifo.get(pkt_trn);
         //             cvmcu_pkt_trn_cg.sample();
         //          end
      join
   endtask
   /// @}

endclass : uvme_cvmcu_cov_model_c


`endif // __UVME_CVMCU_COV_MODEL_SV__
