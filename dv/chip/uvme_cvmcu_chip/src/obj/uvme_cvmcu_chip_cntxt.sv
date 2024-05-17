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
   .T_CFG      (uvme_cvmcu_chip_cfg_c           ),
   .T_REG_MODEL(uvme_cvmcu_chip_reg_block_c     ),
   .T_PROBE_VIF(virtual uvme_cvmcu_chip_probe_if)
);

   /// @name Fields
   /// @{
   uvm_reg_addr_t  malloc_ptr          ; ///< Memory address of next block to be allocated.
   uvm_reg_addr_t  uart0_rx_buffer_addr; ///< Address of UART0 Rx buffer
   uvm_reg_addr_t  uart1_rx_buffer_addr; ///< Address of UART1 Rx buffer
   uvm_reg_addr_t  uart0_tx_buffer_addr; ///< Address of UART0 Tx buffer
   uvm_reg_addr_t  uart1_tx_buffer_addr; ///< Address of UART1 Tx buffer
   /// @}

   /// @name Agents
   /// @{
   uvma_jtag_cntxt_c  jtag_agent_cntxt; ///< JTAG controller agent context
   uvma_spi_cntxt_c  qspi_s0_agent_cntxt; ///< QSPI slave 0 agent context
   uvma_spi_cntxt_c  qspi_s1_agent_cntxt; ///< QSPI slave 1 agent context
   uvma_cvmcu_cpi_cntxt_c  camera_agent_cntxt; ///< Camera Parallel Interface transmitter agent context
   uvma_i2c_cntxt_c  i2c_s0_agent_cntxt; ///< I2C slave 0 agent context
   uvma_i2c_cntxt_c  i2c_s1_agent_cntxt; ///< I2C slave 1 agent context
   uvma_uart_cntxt_c  uart0_agent_cntxt; ///< UART 0 agent context
   uvma_uart_cntxt_c  uart1_agent_cntxt; ///< UART 1 agent context
   uvma_sdio_cntxt_c  sdio_agent_cntxt; ///< Flash card agent context
   uvma_i2c_cntxt_c  i2c_m_agent_cntxt; ///< I2C master agent context
   uvma_obi_cntxt_c  instr_obi_agent_cntxt; ///< Instruction memory OBI agent context
   uvma_obi_cntxt_c  data_obi_agent_cntxt; ///< Data memory OBI agent context
   uvma_cvmcu_event_cntxt_c  event_agent_cntxt; ///< Event agent context
   uvma_cvmcu_dbg_cntxt_c  dbg_agent_cntxt; ///< Debug agent context
   uvma_irq_cntxt_c  irq_l1_agent_cntxt; ///< First Level IRQ agent context
   uvma_irq_cntxt_c  irq_l2_agent_cntxt; ///< Platform-Specific (Second Level) IRQ agent context
   /// @}

   /// @name Sub-Systems
   /// @{
   uvme_apb_timer_ss_cntxt_c  apb_timer_ss_env_cntxt; ///< Simple timer sub-system context
   uvme_apb_adv_timer_ss_cntxt_c  apb_adv_timer_ss_env_cntxt; ///< Advanced timer (PWM) sub-system context
   /// @}

   /// @name Scoreboards
   /// @{
   uvmx_sb_simplex_cntxt_c  sb_udma_qspi0_ingress_cntxt; ///< Scoreboard context for Udma_qspi0_ingress
   uvmx_sb_simplex_cntxt_c  sb_udma_qspi1_ingress_cntxt; ///< Scoreboard context for Udma_qspi1_ingress
   uvmx_sb_simplex_cntxt_c  sb_udma_camera_cntxt; ///< Scoreboard context for Udma_camera
   uvmx_sb_simplex_cntxt_c  sb_udma_i2c0_ingress_cntxt; ///< Scoreboard context for Udma_i2c0_ingress
   uvmx_sb_simplex_cntxt_c  sb_udma_i2c1_ingress_cntxt; ///< Scoreboard context for Udma_i2c1_ingress
   uvmx_sb_simplex_cntxt_c  sb_udma_uart0_ingress_cntxt; ///< Scoreboard context for Udma_uart0_ingress
   uvmx_sb_simplex_cntxt_c  sb_udma_uart1_ingress_cntxt; ///< Scoreboard context for Udma_uart1_ingress
   uvmx_sb_simplex_cntxt_c  sb_apb_i2c_ingress_cntxt; ///< Scoreboard context for Apb_i2c_ingress
   uvmx_sb_simplex_cntxt_c  sb_udma_qspi0_egress_cntxt; ///< Scoreboard context for Udma_qspi0_egress
   uvmx_sb_simplex_cntxt_c  sb_udma_qspi1_egress_cntxt; ///< Scoreboard context for Udma_qspi1_egress
   uvmx_sb_simplex_cntxt_c  sb_udma_i2c0_egress_cntxt; ///< Scoreboard context for Udma_i2c0_egress
   uvmx_sb_simplex_cntxt_c  sb_udma_i2c1_egress_cntxt; ///< Scoreboard context for Udma_i2c1_egress
   uvmx_sb_simplex_cntxt_c  sb_udma_uart0_egress_cntxt; ///< Scoreboard context for Udma_uart0_egress
   uvmx_sb_simplex_cntxt_c  sb_udma_uart1_egress_cntxt; ///< Scoreboard context for Udma_uart1_egress
   uvmx_sb_simplex_cntxt_c  sb_apb_i2c_egress_cntxt; ///< Scoreboard context for Apb_i2c_egress
   uvmx_sb_simplex_cntxt_c  sb_dbg_cntxt; ///< Scoreboard context for Dbg
   /// @}


   `uvm_object_utils_begin(uvme_cvmcu_chip_cntxt_c)
      `uvm_field_enum(uvmx_reset_state_enum, reset_state, UVM_DEFAULT)
      `uvm_field_object(jtag_agent_cntxt, UVM_DEFAULT)
      `uvm_field_object(qspi_s0_agent_cntxt, UVM_DEFAULT)
      `uvm_field_object(qspi_s1_agent_cntxt, UVM_DEFAULT)
      `uvm_field_object(camera_agent_cntxt, UVM_DEFAULT)
      `uvm_field_object(i2c_s0_agent_cntxt, UVM_DEFAULT)
      `uvm_field_object(i2c_s1_agent_cntxt, UVM_DEFAULT)
      `uvm_field_object(uart0_agent_cntxt, UVM_DEFAULT)
      `uvm_field_object(uart1_agent_cntxt, UVM_DEFAULT)
      `uvm_field_object(sdio_agent_cntxt, UVM_DEFAULT)
      `uvm_field_object(i2c_m_agent_cntxt, UVM_DEFAULT)
      `uvm_field_object(instr_obi_agent_cntxt, UVM_DEFAULT)
      `uvm_field_object(data_obi_agent_cntxt, UVM_DEFAULT)
      `uvm_field_object(event_agent_cntxt, UVM_DEFAULT)
      `uvm_field_object(dbg_agent_cntxt, UVM_DEFAULT)
      `uvm_field_object(irq_l1_agent_cntxt, UVM_DEFAULT)
      `uvm_field_object(irq_l2_agent_cntxt, UVM_DEFAULT)
      `uvm_field_object(apb_timer_ss_env_cntxt, UVM_DEFAULT)
      `uvm_field_object(apb_adv_timer_ss_env_cntxt, UVM_DEFAULT)
      `uvm_field_object(sb_udma_qspi0_ingress_cntxt, UVM_DEFAULT)
      `uvm_field_object(sb_udma_qspi1_ingress_cntxt, UVM_DEFAULT)
      `uvm_field_object(sb_udma_camera_cntxt, UVM_DEFAULT)
      `uvm_field_object(sb_udma_i2c0_ingress_cntxt, UVM_DEFAULT)
      `uvm_field_object(sb_udma_i2c1_ingress_cntxt, UVM_DEFAULT)
      `uvm_field_object(sb_udma_uart0_ingress_cntxt, UVM_DEFAULT)
      `uvm_field_object(sb_udma_uart1_ingress_cntxt, UVM_DEFAULT)
      `uvm_field_object(sb_apb_i2c_ingress_cntxt, UVM_DEFAULT)
      `uvm_field_object(sb_udma_qspi0_egress_cntxt, UVM_DEFAULT)
      `uvm_field_object(sb_udma_qspi1_egress_cntxt, UVM_DEFAULT)
      `uvm_field_object(sb_udma_i2c0_egress_cntxt, UVM_DEFAULT)
      `uvm_field_object(sb_udma_i2c1_egress_cntxt, UVM_DEFAULT)
      `uvm_field_object(sb_udma_uart0_egress_cntxt, UVM_DEFAULT)
      `uvm_field_object(sb_udma_uart1_egress_cntxt, UVM_DEFAULT)
      `uvm_field_object(sb_apb_i2c_egress_cntxt, UVM_DEFAULT)
      `uvm_field_object(sb_dbg_cntxt, UVM_DEFAULT)
   `uvm_object_utils_end


   /**
    * Default constructor.
    */
   function new(string name="uvme_cvmcu_chip_cntxt");
      super.new(name);
   endfunction

   /**
    * Creates objects.
    */
   virtual function void build(uvme_cvmcu_chip_cfg_c cfg);
      jtag_agent_cntxt = uvma_jtag_cntxt_c::type_id::create("jtag_cntxt");
      qspi_s0_agent_cntxt = uvma_spi_cntxt_c::type_id::create("qspi_s0_cntxt");
      qspi_s1_agent_cntxt = uvma_spi_cntxt_c::type_id::create("qspi_s1_cntxt");
      camera_agent_cntxt = uvma_cvmcu_cpi_cntxt_c::type_id::create("camera_cntxt");
      i2c_s0_agent_cntxt = uvma_i2c_cntxt_c::type_id::create("i2c_s0_cntxt");
      i2c_s1_agent_cntxt = uvma_i2c_cntxt_c::type_id::create("i2c_s1_cntxt");
      uart0_agent_cntxt = uvma_uart_cntxt_c::type_id::create("uart0_cntxt");
      uart1_agent_cntxt = uvma_uart_cntxt_c::type_id::create("uart1_cntxt");
      sdio_agent_cntxt = uvma_sdio_cntxt_c::type_id::create("sdio_cntxt");
      i2c_m_agent_cntxt = uvma_i2c_cntxt_c::type_id::create("i2c_m_cntxt");
      instr_obi_agent_cntxt = uvma_obi_cntxt_c::type_id::create("instr_obi_cntxt");
      data_obi_agent_cntxt = uvma_obi_cntxt_c::type_id::create("data_obi_cntxt");
      event_agent_cntxt = uvma_cvmcu_event_cntxt_c::type_id::create("event_cntxt");
      dbg_agent_cntxt = uvma_cvmcu_dbg_cntxt_c::type_id::create("dbg_cntxt");
      irq_l1_agent_cntxt = uvma_irq_cntxt_c::type_id::create("irq_l1_cntxt");
      irq_l2_agent_cntxt = uvma_irq_cntxt_c::type_id::create("irq_l2_cntxt");
      apb_timer_ss_env_cntxt = uvme_apb_timer_ss_cntxt_c::type_id::create("apb_timer_ss_env_cntxt");
      apb_adv_timer_ss_env_cntxt = uvme_apb_adv_timer_ss_cntxt_c::type_id::create("apb_adv_timer_ss_env_cntxt");
      sb_udma_qspi0_ingress_cntxt = uvmx_sb_simplex_cntxt_c::type_id::create("sb_udma_qspi0_ingress_cntxt");
      sb_udma_qspi1_ingress_cntxt = uvmx_sb_simplex_cntxt_c::type_id::create("sb_udma_qspi1_ingress_cntxt");
      sb_udma_camera_cntxt = uvmx_sb_simplex_cntxt_c::type_id::create("sb_udma_camera_cntxt");
      sb_udma_i2c0_ingress_cntxt = uvmx_sb_simplex_cntxt_c::type_id::create("sb_udma_i2c0_ingress_cntxt");
      sb_udma_i2c1_ingress_cntxt = uvmx_sb_simplex_cntxt_c::type_id::create("sb_udma_i2c1_ingress_cntxt");
      sb_udma_uart0_ingress_cntxt = uvmx_sb_simplex_cntxt_c::type_id::create("sb_udma_uart0_ingress_cntxt");
      sb_udma_uart1_ingress_cntxt = uvmx_sb_simplex_cntxt_c::type_id::create("sb_udma_uart1_ingress_cntxt");
      sb_apb_i2c_ingress_cntxt = uvmx_sb_simplex_cntxt_c::type_id::create("sb_apb_i2c_ingress_cntxt");
      sb_udma_qspi0_egress_cntxt = uvmx_sb_simplex_cntxt_c::type_id::create("sb_udma_qspi0_egress_cntxt");
      sb_udma_qspi1_egress_cntxt = uvmx_sb_simplex_cntxt_c::type_id::create("sb_udma_qspi1_egress_cntxt");
      sb_udma_i2c0_egress_cntxt = uvmx_sb_simplex_cntxt_c::type_id::create("sb_udma_i2c0_egress_cntxt");
      sb_udma_i2c1_egress_cntxt = uvmx_sb_simplex_cntxt_c::type_id::create("sb_udma_i2c1_egress_cntxt");
      sb_udma_uart0_egress_cntxt = uvmx_sb_simplex_cntxt_c::type_id::create("sb_udma_uart0_egress_cntxt");
      sb_udma_uart1_egress_cntxt = uvmx_sb_simplex_cntxt_c::type_id::create("sb_udma_uart1_egress_cntxt");
      sb_apb_i2c_egress_cntxt = uvmx_sb_simplex_cntxt_c::type_id::create("sb_apb_i2c_egress_cntxt");
      sb_dbg_cntxt = uvmx_sb_simplex_cntxt_c::type_id::create("sb_dbg_cntxt");
   endfunction

   /**
    * Returns all state variables to initial values.
    */
   virtual function void do_reset(uvme_cvmcu_chip_cfg_c cfg);
      jtag_agent_cntxt.reset();
      qspi_s0_agent_cntxt.reset();
      qspi_s1_agent_cntxt.reset();
      camera_agent_cntxt.reset();
      i2c_s0_agent_cntxt.reset();
      i2c_s1_agent_cntxt.reset();
      uart0_agent_cntxt.reset();
      uart1_agent_cntxt.reset();
      sdio_agent_cntxt.reset();
      i2c_m_agent_cntxt.reset();
      instr_obi_agent_cntxt.reset();
      data_obi_agent_cntxt.reset();
      event_agent_cntxt.reset();
      dbg_agent_cntxt.reset();
      irq_l1_agent_cntxt.reset();
      irq_l2_agent_cntxt.reset();
      apb_timer_ss_env_cntxt.reset();
      apb_adv_timer_ss_env_cntxt.reset();
      malloc_ptr = cfg.malloc_base_offset;
   endfunction

   /**
    * Simple memory allocation that doesn't re-use memory.
    * TODO Replace with uvm_mem_mam usage
    */
   function uvm_reg_addr_t malloc(int unsigned block_size);
      malloc = malloc_ptr;
      malloc_ptr += block_size;
   endfunction

endclass


`endif // __UVME_CVMCU_CHIP_CNTXT_SV__
