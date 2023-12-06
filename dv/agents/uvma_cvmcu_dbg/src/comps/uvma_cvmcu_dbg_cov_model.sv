// Copyright 2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMA_CVMCU_DBG_COV_MODEL_SV__
`define __UVMA_CVMCU_DBG_COV_MODEL_SV__


/**
 * Abstract component providing a base class for CORE-V-MCU Debug Interface Agent functional coverage models.
 * @ingroup uvma_cvmcu_dbg_comps
 */
class uvma_cvmcu_dbg_cov_model_c extends uvmx_agent_cov_model_c #(
   .T_CFG     (uvma_cvmcu_dbg_cfg_c     ),
   .T_CNTXT   (uvma_cvmcu_dbg_cntxt_c   ),
   .T_SEQ_ITEM(uvma_cvmcu_dbg_seq_item_c)
);
   /// @name Covergroup variables
   /// @{
   uvma_cvmcu_dbg_mon_trn_c  mon_trn; ///< Monitor Transaction currently being sampled.
   uvma_cvmcu_dbg_core_phy_seq_item_c  core_phy_seq_item; ///< CORE PHY Sequence Item currently being sampled.
   uvma_cvmcu_dbg_sys_phy_seq_item_c  sys_phy_seq_item; ///< SYS PHY Sequence Item currently being sampled.
   uvma_cvmcu_dbg_phy_mon_trn_c  phy_mon_trn; ///< PHY Monitor Transaction currently being sampled.
   /// @}

   /// @name TLM FIFOs
   /// @{
   uvm_tlm_analysis_fifo #(uvma_cvmcu_dbg_mon_trn_c)  mon_trn_fifo; ///< FIFO of Monitor Transactions to be sampled.
   uvm_tlm_analysis_fifo #(uvma_cvmcu_dbg_core_phy_seq_item_c)  core_phy_seq_item_fifo; ///< FIFO of CORE PHY Sequence Items to be sampled.
   uvm_tlm_analysis_fifo #(uvma_cvmcu_dbg_sys_phy_seq_item_c)  sys_phy_seq_item_fifo; ///< FIFO of SYS PHY Sequence Items to be sampled.
   uvm_tlm_analysis_fifo #(uvma_cvmcu_dbg_phy_mon_trn_c)  phy_mon_trn_fifo; ///< FIFO of PHY Monitor Transaction to be sampled.
   /// @}


   `uvm_component_utils(uvma_cvmcu_dbg_cov_model_c)


   /**
    * Default constructor.
    */
   function new(string name="uvma_cvmcu_dbg_cov_model", uvm_component parent=null);
      super.new(name, parent);
   endfunction

   /**
    * Creates all input FIFOs.
    */
   virtual function void create_fifos();
      mon_trn_fifo = new("mon_trn_fifo", this);
      phy_mon_trn_fifo = new("phy_mon_trn_fifo", this);
      core_phy_seq_item_fifo = new("core_phy_seq_item_fifo", this);
      sys_phy_seq_item_fifo = new("sys_phy_seq_item_fifo", this);
   endfunction

   /**
    * Forks all sampling loops
    */
   virtual task sample_tlm();
      fork
         forever begin
            mon_trn_fifo.get(mon_trn);
            sample_mon_trn();
         end
         forever begin
            core_phy_seq_item_fifo.get(core_phy_seq_item);
            sample_core_phy_seq_item();
         end
         forever begin
            sys_phy_seq_item_fifo.get(sys_phy_seq_item);
            sample_sys_phy_seq_item();
         end
         forever begin
            phy_mon_trn_fifo.get(phy_mon_trn);
            sample_phy_mon_trn();
         end
      join
   endtask

   /// @name Sampling Hooks
   /// @{
   virtual function void sample_mon_trn(); endfunction
   virtual function void sample_core_phy_seq_item(); endfunction
   virtual function void sample_sys_phy_seq_item(); endfunction
   virtual function void sample_phy_mon_trn (); endfunction
   /// @}

endclass


`endif // __UVMA_CVMCU_DBG_COV_MODEL_SV__