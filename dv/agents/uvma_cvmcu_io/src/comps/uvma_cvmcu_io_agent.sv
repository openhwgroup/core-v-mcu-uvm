// Copyright 2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMA_CVMCU_IO_AGENT_SV__
`define __UVMA_CVMCU_IO_AGENT_SV__


/**
 * Sequence-based UVM Agent capable of driving/monitoring the CORE-V-MCU IO Interface (uvma_cvmcu_io_if).
 * @ingroup uvma_cvmcu_io_comps
 */
class uvma_cvmcu_io_agent_c extends uvmx_agent_c #(
   .T_VIF      (virtual uvma_cvmcu_io_if ),
   .T_CFG      (uvma_cvmcu_io_cfg_c      ),
   .T_CNTXT    (uvma_cvmcu_io_cntxt_c    ),
   .T_SEQ_ITEM (uvma_cvmcu_io_seq_item_c ),
   .T_VSQR     (uvma_cvmcu_io_vsqr_c     ),
   .T_DRV      (uvma_cvmcu_io_drv_c      ),
   .T_MON      (uvma_cvmcu_io_mon_c      ),
   .T_LOGGER   (uvma_cvmcu_io_logger_c   ),
   .T_COV_MODEL(uvma_cvmcu_io_cov_model_c)
);

   /// @name Ports
   /// @{
   uvm_analysis_port #(uvma_cvmcu_io_mon_trn_c)  ig_mon_trn_ap ; ///< Output Port for IG Monitor Transactions.
   uvm_analysis_port #(uvma_cvmcu_io_mon_trn_c)  eg_mon_trn_ap ; ///< Output Port for EG Monitor Transactions.
   uvm_analysis_port #(uvma_cvmcu_io_board_padi_seq_item_c)  board_padi_seq_item_ap; ///< Output Port for BOARD PADI Sequence Items from #driver.
   uvm_analysis_port #(uvma_cvmcu_io_board_pado_seq_item_c)  board_pado_seq_item_ap; ///< Output Port for BOARD PADO Sequence Items from #driver.
   uvm_analysis_port #(uvma_cvmcu_io_chip_padi_seq_item_c)  chip_padi_seq_item_ap; ///< Output Port for CHIP PADI Sequence Items from #driver.
   uvm_analysis_port #(uvma_cvmcu_io_chip_pado_seq_item_c)  chip_pado_seq_item_ap; ///< Output Port for CHIP PADO Sequence Items from #driver.
   uvm_analysis_port #(uvma_cvmcu_io_padi_mon_trn_c)  padi_mon_trn_ap; ///< Output Port for PADI Monitor Transactions from #monitor.
   uvm_analysis_port #(uvma_cvmcu_io_pado_mon_trn_c)  pado_mon_trn_ap; ///< Output Port for PADO Monitor Transactions from #monitor.
   /// @}


   `uvm_component_utils(uvma_cvmcu_io_agent_c)


   /**
    * Default constructor.
    */
   function new(string name="uvma_cvmcu_io_agent", uvm_component parent=null);
      super.new(name, parent);
   endfunction

   /**
    * Connects sequencer to driver's TLM ports.
    */
   virtual function void connect_drivers_sequencers();
      driver.board_padi_driver.seq_item_port.connect(vsequencer.board_padi_sequencer.seq_item_export);
      driver.board_pado_driver.seq_item_port.connect(vsequencer.board_pado_sequencer.seq_item_export);
      driver.chip_padi_driver.seq_item_port.connect(vsequencer.chip_padi_sequencer.seq_item_export);
      driver.chip_pado_driver.seq_item_port.connect(vsequencer.chip_pado_sequencer.seq_item_export);
   endfunction

   /**
    * Connects sequencer to monitor's TLM ports.
    */
   virtual function void connect_monitor_vsequencer();
      monitor.padi_monitor.ap.connect(vsequencer.padi_mon_trn_fifo.analysis_export);
      monitor.pado_monitor.ap.connect(vsequencer.pado_mon_trn_fifo.analysis_export);
   endfunction

   /**
    * Connects top-level ports to lower-level components'.
    */
   virtual function void connect_ports();
      ig_mon_trn_ap = vsequencer.ig_mon_trn_fifo.put_ap;
      eg_mon_trn_ap = vsequencer.eg_mon_trn_fifo.put_ap;
      board_padi_seq_item_ap = vsequencer.board_padi_sequencer.ap;
      board_pado_seq_item_ap = vsequencer.board_pado_sequencer.ap;
      chip_padi_seq_item_ap = vsequencer.chip_padi_sequencer.ap;
      chip_pado_seq_item_ap = vsequencer.chip_pado_sequencer.ap;
      padi_mon_trn_ap = monitor.padi_monitor.ap;
      pado_mon_trn_ap = monitor.pado_monitor.ap;
   endfunction

   /**
    * Connects coverage model to ports.
    */
   virtual function void connect_cov_model();
      seq_item_ap.connect(cov_model.seq_item_fifo.analysis_export);
      ig_mon_trn_ap.connect(cov_model.ig_mon_trn_fifo.analysis_export);
      eg_mon_trn_ap.connect(cov_model.eg_mon_trn_fifo.analysis_export);
      board_padi_seq_item_ap.connect(cov_model.board_padi_seq_item_fifo.analysis_export);
      board_pado_seq_item_ap.connect(cov_model.board_pado_seq_item_fifo.analysis_export);
      chip_padi_seq_item_ap.connect(cov_model.chip_padi_seq_item_fifo.analysis_export);
      chip_pado_seq_item_ap.connect(cov_model.chip_pado_seq_item_fifo.analysis_export);
      padi_mon_trn_ap.connect(cov_model.padi_mon_trn_fifo.analysis_export);
      pado_mon_trn_ap.connect(cov_model.pado_mon_trn_fifo.analysis_export);
   endfunction

   /**
    * Connects loggers to ports.
    */
   virtual function void connect_logger();
      ig_mon_trn_ap.connect(logger.ig_mon_trn_logger.analysis_export);
      eg_mon_trn_ap.connect(logger.eg_mon_trn_logger.analysis_export);
      board_padi_seq_item_ap.connect(logger.board_padi_seq_item_logger.analysis_export);
      board_pado_seq_item_ap.connect(logger.board_pado_seq_item_logger.analysis_export);
      chip_padi_seq_item_ap.connect(logger.chip_padi_seq_item_logger.analysis_export);
      chip_pado_seq_item_ap.connect(logger.chip_pado_seq_item_logger.analysis_export);
      padi_mon_trn_ap.connect(logger.padi_mon_trn_logger.analysis_export);
      pado_mon_trn_ap.connect(logger.pado_mon_trn_logger.analysis_export);
   endfunction

   /**
    * Starts internal Sequences for driving and monitoring.
    */
   virtual task start_sequences();
      if (cfg.is_active) begin
         case (cfg.drv_mode)
            UVMA_CVMCU_IO_DRV_MODE_BOARD: start_sequence(cfg.board_drv_vseq_type, cntxt.board_drv_vseq);
            UVMA_CVMCU_IO_DRV_MODE_CHIP: start_sequence(cfg.chip_drv_vseq_type, cntxt.chip_drv_vseq);
            default: begin
               `uvm_fatal("CVMCU_IO_AGENT", $sformatf("Invalid cfg.drv_mode: %s", cfg.drv_mode.name()))
            end
         endcase
      end
   endtask

endclass : uvma_cvmcu_io_agent_c


`endif // __UVMA_CVMCU_IO_AGENT_SV__