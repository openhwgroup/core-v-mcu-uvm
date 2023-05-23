// Copyright 2023 Acme Enterprises
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMA_CVMCU_DBG_IDLE_VSEQ_SV__
`define __UVMA_CVMCU_DBG_IDLE_VSEQ_SV__


/**
 * Virtual Sequence generating 'idle' Sequence Items at all times.
 * @ingroup uvma_cvmcu_dbg_seq
 */
class uvma_cvmcu_dbg_idle_vseq_c extends uvma_cvmcu_dbg_base_vseq_c;

   `uvm_object_utils(uvma_cvmcu_dbg_idle_vseq_c)
   `uvmx_idle_vseq()

   /**
    * Default constructor.
    */
   function new(string name="uvma_cvmcu_dbg_idle_vseq");
      super.new(name);
   endfunction

   /**
    * Calls proper `x_idle()` task.
    */
   virtual task idle();
      case (cfg.drv_mode)
         UVMA_CVMCU_DBG_DRV_MODE_CORE: core_idle();
         UVMA_CVMCU_DBG_DRV_MODE_SYS: sys_idle();
      endcase
   endtask

   /**
    * Infinite loop generating idle CORE Sequence Items.
    */
   task core_idle();
      uvma_cvmcu_dbg_core_phy_seq_item_c  core_phy_seq_item;
      if (cfg.drv_idle_random) begin
         forever begin
            `uvmx_create_on(core_phy_seq_item, p_sequencer.core_phy_sequencer)
            `uvmx_rand_send_idle_with(core_phy_seq_item, {
               // TODO Implement random idles for core PHY
               //      Ex: req == 0;
            })
         end
      end
      else begin
         forever begin
            `uvmx_create_on(core_phy_seq_item, p_sequencer.core_phy_sequencer)
            `uvmx_send_idle(core_phy_seq_item)
         end
      end
   endtask

   /**
    * Infinite loop generating idle SYS Sequence Items.
    */
   task sys_idle();
      uvma_cvmcu_dbg_sys_phy_seq_item_c  sys_phy_seq_item;
      if (cfg.drv_idle_random) begin
         forever begin
            `uvmx_create_on(sys_phy_seq_item, p_sequencer.sys_phy_sequencer)
            `uvmx_rand_send_idle_with(sys_phy_seq_item, {
               // TODO Implement random idles for SYS PHY
               //      Ex: req == 0;
            })
         end
      end
      else begin
         forever begin
            `uvmx_create_on(sys_phy_seq_item, p_sequencer.sys_phy_sequencer)
            `uvmx_send_idle(sys_phy_seq_item)
         end
      end
   endtask

endclass : uvma_cvmcu_dbg_idle_vseq_c


`endif // __UVMA_CVMCU_DBG_IDLE_VSEQ_SV__