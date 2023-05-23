// Copyright 2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVME_CVMCU_CHIP_VSQR_SV__
`define __UVME_CVMCU_CHIP_VSQR_SV__


/**
 * Component on which all CORE-V-MCU Sub-System environment (uvme_cvmcu_chip_env_c) virtual sequences are run.
 * @ingroup uvme_cvmcu_chip_comps
 */
class uvme_cvmcu_chip_vsqr_c extends uvmx_chip_env_vsqr_c #(
   .T_CFG  (uvme_cvmcu_chip_cfg_c  ),
   .T_CNTXT(uvme_cvmcu_chip_cntxt_c)
);

   /// @name Sequencer handles
   /// @{
   uvma_jtag_vsqr_c  jtag_agent_vsequencer; ///< JTAG controller sequencer
   uvma_spi_vsqr_c  qspi_s0_agent_vsequencer; ///< QSPI slave 0 sequencer
   uvma_spi_vsqr_c  qspi_s1_agent_vsequencer; ///< QSPI slave 1 sequencer
   uvma_cvmcu_cpi_vsqr_c  camera_agent_vsequencer; ///< Camera Parallel Interface transmitter sequencer
   uvma_i2c_vsqr_c  i2c_s0_agent_vsequencer; ///< I2C slave 0 sequencer
   uvma_i2c_vsqr_c  i2c_s1_agent_vsequencer; ///< I2C slave 1 sequencer
   uvma_apb_vsqr_c  apb_agent_vsequencer; ///< APB peripherals monitor sequencer
   uvma_uart_vsqr_c  uart0_agent_vsequencer; ///< UART 0 sequencer
   uvma_uart_vsqr_c  uart1_agent_vsequencer; ///< UART 1 sequencer
   uvma_sdio_vsqr_c  sdio_agent_vsequencer; ///< Flash card sequencer
   uvma_i2c_vsqr_c  i2c_m_agent_vsequencer; ///< I2C master sequencer
   uvma_cvmcu_io_vsqr_c  io_agent_vsequencer; ///< IO ports sequencer
   uvma_obi_vsqr_c  instr_obi_agent_vsequencer; ///< Instruction memory OBI sequencer
   uvma_obi_vsqr_c  data_obi_agent_vsequencer; ///< Data memory OBI sequencer
   uvma_cvmcu_event_vsqr_c  event_agent_vsequencer; ///< Event sequencer
   uvma_cvmcu_dbg_vsqr_c  dbg_agent_vsequencer; ///< Debug sequencer
   uvme_apb_timer_ss_vsqr_c  apb_timer_ss_env_vsequencer; ///< Simple timer sequencer
   uvme_apb_adv_timer_ss_vsqr_c  apb_adv_timer_ss_env_vsequencer; ///< Advanced timer (PWM) sequencer
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
   uvm_analysis_port #(uvma_cvmcu_event_mon_trn_c)  event_exp_ap; ///< event output for transactions to the predictor
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


   `uvm_component_utils(uvme_cvmcu_chip_vsqr_c)


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
      event_exp_ap = new("event_exp_ap", this);
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

endclass : uvme_cvmcu_chip_vsqr_c


`endif // __UVME_CVMCU_CHIP_VSQR_SV__