// Copyright 2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVME_CVMCU_CHIP_IO_TRANSPORT_VSEQ_SV__
`define __UVME_CVMCU_CHIP_IO_TRANSPORT_VSEQ_SV__


/**
 * Sequence converting sequence items and monitor transactions between io_agent and its sources.
 * @ingroup uvme_cvmcu_chip_seq
 */
class uvme_cvmcu_chip_io_transport_vseq_c extends uvme_cvmcu_chip_base_vseq_c;

   `uvm_object_utils(uvme_cvmcu_chip_io_transport_vseq_c)
   `uvmx_transport_vseq(uvme_cvmcu_chip_io_transport_vseq_c)


   /**
    * Default constructor.
    */
   function new(string name="uvme_cvmcu_chip_io_transport_vseq");
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
      uvma_spi_phy_m2s_mon_trn_c  qspi_s0_phy_m2s_mon_trn;
      uvma_spi_phy_s2m_mon_trn_c  qspi_s0_phy_s2m_mon_trn;
      uvma_spi_phy_m2s_mon_trn_c  qspi_s1_phy_m2s_mon_trn;
      uvma_spi_phy_s2m_mon_trn_c  qspi_s1_phy_s2m_mon_trn;
      uvma_cvmcu_cpi_phy_mon_trn_c  camera_phy_mon_trn;
      uvma_i2c_phy_m2s_mon_trn_c  i2c_s0_phy_m2s_mon_trn;
      uvma_i2c_phy_s2m_mon_trn_c  i2c_s0_phy_s2m_mon_trn;
      uvma_i2c_phy_m2s_mon_trn_c  i2c_s1_phy_m2s_mon_trn;
      uvma_i2c_phy_s2m_mon_trn_c  i2c_s1_phy_s2m_mon_trn;
      uvma_uart_phy_eg_mon_trn_c  uart0_phy_eg_mon_trn;
      uvma_uart_phy_ig_mon_trn_c  uart0_phy_ig_mon_trn;
      uvma_uart_phy_eg_mon_trn_c  uart1_phy_eg_mon_trn;
      uvma_uart_phy_ig_mon_trn_c  uart1_phy_ig_mon_trn;
      uvma_sdio_phy_h2d_mon_trn_c  sdio_phy_h2d_mon_trn;
      uvma_sdio_phy_d2h_mon_trn_c  sdio_phy_d2h_mon_trn;
      uvma_i2c_phy_m2s_mon_trn_c  i2c_m_phy_m2s_mon_trn;
      uvma_i2c_phy_s2m_mon_trn_c  i2c_m_phy_s2m_mon_trn;
      forever begin
         `uvmx_transport_get_duplex_mon_trn(io_mon_trn, io_agent_vsequencer, ig_mon_trn_fifo)
         // TODO Implement uvme_cvmcu_chip_io_transport_vseq_c::monitor_ig()
         //      Ex: `uvmx_transport_create_mon_trn(qspi_s0_phy_m2s_mon_trn, qspi_s0_agent_vsequencer)
         //          qspi_s0_phy_m2s_mon_trn.from(io_mon_trn);
         //          qspi_s0_phy_m2s_mon_trn.abc = io_mon_trn.xyz;
         //          `uvmx_transport_send_mon_trn(qspi_s0_phy_m2s_mon_trn, qspi_s0_agent_vsequencer, m2s_phy_m2s_mon_trn_fifo)
      end
   endtask

   /**
    * Takes in cvmcu_io monitor transactions from the io_agent eg and converts them to monitor transactions for its sources.
    */
   task monitor_eg();
      uvma_cvmcu_io_mon_trn_c  io_mon_trn;
      uvma_spi_phy_m2s_mon_trn_c  qspi_s0_phy_m2s_mon_trn;
      uvma_spi_phy_s2m_mon_trn_c  qspi_s0_phy_s2m_mon_trn;
      uvma_spi_phy_m2s_mon_trn_c  qspi_s1_phy_m2s_mon_trn;
      uvma_spi_phy_s2m_mon_trn_c  qspi_s1_phy_s2m_mon_trn;
      uvma_cvmcu_cpi_phy_mon_trn_c  camera_phy_mon_trn;
      uvma_i2c_phy_m2s_mon_trn_c  i2c_s0_phy_m2s_mon_trn;
      uvma_i2c_phy_s2m_mon_trn_c  i2c_s0_phy_s2m_mon_trn;
      uvma_i2c_phy_m2s_mon_trn_c  i2c_s1_phy_m2s_mon_trn;
      uvma_i2c_phy_s2m_mon_trn_c  i2c_s1_phy_s2m_mon_trn;
      uvma_uart_phy_eg_mon_trn_c  uart0_phy_eg_mon_trn;
      uvma_uart_phy_ig_mon_trn_c  uart0_phy_ig_mon_trn;
      uvma_uart_phy_eg_mon_trn_c  uart1_phy_eg_mon_trn;
      uvma_uart_phy_ig_mon_trn_c  uart1_phy_ig_mon_trn;
      uvma_sdio_phy_h2d_mon_trn_c  sdio_phy_h2d_mon_trn;
      uvma_sdio_phy_d2h_mon_trn_c  sdio_phy_d2h_mon_trn;
      uvma_i2c_phy_m2s_mon_trn_c  i2c_m_phy_m2s_mon_trn;
      uvma_i2c_phy_s2m_mon_trn_c  i2c_m_phy_s2m_mon_trn;
      forever begin
         `uvmx_transport_get_duplex_mon_trn(io_mon_trn, io_agent_vsequencer, eg_mon_trn_fifo)
         // TODO Implement uvme_cvmcu_chip_io_transport_vseq_c::monitor_eg()
         //      Ex: `uvmx_transport_create_mon_trn(qspi_s0_phy_m2s_mon_trn, qspi_s0_agent_vsequencer)
         //          qspi_s0_phy_m2s_mon_trn.from(io_mon_trn);
         //          qspi_s0_phy_m2s_mon_trn.abc = io_mon_trn.xyz;
         //          `uvmx_transport_send_mon_trn(qspi_s0_phy_m2s_mon_trn, qspi_s0_agent_vsequencer, s2m_phy_m2s_mon_trn_fifo)
      end
   endtask

   /**
    * Takes in sequence items from sources and converts them to cvmcu_io sequence items for the io_agent.
    */
   task drive();
      fork
         drive_qspi_s0_phy_m2s();
         drive_qspi_s0_phy_s2m();
         drive_qspi_s1_phy_m2s();
         drive_qspi_s1_phy_s2m();
         drive_camera_phy();
         drive_i2c_s0_phy_m2s();
         drive_i2c_s0_phy_s2m();
         drive_i2c_s1_phy_m2s();
         drive_i2c_s1_phy_s2m();
         drive_uart0_phy_eg();
         drive_uart0_phy_ig();
         drive_uart1_phy_eg();
         drive_uart1_phy_ig();
         drive_sdio_phy_h2d();
         drive_sdio_phy_d2h();
         drive_i2c_m_phy_m2s();
         drive_i2c_m_phy_s2m();
      join
   endtask

   /**
    * Converts qspi_s0 phy_m2s sequence items into io sequence items.
    */
   task drive_qspi_s0_phy_m2s();
      uvma_spi_slv_phy_m2s_seq_item_c  qspi_s0_seq_item;
      uvma_cvmcu_io_seq_item_c  io_seq_item;
      forever begin
         `uvmx_transport_get_seq_item(qspi_s0_seq_item, qspi_s0_agent_vsequencer, slv_phy_m2s_sequencer)
         // TODO Implement uvme_cvmcu_chip_io_transport_vseq_c::drive_qspi_s0_phy_m2s()
         //      Ex: `uvmx_transport_create_seq_item(io_seq_item, io_agent_vsequencer)
         //          io_seq_item.from(qspi_s0_seq_item);
         //          io_seq_item.abc = qspi_s0_seq_item.xyz;
         //          `uvmx_transport_send_seq_item(io_seq_item)
         //          `uvmx_transport_seq_item_done(qspi_s0_agent_vsequencer, slv_phy_m2s_sequencer)
      end
   endtask

   /**
    * Converts qspi_s0 phy_s2m sequence items into io sequence items.
    */
   task drive_qspi_s0_phy_s2m();
      uvma_spi_slv_phy_s2m_seq_item_c  qspi_s0_seq_item;
      uvma_cvmcu_io_seq_item_c  io_seq_item;
      forever begin
         `uvmx_transport_get_seq_item(qspi_s0_seq_item, qspi_s0_agent_vsequencer, slv_phy_s2m_sequencer)
         // TODO Implement uvme_cvmcu_chip_io_transport_vseq_c::drive_qspi_s0_phy_s2m()
         //      Ex: `uvmx_transport_create_seq_item(io_seq_item, io_agent_vsequencer)
         //          io_seq_item.from(qspi_s0_seq_item);
         //          io_seq_item.abc = qspi_s0_seq_item.xyz;
         //          `uvmx_transport_send_seq_item(io_seq_item)
         //          `uvmx_transport_seq_item_done(qspi_s0_agent_vsequencer, slv_phy_s2m_sequencer)
      end
   endtask

   /**
    * Converts qspi_s1 phy_m2s sequence items into io sequence items.
    */
   task drive_qspi_s1_phy_m2s();
      uvma_spi_slv_phy_m2s_seq_item_c  qspi_s1_seq_item;
      uvma_cvmcu_io_seq_item_c  io_seq_item;
      forever begin
         `uvmx_transport_get_seq_item(qspi_s1_seq_item, qspi_s1_agent_vsequencer, slv_phy_m2s_sequencer)
         // TODO Implement uvme_cvmcu_chip_io_transport_vseq_c::drive_qspi_s1_phy_m2s()
         //      Ex: `uvmx_transport_create_seq_item(io_seq_item, io_agent_vsequencer)
         //          io_seq_item.from(qspi_s1_seq_item);
         //          io_seq_item.abc = qspi_s1_seq_item.xyz;
         //          `uvmx_transport_send_seq_item(io_seq_item)
         //          `uvmx_transport_seq_item_done(qspi_s1_agent_vsequencer, slv_phy_m2s_sequencer)
      end
   endtask

   /**
    * Converts qspi_s1 phy_s2m sequence items into io sequence items.
    */
   task drive_qspi_s1_phy_s2m();
      uvma_spi_slv_phy_s2m_seq_item_c  qspi_s1_seq_item;
      uvma_cvmcu_io_seq_item_c  io_seq_item;
      forever begin
         `uvmx_transport_get_seq_item(qspi_s1_seq_item, qspi_s1_agent_vsequencer, slv_phy_s2m_sequencer)
         // TODO Implement uvme_cvmcu_chip_io_transport_vseq_c::drive_qspi_s1_phy_s2m()
         //      Ex: `uvmx_transport_create_seq_item(io_seq_item, io_agent_vsequencer)
         //          io_seq_item.from(qspi_s1_seq_item);
         //          io_seq_item.abc = qspi_s1_seq_item.xyz;
         //          `uvmx_transport_send_seq_item(io_seq_item)
         //          `uvmx_transport_seq_item_done(qspi_s1_agent_vsequencer, slv_phy_s2m_sequencer)
      end
   endtask

   /**
    * Converts camera phy sequence items into io sequence items.
    */
   task drive_camera_phy();
      uvma_cvmcu_cpi_tx_phy_seq_item_c  camera_seq_item;
      uvma_cvmcu_io_seq_item_c  io_seq_item;
      forever begin
         `uvmx_transport_get_seq_item(camera_seq_item, camera_agent_vsequencer, tx_phy_sequencer)
         // TODO Implement uvme_cvmcu_chip_io_transport_vseq_c::drive_camera_phy()
         //      Ex: `uvmx_transport_create_seq_item(io_seq_item, io_agent_vsequencer)
         //          io_seq_item.from(camera_seq_item);
         //          io_seq_item.abc = camera_seq_item.xyz;
         //          `uvmx_transport_send_seq_item(io_seq_item)
         //          `uvmx_transport_seq_item_done(camera_agent_vsequencer, tx_phy_sequencer)
      end
   endtask

   /**
    * Converts i2c_s0 phy_m2s sequence items into io sequence items.
    */
   task drive_i2c_s0_phy_m2s();
      uvma_i2c_slv_phy_m2s_seq_item_c  i2c_s0_seq_item;
      uvma_cvmcu_io_seq_item_c  io_seq_item;
      forever begin
         `uvmx_transport_get_seq_item(i2c_s0_seq_item, i2c_s0_agent_vsequencer, slv_phy_m2s_sequencer)
         // TODO Implement uvme_cvmcu_chip_io_transport_vseq_c::drive_i2c_s0_phy_m2s()
         //      Ex: `uvmx_transport_create_seq_item(io_seq_item, io_agent_vsequencer)
         //          io_seq_item.from(i2c_s0_seq_item);
         //          io_seq_item.abc = i2c_s0_seq_item.xyz;
         //          `uvmx_transport_send_seq_item(io_seq_item)
         //          `uvmx_transport_seq_item_done(i2c_s0_agent_vsequencer, slv_phy_m2s_sequencer)
      end
   endtask

   /**
    * Converts i2c_s0 phy_s2m sequence items into io sequence items.
    */
   task drive_i2c_s0_phy_s2m();
      uvma_i2c_slv_phy_s2m_seq_item_c  i2c_s0_seq_item;
      uvma_cvmcu_io_seq_item_c  io_seq_item;
      forever begin
         `uvmx_transport_get_seq_item(i2c_s0_seq_item, i2c_s0_agent_vsequencer, slv_phy_s2m_sequencer)
         // TODO Implement uvme_cvmcu_chip_io_transport_vseq_c::drive_i2c_s0_phy_s2m()
         //      Ex: `uvmx_transport_create_seq_item(io_seq_item, io_agent_vsequencer)
         //          io_seq_item.from(i2c_s0_seq_item);
         //          io_seq_item.abc = i2c_s0_seq_item.xyz;
         //          `uvmx_transport_send_seq_item(io_seq_item)
         //          `uvmx_transport_seq_item_done(i2c_s0_agent_vsequencer, slv_phy_s2m_sequencer)
      end
   endtask

   /**
    * Converts i2c_s1 phy_m2s sequence items into io sequence items.
    */
   task drive_i2c_s1_phy_m2s();
      uvma_i2c_slv_phy_m2s_seq_item_c  i2c_s1_seq_item;
      uvma_cvmcu_io_seq_item_c  io_seq_item;
      forever begin
         `uvmx_transport_get_seq_item(i2c_s1_seq_item, i2c_s1_agent_vsequencer, slv_phy_m2s_sequencer)
         // TODO Implement uvme_cvmcu_chip_io_transport_vseq_c::drive_i2c_s1_phy_m2s()
         //      Ex: `uvmx_transport_create_seq_item(io_seq_item, io_agent_vsequencer)
         //          io_seq_item.from(i2c_s1_seq_item);
         //          io_seq_item.abc = i2c_s1_seq_item.xyz;
         //          `uvmx_transport_send_seq_item(io_seq_item)
         //          `uvmx_transport_seq_item_done(i2c_s1_agent_vsequencer, slv_phy_m2s_sequencer)
      end
   endtask

   /**
    * Converts i2c_s1 phy_s2m sequence items into io sequence items.
    */
   task drive_i2c_s1_phy_s2m();
      uvma_i2c_slv_phy_s2m_seq_item_c  i2c_s1_seq_item;
      uvma_cvmcu_io_seq_item_c  io_seq_item;
      forever begin
         `uvmx_transport_get_seq_item(i2c_s1_seq_item, i2c_s1_agent_vsequencer, slv_phy_s2m_sequencer)
         // TODO Implement uvme_cvmcu_chip_io_transport_vseq_c::drive_i2c_s1_phy_s2m()
         //      Ex: `uvmx_transport_create_seq_item(io_seq_item, io_agent_vsequencer)
         //          io_seq_item.from(i2c_s1_seq_item);
         //          io_seq_item.abc = i2c_s1_seq_item.xyz;
         //          `uvmx_transport_send_seq_item(io_seq_item)
         //          `uvmx_transport_seq_item_done(i2c_s1_agent_vsequencer, slv_phy_s2m_sequencer)
      end
   endtask

   /**
    * Converts uart0 phy_eg sequence items into io sequence items.
    */
   task drive_uart0_phy_eg();
      uvma_uart_tx_phy_eg_seq_item_c  uart0_seq_item;
      uvma_cvmcu_io_seq_item_c  io_seq_item;
      forever begin
         `uvmx_transport_get_seq_item(uart0_seq_item, uart0_agent_vsequencer, tx_phy_eg_sequencer)
         // TODO Implement uvme_cvmcu_chip_io_transport_vseq_c::drive_uart0_phy_eg()
         //      Ex: `uvmx_transport_create_seq_item(io_seq_item, io_agent_vsequencer)
         //          io_seq_item.from(uart0_seq_item);
         //          io_seq_item.abc = uart0_seq_item.xyz;
         //          `uvmx_transport_send_seq_item(io_seq_item)
         //          `uvmx_transport_seq_item_done(uart0_agent_vsequencer, tx_phy_eg_sequencer)
      end
   endtask

   /**
    * Converts uart0 phy_ig sequence items into io sequence items.
    */
   task drive_uart0_phy_ig();
      uvma_uart_tx_phy_ig_seq_item_c  uart0_seq_item;
      uvma_cvmcu_io_seq_item_c  io_seq_item;
      forever begin
         `uvmx_transport_get_seq_item(uart0_seq_item, uart0_agent_vsequencer, tx_phy_ig_sequencer)
         // TODO Implement uvme_cvmcu_chip_io_transport_vseq_c::drive_uart0_phy_ig()
         //      Ex: `uvmx_transport_create_seq_item(io_seq_item, io_agent_vsequencer)
         //          io_seq_item.from(uart0_seq_item);
         //          io_seq_item.abc = uart0_seq_item.xyz;
         //          `uvmx_transport_send_seq_item(io_seq_item)
         //          `uvmx_transport_seq_item_done(uart0_agent_vsequencer, tx_phy_ig_sequencer)
      end
   endtask

   /**
    * Converts uart1 phy_eg sequence items into io sequence items.
    */
   task drive_uart1_phy_eg();
      uvma_uart_tx_phy_eg_seq_item_c  uart1_seq_item;
      uvma_cvmcu_io_seq_item_c  io_seq_item;
      forever begin
         `uvmx_transport_get_seq_item(uart1_seq_item, uart1_agent_vsequencer, tx_phy_eg_sequencer)
         // TODO Implement uvme_cvmcu_chip_io_transport_vseq_c::drive_uart1_phy_eg()
         //      Ex: `uvmx_transport_create_seq_item(io_seq_item, io_agent_vsequencer)
         //          io_seq_item.from(uart1_seq_item);
         //          io_seq_item.abc = uart1_seq_item.xyz;
         //          `uvmx_transport_send_seq_item(io_seq_item)
         //          `uvmx_transport_seq_item_done(uart1_agent_vsequencer, tx_phy_eg_sequencer)
      end
   endtask

   /**
    * Converts uart1 phy_ig sequence items into io sequence items.
    */
   task drive_uart1_phy_ig();
      uvma_uart_tx_phy_ig_seq_item_c  uart1_seq_item;
      uvma_cvmcu_io_seq_item_c  io_seq_item;
      forever begin
         `uvmx_transport_get_seq_item(uart1_seq_item, uart1_agent_vsequencer, tx_phy_ig_sequencer)
         // TODO Implement uvme_cvmcu_chip_io_transport_vseq_c::drive_uart1_phy_ig()
         //      Ex: `uvmx_transport_create_seq_item(io_seq_item, io_agent_vsequencer)
         //          io_seq_item.from(uart1_seq_item);
         //          io_seq_item.abc = uart1_seq_item.xyz;
         //          `uvmx_transport_send_seq_item(io_seq_item)
         //          `uvmx_transport_seq_item_done(uart1_agent_vsequencer, tx_phy_ig_sequencer)
      end
   endtask

   /**
    * Converts sdio phy_h2d sequence items into io sequence items.
    */
   task drive_sdio_phy_h2d();
      uvma_sdio_dev_phy_h2d_seq_item_c  sdio_seq_item;
      uvma_cvmcu_io_seq_item_c  io_seq_item;
      forever begin
         `uvmx_transport_get_seq_item(sdio_seq_item, sdio_agent_vsequencer, dev_phy_h2d_sequencer)
         // TODO Implement uvme_cvmcu_chip_io_transport_vseq_c::drive_sdio_phy_h2d()
         //      Ex: `uvmx_transport_create_seq_item(io_seq_item, io_agent_vsequencer)
         //          io_seq_item.from(sdio_seq_item);
         //          io_seq_item.abc = sdio_seq_item.xyz;
         //          `uvmx_transport_send_seq_item(io_seq_item)
         //          `uvmx_transport_seq_item_done(sdio_agent_vsequencer, dev_phy_h2d_sequencer)
      end
   endtask

   /**
    * Converts sdio phy_d2h sequence items into io sequence items.
    */
   task drive_sdio_phy_d2h();
      uvma_sdio_dev_phy_d2h_seq_item_c  sdio_seq_item;
      uvma_cvmcu_io_seq_item_c  io_seq_item;
      forever begin
         `uvmx_transport_get_seq_item(sdio_seq_item, sdio_agent_vsequencer, dev_phy_d2h_sequencer)
         // TODO Implement uvme_cvmcu_chip_io_transport_vseq_c::drive_sdio_phy_d2h()
         //      Ex: `uvmx_transport_create_seq_item(io_seq_item, io_agent_vsequencer)
         //          io_seq_item.from(sdio_seq_item);
         //          io_seq_item.abc = sdio_seq_item.xyz;
         //          `uvmx_transport_send_seq_item(io_seq_item)
         //          `uvmx_transport_seq_item_done(sdio_agent_vsequencer, dev_phy_d2h_sequencer)
      end
   endtask

   /**
    * Converts i2c_m phy_m2s sequence items into io sequence items.
    */
   task drive_i2c_m_phy_m2s();
      uvma_i2c_mstr_phy_m2s_seq_item_c  i2c_m_seq_item;
      uvma_cvmcu_io_seq_item_c  io_seq_item;
      forever begin
         `uvmx_transport_get_seq_item(i2c_m_seq_item, i2c_m_agent_vsequencer, mstr_phy_m2s_sequencer)
         // TODO Implement uvme_cvmcu_chip_io_transport_vseq_c::drive_i2c_m_phy_m2s()
         //      Ex: `uvmx_transport_create_seq_item(io_seq_item, io_agent_vsequencer)
         //          io_seq_item.from(i2c_m_seq_item);
         //          io_seq_item.abc = i2c_m_seq_item.xyz;
         //          `uvmx_transport_send_seq_item(io_seq_item)
         //          `uvmx_transport_seq_item_done(i2c_m_agent_vsequencer, mstr_phy_m2s_sequencer)
      end
   endtask

   /**
    * Converts i2c_m phy_s2m sequence items into io sequence items.
    */
   task drive_i2c_m_phy_s2m();
      uvma_i2c_mstr_phy_s2m_seq_item_c  i2c_m_seq_item;
      uvma_cvmcu_io_seq_item_c  io_seq_item;
      forever begin
         `uvmx_transport_get_seq_item(i2c_m_seq_item, i2c_m_agent_vsequencer, mstr_phy_s2m_sequencer)
         // TODO Implement uvme_cvmcu_chip_io_transport_vseq_c::drive_i2c_m_phy_s2m()
         //      Ex: `uvmx_transport_create_seq_item(io_seq_item, io_agent_vsequencer)
         //          io_seq_item.from(i2c_m_seq_item);
         //          io_seq_item.abc = i2c_m_seq_item.xyz;
         //          `uvmx_transport_send_seq_item(io_seq_item)
         //          `uvmx_transport_seq_item_done(i2c_m_agent_vsequencer, mstr_phy_s2m_sequencer)
      end
   endtask

endclass : uvme_cvmcu_chip_io_transport_vseq_c


`endif // __UVME_CVMCU_CHIP_IO_TRANSPORT_VSEQ_SV__