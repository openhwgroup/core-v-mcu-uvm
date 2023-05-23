// Copyright 2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMA_CVMCU_IO_BOARD_DRV_VSEQ_SV__
`define __UVMA_CVMCU_IO_BOARD_DRV_VSEQ_SV__


/**
 * Virtual Sequence taking in uvma_cvmcu_io_seq_item_c instances and driving uvma_cvmcu_io_drv_c with BOARD Sequence Items.
 * @ingroup uvma_cvmcu_io_seq
 */
class uvma_cvmcu_io_board_drv_vseq_c extends uvma_cvmcu_io_base_vseq_c;

   `uvm_object_utils(uvma_cvmcu_io_board_drv_vseq_c)
   `uvmx_in_drv_vseq()

   /**
    * Default constructor.
    */
   function new(string name="uvma_cvmcu_io_board_drv_vseq");
      super.new(name);
   endfunction

   /**
    * Converts uvma_cvmcu_io_seq_item_c instances into BOARD Sequence Items.
    */
   task drive_item(bit async=0, ref uvma_cvmcu_io_seq_item_c seq_item);
      // TODO Implement uvma_cvmcu_io_board_drv_vseq_c::drive()
      //      Ex: int unsigned  num_packed_bits;
      //          uvma_cvmcu_io_data_b_t  data_cycle;
      //          uvma_cvmcu_io_be_b_t    be_cycle;
      //          uvma_cvmcu_io_word_b_t  packed_bytes[];
      //          uvma_cvmcu_io_board_padi_seq_item_c  board_padi_seq_item;
      //          num_packed_bits = seq_item.pack_bytes(packed_bytes);
      //          for (int unsigned ii=0; ii<packed_bytes.size(); ii++) begin
      //             cntxt.drv_data_q.push_back(packed_bytes[ii]);
      //          end
      //          do begin
      //             for (int unsigned ii=0; ii<cfg.data_width; ii++) begin
      //                if ($urandom_range(0,100)>seq_item.bandwidth_pct) begin
      //                   be_cycle[ii] = 0;
      //                end
      //                else begin
      //                   if (cntxt.drv_data_q.size()) begin
      //                      data_cycle[ii] = cntxt.drv_data_q.pop_front();
      //                      be_cycle  [ii] = 1;
      //                   end
      //                end
      //             end
      //             do begin
      //                `uvmx_create_on(board_padi_seq_item, p_sequencer.board_padi_sequencer)
      //                board_padi_seq_item.from(seq_item);
      //                `uvmx_send_drv_with(board_padi_seq_item, {
      //                   padi_req  == 1'b1;
      //                   padi_be   == be_cycle  ;
      //                   padi_data == data_cycle;
      //                })
      //             end while (board_padi_seq_item.padi_gnt !== 1'b1);
      //          end while (cntxt.drv_data_q.size());
   endtask

   /**
    *
    */
   virtual task drive();
      fork
         
      drive_pado();
      
      join
   endtask

   /**
    * Drives uvma_cvmcu_io_board_pado_drv_c.
    */
   task drive_pado();
      uvma_cvmcu_io_board_pado_seq_item_c  board_pado_seq_item;
      forever begin
         clk();
         // TODO Implement uvma_cvmcu_io_board_drv_vseq_c::drive_pado()
         //      Ex: `uvmx_create_on(board_pado_seq_item, p_sequencer.board_pado_sequencer)
         //          board_pado_seq_item.abc = 123;
         //          `uvmx_send_drv(board_pado_seq_item)
      end
   endtask

endclass : uvma_cvmcu_io_board_drv_vseq_c


`endif // __UVMA_CVMCU_IO_BOARD_DRV_VSEQ_SV__