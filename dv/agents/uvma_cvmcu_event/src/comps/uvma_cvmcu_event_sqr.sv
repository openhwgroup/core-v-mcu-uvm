// Copyright 2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMA_CVMCU_EVENT_SQR_SV__
`define __UVMA_CVMCU_EVENT_SQR_SV__


/**
 * Sequencer running CORE-V-MCU Event Interface Agent Sequences extending uvma_cvmcu_event_base_seq_c.
 * @ingroup uvma_cvmcu_event_comps
 */
class uvma_cvmcu_event_sqr_c extends uvmx_agent_sqr_c #(
   .T_CFG     (uvma_cvmcu_event_cfg_c     ),
   .T_CNTXT   (uvma_cvmcu_event_cntxt_c   ),
   .T_SEQ_ITEM(uvma_cvmcu_event_seq_item_c)
);

   /// @name Components
   /// @{
   uvma_cvmcu_event_core_phy_sqr_c  core_phy_sequencer; ///< Sequencer for CORE PHY Driver.
   uvma_cvmcu_event_sys_phy_sqr_c  sys_phy_sequencer; ///< Sequencer for SYS PHY Driver.
   /// @}

   /// @name FIFOs
   /// @{
   uvm_tlm_analysis_fifo #(uvma_cvmcu_event_mon_trn_c)  c2s_mon_trn_fifo; ///< Output for C2s Monitor Transactions.
   uvm_tlm_analysis_fifo #(uvma_cvmcu_event_mon_trn_c)  s2c_mon_trn_fifo; ///< Output for S2c Monitor Transactions.
   uvm_tlm_analysis_fifo #(uvma_cvmcu_event_phy_mon_trn_c)  phy_mon_trn_fifo; ///< FIFO of PHY Monitor Transactions obtained from uvma_cvmcu_event_phy_mon_c.
   /// @}


   `uvm_component_utils(uvma_cvmcu_event_sqr_c)


   /**
    * Default constructor.
    */
   function new(string name="uvma_cvmcu_event_sqr", uvm_component parent=null);
      super.new(name, parent);
   endfunction

   /**
    * Creates Sequencer components.
    */
   virtual function void create_sequencers();
      core_phy_sequencer = uvma_cvmcu_event_core_phy_sqr_c::type_id::create("core_phy_sequencer", this);
      sys_phy_sequencer = uvma_cvmcu_event_sys_phy_sqr_c::type_id::create("sys_phy_sequencer", this);
   endfunction

   /**
    * Creates TLM FIFOs.
    */
   virtual function void create_fifos();
      c2s_mon_trn_fifo = new("c2s_mon_trn_fifo", this);
      s2c_mon_trn_fifo = new("s2c_mon_trn_fifo", this);
      phy_mon_trn_fifo = new("phy_mon_trn_fifo", this);
   endfunction

endclass


`endif // __UVMA_CVMCU_EVENT_SQR_SV__