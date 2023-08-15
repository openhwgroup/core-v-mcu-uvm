// Copyright 2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMA_CVMCU_CPI_VSQR_SV__
`define __UVMA_CVMCU_CPI_VSQR_SV__


/// @name Physical Sequencers
/// @{
///
typedef uvmx_sqr_c #(
   .T_CFG     (uvma_cvmcu_cpi_cfg_c  ),
   .T_CNTXT   (uvma_cvmcu_cpi_cntxt_c),
   .T_SEQ_ITEM(uvma_cvmcu_cpi_tx_phy_seq_item_c)
) uvma_cvmcu_cpi_tx_phy_sqr_c;
///
typedef uvmx_sqr_c #(
   .T_CFG     (uvma_cvmcu_cpi_cfg_c  ),
   .T_CNTXT   (uvma_cvmcu_cpi_cntxt_c),
   .T_SEQ_ITEM(uvma_cvmcu_cpi_rx_phy_seq_item_c)
) uvma_cvmcu_cpi_rx_phy_sqr_c;
/// @}


/**
 * Virtual Sequencer running CORE-V-MCU Camera Parallel Interface Agent Virtual Sequences extending uvma_cvmcu_cpi_base_vseq_c.
 * @ingroup uvma_cvmcu_cpi_comps
 */
class uvma_cvmcu_cpi_vsqr_c extends uvmx_agent_vsqr_c #(
   .T_CFG     (uvma_cvmcu_cpi_cfg_c     ),
   .T_CNTXT   (uvma_cvmcu_cpi_cntxt_c   ),
   .T_SEQ_ITEM(uvma_cvmcu_cpi_seq_item_c)
);

   /// @name Components
   /// @{
   uvma_cvmcu_cpi_tx_phy_sqr_c  tx_phy_sequencer; ///< Sequencer for TX PHY Driver.
   uvma_cvmcu_cpi_rx_phy_sqr_c  rx_phy_sequencer; ///< Sequencer for RX PHY Driver.
   /// @}

   /// @name FIFOs
   /// @{
   uvm_tlm_analysis_fifo #(uvma_cvmcu_cpi_mon_trn_c)  mon_trn_fifo; ///< Output for Monitor Transactions.
   uvm_tlm_analysis_fifo #(uvma_cvmcu_cpi_phy_mon_trn_c)  phy_mon_trn_fifo; ///< FIFO of PHY Monitor Transactions obtained from uvma_cvmcu_cpi_phy_mon_c.
   /// @}


   `uvm_component_utils(uvma_cvmcu_cpi_vsqr_c)


   /**
    * Default constructor.
    */
   function new(string name="uvma_cvmcu_cpi_vsqr", uvm_component parent=null);
      super.new(name, parent);
   endfunction

   /**
    * Creates Sequencer components.
    */
   virtual function void create_sequencers();
      tx_phy_sequencer = uvma_cvmcu_cpi_tx_phy_sqr_c::type_id::create("tx_phy_sequencer", this);
      rx_phy_sequencer = uvma_cvmcu_cpi_rx_phy_sqr_c::type_id::create("rx_phy_sequencer", this);
   endfunction

   /**
    * Creates TLM FIFOs.
    */
   virtual function void create_fifos();
      mon_trn_fifo = new("mon_trn_fifo", this);
      phy_mon_trn_fifo = new("phy_mon_trn_fifo", this);
   endfunction

endclass : uvma_cvmcu_cpi_vsqr_c


`endif // __UVMA_CVMCU_CPI_VSQR_SV__