// Copyright 2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMA_CVMCU_EVENT_SYS_DRV_SEQ_SV__
`define __UVMA_CVMCU_EVENT_SYS_DRV_SEQ_SV__


/**
 * Sequence taking in uvma_cvmcu_event_seq_item_c instances and driving uvma_cvmcu_event_drv_c with SYS Sequence Items.
 * @ingroup uvma_cvmcu_event_agent_seq
 */
class uvma_cvmcu_event_sys_drv_seq_c extends uvma_cvmcu_event_base_seq_c;

   `uvm_object_utils(uvma_cvmcu_event_sys_drv_seq_c)
   `uvmx_in_drv_seq()
   

   /**
    * Default constructor.
    */
   function new(string name="uvma_cvmcu_event_sys_drv_seq");
      super.new(name);
   endfunction

   /**
    * Converts uvma_cvmcu_event_seq_item_c instances into SYS Sequence Items.
    */
   virtual task drive_item(bit async=0, ref uvma_cvmcu_event_seq_item_c seq_item);
      // TODO Implement uvma_cvmcu_event_sys_drv_seq_c::drive()
      //      Ex: int unsigned  num_packed_bits;
      //          uvma_cvmcu_event_data_b_t  data_cycle;
      //          uvma_cvmcu_event_be_b_t    be_cycle;
      //          uvma_cvmcu_event_word_b_t  packed_bytes[];
      //          uvma_cvmcu_event_sys_phy_seq_item_c  sys_phy_seq_item;
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
      //                `uvmx_create_on(sys_phy_seq_item, sys_phy_sequencer)
      //                sys_phy_seq_item.from(seq_item);
      //                `uvmx_send_drv_with(sys_phy_seq_item, {
      //                   phy_req  == 1'b1;
      //                   phy_be   == be_cycle  ;
      //                   phy_data == data_cycle;
      //                })
      //             end while (sys_phy_seq_item.phy_gnt !== 1'b1);
      //          end while (cntxt.drv_data_q.size());
   endtask

   /**
    * Drives all segments.
    */
   virtual task drive();
      uvma_cvmcu_event_sys_phy_seq_item_c  sys_seq_item;
      clk();
      // TODO Implement uvma_cvmcu_event_sys_drv_seq_c::drive()
      //      Ex: randcase
      //             cfg.ton: begin
      //                `uvmx_create_on(sys_seq_item, sys_sequencer)
      //                `uvmx_rand_send_drv_with(sys_seq_item, {
      //                   ready == 1;
      //                })
      //             end
      //             (100-cfg.ton): begin
      //                clk(1);
      //             end
      //          endcase
   endtask

endclass


`endif // __UVMA_CVMCU_EVENT_SYS_DRV_SEQ_SV__