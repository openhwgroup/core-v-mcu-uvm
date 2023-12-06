// Copyright 2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMA_CVMCU_IO_SQR_SV__
`define __UVMA_CVMCU_IO_SQR_SV__


/**
 * Sequencer running CORE-V-MCU IO Agent Sequences extending uvma_cvmcu_io_base_seq_c.
 * @ingroup uvma_cvmcu_io_comps
 */
class uvma_cvmcu_io_sqr_c extends uvmx_agent_sqr_c #(
   .T_CFG     (uvma_cvmcu_io_cfg_c     ),
   .T_CNTXT   (uvma_cvmcu_io_cntxt_c   ),
   .T_SEQ_ITEM(uvma_cvmcu_io_seq_item_c)
);

   /// @name Components
   /// @{
   uvma_cvmcu_io_board_padi_sqr_c  board_padi_sequencer; ///< Sequencer for BOARD PADI Driver.
   uvma_cvmcu_io_board_pado_sqr_c  board_pado_sequencer; ///< Sequencer for BOARD PADO Driver.
   uvma_cvmcu_io_chip_padi_sqr_c  chip_padi_sequencer; ///< Sequencer for CHIP PADI Driver.
   uvma_cvmcu_io_chip_pado_sqr_c  chip_pado_sequencer; ///< Sequencer for CHIP PADO Driver.
   /// @}

   /// @name FIFOs
   /// @{
   uvm_tlm_analysis_fifo #(uvma_cvmcu_io_mon_trn_c)  ig_mon_trn_fifo; ///< Output for Ig Monitor Transactions.
   uvm_tlm_analysis_fifo #(uvma_cvmcu_io_mon_trn_c)  eg_mon_trn_fifo; ///< Output for Eg Monitor Transactions.
   uvm_tlm_analysis_fifo #(uvma_cvmcu_io_padi_mon_trn_c)  padi_mon_trn_fifo; ///< FIFO of PADI Monitor Transactions obtained from uvma_cvmcu_io_padi_mon_c.
   uvm_tlm_analysis_fifo #(uvma_cvmcu_io_pado_mon_trn_c)  pado_mon_trn_fifo; ///< FIFO of PADO Monitor Transactions obtained from uvma_cvmcu_io_pado_mon_c.
   /// @}


   `uvm_component_utils(uvma_cvmcu_io_sqr_c)


   /**
    * Default constructor.
    */
   function new(string name="uvma_cvmcu_io_sqr", uvm_component parent=null);
      super.new(name, parent);
   endfunction

   /**
    * Creates Sequencer components.
    */
   virtual function void create_sequencers();
      board_padi_sequencer = uvma_cvmcu_io_board_padi_sqr_c::type_id::create("board_padi_sequencer", this);
      board_pado_sequencer = uvma_cvmcu_io_board_pado_sqr_c::type_id::create("board_pado_sequencer", this);
      chip_padi_sequencer = uvma_cvmcu_io_chip_padi_sqr_c::type_id::create("chip_padi_sequencer", this);
      chip_pado_sequencer = uvma_cvmcu_io_chip_pado_sqr_c::type_id::create("chip_pado_sequencer", this);
   endfunction

   /**
    * Creates TLM FIFOs.
    */
   virtual function void create_fifos();
      ig_mon_trn_fifo = new("ig_mon_trn_fifo", this);
      eg_mon_trn_fifo = new("eg_mon_trn_fifo", this);
      padi_mon_trn_fifo = new("padi_mon_trn_fifo", this);
      pado_mon_trn_fifo = new("pado_mon_trn_fifo", this);
   endfunction

endclass


`endif // __UVMA_CVMCU_IO_SQR_SV__