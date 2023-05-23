// Copyright 2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMA_CVMCU_CPI_IDLE_VSEQ_SV__
`define __UVMA_CVMCU_CPI_IDLE_VSEQ_SV__


/**
 * Virtual Sequence generating 'idle' Sequence Items at all times.
 * @ingroup uvma_cvmcu_cpi_seq
 */
class uvma_cvmcu_cpi_idle_vseq_c extends uvma_cvmcu_cpi_base_vseq_c;

   `uvm_object_utils(uvma_cvmcu_cpi_idle_vseq_c)
   `uvmx_idle_vseq()

   /**
    * Default constructor.
    */
   function new(string name="uvma_cvmcu_cpi_idle_vseq");
      super.new(name);
   endfunction

   /**
    * Calls proper `x_idle()` task.
    */
   virtual task idle();
      case (cfg.drv_mode)
         UVMA_CVMCU_CPI_DRV_MODE_TX: tx_idle();
         UVMA_CVMCU_CPI_DRV_MODE_RX: rx_idle();
      endcase
   endtask

   /**
    * Infinite loop generating idle TX Sequence Items.
    */
   task tx_idle();
      uvma_cvmcu_cpi_tx_phy_seq_item_c  tx_phy_seq_item;
      if (cfg.drv_idle_random) begin
         forever begin
            `uvmx_create_on(tx_phy_seq_item, p_sequencer.tx_phy_sequencer)
            `uvmx_rand_send_idle_with(tx_phy_seq_item, {
               // TODO Implement random idles for tx PHY
               //      Ex: req == 0;
            })
         end
      end
      else begin
         forever begin
            `uvmx_create_on(tx_phy_seq_item, p_sequencer.tx_phy_sequencer)
            `uvmx_send_idle(tx_phy_seq_item)
         end
      end
   endtask

   /**
    * Infinite loop generating idle RX Sequence Items.
    */
   task rx_idle();
      uvma_cvmcu_cpi_rx_phy_seq_item_c  rx_phy_seq_item;
      if (cfg.drv_idle_random) begin
         forever begin
            `uvmx_create_on(rx_phy_seq_item, p_sequencer.rx_phy_sequencer)
            `uvmx_rand_send_idle_with(rx_phy_seq_item, {
               // TODO Implement random idles for RX PHY
               //      Ex: req == 0;
            })
         end
      end
      else begin
         forever begin
            `uvmx_create_on(rx_phy_seq_item, p_sequencer.rx_phy_sequencer)
            `uvmx_send_idle(rx_phy_seq_item)
         end
      end
   endtask

endclass : uvma_cvmcu_cpi_idle_vseq_c


`endif // __UVMA_CVMCU_CPI_IDLE_VSEQ_SV__