// Copyright 2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMA_CVMCU_CPI_LOGGER_SV__
`define __UVMA_CVMCU_CPI_LOGGER_SV__


/**
 * Component which logs to disk information of the transactions generated and monitored by uvma_cvmcu_cpi_agent_c.
 * @ingroup uvma_cvmcu_cpi_comps
 */
class uvma_cvmcu_cpi_logger_c extends uvmx_agent_logger_c #(
   .T_CFG     (uvma_cvmcu_cpi_cfg_c     ),
   .T_CNTXT   (uvma_cvmcu_cpi_cntxt_c   ),
   .T_SEQ_ITEM(uvma_cvmcu_cpi_seq_item_c)
);

   /// @name Loggers
   /// @{
   uvmx_tlm_logger_c #(uvma_cvmcu_cpi_mon_trn_c )  mon_trn_logger; ///< Logs Monitor Transactions from vsequencer.
   uvmx_tlm_logger_c #(uvma_cvmcu_cpi_tx_phy_seq_item_c)  tx_phy_seq_item_logger; ///< Logs PHY Sequence Items from TX Driver.
   uvmx_tlm_logger_c #(uvma_cvmcu_cpi_rx_phy_seq_item_c)  rx_phy_seq_item_logger; ///< Logs PHY Sequence Items from RX Driver.
   uvmx_tlm_logger_c #(uvma_cvmcu_cpi_phy_mon_trn_c)  phy_mon_trn_logger; ///< Logs PHY Monitor Transactions from Monitor.
   /// @}


   `uvm_component_utils(uvma_cvmcu_cpi_logger_c)


   /**
    * Default constructor.
    */
   function new(string name="uvma_cvmcu_cpi_logger", uvm_component parent=null);
      super.new(name, parent);
   endfunction

   /**
    * Creates logger components.
    */
   virtual function void create_loggers();
      mon_trn_logger  = uvmx_tlm_logger_c #(uvma_cvmcu_cpi_mon_trn_c )::type_id::create("mon_trn_logger" , this);
      phy_mon_trn_logger = uvmx_tlm_logger_c #(uvma_cvmcu_cpi_phy_mon_trn_c)::type_id::create("phy_mon_trn_logger", this);
      tx_phy_seq_item_logger = uvmx_tlm_logger_c #(uvma_cvmcu_cpi_tx_phy_seq_item_c)::type_id::create("tx_phy_seq_item_logger", this);
      rx_phy_seq_item_logger = uvmx_tlm_logger_c #(uvma_cvmcu_cpi_rx_phy_seq_item_c)::type_id::create("rx_phy_seq_item_logger", this);
   endfunction

   /**
    * Sets filenames for logger components.
    */
   virtual function void configure_loggers();
      mon_trn_logger .set_filename("mon_trn");
      phy_mon_trn_logger.set_filename("phy.mon_trn");
      tx_phy_seq_item_logger.set_filename("tx_phy.seq_item");
      rx_phy_seq_item_logger.set_filename("rx_phy.seq_item");
   endfunction

endclass : uvma_cvmcu_cpi_logger_c


`endif // __UVMA_CVMCU_CPI_LOGGER_SV__