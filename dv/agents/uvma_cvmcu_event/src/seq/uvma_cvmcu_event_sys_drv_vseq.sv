// Copyright 2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMA_CVMCU_EVENT_SYS_DRV_VSEQ_SV__
`define __UVMA_CVMCU_EVENT_SYS_DRV_VSEQ_SV__


/**
 * Virtual Sequence taking in uvma_cvmcu_event_seq_item_c instances and driving uvma_cvmcu_event_drv_c with SYS Sequence Items.
 * @ingroup uvma_cvmcu_event_seq
 */
class uvma_cvmcu_event_sys_drv_vseq_c extends uvma_cvmcu_event_base_vseq_c;

   `uvm_object_utils(uvma_cvmcu_event_sys_drv_vseq_c)
   `uvmx_out_drv_vseq()

   /**
    * Default constructor.
    */
   function new(string name="uvma_cvmcu_event_sys_drv_vseq");
      super.new(name);
   endfunction



   /**
    * Drives all segments.
    */
   virtual task drive();
      uvma_cvmcu_event_sys_phy_seq_item_c  sys_seq_item;
      clk();
      // TODO Implement uvma_cvmcu_event_sys_drv_vseq_c::drive()
      //      Ex: randcase
      //             cfg.ton: begin
      //                `uvmx_create_on(sys_seq_item, p_sequencer.sys_sequencer)
      //                `uvmx_rand_send_drv_with(sys_seq_item, {
      //                   ready == 1;
      //                })
      //             end
      //             (100-cfg.ton): begin
      //                clk();
      //             end
      //          endcase
   endtask

endclass : uvma_cvmcu_event_sys_drv_vseq_c


`endif // __UVMA_CVMCU_EVENT_SYS_DRV_VSEQ_SV__