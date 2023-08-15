// Copyright 2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVME_CVMCU_CHIP_ENV_SV__
`define __UVME_CVMCU_CHIP_ENV_SV__


/**
 * Component that encapsulates, builds and connects all other CORE-V-MCU Chip environment components.
 * @ingroup uvme_cvmcu_chip_comps
 */
class uvme_cvmcu_chip_env_c extends uvmx_chip_env_c #(
   .T_CFG      (uvme_cvmcu_chip_cfg_c           ),
   .T_CNTXT    (uvme_cvmcu_chip_cntxt_c         ),
   .T_VSQR     (uvme_cvmcu_chip_vsqr_c          ),
   .T_PRD      (uvme_cvmcu_chip_prd_c           ),
   .T_SB       (uvme_cvmcu_chip_sb_c            ),
   .T_COV_MODEL(uvme_cvmcu_chip_cov_model_c     ),
   .T_PROBE_VIF(virtual uvme_cvmcu_chip_probe_if)
);

   /// @name Agents
   /// @{
   uvma_jtag_agent_c  jtag_agent; ///< JTAG controller agent
   uvma_spi_agent_c  qspi_s0_agent; ///< QSPI slave 0 agent
   uvma_spi_agent_c  qspi_s1_agent; ///< QSPI slave 1 agent
   uvma_cvmcu_cpi_agent_c  camera_agent; ///< Camera Parallel Interface transmitter agent
   uvma_i2c_agent_c  i2c_s0_agent; ///< I2C slave 0 agent
   uvma_i2c_agent_c  i2c_s1_agent; ///< I2C slave 1 agent
   uvma_uart_agent_c  uart0_agent; ///< UART 0 agent
   uvma_uart_agent_c  uart1_agent; ///< UART 1 agent
   uvma_sdio_agent_c  sdio_agent; ///< Flash card agent
   uvma_i2c_agent_c  i2c_m_agent; ///< I2C master agent
   uvma_cvmcu_io_agent_c  io_agent; ///< IO ports agent
   uvma_obi_agent_c  instr_obi_agent; ///< Instruction memory OBI agent
   uvma_obi_agent_c  data_obi_agent; ///< Data memory OBI agent
   uvma_cvmcu_event_agent_c  event_agent; ///< Event agent
   uvma_cvmcu_dbg_agent_c  dbg_agent; ///< Debug agent
   uvma_irq_agent_c  irq_l1_agent; /// First Level IRQ agent
   uvma_irq_agent_c  irq_l2_agent; /// Platform-Specific (Second Level) IRQ agent
   /// @}

   /// @name Sub-Systems
   /// @{
   uvme_apb_timer_ss_env_c  apb_timer_ss_env; ///< Simple timer sub-system
   uvme_apb_adv_timer_ss_env_c  apb_adv_timer_ss_env; ///< Advanced timer (PWM) sub-system
   /// @}

   /// @name Register Adapters
   /// @{
   uvma_obi_reg_adapter_c  data_obi_reg_adapter; ///< Converts OBI sequence items to/from register operations.
   /// @}


   `uvm_component_utils(uvme_cvmcu_chip_env_c)


   /**
    * Default constructor.
    */
   function new(string name="uvme_cvmcu_chip_env", uvm_component parent=null);
      super.new(name, parent);
   endfunction

   /**
    * Assigns configuration handles to components using UVM Configuration Database.
    */
   virtual function void assign_cfg();
      uvm_config_db#(uvma_jtag_cfg_c)::set(this, "jtag_agent", "cfg", cfg.jtag_agent_cfg);
      uvm_config_db#(uvma_spi_cfg_c)::set(this, "qspi_s0_agent", "cfg", cfg.qspi_s0_agent_cfg);
      uvm_config_db#(uvma_spi_cfg_c)::set(this, "qspi_s1_agent", "cfg", cfg.qspi_s1_agent_cfg);
      uvm_config_db#(uvma_cvmcu_cpi_cfg_c)::set(this, "camera_agent", "cfg", cfg.camera_agent_cfg);
      uvm_config_db#(uvma_i2c_cfg_c)::set(this, "i2c_s0_agent", "cfg", cfg.i2c_s0_agent_cfg);
      uvm_config_db#(uvma_i2c_cfg_c)::set(this, "i2c_s1_agent", "cfg", cfg.i2c_s1_agent_cfg);
      uvm_config_db#(uvma_uart_cfg_c)::set(this, "uart0_agent", "cfg", cfg.uart0_agent_cfg);
      uvm_config_db#(uvma_uart_cfg_c)::set(this, "uart1_agent", "cfg", cfg.uart1_agent_cfg);
      uvm_config_db#(uvma_sdio_cfg_c)::set(this, "sdio_agent", "cfg", cfg.sdio_agent_cfg);
      uvm_config_db#(uvma_i2c_cfg_c)::set(this, "i2c_m_agent", "cfg", cfg.i2c_m_agent_cfg);
      uvm_config_db#(uvma_cvmcu_io_cfg_c)::set(this, "io_agent", "cfg", cfg.io_agent_cfg);
      uvm_config_db#(uvma_obi_cfg_c)::set(this, "instr_obi_agent", "cfg", cfg.instr_obi_agent_cfg);
      uvm_config_db#(uvma_obi_cfg_c)::set(this, "data_obi_agent", "cfg", cfg.data_obi_agent_cfg);
      uvm_config_db#(uvma_cvmcu_event_cfg_c)::set(this, "event_agent", "cfg", cfg.event_agent_cfg);
      uvm_config_db#(uvma_cvmcu_dbg_cfg_c)::set(this, "dbg_agent", "cfg", cfg.dbg_agent_cfg);
      uvm_config_db#(uvma_irq_cfg_c)::set(this, "irq_l1_agent", "cfg", cfg.irq_l1_agent_cfg);
      uvm_config_db#(uvma_irq_cfg_c)::set(this, "irq_l2_agent", "cfg", cfg.irq_l2_agent_cfg);
      uvm_config_db#(uvme_apb_timer_ss_cfg_c)::set(this, "apb_timer_ss_env", "cfg", cfg.apb_timer_ss_env_cfg);
      uvm_config_db#(uvme_apb_adv_timer_ss_cfg_c)::set(this, "apb_adv_timer_ss_env", "cfg", cfg.apb_adv_timer_ss_env_cfg);
   endfunction

   /**
    * Assigns context handles to components using UVM Configuration Database.
    */
   virtual function void assign_cntxt();
      uvm_config_db#(uvma_jtag_cntxt_c)::set(this, "jtag_agent", "cntxt", cntxt.jtag_agent_cntxt);
      uvm_config_db#(uvma_spi_cntxt_c)::set(this, "qspi_s0_agent", "cntxt", cntxt.qspi_s0_agent_cntxt);
      uvm_config_db#(uvma_spi_cntxt_c)::set(this, "qspi_s1_agent", "cntxt", cntxt.qspi_s1_agent_cntxt);
      uvm_config_db#(uvma_cvmcu_cpi_cntxt_c)::set(this, "camera_agent", "cntxt", cntxt.camera_agent_cntxt);
      uvm_config_db#(uvma_i2c_cntxt_c)::set(this, "i2c_s0_agent", "cntxt", cntxt.i2c_s0_agent_cntxt);
      uvm_config_db#(uvma_i2c_cntxt_c)::set(this, "i2c_s1_agent", "cntxt", cntxt.i2c_s1_agent_cntxt);
      uvm_config_db#(uvma_uart_cntxt_c)::set(this, "uart0_agent", "cntxt", cntxt.uart0_agent_cntxt);
      uvm_config_db#(uvma_uart_cntxt_c)::set(this, "uart1_agent", "cntxt", cntxt.uart1_agent_cntxt);
      uvm_config_db#(uvma_sdio_cntxt_c)::set(this, "sdio_agent", "cntxt", cntxt.sdio_agent_cntxt);
      uvm_config_db#(uvma_i2c_cntxt_c)::set(this, "i2c_m_agent", "cntxt", cntxt.i2c_m_agent_cntxt);
      uvm_config_db#(uvma_cvmcu_io_cntxt_c)::set(this, "io_agent", "cntxt", cntxt.io_agent_cntxt);
      uvm_config_db#(uvma_obi_cntxt_c)::set(this, "instr_obi_agent", "cntxt", cntxt.instr_obi_agent_cntxt);
      uvm_config_db#(uvma_obi_cntxt_c)::set(this, "data_obi_agent", "cntxt", cntxt.data_obi_agent_cntxt);
      uvm_config_db#(uvma_cvmcu_event_cntxt_c)::set(this, "event_agent", "cntxt", cntxt.event_agent_cntxt);
      uvm_config_db#(uvma_cvmcu_dbg_cntxt_c)::set(this, "dbg_agent", "cntxt", cntxt.dbg_agent_cntxt);
      uvm_config_db#(uvma_irq_cntxt_c)::set(this, "irq_l1_agent", "cntxt", cntxt.irq_l1_agent_cntxt);
      uvm_config_db#(uvma_irq_cntxt_c)::set(this, "irq_l2_agent", "cntxt", cntxt.irq_l2_agent_cntxt);
      uvm_config_db#(uvme_apb_timer_ss_cntxt_c)::set(this, "apb_timer_ss_env", "cntxt", cntxt.apb_timer_ss_env_cntxt);
      uvm_config_db#(uvme_apb_adv_timer_ss_cntxt_c)::set(this, "apb_adv_timer_ss_env", "cntxt", cntxt.apb_adv_timer_ss_env_cntxt);
   endfunction

   /**
    * Distributes register blocks to sub-systems.
    */
   virtual function void assign_reg_blocks();
      cntxt.apb_timer_ss_env_cntxt.reg_model = cntxt.reg_model.timer;
      cntxt.apb_adv_timer_ss_env_cntxt.reg_model = cntxt.reg_model.adv_timer;
   endfunction

   /**
    * Creates agent components.
    */
   virtual function void create_agents();
      jtag_agent = uvma_jtag_agent_c::type_id::create("jtag_agent", this);
      qspi_s0_agent = uvma_spi_agent_c::type_id::create("qspi_s0_agent", this);
      qspi_s1_agent = uvma_spi_agent_c::type_id::create("qspi_s1_agent", this);
      camera_agent = uvma_cvmcu_cpi_agent_c::type_id::create("camera_agent", this);
      i2c_s0_agent = uvma_i2c_agent_c::type_id::create("i2c_s0_agent", this);
      i2c_s1_agent = uvma_i2c_agent_c::type_id::create("i2c_s1_agent", this);
      uart0_agent = uvma_uart_agent_c::type_id::create("uart0_agent", this);
      uart1_agent = uvma_uart_agent_c::type_id::create("uart1_agent", this);
      sdio_agent = uvma_sdio_agent_c::type_id::create("sdio_agent", this);
      i2c_m_agent = uvma_i2c_agent_c::type_id::create("i2c_m_agent", this);
      io_agent = uvma_cvmcu_io_agent_c::type_id::create("io_agent", this);
      instr_obi_agent = uvma_obi_agent_c::type_id::create("instr_obi_agent", this);
      data_obi_agent = uvma_obi_agent_c::type_id::create("data_obi_agent", this);
      event_agent = uvma_cvmcu_event_agent_c::type_id::create("event_agent", this);
      dbg_agent = uvma_cvmcu_dbg_agent_c::type_id::create("dbg_agent", this);
      irq_l1_agent = uvma_irq_agent_c::type_id::create("irq_l1_agent", this);
      irq_l2_agent = uvma_irq_agent_c::type_id::create("irq_l2_agent", this);
   endfunction

   /**
    * Creates sub-system environment components.
    */
   virtual function void create_ss();
      apb_timer_ss_env = uvme_apb_timer_ss_env_c::type_id::create("apb_timer_ss_env", this);
      apb_adv_timer_ss_env = uvme_apb_adv_timer_ss_env_c::type_id::create("apb_adv_timer_ss_env", this);
   endfunction

   /**
    * Creates register adapters.
    */
   virtual function void create_reg_adapter();
      data_obi_reg_adapter = uvma_obi_reg_adapter_c::type_id::create("data_obi_reg_adapter");
      data_obi_reg_adapter.cfg   = cfg  .data_obi_agent_cfg  ;
      data_obi_reg_adapter.cntxt = cntxt.data_obi_agent_cntxt;
   endfunction

   /**
    * Connects register block to register adapters.
    */
   virtual function void connect_reg_block();
      cntxt.reg_model.default_map.set_sequencer(data_obi_agent.vsequencer, data_obi_reg_adapter);
      cntxt.reg_model.default_map.set_auto_predict(1);
   endfunction

   /**
    * Connects agents to predictor.
    */
   virtual function void connect_predictor();
      data_obi_agent.mon_trn_ap.connect(predictor.data_obi_reg_fifo.analysis_export);
      qspi_s0_agent.s2m_mon_trn_ap.connect(predictor.udma_qspi0_ingress_fifo.analysis_export);
      qspi_s1_agent.s2m_mon_trn_ap.connect(predictor.udma_qspi1_ingress_fifo.analysis_export);
      camera_agent.mon_trn_ap.connect(predictor.udma_camera_fifo.analysis_export);
      i2c_s0_agent.s2m_mon_trn_ap.connect(predictor.udma_i2c0_ingress_fifo.analysis_export);
      i2c_s1_agent.s2m_mon_trn_ap.connect(predictor.udma_i2c1_ingress_fifo.analysis_export);
      uart0_agent.ig_mon_trn_ap.connect(predictor.udma_uart0_ingress_fifo.analysis_export);
      uart1_agent.ig_mon_trn_ap.connect(predictor.udma_uart1_ingress_fifo.analysis_export);
      i2c_m_agent.m2s_mon_trn_ap.connect(predictor.apb_i2c_ingress_fifo.analysis_export);
      io_agent.ig_mon_trn_ap.connect(predictor.gpio_ingress_fifo.analysis_export);
      event_agent.mon_trn_ap.connect(predictor.mon_event_fifo.analysis_export);
      dbg_agent.mon_trn_ap.connect(predictor.mon_dbg_fifo.analysis_export);
      vsequencer.udma_qspi0_egress_exp_ap.connect(predictor.udma_qspi0_egress_fifo.analysis_export);
      vsequencer.udma_qspi1_egress_exp_ap.connect(predictor.udma_qspi1_egress_fifo.analysis_export);
      vsequencer.udma_i2c0_egress_exp_ap.connect(predictor.udma_i2c0_egress_fifo.analysis_export);
      vsequencer.udma_i2c1_egress_exp_ap.connect(predictor.udma_i2c1_egress_fifo.analysis_export);
      vsequencer.udma_uart0_egress_exp_ap.connect(predictor.udma_uart0_egress_fifo.analysis_export);
      vsequencer.udma_uart1_egress_exp_ap.connect(predictor.udma_uart1_egress_fifo.analysis_export);
      vsequencer.apb_i2c_egress_exp_ap.connect(predictor.apb_i2c_egress_fifo.analysis_export);
      vsequencer.gpio_egress_exp_ap.connect(predictor.gpio_egress_fifo.analysis_export);
      vsequencer.event_exp_ap.connect(predictor.event_fifo.analysis_export);
      vsequencer.dbg_exp_ap.connect(predictor.dbg_fifo.analysis_export);
   endfunction

   /**
    * Connects scoreboards components to agents/predictor.
    */
   virtual function void connect_scoreboard();
      qspi_s0_agent.m2s_mon_trn_ap.connect(scoreboard.udma_qspi0_egress_sb.act_export);
      qspi_s1_agent.m2s_mon_trn_ap.connect(scoreboard.udma_qspi1_egress_sb.act_export);
      i2c_s0_agent.m2s_mon_trn_ap.connect(scoreboard.udma_i2c0_egress_sb.act_export);
      i2c_s1_agent.m2s_mon_trn_ap.connect(scoreboard.udma_i2c1_egress_sb.act_export);
      uart0_agent.eg_mon_trn_ap.connect(scoreboard.udma_uart0_egress_sb.act_export);
      uart1_agent.eg_mon_trn_ap.connect(scoreboard.udma_uart1_egress_sb.act_export);
      i2c_m_agent.s2m_mon_trn_ap.connect(scoreboard.apb_i2c_egress_sb.act_export);
      io_agent.eg_mon_trn_ap.connect(scoreboard.gpio_egress_sb.act_export);
      event_agent.mon_trn_ap.connect(scoreboard.event_sb.act_export);
      dbg_agent.mon_trn_ap.connect(scoreboard.dbg_sb.act_export);
      predictor.udma_qspi0_egress_ap.connect(scoreboard.udma_qspi0_egress_sb.exp_export);
      predictor.udma_qspi1_egress_ap.connect(scoreboard.udma_qspi1_egress_sb.exp_export);
      predictor.udma_i2c0_egress_ap.connect(scoreboard.udma_i2c0_egress_sb.exp_export);
      predictor.udma_i2c1_egress_ap.connect(scoreboard.udma_i2c1_egress_sb.exp_export);
      predictor.udma_uart0_egress_ap.connect(scoreboard.udma_uart0_egress_sb.exp_export);
      predictor.udma_uart1_egress_ap.connect(scoreboard.udma_uart1_egress_sb.exp_export);
      predictor.apb_i2c_egress_ap.connect(scoreboard.apb_i2c_egress_sb.exp_export);
      predictor.gpio_egress_ap.connect(scoreboard.gpio_egress_sb.exp_export);
      predictor.event_ap.connect(scoreboard.event_sb.exp_export);
      predictor.dbg_ap.connect(scoreboard.dbg_sb.exp_export);
      vsequencer.udma_qspi0_ingress_act_ap.connect(scoreboard.udma_qspi0_ingress_sb.act_export);
      vsequencer.udma_qspi1_ingress_act_ap.connect(scoreboard.udma_qspi1_ingress_sb.act_export);
      vsequencer.udma_camera_act_ap.connect(scoreboard.udma_camera_sb.act_export);
      vsequencer.udma_i2c0_ingress_act_ap.connect(scoreboard.udma_i2c0_ingress_sb.act_export);
      vsequencer.udma_i2c1_ingress_act_ap.connect(scoreboard.udma_i2c1_ingress_sb.act_export);
      vsequencer.udma_uart0_ingress_act_ap.connect(scoreboard.udma_uart0_ingress_sb.act_export);
      vsequencer.udma_uart1_ingress_act_ap.connect(scoreboard.udma_uart1_ingress_sb.act_export);
      vsequencer.apb_i2c_ingress_act_ap.connect(scoreboard.apb_i2c_ingress_sb.act_export);
      vsequencer.gpio_ingress_act_ap.connect(scoreboard.gpio_ingress_sb.act_export);
   endfunction

   /**
    * Connects environment coverage model to agents/scoreboards/predictor.
    */
   virtual function void connect_coverage_model();
      qspi_s0_agent.s2m_mon_trn_ap.connect(cov_model.udma_qspi0_ingress_exp_fifo.analysis_export);
      qspi_s1_agent.s2m_mon_trn_ap.connect(cov_model.udma_qspi1_ingress_exp_fifo.analysis_export);
      camera_agent.mon_trn_ap.connect(cov_model.udma_camera_exp_fifo.analysis_export);
      i2c_s0_agent.s2m_mon_trn_ap.connect(cov_model.udma_i2c0_ingress_exp_fifo.analysis_export);
      i2c_s1_agent.s2m_mon_trn_ap.connect(cov_model.udma_i2c1_ingress_exp_fifo.analysis_export);
      uart0_agent.ig_mon_trn_ap.connect(cov_model.udma_uart0_ingress_exp_fifo.analysis_export);
      uart1_agent.ig_mon_trn_ap.connect(cov_model.udma_uart1_ingress_exp_fifo.analysis_export);
      i2c_m_agent.m2s_mon_trn_ap.connect(cov_model.apb_i2c_ingress_exp_fifo.analysis_export);
      io_agent.ig_mon_trn_ap.connect(cov_model.gpio_ingress_exp_fifo.analysis_export);
      event_agent.mon_trn_ap.connect(cov_model.mon_event_exp_fifo.analysis_export);
      dbg_agent.mon_trn_ap.connect(cov_model.mon_dbg_exp_fifo.analysis_export);
      vsequencer.udma_qspi0_egress_exp_ap.connect(cov_model.udma_qspi0_egress_exp_fifo.analysis_export);
      vsequencer.udma_qspi1_egress_exp_ap.connect(cov_model.udma_qspi1_egress_exp_fifo.analysis_export);
      vsequencer.udma_i2c0_egress_exp_ap.connect(cov_model.udma_i2c0_egress_exp_fifo.analysis_export);
      vsequencer.udma_i2c1_egress_exp_ap.connect(cov_model.udma_i2c1_egress_exp_fifo.analysis_export);
      vsequencer.udma_uart0_egress_exp_ap.connect(cov_model.udma_uart0_egress_exp_fifo.analysis_export);
      vsequencer.udma_uart1_egress_exp_ap.connect(cov_model.udma_uart1_egress_exp_fifo.analysis_export);
      vsequencer.apb_i2c_egress_exp_ap.connect(cov_model.apb_i2c_egress_exp_fifo.analysis_export);
      vsequencer.gpio_egress_exp_ap.connect(cov_model.gpio_egress_exp_fifo.analysis_export);
      vsequencer.event_exp_ap.connect(cov_model.event_exp_fifo.analysis_export);
      vsequencer.dbg_exp_ap.connect(cov_model.dbg_exp_fifo.analysis_export);
      predictor.udma_qspi0_egress_ap.connect(cov_model.udma_qspi0_egress_act_fifo.analysis_export);
      predictor.udma_qspi1_egress_ap.connect(cov_model.udma_qspi1_egress_act_fifo.analysis_export);
      predictor.udma_i2c0_egress_ap.connect(cov_model.udma_i2c0_egress_act_fifo.analysis_export);
      predictor.udma_i2c1_egress_ap.connect(cov_model.udma_i2c1_egress_act_fifo.analysis_export);
      predictor.udma_uart0_egress_ap.connect(cov_model.udma_uart0_egress_act_fifo.analysis_export);
      predictor.udma_uart1_egress_ap.connect(cov_model.udma_uart1_egress_act_fifo.analysis_export);
      predictor.apb_i2c_egress_ap.connect(cov_model.apb_i2c_egress_act_fifo.analysis_export);
      predictor.gpio_egress_ap.connect(cov_model.gpio_egress_act_fifo.analysis_export);
      predictor.event_ap.connect(cov_model.event_act_fifo.analysis_export);
      predictor.dbg_ap.connect(cov_model.dbg_act_fifo.analysis_export);
      vsequencer.udma_qspi0_ingress_act_ap.connect(cov_model.udma_qspi0_ingress_act_fifo.analysis_export);
      vsequencer.udma_qspi1_ingress_act_ap.connect(cov_model.udma_qspi1_ingress_act_fifo.analysis_export);
      vsequencer.udma_camera_act_ap.connect(cov_model.udma_camera_act_fifo.analysis_export);
      vsequencer.udma_i2c0_ingress_act_ap.connect(cov_model.udma_i2c0_ingress_act_fifo.analysis_export);
      vsequencer.udma_i2c1_ingress_act_ap.connect(cov_model.udma_i2c1_ingress_act_fifo.analysis_export);
      vsequencer.udma_uart0_ingress_act_ap.connect(cov_model.udma_uart0_ingress_act_fifo.analysis_export);
      vsequencer.udma_uart1_ingress_act_ap.connect(cov_model.udma_uart1_ingress_act_fifo.analysis_export);
      vsequencer.apb_i2c_ingress_act_ap.connect(cov_model.apb_i2c_ingress_act_fifo.analysis_export);
      vsequencer.gpio_ingress_act_ap.connect(cov_model.gpio_ingress_act_fifo.analysis_export);
   endfunction

   /**
    * Connects bypass agents to transport agents.
    */
   virtual function void connect_transport_agents();
      `uvmx_connect_transport_agent(qspi_s0_agent, io_agent);
      `uvmx_connect_transport_agent(qspi_s1_agent, io_agent);
      `uvmx_connect_transport_agent(camera_agent, io_agent);
      `uvmx_connect_transport_agent(i2c_s0_agent, io_agent);
      `uvmx_connect_transport_agent(i2c_s1_agent, io_agent);
      `uvmx_connect_transport_agent(uart0_agent, io_agent);
      `uvmx_connect_transport_agent(uart1_agent, io_agent);
      `uvmx_connect_transport_agent(sdio_agent, io_agent);
      `uvmx_connect_transport_agent(i2c_m_agent, io_agent);
   endfunction

   /**
    * Assembles virtual sequencer from agent, sub-system and block sequencers.
    */
   virtual function void assemble_vsequencer();
      vsequencer.jtag_agent_vsequencer = jtag_agent.vsequencer;
      vsequencer.qspi_s0_agent_vsequencer = qspi_s0_agent.vsequencer;
      vsequencer.qspi_s1_agent_vsequencer = qspi_s1_agent.vsequencer;
      vsequencer.camera_agent_vsequencer = camera_agent.vsequencer;
      vsequencer.i2c_s0_agent_vsequencer = i2c_s0_agent.vsequencer;
      vsequencer.i2c_s1_agent_vsequencer = i2c_s1_agent.vsequencer;
      vsequencer.uart0_agent_vsequencer = uart0_agent.vsequencer;
      vsequencer.uart1_agent_vsequencer = uart1_agent.vsequencer;
      vsequencer.sdio_agent_vsequencer = sdio_agent.vsequencer;
      vsequencer.i2c_m_agent_vsequencer = i2c_m_agent.vsequencer;
      vsequencer.io_agent_vsequencer = io_agent.vsequencer;
      vsequencer.instr_obi_agent_vsequencer = instr_obi_agent.vsequencer;
      vsequencer.data_obi_agent_vsequencer = data_obi_agent.vsequencer;
      vsequencer.event_agent_vsequencer = event_agent.vsequencer;
      vsequencer.dbg_agent_vsequencer = dbg_agent.vsequencer;
      vsequencer.apb_timer_ss_env_vsequencer = apb_timer_ss_env.vsequencer;
      vsequencer.apb_adv_timer_ss_env_vsequencer = apb_adv_timer_ss_env.vsequencer;
   endfunction

   /**
    * Adds automated register testing ignore lists.
    */
   virtual function void add_reg_test_ignore_lists();
      add_reg_test_ignore_list(UVM_DO_ALL_REG_MEM_TESTS, uvme_cvmcu_chip_all_reg_mem_ignore_list    );
      add_reg_test_ignore_list(UVM_DO_REG_HW_RESET     , uvme_cvmcu_chip_reg_hw_reset_ignore_list   );
      add_reg_test_ignore_list(UVM_DO_REG_BIT_BASH     , uvme_cvmcu_chip_reg_bit_bash_ignore_list   );
      add_reg_test_ignore_list(UVM_DO_REG_ACCESS       , uvme_cvmcu_chip_reg_access_ignore_list     );
      add_reg_test_ignore_list(UVM_DO_MEM_ACCESS       , uvme_cvmcu_chip_mem_access_ignore_list     );
      add_reg_test_ignore_list(UVM_DO_SHARED_ACCESS    , uvme_cvmcu_chip_shared_access_ignore_list  );
      add_reg_test_ignore_list(UVM_DO_MEM_WALK         , uvme_cvmcu_chip_mem_walk_access_ignore_list);
   endfunction

   /**
    * Creates and starts transport sequences.
    */
   virtual task run_phase(uvm_phase phase);
      super.run_phase(phase);
      if (cfg.enabled) begin
         fork
            `uvmx_run_transport_vseq(uvme_cvmcu_chip_io_transport_vseq_c)
         join_none
      end
   endtask

endclass : uvme_cvmcu_chip_env_c


`endif // __UVME_CVMCU_CHIP_ENV_SV__