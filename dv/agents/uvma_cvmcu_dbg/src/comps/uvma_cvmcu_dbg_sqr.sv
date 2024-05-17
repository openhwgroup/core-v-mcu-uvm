// Copyright 2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMA_CVMCU_DBG_SQR_SV__
`define __UVMA_CVMCU_DBG_SQR_SV__


/**
 * Sequencer running CORE-V-MCU Debug Interface Agent Sequences extending uvma_cvmcu_dbg_base_seq_c.
 * @ingroup uvma_cvmcu_dbg_comps
 */
class uvma_cvmcu_dbg_sqr_c extends uvmx_agent_sqr_c #(
   .T_CFG     (uvma_cvmcu_dbg_cfg_c     ),
   .T_CNTXT   (uvma_cvmcu_dbg_cntxt_c   ),
   .T_SEQ_ITEM(uvma_cvmcu_dbg_seq_item_c)
);

   /// @name Components
   /// @{
   uvma_cvmcu_dbg_core_phy_sqr_c  core_phy_sequencer; ///< Sequencer for CORE PHY Driver.
   uvma_cvmcu_dbg_sys_phy_sqr_c  sys_phy_sequencer; ///< Sequencer for SYS PHY Driver.
   /// @}

   /// @name FIFOs
   /// @{
   uvm_tlm_analysis_fifo #(uvma_cvmcu_dbg_mon_trn_c)  mon_trn_fifo; ///< Output for Monitor Transactions.
   uvm_tlm_analysis_fifo #(uvma_cvmcu_dbg_phy_mon_trn_c)  phy_mon_trn_fifo; ///< FIFO of PHY Monitor Transactions obtained from uvma_cvmcu_dbg_phy_mon_c.
   /// @}


   `uvm_component_utils(uvma_cvmcu_dbg_sqr_c)


   /**
    * Default constructor.
    */
   function new(string name="uvma_cvmcu_dbg_sqr", uvm_component parent=null);
      super.new(name, parent);
   endfunction

   /**
    * Creates Sequencer components.
    */
   virtual function void create_sequencers();
      core_phy_sequencer = uvma_cvmcu_dbg_core_phy_sqr_c::type_id::create("core_phy_sequencer", this);
      sys_phy_sequencer = uvma_cvmcu_dbg_sys_phy_sqr_c::type_id::create("sys_phy_sequencer", this);
   endfunction

   /**
    * Creates TLM FIFOs.
    */
   virtual function void create_fifos();
      mon_trn_fifo = new("mon_trn_fifo", this);
      phy_mon_trn_fifo = new("phy_mon_trn_fifo", this);
   endfunction

endclass


`endif // __UVMA_CVMCU_DBG_SQR_SV__