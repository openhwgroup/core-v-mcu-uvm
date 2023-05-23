// Copyright 2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMA_CVMCU_EVENT_CORE_DRV_VSEQ_SV__
`define __UVMA_CVMCU_EVENT_CORE_DRV_VSEQ_SV__


/**
 * Virtual Sequence taking in uvma_cvmcu_event_seq_item_c instances and driving uvma_cvmcu_event_drv_c with CORE Sequence Items.
 * @ingroup uvma_cvmcu_event_seq
 */
class uvma_cvmcu_event_core_drv_vseq_c extends uvma_cvmcu_event_base_vseq_c;

   `uvm_object_utils(uvma_cvmcu_event_core_drv_vseq_c)
   `uvmx_in_drv_vseq()

   /**
    * Default constructor.
    */
   function new(string name="uvma_cvmcu_event_core_drv_vseq");
      super.new(name);
   endfunction

   /**
    * Converts uvma_cvmcu_event_seq_item_c instances into CORE Sequence Items.
    */
   task drive_item(bit async=0, ref uvma_cvmcu_event_seq_item_c seq_item);
      // TODO Implement uvma_cvmcu_event_core_drv_vseq_c::drive()
      //      Ex: int unsigned  num_packed_bits;
      //          uvma_cvmcu_event_data_b_t  data_cycle;
      //          uvma_cvmcu_event_be_b_t    be_cycle;
      //          uvma_cvmcu_event_word_b_t  packed_bytes[];
      //          uvma_cvmcu_event_core_phy_seq_item_c  core_phy_seq_item;
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
      //                `uvmx_create_on(core_phy_seq_item, p_sequencer.core_phy_sequencer)
      //                core_phy_seq_item.from(seq_item);
      //                `uvmx_send_drv_with(core_phy_seq_item, {
      //                   phy_req  == 1'b1;
      //                   phy_be   == be_cycle  ;
      //                   phy_data == data_cycle;
      //                })
      //             end while (core_phy_seq_item.phy_gnt !== 1'b1);
      //          end while (cntxt.drv_data_q.size());
   endtask


endclass : uvma_cvmcu_event_core_drv_vseq_c


`endif // __UVMA_CVMCU_EVENT_CORE_DRV_VSEQ_SV__