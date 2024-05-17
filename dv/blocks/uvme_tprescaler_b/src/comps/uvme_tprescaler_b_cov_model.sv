// Copyright 2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVME_TPRESCALER_B_COV_MODEL_SV__
`define __UVME_TPRESCALER_B_COV_MODEL_SV__


/**
 * Component encapsulating Timer unit prescaler Block's functional coverage model.
 * @ingroup uvme_tprescaler_b_comps
 */
class uvme_tprescaler_b_cov_model_c extends uvmx_block_env_cov_model_c #(
   .T_CFG  (uvme_tprescaler_b_cfg_c  ),
   .T_CNTXT(uvme_tprescaler_b_cntxt_c)
);

   /// @name Objects
   /// @{
   uvma_tprescaler_b_seq_item_c      seq_item    ; ///< Sequence Item being sampled.
   uvma_tprescaler_b_mon_trn_c       in_mon_trn  ; ///< Input Monitor Transaction being sampled.
   uvma_tprescaler_b_mon_trn_c       out_mon_trn ; ///< Output Monitor Transaction being sampled.
   uvma_tprescaler_b_cp_seq_item_c   cp_seq_item ; ///< Control Plane Sequence Item being sampled.
   uvma_tprescaler_b_dpi_seq_item_c  dpi_seq_item; ///< Data Plane Input Sequence Item being sampled.
   uvma_tprescaler_b_dpo_seq_item_c  dpo_seq_item; ///< Data Plane Output Sequence Item being sampled.
   uvma_tprescaler_b_cp_mon_trn_c    cp_mon_trn  ; ///< Control Plane Monitor Transaction being sampled.
   uvma_tprescaler_b_dpi_mon_trn_c   dpi_mon_trn ; ///< Data Plane Input Monitor Transaction being sampled.
   uvma_tprescaler_b_dpo_mon_trn_c   dpo_mon_trn ; ///< Data Plane Output Monitor Transaction being sampled.
   /// @}

   /// @name FIFOs
   /// @{
   uvm_tlm_analysis_fifo #(uvma_tprescaler_b_seq_item_c    )  seq_item_fifo    ; ///< Input FIFO for Sequence Items.
   uvm_tlm_analysis_fifo #(uvma_tprescaler_b_mon_trn_c     )  in_mon_trn_fifo  ; ///< Input FIFO for Input Monitor Transactions.
   uvm_tlm_analysis_fifo #(uvma_tprescaler_b_mon_trn_c     )  out_mon_trn_fifo ; ///< Input FIFO for Output Monitor Transactions.
   uvm_tlm_analysis_fifo #(uvma_tprescaler_b_cp_seq_item_c )  cp_seq_item_fifo ; ///< Input FIFO for Control Plane Sequence Items.
   uvm_tlm_analysis_fifo #(uvma_tprescaler_b_dpi_seq_item_c)  dpi_seq_item_fifo; ///< Input FIFO for Data Plane Input Sequence Items.
   uvm_tlm_analysis_fifo #(uvma_tprescaler_b_dpo_seq_item_c)  dpo_seq_item_fifo; ///< Input FIFO for Data Plane Output Sequence Items.
   uvm_tlm_analysis_fifo #(uvma_tprescaler_b_cp_mon_trn_c  )  cp_mon_trn_fifo  ; ///< Input FIFO for Control Plane Monitor Transactions.
   uvm_tlm_analysis_fifo #(uvma_tprescaler_b_dpi_mon_trn_c )  dpi_mon_trn_fifo ; ///< Input FIFO for Data Plane Input Monitor Transactions.
   uvm_tlm_analysis_fifo #(uvma_tprescaler_b_dpo_mon_trn_c )  dpo_mon_trn_fifo ; ///< Input FIFO for Data Plane Output Monitor Transactions.
   /// @}


   `uvm_component_utils(uvme_tprescaler_b_cov_model_c)


   /**
    * Environment configuration functional coverage.
    */
   covergroup tprescaler_b_cfg_cg;
      // TODO Implement tprescaler_b_cfg_cg
      //      Ex: abc_cp : coverpoint cfg.abc;
   endgroup

   /**
    * Environment context functional coverage.
    */
   covergroup tprescaler_b_cntxt_cg;
      // TODO Implement tprescaler_b_cntxt_cg
      //      Ex: abc_cp : coverpoint cntxt.abc;
   endgroup

   /**
    * Sequence Item functional coverage.
    */
   covergroup tprescaler_b_seq_item_cg;
      // TODO Implement tprescaler_b_seq_item_cg
      //      Ex: abc_cp : coverpoint seq_item.abc;
   endgroup

   /**
    * Input Monitor Transaction functional coverage.
    */
   covergroup tprescaler_b_in_mon_trn_cg;
      // TODO Implement tprescaler_b_in_mon_trn_cg
      //      Ex: abc_cp : coverpoint in_mon_trn.abc;
   endgroup

   /**
    * Output Monitor Transaction functional coverage.
    */
   covergroup tprescaler_b_out_mon_trn_cg;
      // TODO Implement tprescaler_b_out_mon_trn_cg
      //      Ex: abc_cp : coverpoint out_mon_trn.abc;
   endgroup

   /**
    * Control Plane Sequence Item functional coverage.
    */
   covergroup tprescaler_b_cp_seq_item_cg;
      // TODO Implement tprescaler_b_cp_seq_item_cg
      //      Ex: abc_cp : coverpoint cp_seq_item.abc;
   endgroup

   /**
    * Data Plane Input Sequence Item functional coverage.
    */
   covergroup tprescaler_b_dpi_seq_item_cg;
      // TODO Implement tprescaler_b_dpi_seq_item_cg
      //      Ex: abc_cp : coverpoint dpi_seq_item.abc;
   endgroup

   /**
    * Data Plane Output Sequence Item functional coverage.
    */
   covergroup tprescaler_b_dpo_seq_item_cg;
      // TODO Implement tprescaler_b_dpo_seq_item_cg
      //      Ex: abc_cp : coverpoint dpo_seq_item.abc;
   endgroup

   /**
    * Control Plane Monitor Transaction functional coverage.
    */
   covergroup tprescaler_b_cp_mon_trn_cg;
      // TODO Implement tprescaler_b_cp_mon_trn_cg
      //      Ex: abc_cp : coverpoint cp_mon_trn.abc;
   endgroup

   /**
    * Data Plane Input Monitor Transaction functional coverage.
    */
   covergroup tprescaler_b_dpi_mon_trn_cg;
      // TODO Implement tprescaler_b_dpi_mon_trn_cg
      //      Ex: abc_cp : coverpoint dpi_mon_trn.abc;
   endgroup

   /**
    * Data Plane Output Monitor Transaction functional coverage.
    */
   covergroup tprescaler_b_dpo_mon_trn_cg;
      // TODO Implement tprescaler_b_dpo_mon_trn_cg
      //      Ex: abc_cp : coverpoint dpo_mon_trn.abc;
   endgroup


   /**
    * Creates covergroups.
    */
   function new(string name="uvme_tprescaler_b_cov_model", uvm_component parent=null);
      super.new(name, parent);
      tprescaler_b_cfg_cg          = new();
      tprescaler_b_cntxt_cg        = new();
      tprescaler_b_seq_item_cg     = new();
      tprescaler_b_in_mon_trn_cg   = new();
      tprescaler_b_out_mon_trn_cg  = new();
      tprescaler_b_cp_seq_item_cg  = new();
      tprescaler_b_dpi_seq_item_cg = new();
      tprescaler_b_dpo_seq_item_cg = new();
      tprescaler_b_cp_mon_trn_cg   = new();
      tprescaler_b_dpi_mon_trn_cg  = new();
      tprescaler_b_dpo_mon_trn_cg  = new();
   endfunction

   /**
    * Creates TLM FIFOs.
    */
   virtual function void create_fifos();
      seq_item_fifo     = new("seq_item_fifo"    , this);
      in_mon_trn_fifo   = new("in_mon_trn_fifo"  , this);
      out_mon_trn_fifo  = new("out_mon_trn_fifo" , this);
      cp_seq_item_fifo  = new("cp_seq_item_fifo" , this);
      dpi_seq_item_fifo = new("dpi_seq_item_fifo", this);
      dpo_seq_item_fifo = new("dpo_seq_item_fifo", this);
      cp_mon_trn_fifo   = new("cp_mon_trn_fifo"  , this);
      dpi_mon_trn_fifo  = new("dpi_mon_trn_fifo" , this);
      dpo_mon_trn_fifo  = new("dpo_mon_trn_fifo" , this);
   endfunction

   /// @name Sampling functions
   /// @{
   virtual function void sample_cfg  (); tprescaler_b_cfg_cg  .sample(); endfunction
   virtual function void sample_cntxt(); tprescaler_b_cntxt_cg.sample(); endfunction
   virtual task sample_tlm();
      fork
         forever begin
            seq_item_fifo.get(seq_item);
            tprescaler_b_seq_item_cg.sample();
         end
         forever begin
            in_mon_trn_fifo.get(in_mon_trn);
            tprescaler_b_in_mon_trn_cg.sample();
         end
         forever begin
            out_mon_trn_fifo.get(out_mon_trn);
            tprescaler_b_out_mon_trn_cg.sample();
         end
         forever begin
            cp_seq_item_fifo.get(cp_seq_item);
            tprescaler_b_cp_seq_item_cg.sample();
         end
         forever begin
            dpo_seq_item_fifo.get(dpo_seq_item);
            tprescaler_b_dpo_seq_item_cg.sample();
         end
         forever begin
            dpi_seq_item_fifo.get(dpi_seq_item);
            tprescaler_b_dpi_seq_item_cg.sample();
         end
         forever begin
            cp_mon_trn_fifo.get(cp_mon_trn);
            tprescaler_b_cp_mon_trn_cg.sample();
         end
         forever begin
            dpo_mon_trn_fifo.get(dpo_mon_trn);
            tprescaler_b_dpo_mon_trn_cg.sample();
         end
         forever begin
            dpi_mon_trn_fifo.get(dpi_mon_trn);
            tprescaler_b_dpi_mon_trn_cg.sample();
         end
      join
   endtask
   /// @}

endclass


`endif // __UVME_TPRESCALER_B_COV_MODEL_SV__