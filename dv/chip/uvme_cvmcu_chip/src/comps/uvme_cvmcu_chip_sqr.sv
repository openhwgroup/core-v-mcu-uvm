// Copyright 2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVME_CVMCU_CHIP_SQR_SV__
`define __UVME_CVMCU_CHIP_SQR_SV__


/**
 * Component on which all CORE-V-MCU Sub-System environment (uvme_cvmcu_chip_env_c) Sequences are run.
 * @ingroup uvme_cvmcu_chip_comps
 */
class uvme_cvmcu_chip_sqr_c extends uvmx_chip_env_sqr_c #(
   .T_CFG  (uvme_cvmcu_chip_cfg_c  ),
   .T_CNTXT(uvme_cvmcu_chip_cntxt_c)
);

   /// @name Sequencer handles
   /// @{
   uvma_jtag_sqr_c  jtag_agent_sequencer; ///< JTAG controller sequencer
   uvma_spi_sqr_c  qspi_s0_agent_sequencer; ///< QSPI slave 0 sequencer
   uvma_spi_sqr_c  qspi_s1_agent_sequencer; ///< QSPI slave 1 sequencer
   uvma_cvmcu_cpi_sqr_c  camera_agent_sequencer; ///< Camera Parallel Interface transmitter sequencer
   uvma_i2c_sqr_c  i2c_s0_agent_sequencer; ///< I2C slave 0 sequencer
   uvma_i2c_sqr_c  i2c_s1_agent_sequencer; ///< I2C slave 1 sequencer
   uvma_uart_sqr_c  uart0_agent_sequencer; ///< UART 0 sequencer
   uvma_uart_sqr_c  uart1_agent_sequencer; ///< UART 1 sequencer
   uvma_sdio_sqr_c  sdio_agent_sequencer; ///< Flash card sequencer
   uvma_i2c_sqr_c  i2c_m_agent_sequencer; ///< I2C master sequencer
   uvma_cvmcu_io_sqr_c  io_agent_sequencer; ///< IO ports sequencer
   uvma_obi_sqr_c  instr_obi_agent_sequencer; ///< Instruction memory OBI sequencer
   uvma_obi_sqr_c  data_obi_agent_sequencer; ///< Data memory OBI sequencer
   uvma_cvmcu_event_sqr_c  event_agent_sequencer; ///< Event sequencer
   uvma_cvmcu_dbg_sqr_c  dbg_agent_sequencer; ///< Debug sequencer
   uvme_apb_timer_ss_sqr_c  apb_timer_ss_env_sequencer; ///< Simple timer sequencer
   uvme_apb_adv_timer_ss_sqr_c  apb_adv_timer_ss_env_sequencer; ///< Advanced timer (PWM) sequencer
   /// @}

   /// @name Ports
   /// @{
   uvm_analysis_port #(uvma_spi_mon_trn_c)  udma_qspi0_egress_exp_ap; ///< udma_qspi0_egress output for transactions to the predictor
   uvm_analysis_port #(uvma_spi_mon_trn_c)  udma_qspi1_egress_exp_ap; ///< udma_qspi1_egress output for transactions to the predictor
   uvm_analysis_port #(uvma_i2c_mon_trn_c)  udma_i2c0_egress_exp_ap; ///< udma_i2c0_egress output for transactions to the predictor
   uvm_analysis_port #(uvma_i2c_mon_trn_c)  udma_i2c1_egress_exp_ap; ///< udma_i2c1_egress output for transactions to the predictor
   uvm_analysis_port #(uvma_uart_mon_trn_c)  udma_uart0_egress_exp_ap; ///< udma_uart0_egress output for transactions to the predictor
   uvm_analysis_port #(uvma_uart_mon_trn_c)  udma_uart1_egress_exp_ap; ///< udma_uart1_egress output for transactions to the predictor
   uvm_analysis_port #(uvma_i2c_mon_trn_c)  apb_i2c_egress_exp_ap; ///< apb_i2c_egress output for transactions to the predictor
   uvm_analysis_port #(uvma_cvmcu_io_mon_trn_c)  gpio_egress_exp_ap; ///< gpio_egress output for transactions to the predictor
   uvm_analysis_port #(uvma_cvmcu_dbg_mon_trn_c)  dbg_exp_ap; ///< dbg output for transactions to the predictor
   uvm_analysis_port #(uvma_spi_mon_trn_c)  udma_qspi0_ingress_act_ap; ///< udma_qspi0_ingress output for transactions to the scoreboard
   uvm_analysis_port #(uvma_spi_mon_trn_c)  udma_qspi1_ingress_act_ap; ///< udma_qspi1_ingress output for transactions to the scoreboard
   uvm_analysis_port #(uvma_cvmcu_cpi_mon_trn_c)  udma_camera_act_ap; ///< udma_camera output for transactions to the scoreboard
   uvm_analysis_port #(uvma_i2c_mon_trn_c)  udma_i2c0_ingress_act_ap; ///< udma_i2c0_ingress output for transactions to the scoreboard
   uvm_analysis_port #(uvma_i2c_mon_trn_c)  udma_i2c1_ingress_act_ap; ///< udma_i2c1_ingress output for transactions to the scoreboard
   uvm_analysis_port #(uvma_uart_mon_trn_c)  udma_uart0_ingress_act_ap; ///< udma_uart0_ingress output for transactions to the scoreboard
   uvm_analysis_port #(uvma_uart_mon_trn_c)  udma_uart1_ingress_act_ap; ///< udma_uart1_ingress output for transactions to the scoreboard
   uvm_analysis_port #(uvma_i2c_mon_trn_c)  apb_i2c_ingress_act_ap; ///< apb_i2c_ingress output for transactions to the scoreboard
   uvm_analysis_port #(uvma_cvmcu_io_mon_trn_c)  gpio_ingress_act_ap; ///< gpio_ingress output for transactions to the scoreboard
   /// @}


   `uvm_component_utils(uvme_cvmcu_chip_sqr_c)


   /**
    * Default constructor.
    */
   function new(string name="uvme_cvmcu_chip_sqr", uvm_component parent=null);
      super.new(name, parent);
   endfunction

   /**
    * Creates analysis ports.
    */
   virtual function void create_ports();
      udma_qspi0_egress_exp_ap = new("udma_qspi0_egress_exp_ap", this);
      udma_qspi1_egress_exp_ap = new("udma_qspi1_egress_exp_ap", this);
      udma_i2c0_egress_exp_ap = new("udma_i2c0_egress_exp_ap", this);
      udma_i2c1_egress_exp_ap = new("udma_i2c1_egress_exp_ap", this);
      udma_uart0_egress_exp_ap = new("udma_uart0_egress_exp_ap", this);
      udma_uart1_egress_exp_ap = new("udma_uart1_egress_exp_ap", this);
      apb_i2c_egress_exp_ap = new("apb_i2c_egress_exp_ap", this);
      gpio_egress_exp_ap = new("gpio_egress_exp_ap", this);
      dbg_exp_ap = new("dbg_exp_ap", this);
      udma_qspi0_ingress_act_ap = new("udma_qspi0_ingress_act_ap", this);
      udma_qspi1_ingress_act_ap = new("udma_qspi1_ingress_act_ap", this);
      udma_camera_act_ap = new("udma_camera_act_ap", this);
      udma_i2c0_ingress_act_ap = new("udma_i2c0_ingress_act_ap", this);
      udma_i2c1_ingress_act_ap = new("udma_i2c1_ingress_act_ap", this);
      udma_uart0_ingress_act_ap = new("udma_uart0_ingress_act_ap", this);
      udma_uart1_ingress_act_ap = new("udma_uart1_ingress_act_ap", this);
      apb_i2c_ingress_act_ap = new("apb_i2c_ingress_act_ap", this);
      gpio_ingress_act_ap = new("gpio_ingress_act_ap", this);
   endfunction

endclass


`endif // __UVME_CVMCU_CHIP_SQR_SV__