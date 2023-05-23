// Copyright 2023 Acme Enterprises
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMA_CVMCU_CPI_COV_MODEL_SV__
`define __UVMA_CVMCU_CPI_COV_MODEL_SV__


/**
 * Abstract component providing a base class for CORE-V-MCU Camera Parallel Interface Agent functional coverage models.
 * @ingroup uvma_cvmcu_cpi_comps
 */
class uvma_cvmcu_cpi_cov_model_c extends uvmx_agent_cov_model_c #(
   .T_CFG     (uvma_cvmcu_cpi_cfg_c     ),
   .T_CNTXT   (uvma_cvmcu_cpi_cntxt_c   ),
   .T_SEQ_ITEM(uvma_cvmcu_cpi_seq_item_c)
);
   /// @name Covergroup variables
   /// @{
   uvma_cvmcu_cpi_mon_trn_c  mon_trn; ///< Monitor Transaction currently being sampled.
   uvma_cvmcu_cpi_tx_phy_seq_item_c  tx_phy_seq_item; ///< TX PHY Sequence Item currently being sampled.
   uvma_cvmcu_cpi_rx_phy_seq_item_c  rx_phy_seq_item; ///< RX PHY Sequence Item currently being sampled.
   uvma_cvmcu_cpi_phy_mon_trn_c  phy_mon_trn; ///< PHY Monitor Transaction currently being sampled.
   /// @}

   /// @name TLM FIFOs
   /// @{
   uvm_tlm_analysis_fifo #(uvma_cvmcu_cpi_mon_trn_c)  mon_trn_fifo; ///< FIFO of Monitor Transactions to be sampled.
   uvm_tlm_analysis_fifo #(uvma_cvmcu_cpi_tx_phy_seq_item_c)  tx_phy_seq_item_fifo; ///< FIFO of TX PHY Sequence Items to be sampled.
   uvm_tlm_analysis_fifo #(uvma_cvmcu_cpi_rx_phy_seq_item_c)  rx_phy_seq_item_fifo; ///< FIFO of RX PHY Sequence Items to be sampled.
   uvm_tlm_analysis_fifo #(uvma_cvmcu_cpi_phy_mon_trn_c)  phy_mon_trn_fifo; ///< FIFO of PHY Monitor Transaction to be sampled.
   /// @}


   `uvm_component_utils(uvma_cvmcu_cpi_cov_model_c)


   /**
    * Default constructor.
    */
   function new(string name="uvma_cvmcu_cpi_cov_model", uvm_component parent=null);
      super.new(name, parent);
   endfunction

   /**
    *
    */
   virtual function void create_fifos();
      mon_trn_fifo = new("mon_trn_fifo", this);
      phy_mon_trn_fifo = new("phy_mon_trn_fifo", this);
      tx_phy_seq_item_fifo = new("tx_phy_seq_item_fifo", this);
      rx_phy_seq_item_fifo = new("rx_phy_seq_item_fifo", this);
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
            tx_phy_seq_item_fifo.get(tx_phy_seq_item);
            sample_tx_phy_seq_item();
         end
         forever begin
            rx_phy_seq_item_fifo.get(rx_phy_seq_item);
            sample_rx_phy_seq_item();
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
   virtual function void sample_tx_phy_seq_item(); endfunction
   virtual function void sample_rx_phy_seq_item(); endfunction
   virtual function void sample_phy_mon_trn (); endfunction
   /// @}

endclass : uvma_cvmcu_cpi_cov_model_c


`endif // __UVMA_CVMCU_CPI_COV_MODEL_SV__