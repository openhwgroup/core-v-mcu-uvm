// Copyright 2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMA_CVMCU_IO_COV_MODEL_SV__
`define __UVMA_CVMCU_IO_COV_MODEL_SV__


/**
 * Abstract component providing a base class for CORE-V-MCU IO Agent functional coverage models.
 * @ingroup uvma_cvmcu_io_comps
 */
class uvma_cvmcu_io_cov_model_c extends uvmx_agent_cov_model_c #(
   .T_CFG     (uvma_cvmcu_io_cfg_c     ),
   .T_CNTXT   (uvma_cvmcu_io_cntxt_c   ),
   .T_SEQ_ITEM(uvma_cvmcu_io_seq_item_c)
);
   /// @name Covergroup variables
   /// @{
   uvma_cvmcu_io_mon_trn_c  ig_mon_trn; ///< IG Monitor Transaction currently being sampled.
   uvma_cvmcu_io_mon_trn_c  eg_mon_trn; ///< EG Monitor Transaction currently being sampled.
   uvma_cvmcu_io_board_padi_seq_item_c  board_padi_seq_item; ///< BOARD PADI Sequence Item currently being sampled.
   uvma_cvmcu_io_board_pado_seq_item_c  board_pado_seq_item; ///< BOARD PADO Sequence Item currently being sampled.
   uvma_cvmcu_io_chip_padi_seq_item_c  chip_padi_seq_item; ///< CHIP PADI Sequence Item currently being sampled.
   uvma_cvmcu_io_chip_pado_seq_item_c  chip_pado_seq_item; ///< CHIP PADO Sequence Item currently being sampled.
   uvma_cvmcu_io_padi_mon_trn_c  padi_mon_trn; ///< PADI Monitor Transaction currently being sampled.
   uvma_cvmcu_io_pado_mon_trn_c  pado_mon_trn; ///< PADO Monitor Transaction currently being sampled.
   /// @}

   /// @name TLM FIFOs
   /// @{
   uvm_tlm_analysis_fifo #(uvma_cvmcu_io_mon_trn_c)  ig_mon_trn_fifo; ///< FIFO of IG Monitor Transactions to be sampled.
   uvm_tlm_analysis_fifo #(uvma_cvmcu_io_mon_trn_c)  eg_mon_trn_fifo; ///< FIFO of EG Monitor Transactions to be sampled.
   uvm_tlm_analysis_fifo #(uvma_cvmcu_io_board_padi_seq_item_c)  board_padi_seq_item_fifo; ///< FIFO of BOARD PADI Sequence Items to be sampled.
   uvm_tlm_analysis_fifo #(uvma_cvmcu_io_board_pado_seq_item_c)  board_pado_seq_item_fifo; ///< FIFO of BOARD PADO Sequence Items to be sampled.
   uvm_tlm_analysis_fifo #(uvma_cvmcu_io_chip_padi_seq_item_c)  chip_padi_seq_item_fifo; ///< FIFO of CHIP PADI Sequence Items to be sampled.
   uvm_tlm_analysis_fifo #(uvma_cvmcu_io_chip_pado_seq_item_c)  chip_pado_seq_item_fifo; ///< FIFO of CHIP PADO Sequence Items to be sampled.
   uvm_tlm_analysis_fifo #(uvma_cvmcu_io_padi_mon_trn_c)  padi_mon_trn_fifo; ///< FIFO of PADI Monitor Transaction to be sampled.
   uvm_tlm_analysis_fifo #(uvma_cvmcu_io_pado_mon_trn_c)  pado_mon_trn_fifo; ///< FIFO of PADO Monitor Transaction to be sampled.
   /// @}


   `uvm_component_utils(uvma_cvmcu_io_cov_model_c)


   /**
    * Default constructor.
    */
   function new(string name="uvma_cvmcu_io_cov_model", uvm_component parent=null);
      super.new(name, parent);
   endfunction

   /**
    *
    */
   virtual function void create_fifos();
      ig_mon_trn_fifo = new("ig_mon_trn_fifo", this);
      eg_mon_trn_fifo = new("eg_mon_trn_fifo", this);
      padi_mon_trn_fifo = new("padi_mon_trn_fifo", this);
      pado_mon_trn_fifo = new("pado_mon_trn_fifo", this);
      board_padi_seq_item_fifo = new("board_padi_seq_item_fifo", this);
      chip_padi_seq_item_fifo = new("chip_padi_seq_item_fifo", this);
board_pado_seq_item_fifo = new("board_pado_seq_item_fifo", this);
      chip_pado_seq_item_fifo = new("chip_pado_seq_item_fifo", this);
   endfunction

   /**
    * Forks all sampling loops
    */
   virtual task sample_tlm();
      fork
         forever begin
            ig_mon_trn_fifo.get(ig_mon_trn);
            sample_ig_mon_trn();
         end
         forever begin
            eg_mon_trn_fifo.get(eg_mon_trn);
            sample_eg_mon_trn();
         end
         forever begin
            board_padi_seq_item_fifo.get(board_padi_seq_item);
            sample_board_padi_seq_item();
         end
         forever begin
            board_pado_seq_item_fifo.get(board_pado_seq_item);
            sample_board_pado_seq_item();
         end
         forever begin
            chip_padi_seq_item_fifo.get(chip_padi_seq_item);
            sample_chip_padi_seq_item();
         end
         forever begin
            chip_pado_seq_item_fifo.get(chip_pado_seq_item);
            sample_chip_pado_seq_item();
         end
         forever begin
            padi_mon_trn_fifo.get(padi_mon_trn);
            sample_padi_mon_trn();
         end
         forever begin
            pado_mon_trn_fifo.get(pado_mon_trn);
            sample_pado_mon_trn();
         end
      join
   endtask

   /// @name Sampling Hooks
   /// @{
   virtual function void sample_ig_mon_trn(); endfunction
   virtual function void sample_eg_mon_trn(); endfunction
   
   virtual function void sample_board_padi_seq_item(); endfunction
   virtual function void sample_board_pado_seq_item(); endfunction
   virtual function void sample_chip_padi_seq_item(); endfunction
   virtual function void sample_chip_pado_seq_item(); endfunction
   virtual function void sample_padi_mon_trn (); endfunction
   virtual function void sample_pado_mon_trn (); endfunction
   /// @}

endclass : uvma_cvmcu_io_cov_model_c


`endif // __UVMA_CVMCU_IO_COV_MODEL_SV__