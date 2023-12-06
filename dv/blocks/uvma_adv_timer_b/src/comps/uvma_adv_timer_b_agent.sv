// Copyright 2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMA_ADV_TIMER_B_AGENT_SV__
`define __UVMA_ADV_TIMER_B_AGENT_SV__


/**
 * Sequence-based UVM Agent capable of driving/monitoring the Advanced timer counter Interface (uvma_adv_timer_b_if).
 * @ingroup uvma_adv_timer_b_comps
 */
class uvma_adv_timer_b_agent_c extends uvmx_block_agent_c #(
   .T_VIF      (virtual uvma_adv_timer_b_if),
   .T_CFG      (uvma_adv_timer_b_cfg_c     ),
   .T_CNTXT    (uvma_adv_timer_b_cntxt_c   ),
   .T_SEQ_ITEM (uvma_adv_timer_b_seq_item_c),
   .T_SQR      (uvma_adv_timer_b_sqr_c     ),
   .T_DRV      (uvma_adv_timer_b_drv_c     ),
   .T_MON      (uvma_adv_timer_b_mon_c     ),
   .T_LOGGER   (uvma_adv_timer_b_logger_c  )
);

   /// @name Ports
   /// @{
   uvm_analysis_port #(uvma_adv_timer_b_mon_trn_c     )  in_mon_trn_ap  ; ///< Output port for Input Monitor Transactions
   uvm_analysis_port #(uvma_adv_timer_b_mon_trn_c     )  out_mon_trn_ap ; ///< Output port for Output Monitor Transactions
   uvm_analysis_port #(uvma_adv_timer_b_cp_seq_item_c )  cp_seq_item_ap ; ///< Output port for Control Plane Sequence Items
   uvm_analysis_port #(uvma_adv_timer_b_dpi_seq_item_c)  dpi_seq_item_ap; ///< Output port for Data Plane Input Sequence Items
   uvm_analysis_port #(uvma_adv_timer_b_dpo_seq_item_c)  dpo_seq_item_ap; ///< Output port for Data Plane Output Sequence Items
   uvm_analysis_port #(uvma_adv_timer_b_cp_mon_trn_c  )  cp_mon_trn_ap  ; ///< Output port for Control Plane Monitor Transactions
   uvm_analysis_port #(uvma_adv_timer_b_dpi_mon_trn_c )  dpi_mon_trn_ap ; ///< Output port for Data Plane Input Monitor Transactions
   uvm_analysis_port #(uvma_adv_timer_b_dpo_mon_trn_c )  dpo_mon_trn_ap ; ///< Output port for Data Plane Output Monitor Transactions
   /// @}


   `uvm_component_utils(uvma_adv_timer_b_agent_c)


   /**
    * Default constructor.
    */
   function new(string name="uvma_adv_timer_b_agent", uvm_component parent=null);
      super.new(name, parent);
   endfunction

   /**
    * Connects sequencer to driver's TLM ports.
    */
   virtual function void connect_drivers_sequencers();
      driver.cp_driver .seq_item_port.connect(sequencer.cp_sequencer .seq_item_export);
      driver.dpi_driver.seq_item_port.connect(sequencer.dpi_sequencer.seq_item_export);
      driver.dpo_driver.seq_item_port.connect(sequencer.dpo_sequencer.seq_item_export);
   endfunction

   /**
    * Connects sequencer to monitor's TLM ports.
    */
   virtual function void connect_monitor_sequencer();
      monitor.cp_monitor .ap.connect(sequencer.cp_mon_trn_fifo .analysis_export);
      monitor.dpi_monitor.ap.connect(sequencer.dpi_mon_trn_fifo.analysis_export);
      monitor.dpo_monitor.ap.connect(sequencer.dpo_mon_trn_fifo.analysis_export);
   endfunction

   /**
    * Connects top-level ports to lower-level components'.
    */
   virtual function void connect_ports();
      in_mon_trn_ap   = sequencer.in_mon_trn_fifo .put_ap;
      out_mon_trn_ap  = sequencer.out_mon_trn_fifo.put_ap;
      cp_seq_item_ap  = sequencer.cp_sequencer .ap;
      dpi_seq_item_ap = sequencer.dpi_sequencer.ap;
      dpo_seq_item_ap = sequencer.dpo_sequencer.ap;
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
         start_sequence(cfg.in_drv_seq_type , cntxt.in_drv_seq );
         start_sequence(cfg.out_drv_seq_type, cntxt.out_drv_seq);
      end
   endtask

endclass


`endif // __UVMA_ADV_TIMER_B_AGENT_SV__