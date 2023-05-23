// Copyright 2023 Acme Enterprises
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMA_CVMCU_IO_MON_VSEQ_SV__
`define __UVMA_CVMCU_IO_MON_VSEQ_SV__


/**
 * Virtual Sequence taking in BOARD & CHIP Monitor Transactions and creating CORE-V-MCU IO transactions (uvma_cvmcu_io_mon_trn_c).
 * @ingroup uvma_cvmcu_io_seq
 */
class uvma_cvmcu_io_mon_vseq_c extends uvma_cvmcu_io_base_vseq_c;

   `uvm_object_utils(uvma_cvmcu_io_mon_vseq_c)
   `uvmx_mon_vseq()

   /**
    * Default constructor.
    */
   function new(string name="uvma_cvmcu_io_mon_vseq");
      super.new(name);
   endfunction

   /**
    * Infinite loop forking off the `monitor_x()` tasks and a reset thread.
    */
   task monitor();
      fork
         monitor_padi();
monitor_pado();
   join
   endtask

   /**
    * TODO Describe uvma_cvmcu_io_mon_vseq_c::monitor_padi()
    */
   virtual task monitor_padi();
      uvma_cvmcu_io_mon_trn_c  mon_trn;
      uvma_cvmcu_io_padi_mon_trn_c  padi_mon_trn;
      uvma_cvmcu_io_padi_mon_trn_c  current_trn;
      forever begin
         clk();
         // TODO Implement uvma_cvmcu_io_mon_vseq_c::monitor_padi()
         //      Ex: uvma_cvmcu_io_data_b_t  data_q[$];
         //          uvma_cvmcu_io_data_b_t  packed_bytes[];
         //          do begin
         //             `uvmx_get_mon_trn(padi_mon_trn, padi_mon_trn_fifo)
         //          end while ((padi_mon_trn.padi_req !== 1'b1) || (padi_mon_trn.padi_gnt !== 1'b1));
         //          do begin
         //             cntxt.mon_padi_q.push_back(padi_mon_trn);
         //             `uvmx_get_mon_trn(padi_mon_trn, padi_mon_trn_fifo)
         //          end while ((padi_mon_trn.padi_req === 1'b1) && (padi_mon_trn.padi_gnt === 1'b1));
         //          mon_trn = uvma_cvmcu_io_mon_trn_c::type_id::create("mon_trn");
         //          do begin
         //             current_trn = cntxt.mon_padi_q.pop_front();
         //             mon_trn.from(current_trn);
         //             for (int unsigned ii=0; ii<cfg.data_width; ii++) begin
         //                data_q.push_back(current_trn.padi_data[ii]);
         //             end
         //          end while (cntxt.mon_board_padi_q.size());
         //          packed_bytes = new[data_q.size()];
         //          for (int unsigned ii=0; ii<packed_bytes.size(); ii++) begin
         //             packed_bytes[ii] = data_q.pop_front();
         //          end
         //          void'(mon_trn.unpack_bytes(packed_bytes));
         //          `uvmx_write_mon_trn(mon_trn, mon_trn_ap)
      end
   endtask

   /**
    * TODO Describe uvma_cvmcu_io_mon_vseq_c::monitor_pado()
    */
   virtual task monitor_pado();
      uvma_cvmcu_io_mon_trn_c  mon_trn;
      uvma_cvmcu_io_pado_mon_trn_c  pado_mon_trn;
      uvma_cvmcu_io_pado_mon_trn_c  current_trn;
      forever begin
         clk();
         // TODO Implement uvma_cvmcu_io_mon_vseq_c::monitor_pado()
         //      Ex: uvma_cvmcu_io_data_b_t  data_q[$];
         //          uvma_cvmcu_io_data_b_t  packed_bytes[];
         //          do begin
         //             `uvmx_get_mon_trn(pado_mon_trn, pado_mon_trn_fifo)
         //          end while ((pado_mon_trn.pado_req !== 1'b1) || (pado_mon_trn.pado_gnt !== 1'b1));
         //          do begin
         //             cntxt.mon_pado_q.push_back(pado_mon_trn);
         //             `uvmx_get_mon_trn(pado_mon_trn, pado_mon_trn_fifo)
         //          end while ((pado_mon_trn.pado_req === 1'b1) && (pado_mon_trn.pado_gnt === 1'b1));
         //          mon_trn = uvma_cvmcu_io_mon_trn_c::type_id::create("mon_trn");
         //          do begin
         //             current_trn = cntxt.mon_pado_q.pop_front();
         //             mon_trn.from(current_trn);
         //             for (int unsigned ii=0; ii<cfg.data_width; ii++) begin
         //                data_q.push_back(current_trn.pado_data[ii]);
         //             end
         //          end while (cntxt.mon_chip_pado_q.size());
         //          packed_bytes = new[data_q.size()];
         //          for (int unsigned ii=0; ii<packed_bytes.size(); ii++) begin
         //             packed_bytes[ii] = data_q.pop_front();
         //          end
         //          void'(mon_trn.unpack_bytes(packed_bytes));
         //          `uvmx_write_mon_trn(mon_trn, mon_trn_ap)
      end
   endtask

endclass : uvma_cvmcu_io_mon_vseq_c


`endif // __UVMA_CVMCU_IO_MON_VSEQ_SV__