// Copyright 2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMA_CVMCU_DBG_SYS_DRV_SEQ_SV__
`define __UVMA_CVMCU_DBG_SYS_DRV_SEQ_SV__


/**
 * Sequence taking in uvma_cvmcu_dbg_seq_item_c instances and driving uvma_cvmcu_dbg_drv_c with SYS Sequence Items.
 * @ingroup uvma_cvmcu_dbg_agent_seq
 */
class uvma_cvmcu_dbg_sys_drv_seq_c extends uvma_cvmcu_dbg_base_seq_c;

   `uvm_object_utils(uvma_cvmcu_dbg_sys_drv_seq_c)
   `uvmx_out_drv_seq()

   /**
    * Default constructor.
    */
   function new(string name="uvma_cvmcu_dbg_sys_drv_seq");
      super.new(name);
   endfunction


   /**
    * Drives all segments.
    */
   virtual task drive();
      uvma_cvmcu_dbg_sys_phy_seq_item_c  sys_seq_item;
      clk();
      // TODO Implement uvma_cvmcu_dbg_sys_drv_seq_c::drive()
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


`endif // __UVMA_CVMCU_DBG_SYS_DRV_SEQ_SV__