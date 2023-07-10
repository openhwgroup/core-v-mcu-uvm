// Copyright 2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVME_CVMCU_CHIP_CNTXT_SV__
`define __UVME_CVMCU_CHIP_CNTXT_SV__


/**
 * Object encapsulating all state variables for CORE-V-MCU Chip environment (uvme_cvmcu_chip_env_c) components.
 * @ingroup uvme_cvmcu_chip_obj
 */
class uvme_cvmcu_chip_cntxt_c extends uvmx_chip_env_cntxt_c #(
   .T_REG_MODEL(uvme_cvmcu_chip_reg_block_c     ),
   .T_PROBE_VIF(virtual uvme_cvmcu_chip_probe_if)
);

   /// @name Integrals
   /// @{
   /// @}

   /// @name Agents
   /// @{
   uvma_jtag_cntxt_c  jtag_agent_cntxt; ///< JTAG controller agent context
   uvma_spi_cntxt_c  qspi_s0_agent_cntxt; ///< QSPI slave 0 agent context
   uvma_spi_cntxt_c  qspi_s1_agent_cntxt; ///< QSPI slave 1 agent context
   uvma_cvmcu_cpi_cntxt_c  camera_agent_cntxt; ///< Camera Parallel Interface transmitter agent context
   uvma_i2c_cntxt_c  i2c_s0_agent_cntxt; ///< I2C slave 0 agent context
   uvma_i2c_cntxt_c  i2c_s1_agent_cntxt; ///< I2C slave 1 agent context
   uvma_apb_cntxt_c  apb_agent_cntxt; ///< APB peripherals monitor agent context
   uvma_uart_cntxt_c  uart0_agent_cntxt; ///< UART 0 agent context
   uvma_uart_cntxt_c  uart1_agent_cntxt; ///< UART 1 agent context
   uvma_sdio_cntxt_c  sdio_agent_cntxt; ///< Flash card agent context
   uvma_i2c_cntxt_c  i2c_m_agent_cntxt; ///< I2C master agent context
   uvma_cvmcu_io_cntxt_c  io_agent_cntxt; ///< IO ports agent context
   uvma_obi_cntxt_c  instr_obi_agent_cntxt; ///< Instruction memory OBI agent context
   uvma_obi_cntxt_c  data_obi_agent_cntxt; ///< Data memory OBI agent context
   uvma_cvmcu_event_cntxt_c  event_agent_cntxt; ///< Event agent context
   uvma_cvmcu_dbg_cntxt_c  dbg_agent_cntxt; ///< Debug agent context
   uvma_irq_cntxt_c  irq_l1_agent_cntxt; /// First Level IRQ agent context
   uvma_irq_cntxt_c  irq_l2_agent_cntxt; /// Platform-Specific (Second Level) IRQ agent context
   /// @}

   /// @name Sub-Systems
   /// @{
   uvme_apb_timer_ss_cntxt_c  apb_timer_ss_env_cntxt; ///< Simple timer sub-system context
   uvme_apb_adv_timer_ss_cntxt_c  apb_adv_timer_ss_env_cntxt; ///< Advanced timer (PWM) sub-system context
   /// @}

   /// @name Scoreboards
   /// @{
   uvml_sb_simplex_cntxt_c  udma_qspi0_ingress_sb_cntxt; ///< Scoreboard context for UDMA_QSPI0_INGRESS
   uvml_sb_simplex_cntxt_c  udma_qspi1_ingress_sb_cntxt; ///< Scoreboard context for UDMA_QSPI1_INGRESS
   uvml_sb_simplex_cntxt_c  udma_camera_sb_cntxt; ///< Scoreboard context for UDMA_CAMERA
   uvml_sb_simplex_cntxt_c  udma_i2c0_ingress_sb_cntxt; ///< Scoreboard context for UDMA_I2C0_INGRESS
   uvml_sb_simplex_cntxt_c  udma_i2c1_ingress_sb_cntxt; ///< Scoreboard context for UDMA_I2C1_INGRESS
   uvml_sb_simplex_cntxt_c  udma_uart0_ingress_sb_cntxt; ///< Scoreboard context for UDMA_UART0_INGRESS
   uvml_sb_simplex_cntxt_c  udma_uart1_ingress_sb_cntxt; ///< Scoreboard context for UDMA_UART1_INGRESS
   uvml_sb_simplex_cntxt_c  apb_i2c_ingress_sb_cntxt; ///< Scoreboard context for APB_I2C_INGRESS
   uvml_sb_simplex_cntxt_c  gpio_ingress_sb_cntxt; ///< Scoreboard context for GPIO_INGRESS
   uvml_sb_simplex_cntxt_c  udma_qspi0_egress_sb_cntxt; ///< Scoreboard context for UDMA_QSPI0_EGRESS
   uvml_sb_simplex_cntxt_c  udma_qspi1_egress_sb_cntxt; ///< Scoreboard context for UDMA_QSPI1_EGRESS
   uvml_sb_simplex_cntxt_c  udma_i2c0_egress_sb_cntxt; ///< Scoreboard context for UDMA_I2C0_EGRESS
   uvml_sb_simplex_cntxt_c  udma_i2c1_egress_sb_cntxt; ///< Scoreboard context for UDMA_I2C1_EGRESS
   uvml_sb_simplex_cntxt_c  udma_uart0_egress_sb_cntxt; ///< Scoreboard context for UDMA_UART0_EGRESS
   uvml_sb_simplex_cntxt_c  udma_uart1_egress_sb_cntxt; ///< Scoreboard context for UDMA_UART1_EGRESS
   uvml_sb_simplex_cntxt_c  apb_i2c_egress_sb_cntxt; ///< Scoreboard context for APB_I2C_EGRESS
   uvml_sb_simplex_cntxt_c  gpio_egress_sb_cntxt; ///< Scoreboard context for GPIO_EGRESS
   uvml_sb_simplex_cntxt_c  event_sb_cntxt; ///< Scoreboard context for EVENT
   uvml_sb_simplex_cntxt_c  dbg_sb_cntxt; ///< Scoreboard context for DBG
   /// @}


   `uvm_object_utils_begin(uvme_cvmcu_chip_cntxt_c)
      `uvm_field_enum(uvmx_reset_state_enum, reset_state, UVM_DEFAULT)
      `uvm_field_object(jtag_agent_cntxt, UVM_DEFAULT)
      `uvm_field_object(qspi_s0_agent_cntxt, UVM_DEFAULT)
      `uvm_field_object(qspi_s1_agent_cntxt, UVM_DEFAULT)
      `uvm_field_object(camera_agent_cntxt, UVM_DEFAULT)
      `uvm_field_object(i2c_s0_agent_cntxt, UVM_DEFAULT)
      `uvm_field_object(i2c_s1_agent_cntxt, UVM_DEFAULT)
      `uvm_field_object(apb_agent_cntxt, UVM_DEFAULT)
      `uvm_field_object(uart0_agent_cntxt, UVM_DEFAULT)
      `uvm_field_object(uart1_agent_cntxt, UVM_DEFAULT)
      `uvm_field_object(sdio_agent_cntxt, UVM_DEFAULT)
      `uvm_field_object(i2c_m_agent_cntxt, UVM_DEFAULT)
      `uvm_field_object(io_agent_cntxt, UVM_DEFAULT)
      `uvm_field_object(instr_obi_agent_cntxt, UVM_DEFAULT)
      `uvm_field_object(data_obi_agent_cntxt, UVM_DEFAULT)
      `uvm_field_object(event_agent_cntxt, UVM_DEFAULT)
      `uvm_field_object(dbg_agent_cntxt, UVM_DEFAULT)
      `uvm_field_object(irq_l1_agent_cntxt, UVM_DEFAULT)
      `uvm_field_object(irq_l2_agent_cntxt, UVM_DEFAULT)
      `uvm_field_object(apb_timer_ss_env_cntxt, UVM_DEFAULT)
      `uvm_field_object(apb_adv_timer_ss_env_cntxt, UVM_DEFAULT)
      `uvm_field_object(udma_qspi0_ingress_sb_cntxt , UVM_DEFAULT)
      `uvm_field_object(udma_qspi1_ingress_sb_cntxt , UVM_DEFAULT)
      `uvm_field_object(udma_camera_sb_cntxt , UVM_DEFAULT)
      `uvm_field_object(udma_i2c0_ingress_sb_cntxt , UVM_DEFAULT)
      `uvm_field_object(udma_i2c1_ingress_sb_cntxt , UVM_DEFAULT)
      `uvm_field_object(udma_uart0_ingress_sb_cntxt , UVM_DEFAULT)
      `uvm_field_object(udma_uart1_ingress_sb_cntxt , UVM_DEFAULT)
      `uvm_field_object(apb_i2c_ingress_sb_cntxt , UVM_DEFAULT)
      `uvm_field_object(gpio_ingress_sb_cntxt , UVM_DEFAULT)
      `uvm_field_object(udma_qspi0_egress_sb_cntxt , UVM_DEFAULT)
      `uvm_field_object(udma_qspi1_egress_sb_cntxt , UVM_DEFAULT)
      `uvm_field_object(udma_i2c0_egress_sb_cntxt , UVM_DEFAULT)
      `uvm_field_object(udma_i2c1_egress_sb_cntxt , UVM_DEFAULT)
      `uvm_field_object(udma_uart0_egress_sb_cntxt , UVM_DEFAULT)
      `uvm_field_object(udma_uart1_egress_sb_cntxt , UVM_DEFAULT)
      `uvm_field_object(apb_i2c_egress_sb_cntxt , UVM_DEFAULT)
      `uvm_field_object(gpio_egress_sb_cntxt , UVM_DEFAULT)
      `uvm_field_object(event_sb_cntxt , UVM_DEFAULT)
      `uvm_field_object(dbg_sb_cntxt , UVM_DEFAULT)
   `uvm_object_utils_end


   /**
    * Default constructor.
    */
   function new(string name="uvme_cvmcu_chip_cntxt");
      super.new(name);
   endfunction

   /**
    * Creates agent, sub-system, block and scoreboard context objects.
    */
   virtual function void create_objects();
      jtag_agent_cntxt = uvma_jtag_cntxt_c::type_id::create("jtag_cntxt");
      qspi_s0_agent_cntxt = uvma_spi_cntxt_c::type_id::create("qspi_s0_cntxt");
      qspi_s1_agent_cntxt = uvma_spi_cntxt_c::type_id::create("qspi_s1_cntxt");
      camera_agent_cntxt = uvma_cvmcu_cpi_cntxt_c::type_id::create("camera_cntxt");
      i2c_s0_agent_cntxt = uvma_i2c_cntxt_c::type_id::create("i2c_s0_cntxt");
      i2c_s1_agent_cntxt = uvma_i2c_cntxt_c::type_id::create("i2c_s1_cntxt");
      apb_agent_cntxt = uvma_apb_cntxt_c::type_id::create("apb_cntxt");
      uart0_agent_cntxt = uvma_uart_cntxt_c::type_id::create("uart0_cntxt");
      uart1_agent_cntxt = uvma_uart_cntxt_c::type_id::create("uart1_cntxt");
      sdio_agent_cntxt = uvma_sdio_cntxt_c::type_id::create("sdio_cntxt");
      i2c_m_agent_cntxt = uvma_i2c_cntxt_c::type_id::create("i2c_m_cntxt");
      io_agent_cntxt = uvma_cvmcu_io_cntxt_c::type_id::create("io_cntxt");
      instr_obi_agent_cntxt = uvma_obi_cntxt_c::type_id::create("instr_obi_cntxt");
      data_obi_agent_cntxt = uvma_obi_cntxt_c::type_id::create("data_obi_cntxt");
      event_agent_cntxt = uvma_cvmcu_event_cntxt_c::type_id::create("event_cntxt");
      dbg_agent_cntxt = uvma_cvmcu_dbg_cntxt_c::type_id::create("dbg_cntxt");
      irq_l1_agent_cntxt = uvma_irq_cntxt_c::type_id::create("irq_l1_cntxt");
      irq_l2_agent_cntxt = uvma_irq_cntxt_c::type_id::create("irq_l2_cntxt");
      apb_timer_ss_env_cntxt  = uvme_apb_timer_ss_cntxt_c::type_id::create("apb_timer_ss_env_cntxt");
      apb_adv_timer_ss_env_cntxt  = uvme_apb_adv_timer_ss_cntxt_c::type_id::create("apb_adv_timer_ss_env_cntxt");
      udma_qspi0_ingress_sb_cntxt = uvml_sb_simplex_cntxt_c::type_id::create("udma_qspi0_ingress_sb_cntxt");
      udma_qspi1_ingress_sb_cntxt = uvml_sb_simplex_cntxt_c::type_id::create("udma_qspi1_ingress_sb_cntxt");
      udma_camera_sb_cntxt = uvml_sb_simplex_cntxt_c::type_id::create("udma_camera_sb_cntxt");
      udma_i2c0_ingress_sb_cntxt = uvml_sb_simplex_cntxt_c::type_id::create("udma_i2c0_ingress_sb_cntxt");
      udma_i2c1_ingress_sb_cntxt = uvml_sb_simplex_cntxt_c::type_id::create("udma_i2c1_ingress_sb_cntxt");
      udma_uart0_ingress_sb_cntxt = uvml_sb_simplex_cntxt_c::type_id::create("udma_uart0_ingress_sb_cntxt");
      udma_uart1_ingress_sb_cntxt = uvml_sb_simplex_cntxt_c::type_id::create("udma_uart1_ingress_sb_cntxt");
      apb_i2c_ingress_sb_cntxt = uvml_sb_simplex_cntxt_c::type_id::create("apb_i2c_ingress_sb_cntxt");
      gpio_ingress_sb_cntxt = uvml_sb_simplex_cntxt_c::type_id::create("gpio_ingress_sb_cntxt");
      udma_qspi0_egress_sb_cntxt = uvml_sb_simplex_cntxt_c::type_id::create("udma_qspi0_egress_sb_cntxt");
      udma_qspi1_egress_sb_cntxt = uvml_sb_simplex_cntxt_c::type_id::create("udma_qspi1_egress_sb_cntxt");
      udma_i2c0_egress_sb_cntxt = uvml_sb_simplex_cntxt_c::type_id::create("udma_i2c0_egress_sb_cntxt");
      udma_i2c1_egress_sb_cntxt = uvml_sb_simplex_cntxt_c::type_id::create("udma_i2c1_egress_sb_cntxt");
      udma_uart0_egress_sb_cntxt = uvml_sb_simplex_cntxt_c::type_id::create("udma_uart0_egress_sb_cntxt");
      udma_uart1_egress_sb_cntxt = uvml_sb_simplex_cntxt_c::type_id::create("udma_uart1_egress_sb_cntxt");
      apb_i2c_egress_sb_cntxt = uvml_sb_simplex_cntxt_c::type_id::create("apb_i2c_egress_sb_cntxt");
      gpio_egress_sb_cntxt = uvml_sb_simplex_cntxt_c::type_id::create("gpio_egress_sb_cntxt");
      event_sb_cntxt = uvml_sb_simplex_cntxt_c::type_id::create("event_sb_cntxt");
      dbg_sb_cntxt = uvml_sb_simplex_cntxt_c::type_id::create("dbg_sb_cntxt");
   endfunction

   /**
    * Returns all state variables to initial values.
    */
   virtual function void reset();
      apb_timer_ss_env_cntxt.reset();
      apb_adv_timer_ss_env_cntxt.reset();
   endfunction

endclass : uvme_cvmcu_chip_cntxt_c


`endif // __UVME_CVMCU_CHIP_CNTXT_SV__