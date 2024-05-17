// Copyright 2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMA_CVMCU_CPI_AGENT_SV__
`define __UVMA_CVMCU_CPI_AGENT_SV__


/**
 * Sequence-based UVM Agent capable of driving/monitoring the CORE-V-MCU Camera Parallel Interface Interface (uvma_cvmcu_cpi_if).
 * @ingroup uvma_cvmcu_cpi_comps
 */
class uvma_cvmcu_cpi_agent_c extends uvmx_agent_c #(
   .T_VIF      (virtual uvma_cvmcu_cpi_if ),
   .T_CFG      (uvma_cvmcu_cpi_cfg_c      ),
   .T_CNTXT    (uvma_cvmcu_cpi_cntxt_c    ),
   .T_SEQ_ITEM (uvma_cvmcu_cpi_seq_item_c ),
   .T_SQR      (uvma_cvmcu_cpi_sqr_c      ),
   .T_DRV      (uvma_cvmcu_cpi_drv_c      ),
   .T_MON      (uvma_cvmcu_cpi_mon_c      ),
   .T_LOGGER   (uvma_cvmcu_cpi_logger_c   ),
   .T_COV_MODEL(uvma_cvmcu_cpi_cov_model_c)
);

   /// @name Ports
   /// @{
   uvm_analysis_port #(uvma_cvmcu_cpi_mon_trn_c)  mon_trn_ap ; ///< Output Port for Monitor Transactions.
   uvm_analysis_port #(uvma_cvmcu_cpi_tx_phy_seq_item_c)  tx_phy_seq_item_ap; ///< Output Port for TX PHY Sequence Items from #driver.
   uvm_analysis_port #(uvma_cvmcu_cpi_rx_phy_seq_item_c)  rx_phy_seq_item_ap; ///< Output Port for RX PHY Sequence Items from #driver.
   uvm_analysis_port #(uvma_cvmcu_cpi_phy_mon_trn_c)  phy_mon_trn_ap; ///< Output Port for PHY Monitor Transactions from #monitor.
   /// @}


   `uvm_component_utils(uvma_cvmcu_cpi_agent_c)


   /**
    * Default constructor.
    */
   function new(string name="uvma_cvmcu_cpi_agent", uvm_component parent=null);
      super.new(name, parent);
   endfunction

   /**
    * Connects sequencer to driver's TLM ports.
    */
   virtual function void connect_drivers_sequencers();
      driver.tx_phy_driver.seq_item_port.connect(sequencer.tx_phy_sequencer.seq_item_export);
      driver.rx_phy_driver.seq_item_port.connect(sequencer.rx_phy_sequencer.seq_item_export);
   endfunction

   /**
    * Connects sequencer to monitor's TLM ports.
    */
   virtual function void connect_monitor_sequencer();
      monitor.phy_monitor.ap.connect(sequencer.phy_mon_trn_fifo.analysis_export);
   endfunction

   /**
    * Connects top-level ports to lower-level components'.
    */
   virtual function void connect_ports();
      mon_trn_ap = sequencer.mon_trn_fifo.put_ap;
      tx_phy_seq_item_ap = sequencer.tx_phy_sequencer.ap;
      rx_phy_seq_item_ap = sequencer.rx_phy_sequencer.ap;
      phy_mon_trn_ap = monitor.phy_monitor.ap;
   endfunction

   /**
    * Connects coverage model to ports.
    */
   virtual function void connect_cov_model();
      seq_item_ap.connect(cov_model.seq_item_fifo.analysis_export);
      mon_trn_ap .connect(cov_model.mon_trn_fifo .analysis_export);
      tx_phy_seq_item_ap.connect(cov_model.tx_phy_seq_item_fifo.analysis_export);
      rx_phy_seq_item_ap.connect(cov_model.rx_phy_seq_item_fifo.analysis_export);
      phy_mon_trn_ap.connect(cov_model.phy_mon_trn_fifo.analysis_export);
   endfunction

   /**
    * Connects loggers to ports.
    */
   virtual function void connect_logger();
      mon_trn_ap .connect(logger.mon_trn_logger.analysis_export);
      tx_phy_seq_item_ap.connect(logger.tx_phy_seq_item_logger.analysis_export);
      rx_phy_seq_item_ap.connect(logger.rx_phy_seq_item_logger.analysis_export);
      phy_mon_trn_ap.connect(logger.phy_mon_trn_logger.analysis_export);
   endfunction

   /**
    * Starts internal Sequences for driving and monitoring.
    */
   virtual task start_sequences();
      if (cfg.is_active) begin
         case (cfg.drv_mode)
            UVMA_CVMCU_CPI_DRV_MODE_TX: start_sequence(cfg.tx_drv_seq_type, cntxt.tx_drv_seq);
            UVMA_CVMCU_CPI_DRV_MODE_RX: start_sequence(cfg.rx_drv_seq_type, cntxt.rx_drv_seq);
            default: begin
               `uvm_fatal("CVMCU_CPI_AGENT", $sformatf("Invalid cfg.drv_mode: %s", cfg.drv_mode.name()))
            end
         endcase
      end
   endtask

endclass


`endif // __UVMA_CVMCU_CPI_AGENT_SV__