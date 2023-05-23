// Copyright 2023 Acme Enterprises
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMA_CVMCU_DBG_MON_VSEQ_SV__
`define __UVMA_CVMCU_DBG_MON_VSEQ_SV__


/**
 * Virtual Sequence taking in CORE & SYS Monitor Transactions and creating CORE-V-MCU Debug Interface transactions (uvma_cvmcu_dbg_mon_trn_c).
 * @ingroup uvma_cvmcu_dbg_seq
 */
class uvma_cvmcu_dbg_mon_vseq_c extends uvma_cvmcu_dbg_base_vseq_c;

   `uvm_object_utils(uvma_cvmcu_dbg_mon_vseq_c)
   `uvmx_mon_vseq()

   /**
    * Default constructor.
    */
   function new(string name="uvma_cvmcu_dbg_mon_vseq");
      super.new(name);
   endfunction

   /**
    * Infinite loop forking off the `monitor_x()` tasks and a reset thread.
    */
   task monitor();
      fork
         monitor_phy();
   join
   endtask

   /**
    * TODO Describe uvma_cvmcu_dbg_mon_vseq_c::monitor_phy()
    */
   virtual task monitor_phy();
      uvma_cvmcu_dbg_mon_trn_c  mon_trn;
      uvma_cvmcu_dbg_phy_mon_trn_c  phy_mon_trn;
      uvma_cvmcu_dbg_phy_mon_trn_c  current_trn;
      forever begin
         clk();
         // TODO Implement uvma_cvmcu_dbg_mon_vseq_c::monitor_phy()
         //      Ex: uvma_cvmcu_dbg_data_b_t  data_q[$];
         //          uvma_cvmcu_dbg_data_b_t  packed_bytes[];
         //          do begin
         //             `uvmx_get_mon_trn(phy_mon_trn, phy_mon_trn_fifo)
         //          end while ((phy_mon_trn.phy_req !== 1'b1) || (phy_mon_trn.phy_gnt !== 1'b1));
         //          do begin
         //             cntxt.mon_phy_q.push_back(phy_mon_trn);
         //             `uvmx_get_mon_trn(phy_mon_trn, phy_mon_trn_fifo)
         //          end while ((phy_mon_trn.phy_req === 1'b1) && (phy_mon_trn.phy_gnt === 1'b1));
         //          mon_trn = uvma_cvmcu_dbg_mon_trn_c::type_id::create("mon_trn");
         //          do begin
         //             current_trn = cntxt.mon_phy_q.pop_front();
         //             mon_trn.from(current_trn);
         //             for (int unsigned ii=0; ii<cfg.data_width; ii++) begin
         //                data_q.push_back(current_trn.phy_data[ii]);
         //             end
         //          end while (cntxt.mon_sys_phy_q.size());
         //          packed_bytes = new[data_q.size()];
         //          for (int unsigned ii=0; ii<packed_bytes.size(); ii++) begin
         //             packed_bytes[ii] = data_q.pop_front();
         //          end
         //          void'(mon_trn.unpack_bytes(packed_bytes));
         //          `uvmx_write_mon_trn(mon_trn, mon_trn_ap)
      end
   endtask

endclass : uvma_cvmcu_dbg_mon_vseq_c


`endif // __UVMA_CVMCU_DBG_MON_VSEQ_SV__