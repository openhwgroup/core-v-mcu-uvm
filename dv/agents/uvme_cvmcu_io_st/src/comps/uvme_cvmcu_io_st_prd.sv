// Copyright 2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVME_CVMCU_IO_ST_PRD_SV__
`define __UVME_CVMCU_IO_ST_PRD_SV__


/**
 * Component implementing TLM-based prediction for CORE-V-MCU IO UVM Agent Self-Testing Environment.
 * Predicts how the Passive Agent will observe stimulus from BOARD & CHIP Agents as well as end-to-end.
 * @ingroup uvme_cvmcu_io_st_comps
 */
class uvme_cvmcu_io_st_prd_c extends uvmx_agent_prd_c #(
   .T_CFG  (uvme_cvmcu_io_st_cfg_c  ),
   .T_CNTXT(uvme_cvmcu_io_st_cntxt_c)
);

   /// @name FIFOs
   /// @{
   uvm_tlm_analysis_fifo #(uvma_cvmcu_io_seq_item_c)  board_fifo; ///< FIFO of Sequence Items from BOARD Agent.
   uvm_tlm_analysis_fifo #(uvma_cvmcu_io_seq_item_c)  chip_fifo; ///< FIFO of Sequence Items from CHIP Agent.
   uvm_tlm_analysis_fifo #(uvma_cvmcu_io_mon_trn_c )  ig_fifo; ///< FIFO of Sequence Items from IG Agent.
   uvm_tlm_analysis_fifo #(uvma_cvmcu_io_mon_trn_c )  eg_fifo; ///< FIFO of Sequence Items from EG Agent.
   /// @}

   /// @name Ports
   /// @{
   uvm_analysis_port #(uvma_cvmcu_io_mon_trn_c )  board_ap; ///< Output Port for Monitor Transactions for BOARD Scoreboard Expected.
   uvm_analysis_port #(uvma_cvmcu_io_mon_trn_c )  chip_ap; ///< Output Port for Monitor Transactions for CHIP Scoreboard Expected.
   uvm_analysis_port #(uvma_cvmcu_io_mon_trn_c )  ig_ap; ///< Output Port for Monitor Transactions for IG Scoreboard Expected.
   uvm_analysis_port #(uvma_cvmcu_io_mon_trn_c )  eg_ap; ///< Output Port for Monitor Transactions for EG Scoreboard Expected.
   /// @}


   `uvm_component_utils(uvme_cvmcu_io_st_prd_c)


   /**
    * Default constructor.
    */
   function new(string name="uvme_cvmcu_io_st_prd", uvm_component parent=null);
      super.new(name, parent);
   endfunction

   /**
    * Creates TLM FIFOs.
    */
   virtual function void create_fifos();
      board_fifo = new("board_fifo", this);
      chip_fifo = new("chip_fifo", this);
      ig_fifo = new("ig_fifo", this);
      eg_fifo = new("eg_fifo", this);
      endfunction

   /**
    * Creates TLM Ports.
    */
   virtual function void create_ports();
      board_ap = new("board_ap", this);
      chip_ap = new("chip_ap", this);
      ig_ap = new("ig_ap", this);
      eg_ap = new("eg_ap", this);
      endfunction

   /**
    *
    */
   virtual task predict();
      fork
         predict_board();
         predict_ig();predict_chip();
         predict_eg();
         join
   endtask

   /**
    * TODO Describe uvme_cvmcu_io_st_prd_c::predict_board()
    */
   task predict_board();
      uvma_cvmcu_io_seq_item_c  in_trn ;
      uvma_cvmcu_io_mon_trn_c   out_trn;
      forever begin
         `uvmx_prd_get(board_fifo, in_trn)
         out_trn = uvma_cvmcu_io_mon_trn_c::type_id::create("out_trn");
         out_trn.from(in_trn);
         out_trn.data_size = in_trn.data_size;
         out_trn.data      = new[in_trn.data_size];
         foreach (out_trn.data[ii]) begin
            out_trn.data[ii] = in_trn.data[ii];
         end
         `uvmx_prd_send(board_ap, out_trn)
      end
   endtask

   /**
    * TODO Describe uvme_cvmcu_io_st_prd_c::predict_chip()
    */
   task predict_chip();
      uvma_cvmcu_io_seq_item_c  in_trn ;
      uvma_cvmcu_io_mon_trn_c   out_trn;
      forever begin
         `uvmx_prd_get(chip_fifo, in_trn)
         out_trn = uvma_cvmcu_io_mon_trn_c::type_id::create("out_trn");
         out_trn.from(in_trn);
         out_trn.data_size = in_trn.data_size;
         out_trn.data      = new[in_trn.data_size];
         foreach (out_trn.data[ii]) begin
            out_trn.data[ii] = in_trn.data[ii];
         end
         `uvmx_prd_send(chip_ap, out_trn)
      end
   endtask

   /**
    * TODO Describe uvme_cvmcu_io_st_prd_c::predict_ig()
    */
   task predict_ig();
      uvma_cvmcu_io_mon_trn_c  in_trn, out_trn;
      forever begin
         `uvmx_prd_get(ig_fifo, in_trn)
         out_trn = uvma_cvmcu_io_mon_trn_c::type_id::create("out_trn");
         out_trn.copy(in_trn);
         out_trn.from(in_trn);
         `uvmx_prd_send(ig_ap, out_trn)
      end
   endtask

   /**
    * TODO Describe uvme_cvmcu_io_st_prd_c::predict_eg()
    */
   task predict_eg();
      uvma_cvmcu_io_mon_trn_c  in_trn, out_trn;
      forever begin
         `uvmx_prd_get(eg_fifo, in_trn)
         out_trn = uvma_cvmcu_io_mon_trn_c::type_id::create("out_trn");
         out_trn.copy(in_trn);
         out_trn.from(in_trn);
         `uvmx_prd_send(eg_ap, out_trn)
      end
   endtask

   
endclass : uvme_cvmcu_io_st_prd_c


`endif // __UVME_CVMCU_IO_ST_PRD_SV__