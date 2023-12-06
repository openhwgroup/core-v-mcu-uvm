// Copyright 2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVME_CVMCU_CHIP_IO_TRANSPORT_SEQ_SV__
`define __UVME_CVMCU_CHIP_IO_TRANSPORT_SEQ_SV__


/**
 * Sequence converting sequence items and monitor transactions between io_agent and its sources.
 * @ingroup uvme_cvmcu_chip_seq
 */
class uvme_cvmcu_chip_io_transport_seq_c extends uvme_cvmcu_chip_base_seq_c;

   `uvm_object_utils(uvme_cvmcu_chip_io_transport_seq_c)
   `uvmx_transport_seq(uvme_cvmcu_chip_io_transport_seq_c)


   /**
    * Default constructor.
    */
   function new(string name="uvme_cvmcu_chip_io_transport_seq");
      super.new(name);
   endfunction

   /**
    * Takes in cvmcu_io monitor transactions from the io_agent and converts them to monitor transactions for its sources.
    */
   task monitor();
      fork
         monitor_ig();
         monitor_eg();
      join
   endtask

   /**
    * Takes in cvmcu_io monitor transactions from the io_agent ig and converts them to monitor transactions for its sources.
    */
   task monitor_ig();
      uvma_cvmcu_io_mon_trn_c  io_mon_trn;
      uvma_spi_phym_mon_trn_c  qspi_s0_phym_mon_trn;
      uvma_spi_phys_mon_trn_c  qspi_s0_phys_mon_trn;
      uvma_spi_phym_mon_trn_c  qspi_s1_phym_mon_trn;
      uvma_spi_phys_mon_trn_c  qspi_s1_phys_mon_trn;
      uvma_cvmcu_cpi_phy_mon_trn_c  camera_phy_mon_trn;
      uvma_i2c_phym_mon_trn_c  i2c_s0_phym_mon_trn;
      uvma_i2c_phys_mon_trn_c  i2c_s0_phys_mon_trn;
      uvma_i2c_phym_mon_trn_c  i2c_s1_phym_mon_trn;
      uvma_i2c_phys_mon_trn_c  i2c_s1_phys_mon_trn;
      uvma_uart_phyt_mon_trn_c  uart0_phyt_mon_trn;
      uvma_uart_phyr_mon_trn_c  uart0_phyr_mon_trn;
      uvma_uart_phyt_mon_trn_c  uart1_phyt_mon_trn;
      uvma_uart_phyr_mon_trn_c  uart1_phyr_mon_trn;
      uvma_sdio_phyh_mon_trn_c  sdio_phyh_mon_trn;
      uvma_sdio_phyd_mon_trn_c  sdio_phyd_mon_trn;
      uvma_i2c_phym_mon_trn_c  i2c_m_phym_mon_trn;
      uvma_i2c_phys_mon_trn_c  i2c_m_phys_mon_trn;
      forever begin
         `uvmx_transport_get_duplex_mon_trn(io_mon_trn, io_agent_sequencer, ig_mon_trn_fifo)
         // TODO Implement uvme_cvmcu_chip_io_transport_seq_c::monitor_ig()
         //      Ex: `uvmx_transport_create_mon_trn(qspi_s0_phym_m2s_mon_trn, qspi_s0_agent_sequencer)
         //          qspi_s0_phym_m2s_mon_trn.from(io_mon_trn);
         //          qspi_s0_phym_m2s_mon_trn.abc = io_mon_trn.xyz;
         //          `uvmx_transport_send_mon_trn(qspi_s0_phym_m2s_mon_trn, qspi_s0_agent_sequencer, phym_mon_trn_fifo)
      end
   endtask

   /**
    * Takes in cvmcu_io monitor transactions from the io_agent eg and converts them to monitor transactions for its sources.
    */
   task monitor_eg();
      uvma_cvmcu_io_mon_trn_c  io_mon_trn;
      uvma_spi_phym_mon_trn_c  qspi_s0_phym_mon_trn;
      uvma_spi_phys_mon_trn_c  qspi_s0_phys_mon_trn;
      uvma_spi_phym_mon_trn_c  qspi_s1_phym_mon_trn;
      uvma_spi_phys_mon_trn_c  qspi_s1_phys_mon_trn;
      uvma_cvmcu_cpi_phy_mon_trn_c  camera_phy_mon_trn;
      uvma_i2c_phym_mon_trn_c  i2c_s0_phym_mon_trn;
      uvma_i2c_phys_mon_trn_c  i2c_s0_phys_mon_trn;
      uvma_i2c_phym_mon_trn_c  i2c_s1_phym_mon_trn;
      uvma_i2c_phys_mon_trn_c  i2c_s1_phys_mon_trn;
      uvma_uart_phyt_mon_trn_c  uart0_phyt_mon_trn;
      uvma_uart_phyr_mon_trn_c  uart0_phyr_mon_trn;
      uvma_uart_phyt_mon_trn_c  uart1_phyt_mon_trn;
      uvma_uart_phyr_mon_trn_c  uart1_phyr_mon_trn;
      uvma_sdio_phyh_mon_trn_c  sdio_phyh_mon_trn;
      uvma_sdio_phyd_mon_trn_c  sdio_phyd_mon_trn;
      uvma_i2c_phym_mon_trn_c  i2c_m_phym_mon_trn;
      uvma_i2c_phys_mon_trn_c  i2c_m_phys_mon_trn;
      forever begin
         `uvmx_transport_get_duplex_mon_trn(io_mon_trn, io_agent_sequencer, eg_mon_trn_fifo)
         // TODO Implement uvme_cvmcu_chip_io_transport_seq_c::monitor_eg()
         //      Ex: `uvmx_transport_create_mon_trn(qspi_s0_phym_m2s_mon_trn, qspi_s0_agent_sequencer)
         //          qspi_s0_phym_m2s_mon_trn.from(io_mon_trn);
         //          qspi_s0_phym_m2s_mon_trn.abc = io_mon_trn.xyz;
         //          `uvmx_transport_send_mon_trn(qspi_s0_phym_m2s_mon_trn, qspi_s0_agent_sequencer, phym_mon_trn_fifo)
      end
   endtask

   /**
    * Takes in sequence items from sources and converts them to cvmcu_io sequence items for the io_agent.
    */
   task drive();
      fork
         drive_qspi_s0_phym();
         drive_qspi_s0_phys();
         drive_qspi_s1_phym();
         drive_qspi_s1_phys();
         drive_camera_phy();
         drive_i2c_s0_phym();
         drive_i2c_s0_phys();
         drive_i2c_s1_phym();
         drive_i2c_s1_phys();
         drive_uart0_phyt();
         drive_uart0_phyr();
         drive_uart1_phyt();
         drive_uart1_phyr();
         drive_sdio_phyh();
         drive_sdio_phyd();
         drive_i2c_m_phym();
         drive_i2c_m_phys();
      join
   endtask

   /**
    * Converts qspi_s0 phym sequence items into io sequence items.
    */
   task drive_qspi_s0_phym();
      uvma_spi_slv_phym_seq_item_c  qspi_s0_seq_item;
      uvma_cvmcu_io_seq_item_c  io_seq_item;
      forever begin
         `uvmx_transport_get_seq_item(qspi_s0_seq_item, qspi_s0_agent_sequencer, slv_phym_sequencer)
         // TODO Implement uvme_cvmcu_chip_io_transport_seq_c::drive_qspi_s0_phym()
         //      Ex: `uvmx_transport_create_seq_item(io_seq_item, io_agent_sequencer)
         //          io_seq_item.from(qspi_s0_seq_item);
         //          io_seq_item.abc = qspi_s0_seq_item.xyz;
         //          `uvmx_transport_send_seq_item(io_seq_item)
         //          `uvmx_transport_seq_item_done(qspi_s0_agent_sequencer, slv_phym_sequencer)
      end
   endtask

   /**
    * Converts qspi_s0 phys sequence items into io sequence items.
    */
   task drive_qspi_s0_phys();
      uvma_spi_slv_phys_seq_item_c  qspi_s0_seq_item;
      uvma_cvmcu_io_seq_item_c  io_seq_item;
      forever begin
         `uvmx_transport_get_seq_item(qspi_s0_seq_item, qspi_s0_agent_sequencer, slv_phys_sequencer)
         // TODO Implement uvme_cvmcu_chip_io_transport_seq_c::drive_qspi_s0_phys()
         //      Ex: `uvmx_transport_create_seq_item(io_seq_item, io_agent_sequencer)
         //          io_seq_item.from(qspi_s0_seq_item);
         //          io_seq_item.abc = qspi_s0_seq_item.xyz;
         //          `uvmx_transport_send_seq_item(io_seq_item)
         //          `uvmx_transport_seq_item_done(qspi_s0_agent_sequencer, slv_phys_sequencer)
      end
   endtask

   /**
    * Converts qspi_s1 phym sequence items into io sequence items.
    */
   task drive_qspi_s1_phym();
      uvma_spi_slv_phym_seq_item_c  qspi_s1_seq_item;
      uvma_cvmcu_io_seq_item_c  io_seq_item;
      forever begin
         `uvmx_transport_get_seq_item(qspi_s1_seq_item, qspi_s1_agent_sequencer, slv_phym_sequencer)
         // TODO Implement uvme_cvmcu_chip_io_transport_seq_c::drive_qspi_s1_phym()
         //      Ex: `uvmx_transport_create_seq_item(io_seq_item, io_agent_sequencer)
         //          io_seq_item.from(qspi_s1_seq_item);
         //          io_seq_item.abc = qspi_s1_seq_item.xyz;
         //          `uvmx_transport_send_seq_item(io_seq_item)
         //          `uvmx_transport_seq_item_done(qspi_s1_agent_sequencer, slv_phym_sequencer)
      end
   endtask

   /**
    * Converts qspi_s1 phys sequence items into io sequence items.
    */
   task drive_qspi_s1_phys();
      uvma_spi_slv_phys_seq_item_c  qspi_s1_seq_item;
      uvma_cvmcu_io_seq_item_c  io_seq_item;
      forever begin
         `uvmx_transport_get_seq_item(qspi_s1_seq_item, qspi_s1_agent_sequencer, slv_phys_sequencer)
         // TODO Implement uvme_cvmcu_chip_io_transport_seq_c::drive_qspi_s1_phys()
         //      Ex: `uvmx_transport_create_seq_item(io_seq_item, io_agent_sequencer)
         //          io_seq_item.from(qspi_s1_seq_item);
         //          io_seq_item.abc = qspi_s1_seq_item.xyz;
         //          `uvmx_transport_send_seq_item(io_seq_item)
         //          `uvmx_transport_seq_item_done(qspi_s1_agent_sequencer, slv_phys_sequencer)
      end
   endtask

   /**
    * Converts camera phy sequence items into io sequence items.
    */
   task drive_camera_phy();
      uvma_cvmcu_cpi_tx_phy_seq_item_c  camera_seq_item;
      uvma_cvmcu_io_seq_item_c  io_seq_item;
      forever begin
         `uvmx_transport_get_seq_item(camera_seq_item, camera_agent_sequencer, tx_phy_sequencer)
         // TODO Implement uvme_cvmcu_chip_io_transport_seq_c::drive_camera_phy()
         //      Ex: `uvmx_transport_create_seq_item(io_seq_item, io_agent_sequencer)
         //          io_seq_item.from(camera_seq_item);
         //          io_seq_item.abc = camera_seq_item.xyz;
         //          `uvmx_transport_send_seq_item(io_seq_item)
         //          `uvmx_transport_seq_item_done(camera_agent_sequencer, tx_phy_sequencer)
      end
   endtask

   /**
    * Converts i2c_s0 phym sequence items into io sequence items.
    */
   task drive_i2c_s0_phym();
      uvma_i2c_slv_phym_seq_item_c  i2c_s0_seq_item;
      uvma_cvmcu_io_seq_item_c  io_seq_item;
      forever begin
         `uvmx_transport_get_seq_item(i2c_s0_seq_item, i2c_s0_agent_sequencer, slv_phym_sequencer)
         // TODO Implement uvme_cvmcu_chip_io_transport_seq_c::drive_i2c_s0_phym()
         //      Ex: `uvmx_transport_create_seq_item(io_seq_item, io_agent_sequencer)
         //          io_seq_item.from(i2c_s0_seq_item);
         //          io_seq_item.abc = i2c_s0_seq_item.xyz;
         //          `uvmx_transport_send_seq_item(io_seq_item)
         //          `uvmx_transport_seq_item_done(i2c_s0_agent_sequencer, slv_phym_sequencer)
      end
   endtask

   /**
    * Converts i2c_s0 phys sequence items into io sequence items.
    */
   task drive_i2c_s0_phys();
      uvma_i2c_slv_phys_seq_item_c  i2c_s0_seq_item;
      uvma_cvmcu_io_seq_item_c  io_seq_item;
      forever begin
         `uvmx_transport_get_seq_item(i2c_s0_seq_item, i2c_s0_agent_sequencer, slv_phys_sequencer)
         // TODO Implement uvme_cvmcu_chip_io_transport_seq_c::drive_i2c_s0_phys()
         //      Ex: `uvmx_transport_create_seq_item(io_seq_item, io_agent_sequencer)
         //          io_seq_item.from(i2c_s0_seq_item);
         //          io_seq_item.abc = i2c_s0_seq_item.xyz;
         //          `uvmx_transport_send_seq_item(io_seq_item)
         //          `uvmx_transport_seq_item_done(i2c_s0_agent_sequencer, slv_phys_sequencer)
      end
   endtask

   /**
    * Converts i2c_s1 phym sequence items into io sequence items.
    */
   task drive_i2c_s1_phym();
      uvma_i2c_slv_phym_seq_item_c  i2c_s1_seq_item;
      uvma_cvmcu_io_seq_item_c  io_seq_item;
      forever begin
         `uvmx_transport_get_seq_item(i2c_s1_seq_item, i2c_s1_agent_sequencer, slv_phym_sequencer)
         // TODO Implement uvme_cvmcu_chip_io_transport_seq_c::drive_i2c_s1_phym()
         //      Ex: `uvmx_transport_create_seq_item(io_seq_item, io_agent_sequencer)
         //          io_seq_item.from(i2c_s1_seq_item);
         //          io_seq_item.abc = i2c_s1_seq_item.xyz;
         //          `uvmx_transport_send_seq_item(io_seq_item)
         //          `uvmx_transport_seq_item_done(i2c_s1_agent_sequencer, slv_phym_sequencer)
      end
   endtask

   /**
    * Converts i2c_s1 phys sequence items into io sequence items.
    */
   task drive_i2c_s1_phys();
      uvma_i2c_slv_phys_seq_item_c  i2c_s1_seq_item;
      uvma_cvmcu_io_seq_item_c  io_seq_item;
      forever begin
         `uvmx_transport_get_seq_item(i2c_s1_seq_item, i2c_s1_agent_sequencer, slv_phys_sequencer)
         // TODO Implement uvme_cvmcu_chip_io_transport_seq_c::drive_i2c_s1_phys()
         //      Ex: `uvmx_transport_create_seq_item(io_seq_item, io_agent_sequencer)
         //          io_seq_item.from(i2c_s1_seq_item);
         //          io_seq_item.abc = i2c_s1_seq_item.xyz;
         //          `uvmx_transport_send_seq_item(io_seq_item)
         //          `uvmx_transport_seq_item_done(i2c_s1_agent_sequencer, slv_phys_sequencer)
      end
   endtask

   /**
    * Converts uart0 phyt sequence items into io sequence items.
    */
   task drive_uart0_phyt();
      uvma_uart_tx_phyt_seq_item_c  uart0_seq_item;
      uvma_cvmcu_io_seq_item_c  io_seq_item;
      forever begin
         `uvmx_transport_get_seq_item(uart0_seq_item, uart0_agent_sequencer, tx_phyt_sequencer)
         // TODO Implement uvme_cvmcu_chip_io_transport_seq_c::drive_uart0_phyt()
         //      Ex: `uvmx_transport_create_seq_item(io_seq_item, io_agent_sequencer)
         //          io_seq_item.from(uart0_seq_item);
         //          io_seq_item.abc = uart0_seq_item.xyz;
         //          `uvmx_transport_send_seq_item(io_seq_item)
         //          `uvmx_transport_seq_item_done(uart0_agent_sequencer, tx_phyt_sequencer)
      end
   endtask

   /**
    * Converts uart0 phyr sequence items into io sequence items.
    */
   task drive_uart0_phyr();
      uvma_uart_tx_phyr_seq_item_c  uart0_seq_item;
      uvma_cvmcu_io_seq_item_c  io_seq_item;
      forever begin
         `uvmx_transport_get_seq_item(uart0_seq_item, uart0_agent_sequencer, tx_phyr_sequencer)
         // TODO Implement uvme_cvmcu_chip_io_transport_seq_c::drive_uart0_phyr()
         //      Ex: `uvmx_transport_create_seq_item(io_seq_item, io_agent_sequencer)
         //          io_seq_item.from(uart0_seq_item);
         //          io_seq_item.abc = uart0_seq_item.xyz;
         //          `uvmx_transport_send_seq_item(io_seq_item)
         //          `uvmx_transport_seq_item_done(uart0_agent_sequencer, tx_phyr_sequencer)
      end
   endtask

   /**
    * Converts uart1 phyt sequence items into io sequence items.
    */
   task drive_uart1_phyt();
      uvma_uart_tx_phyt_seq_item_c  uart1_seq_item;
      uvma_cvmcu_io_seq_item_c  io_seq_item;
      forever begin
         `uvmx_transport_get_seq_item(uart1_seq_item, uart1_agent_sequencer, tx_phyt_sequencer)
         // TODO Implement uvme_cvmcu_chip_io_transport_seq_c::drive_uart1_phyt()
         //      Ex: `uvmx_transport_create_seq_item(io_seq_item, io_agent_sequencer)
         //          io_seq_item.from(uart1_seq_item);
         //          io_seq_item.abc = uart1_seq_item.xyz;
         //          `uvmx_transport_send_seq_item(io_seq_item)
         //          `uvmx_transport_seq_item_done(uart1_agent_sequencer, tx_phyt_sequencer)
      end
   endtask

   /**
    * Converts uart1 phyr sequence items into io sequence items.
    */
   task drive_uart1_phyr();
      uvma_uart_tx_phyr_seq_item_c  uart1_seq_item;
      uvma_cvmcu_io_seq_item_c  io_seq_item;
      forever begin
         `uvmx_transport_get_seq_item(uart1_seq_item, uart1_agent_sequencer, tx_phyr_sequencer)
         // TODO Implement uvme_cvmcu_chip_io_transport_seq_c::drive_uart1_phyr()
         //      Ex: `uvmx_transport_create_seq_item(io_seq_item, io_agent_sequencer)
         //          io_seq_item.from(uart1_seq_item);
         //          io_seq_item.abc = uart1_seq_item.xyz;
         //          `uvmx_transport_send_seq_item(io_seq_item)
         //          `uvmx_transport_seq_item_done(uart1_agent_sequencer, tx_phyr_sequencer)
      end
   endtask

   /**
    * Converts sdio phyh sequence items into io sequence items.
    */
   task drive_sdio_phyh();
      uvma_sdio_dev_phyh_seq_item_c  sdio_seq_item;
      uvma_cvmcu_io_seq_item_c  io_seq_item;
      forever begin
         `uvmx_transport_get_seq_item(sdio_seq_item, sdio_agent_sequencer, dev_phyh_sequencer)
         // TODO Implement uvme_cvmcu_chip_io_transport_seq_c::drive_sdio_phyh()
         //      Ex: `uvmx_transport_create_seq_item(io_seq_item, io_agent_sequencer)
         //          io_seq_item.from(sdio_seq_item);
         //          io_seq_item.abc = sdio_seq_item.xyz;
         //          `uvmx_transport_send_seq_item(io_seq_item)
         //          `uvmx_transport_seq_item_done(sdio_agent_sequencer, dev_phyh_sequencer)
      end
   endtask

   /**
    * Converts sdio phyd sequence items into io sequence items.
    */
   task drive_sdio_phyd();
      uvma_sdio_dev_phyd_seq_item_c  sdio_seq_item;
      uvma_cvmcu_io_seq_item_c  io_seq_item;
      forever begin
         `uvmx_transport_get_seq_item(sdio_seq_item, sdio_agent_sequencer, dev_phyd_sequencer)
         // TODO Implement uvme_cvmcu_chip_io_transport_seq_c::drive_sdio_phyd()
         //      Ex: `uvmx_transport_create_seq_item(io_seq_item, io_agent_sequencer)
         //          io_seq_item.from(sdio_seq_item);
         //          io_seq_item.abc = sdio_seq_item.xyz;
         //          `uvmx_transport_send_seq_item(io_seq_item)
         //          `uvmx_transport_seq_item_done(sdio_agent_sequencer, dev_phyd_sequencer)
      end
   endtask

   /**
    * Converts i2c_m phym sequence items into io sequence items.
    */
   task drive_i2c_m_phym();
      uvma_i2c_mstr_phym_seq_item_c  i2c_m_seq_item;
      uvma_cvmcu_io_seq_item_c  io_seq_item;
      forever begin
         `uvmx_transport_get_seq_item(i2c_m_seq_item, i2c_m_agent_sequencer, mstr_phym_sequencer)
         // TODO Implement uvme_cvmcu_chip_io_transport_seq_c::drive_i2c_m_phym()
         //      Ex: `uvmx_transport_create_seq_item(io_seq_item, io_agent_sequencer)
         //          io_seq_item.from(i2c_m_seq_item);
         //          io_seq_item.abc = i2c_m_seq_item.xyz;
         //          `uvmx_transport_send_seq_item(io_seq_item)
         //          `uvmx_transport_seq_item_done(i2c_m_agent_sequencer, mstr_phym_sequencer)
      end
   endtask

   /**
    * Converts i2c_m phys sequence items into io sequence items.
    */
   task drive_i2c_m_phys();
      uvma_i2c_mstr_phys_seq_item_c  i2c_m_seq_item;
      uvma_cvmcu_io_seq_item_c  io_seq_item;
      forever begin
         `uvmx_transport_get_seq_item(i2c_m_seq_item, i2c_m_agent_sequencer, mstr_phys_sequencer)
         // TODO Implement uvme_cvmcu_chip_io_transport_seq_c::drive_i2c_m_phys()
         //      Ex: `uvmx_transport_create_seq_item(io_seq_item, io_agent_sequencer)
         //          io_seq_item.from(i2c_m_seq_item);
         //          io_seq_item.abc = i2c_m_seq_item.xyz;
         //          `uvmx_transport_send_seq_item(io_seq_item)
         //          `uvmx_transport_seq_item_done(i2c_m_agent_sequencer, mstr_phys_sequencer)
      end
   endtask

endclass : uvme_cvmcu_chip_io_transport_seq_c


`endif // __UVME_CVMCU_CHIP_IO_TRANSPORT_SEQ_SV__