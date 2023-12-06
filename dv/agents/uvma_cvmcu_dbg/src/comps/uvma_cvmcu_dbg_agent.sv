// Copyright 2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMA_CVMCU_DBG_AGENT_SV__
`define __UVMA_CVMCU_DBG_AGENT_SV__


/**
 * Sequence-based UVM Agent capable of driving/monitoring the CORE-V-MCU Debug Interface Interface (uvma_cvmcu_dbg_if).
 * @ingroup uvma_cvmcu_dbg_comps
 */
class uvma_cvmcu_dbg_agent_c extends uvmx_agent_c #(
   .T_VIF      (virtual uvma_cvmcu_dbg_if ),
   .T_CFG      (uvma_cvmcu_dbg_cfg_c      ),
   .T_CNTXT    (uvma_cvmcu_dbg_cntxt_c    ),
   .T_SEQ_ITEM (uvma_cvmcu_dbg_seq_item_c ),
   .T_SQR      (uvma_cvmcu_dbg_sqr_c      ),
   .T_DRV      (uvma_cvmcu_dbg_drv_c      ),
   .T_MON      (uvma_cvmcu_dbg_mon_c      ),
   .T_LOGGER   (uvma_cvmcu_dbg_logger_c   ),
   .T_COV_MODEL(uvma_cvmcu_dbg_cov_model_c)
);

   /// @name Ports
   /// @{
   uvm_analysis_port #(uvma_cvmcu_dbg_mon_trn_c)  mon_trn_ap ; ///< Output Port for Monitor Transactions.
   uvm_analysis_port #(uvma_cvmcu_dbg_core_phy_seq_item_c)  core_phy_seq_item_ap; ///< Output Port for CORE PHY Sequence Items from #driver.
   uvm_analysis_port #(uvma_cvmcu_dbg_sys_phy_seq_item_c)  sys_phy_seq_item_ap; ///< Output Port for SYS PHY Sequence Items from #driver.
   uvm_analysis_port #(uvma_cvmcu_dbg_phy_mon_trn_c)  phy_mon_trn_ap; ///< Output Port for PHY Monitor Transactions from #monitor.
   /// @}


   `uvm_component_utils(uvma_cvmcu_dbg_agent_c)


   /**
    * Default constructor.
    */
   function new(string name="uvma_cvmcu_dbg_agent", uvm_component parent=null);
      super.new(name, parent);
   endfunction

   /**
    * Connects sequencer to driver's TLM ports.
    */
   virtual function void connect_drivers_sequencers();
      driver.core_phy_driver.seq_item_port.connect(sequencer.core_phy_sequencer.seq_item_export);
      driver.sys_phy_driver.seq_item_port.connect(sequencer.sys_phy_sequencer.seq_item_export);
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
      core_phy_seq_item_ap = sequencer.core_phy_sequencer.ap;
      sys_phy_seq_item_ap = sequencer.sys_phy_sequencer.ap;
      phy_mon_trn_ap = monitor.phy_monitor.ap;
   endfunction

   /**
    * Connects coverage model to ports.
    */
   virtual function void connect_cov_model();
      seq_item_ap.connect(cov_model.seq_item_fifo.analysis_export);
      mon_trn_ap .connect(cov_model.mon_trn_fifo .analysis_export);
      core_phy_seq_item_ap.connect(cov_model.core_phy_seq_item_fifo.analysis_export);
      sys_phy_seq_item_ap.connect(cov_model.sys_phy_seq_item_fifo.analysis_export);
      phy_mon_trn_ap.connect(cov_model.phy_mon_trn_fifo.analysis_export);
   endfunction

   /**
    * Connects loggers to ports.
    */
   virtual function void connect_logger();
      mon_trn_ap .connect(logger.mon_trn_logger.analysis_export);
      core_phy_seq_item_ap.connect(logger.core_phy_seq_item_logger.analysis_export);
      sys_phy_seq_item_ap.connect(logger.sys_phy_seq_item_logger.analysis_export);
      phy_mon_trn_ap.connect(logger.phy_mon_trn_logger.analysis_export);
   endfunction

   /**
    * Starts internal Sequences for driving and monitoring.
    */
   virtual task start_sequences();
      if (cfg.is_active) begin
         case (cfg.drv_mode)
            UVMA_CVMCU_DBG_DRV_MODE_CORE: start_sequence(cfg.core_drv_seq_type, cntxt.core_drv_seq);
            UVMA_CVMCU_DBG_DRV_MODE_SYS: start_sequence(cfg.sys_drv_seq_type, cntxt.sys_drv_seq);
            default: begin
               `uvm_fatal("CVMCU_DBG_AGENT", $sformatf("Invalid cfg.drv_mode: %s", cfg.drv_mode.name()))
            end
         endcase
      end
   endtask

endclass


`endif // __UVMA_CVMCU_DBG_AGENT_SV__