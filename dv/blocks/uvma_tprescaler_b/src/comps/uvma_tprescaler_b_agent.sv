// Copyright 2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMA_TPRESCALER_B_AGENT_SV__
`define __UVMA_TPRESCALER_B_AGENT_SV__


/**
 * Sequence-based UVM Agent capable of driving/monitoring the Timer unit prescaler Interface (uvma_tprescaler_b_if).
 * @ingroup uvma_tprescaler_b_comps
 */
class uvma_tprescaler_b_agent_c extends uvmx_agent_c #(
   .T_VIF      (virtual uvma_tprescaler_b_if ),
   .T_CFG      (uvma_tprescaler_b_cfg_c      ),
   .T_CNTXT    (uvma_tprescaler_b_cntxt_c    ),
   .T_SEQ_ITEM (uvma_tprescaler_b_seq_item_c ),
   .T_VSQR     (uvma_tprescaler_b_vsqr_c     ),
   .T_DRV      (uvma_tprescaler_b_drv_c      ),
   .T_MON      (uvma_tprescaler_b_mon_c      ),
   .T_LOGGER   (uvma_tprescaler_b_logger_c   ),
   .T_COV_MODEL(uvma_tprescaler_b_cov_model_c)
);

   /// @name Ports
   /// @{
   uvm_analysis_port #(uvma_tprescaler_b_mon_trn_c     )  in_mon_trn_ap  ; ///< Output port for Input Monitor Transactions
   uvm_analysis_port #(uvma_tprescaler_b_mon_trn_c     )  out_mon_trn_ap ; ///< Output port for Output Monitor Transactions
   uvm_analysis_port #(uvma_tprescaler_b_cp_seq_item_c )  cp_seq_item_ap ; ///< Output port for Control Plane Sequence Items
   uvm_analysis_port #(uvma_tprescaler_b_dpi_seq_item_c)  dpi_seq_item_ap; ///< Output port for Data Plane Input Sequence Items
   uvm_analysis_port #(uvma_tprescaler_b_dpo_seq_item_c)  dpo_seq_item_ap; ///< Output port for Data Plane Output Sequence Items
   uvm_analysis_port #(uvma_tprescaler_b_cp_mon_trn_c  )  cp_mon_trn_ap  ; ///< Output port for Control Plane Monitor Transactions
   uvm_analysis_port #(uvma_tprescaler_b_dpi_mon_trn_c )  dpi_mon_trn_ap ; ///< Output port for Data Plane Input Monitor Transactions
   uvm_analysis_port #(uvma_tprescaler_b_dpo_mon_trn_c )  dpo_mon_trn_ap ; ///< Output port for Data Plane Output Monitor Transactions
   /// @}


   `uvm_component_utils(uvma_tprescaler_b_agent_c)


   /**
    * Default constructor.
    */
   function new(string name="uvma_tprescaler_b_agent", uvm_component parent=null);
      super.new(name, parent);
   endfunction

   /**
    * Connects sequencer to driver's TLM ports.
    */
   virtual function void connect_drivers_sequencers();
      driver.cp_driver .seq_item_port.connect(vsequencer.cp_sequencer .seq_item_export);
      driver.dpi_driver.seq_item_port.connect(vsequencer.dpi_sequencer.seq_item_export);
      driver.dpo_driver.seq_item_port.connect(vsequencer.dpo_sequencer.seq_item_export);
   endfunction

   /**
    * Connects sequencer to monitor's TLM ports.
    */
   virtual function void connect_monitor_vsequencer();
      monitor.cp_monitor .ap.connect(vsequencer.cp_mon_trn_fifo .analysis_export);
      monitor.dpi_monitor.ap.connect(vsequencer.dpi_mon_trn_fifo.analysis_export);
      monitor.dpo_monitor.ap.connect(vsequencer.dpo_mon_trn_fifo.analysis_export);
   endfunction

   /**
    * Connects top-level ports to lower-level components'.
    */
   virtual function void connect_ports();
      in_mon_trn_ap   = vsequencer.in_mon_trn_ap ;
      out_mon_trn_ap  = vsequencer.out_mon_trn_ap;
      cp_seq_item_ap  = driver .cp_driver  .ap;
      dpi_seq_item_ap = driver .dpi_driver .ap;
      dpo_seq_item_ap = driver .dpo_driver .ap;
      cp_mon_trn_ap   = monitor.cp_monitor .ap;
      dpi_mon_trn_ap  = monitor.dpi_monitor.ap;
      dpo_mon_trn_ap  = monitor.dpo_monitor.ap;
   endfunction

   /**
    * Connects loggers to ports.
    */
   virtual function void connect_logger();
      in_mon_trn_ap  .connect(logger.in_mon_trn_logger  .analysis_export);
      out_mon_trn_ap .connect(logger.out_mon_trn_logger .analysis_export);
      cp_seq_item_ap .connect(logger.cp_seq_item_logger .analysis_export);
      dpi_seq_item_ap.connect(logger.dpi_seq_item_logger.analysis_export);
      dpo_seq_item_ap.connect(logger.dpo_seq_item_logger.analysis_export);
      cp_mon_trn_ap  .connect(logger.cp_mon_trn_logger  .analysis_export);
      dpi_mon_trn_ap .connect(logger.dpi_mon_trn_logger .analysis_export);
      dpo_mon_trn_ap .connect(logger.dpo_mon_trn_logger .analysis_export);
   endfunction

   /**
    * Starts internal Sequences for driving and monitoring.
    */
   virtual task start_sequences();
      if (cfg.is_active) begin
         start_sequence(cfg.in_drv_vseq_type , cntxt.in_drv_vseq );
         start_sequence(cfg.out_drv_vseq_type, cntxt.out_drv_vseq);
      end
   endtask

endclass : uvma_tprescaler_b_agent_c


`endif // __UVMA_TPRESCALER_B_AGENT_SV__