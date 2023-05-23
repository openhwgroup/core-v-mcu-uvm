// Copyright 2023 Acme Enterprises
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMA_CVMCU_EVENT_VSQR_SV__
`define __UVMA_CVMCU_EVENT_VSQR_SV__


/// @name Physical Sequencers
/// @{
///
typedef uvmx_sqr_c #(
   .T_CFG     (uvma_cvmcu_event_cfg_c  ),
   .T_CNTXT   (uvma_cvmcu_event_cntxt_c),
   .T_SEQ_ITEM(uvma_cvmcu_event_sys_phy_seq_item_c)
) uvma_cvmcu_event_sys_phy_sqr_c;
///
typedef uvmx_sqr_c #(
   .T_CFG     (uvma_cvmcu_event_cfg_c  ),
   .T_CNTXT   (uvma_cvmcu_event_cntxt_c),
   .T_SEQ_ITEM(uvma_cvmcu_event_core_phy_seq_item_c)
) uvma_cvmcu_event_core_phy_sqr_c;
/// @}


/**
 * Virtual Sequencer running CORE-V-MCU Event Interface Agent Virtual Sequences extending uvma_cvmcu_event_base_vseq_c.
 * @ingroup uvma_cvmcu_event_comps
 */
class uvma_cvmcu_event_vsqr_c extends uvmx_agent_vsqr_c #(
   .T_CFG     (uvma_cvmcu_event_cfg_c     ),
   .T_CNTXT   (uvma_cvmcu_event_cntxt_c   ),
   .T_SEQ_ITEM(uvma_cvmcu_event_seq_item_c)
);

   /// @name Components
   /// @{
   uvma_cvmcu_event_core_phy_sqr_c  core_phy_sequencer; ///< Sequencer for CORE PHY Driver.
   uvma_cvmcu_event_sys_phy_sqr_c  sys_phy_sequencer; ///< Sequencer for SYS PHY Driver.
   /// @}

   /// @name Ports
   /// @{
   uvm_analysis_port #(uvma_cvmcu_event_mon_trn_c)  mon_trn_ap; ///< Output Port for Monitor Transactions.
   /// @}

   /// @name FIFOs
   /// @{
   uvm_tlm_analysis_fifo  #(uvma_cvmcu_event_phy_mon_trn_c)  phy_mon_trn_fifo; ///< FIFO of PHY Monitor Transactions obtained from uvma_cvmcu_event_phy_mon_c.
   /// @}


   `uvm_component_utils(uvma_cvmcu_event_vsqr_c)


   /**
    * Default constructor.
    */
   function new(string name="uvma_cvmcu_event_vsqr", uvm_component parent=null);
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
    * Creates TLM Ports.
    */
   virtual function void create_ports();
      mon_trn_ap = new("mon_trn_ap", this);
   endfunction

   /**
    * Creates TLM FIFOs.
    */
   virtual function void create_fifos();
      phy_mon_trn_fifo = new("phy_mon_trn_fifo", this);
   endfunction

endclass : uvma_cvmcu_event_vsqr_c


`endif // __UVMA_CVMCU_EVENT_VSQR_SV__