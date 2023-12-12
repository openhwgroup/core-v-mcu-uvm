// Copyright 2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVME_CVMCU_CHIP_CFG_SV__
`define __UVME_CVMCU_CHIP_CFG_SV__


/**
 * Object encapsulating all parameters for creating, connecting and running the CORE-V-MCU Chip environment
 * (uvme_cvmcu_chip_env_c) components.
 * @ingroup uvme_cvmcu_chip_obj
 */
class uvme_cvmcu_chip_cfg_c extends uvmx_chip_env_cfg_c;

   // @name Settings
   /// @{
   rand longint unsigned  reg_block_base_address; ///< Base address for #cvmcu_chip_reg_block
   /// @}

   /// @name Bus Widths
   /// @{
   rand bit use_cores; ///< Includes the Core Sub-System
   /// @}

   /// @name Agents
   /// @{
   rand uvma_jtag_cfg_c  jtag_agent_cfg; ///< JTAG controller agent configuration
   rand uvma_spi_cfg_c  qspi_s0_agent_cfg; ///< QSPI slave 0 agent configuration
   rand uvma_spi_cfg_c  qspi_s1_agent_cfg; ///< QSPI slave 1 agent configuration
   rand uvma_cvmcu_cpi_cfg_c  camera_agent_cfg; ///< Camera Parallel Interface transmitter agent configuration
   rand uvma_i2c_cfg_c  i2c_s0_agent_cfg; ///< I2C slave 0 agent configuration
   rand uvma_i2c_cfg_c  i2c_s1_agent_cfg; ///< I2C slave 1 agent configuration
   rand uvma_uart_cfg_c  uart0_agent_cfg; ///< UART 0 agent configuration
   rand uvma_uart_cfg_c  uart1_agent_cfg; ///< UART 1 agent configuration
   rand uvma_sdio_cfg_c  sdio_agent_cfg; ///< Flash card agent configuration
   rand uvma_i2c_cfg_c  i2c_m_agent_cfg; ///< I2C master agent configuration
   rand uvma_obi_cfg_c  instr_obi_agent_cfg; ///< Instruction memory OBI agent configuration
   rand uvma_obi_cfg_c  data_obi_agent_cfg; ///< Data memory OBI agent configuration
   rand uvma_cvmcu_event_cfg_c  event_agent_cfg; ///< Event agent configuration
   rand uvma_cvmcu_dbg_cfg_c  dbg_agent_cfg; ///< Debug agent configuration
   rand uvma_irq_cfg_c  irq_l1_agent_cfg; /// First Level IRQ agent configuration
   rand uvma_irq_cfg_c  irq_l2_agent_cfg; /// Platform-Specific (Second Level) IRQ agent configuration
   /// @}

   /// @name Sub-Systems
   /// @{
   rand uvme_apb_timer_ss_cfg_c  apb_timer_ss_env_cfg; ///< Simple timer sub-system configuration
   rand uvme_apb_adv_timer_ss_cfg_c  apb_adv_timer_ss_env_cfg; ///< Advanced timer (PWM) sub-system configuration
   /// @}

   /// @name Scoreboards
   /// @{
   rand uvmx_sb_simplex_cfg_c  sb_udma_qspi0_ingress_cfg; ///< Udma_qspi0_ingress scoreboard configuration
   rand uvmx_sb_simplex_cfg_c  sb_udma_qspi1_ingress_cfg; ///< Udma_qspi1_ingress scoreboard configuration
   rand uvmx_sb_simplex_cfg_c  sb_udma_camera_cfg; ///< Udma_camera scoreboard configuration
   rand uvmx_sb_simplex_cfg_c  sb_udma_i2c0_ingress_cfg; ///< Udma_i2c0_ingress scoreboard configuration
   rand uvmx_sb_simplex_cfg_c  sb_udma_i2c1_ingress_cfg; ///< Udma_i2c1_ingress scoreboard configuration
   rand uvmx_sb_simplex_cfg_c  sb_udma_uart0_ingress_cfg; ///< Udma_uart0_ingress scoreboard configuration
   rand uvmx_sb_simplex_cfg_c  sb_udma_uart1_ingress_cfg; ///< Udma_uart1_ingress scoreboard configuration
   rand uvmx_sb_simplex_cfg_c  sb_apb_i2c_ingress_cfg; ///< Apb_i2c_ingress scoreboard configuration
   rand uvmx_sb_simplex_cfg_c  sb_udma_qspi0_egress_cfg; ///< Udma_qspi0_egress scoreboard configuration
   rand uvmx_sb_simplex_cfg_c  sb_udma_qspi1_egress_cfg; ///< Udma_qspi1_egress scoreboard configuration
   rand uvmx_sb_simplex_cfg_c  sb_udma_i2c0_egress_cfg; ///< Udma_i2c0_egress scoreboard configuration
   rand uvmx_sb_simplex_cfg_c  sb_udma_i2c1_egress_cfg; ///< Udma_i2c1_egress scoreboard configuration
   rand uvmx_sb_simplex_cfg_c  sb_udma_uart0_egress_cfg; ///< Udma_uart0_egress scoreboard configuration
   rand uvmx_sb_simplex_cfg_c  sb_udma_uart1_egress_cfg; ///< Udma_uart1_egress scoreboard configuration
   rand uvmx_sb_simplex_cfg_c  sb_apb_i2c_egress_cfg; ///< Apb_i2c_egress scoreboard configuration
   rand uvmx_sb_simplex_cfg_c  sb_dbg_cfg; ///< Dbg scoreboard configuration
   /// @}


   `uvm_object_utils_begin(uvme_cvmcu_chip_cfg_c)
      `uvm_field_int(enabled, UVM_DEFAULT)
      `uvm_field_enum(uvm_active_passive_enum, is_active, UVM_DEFAULT)
      `uvm_field_enum(uvmx_reset_type_enum, reset_type, UVM_DEFAULT)
      `uvm_field_int(scoreboarding_enabled, UVM_DEFAULT)
      `uvm_field_int(reg_block_base_address, UVM_DEFAULT)
      `uvm_field_int(use_cores, UVM_DEFAULT)
      `uvm_field_object(jtag_agent_cfg, UVM_DEFAULT)
      `uvm_field_object(qspi_s0_agent_cfg, UVM_DEFAULT)
      `uvm_field_object(qspi_s1_agent_cfg, UVM_DEFAULT)
      `uvm_field_object(camera_agent_cfg, UVM_DEFAULT)
      `uvm_field_object(i2c_s0_agent_cfg, UVM_DEFAULT)
      `uvm_field_object(i2c_s1_agent_cfg, UVM_DEFAULT)
      `uvm_field_object(uart0_agent_cfg, UVM_DEFAULT)
      `uvm_field_object(uart1_agent_cfg, UVM_DEFAULT)
      `uvm_field_object(sdio_agent_cfg, UVM_DEFAULT)
      `uvm_field_object(i2c_m_agent_cfg, UVM_DEFAULT)
      `uvm_field_object(instr_obi_agent_cfg, UVM_DEFAULT)
      `uvm_field_object(data_obi_agent_cfg, UVM_DEFAULT)
      `uvm_field_object(event_agent_cfg, UVM_DEFAULT)
      `uvm_field_object(dbg_agent_cfg, UVM_DEFAULT)
      `uvm_field_object(irq_l1_agent_cfg, UVM_DEFAULT)
      `uvm_field_object(irq_l2_agent_cfg, UVM_DEFAULT)
      `uvm_field_object(apb_timer_ss_env_cfg, UVM_DEFAULT)
      `uvm_field_object(apb_adv_timer_ss_env_cfg, UVM_DEFAULT)
      `uvm_field_object(sb_udma_qspi0_ingress_cfg, UVM_DEFAULT)
      `uvm_field_object(sb_udma_qspi1_ingress_cfg, UVM_DEFAULT)
      `uvm_field_object(sb_udma_camera_cfg, UVM_DEFAULT)
      `uvm_field_object(sb_udma_i2c0_ingress_cfg, UVM_DEFAULT)
      `uvm_field_object(sb_udma_i2c1_ingress_cfg, UVM_DEFAULT)
      `uvm_field_object(sb_udma_uart0_ingress_cfg, UVM_DEFAULT)
      `uvm_field_object(sb_udma_uart1_ingress_cfg, UVM_DEFAULT)
      `uvm_field_object(sb_apb_i2c_ingress_cfg, UVM_DEFAULT)
      `uvm_field_object(sb_udma_qspi0_egress_cfg, UVM_DEFAULT)
      `uvm_field_object(sb_udma_qspi1_egress_cfg, UVM_DEFAULT)
      `uvm_field_object(sb_udma_i2c0_egress_cfg, UVM_DEFAULT)
      `uvm_field_object(sb_udma_i2c1_egress_cfg, UVM_DEFAULT)
      `uvm_field_object(sb_udma_uart0_egress_cfg, UVM_DEFAULT)
      `uvm_field_object(sb_udma_uart1_egress_cfg, UVM_DEFAULT)
      `uvm_field_object(sb_apb_i2c_egress_cfg, UVM_DEFAULT)
      `uvm_field_object(sb_dbg_cfg, UVM_DEFAULT)
   `uvm_object_utils_end


   /**
    * Sets valid and default values for settings.
    */
   constraint settings_space_cons {
      soft reg_block_base_address == uvme_cvmcu_chip_default_reg_block_base_address;
   }

   /**
    * Rules for parameters.
    */
   constraint bw_space_cons {
   }

   /**
    * Sets JTAG controller agent configuration.
    */
   constraint jtag_agent_cfg_cons {
      soft jtag_agent_cfg.enabled == enabled;
      jtag_agent_cfg.drv_mode == UVMA_JTAG_DRV_MODE_CTRL;
      jtag_agent_cfg.is_active == is_active;
   }

   /**
    * Sets QSPI slave 0 agent configuration.
    */
   constraint qspi_s0_agent_cfg_cons {
      soft qspi_s0_agent_cfg.enabled == enabled;
      qspi_s0_agent_cfg.data_width == 4;
      qspi_s0_agent_cfg.drv_mode == UVMA_SPI_DRV_MODE_SLV;
      qspi_s0_agent_cfg.is_active == is_active;
   }

   /**
    * Sets QSPI slave 1 agent configuration.
    */
   constraint qspi_s1_agent_cfg_cons {
      soft qspi_s1_agent_cfg.enabled == enabled;
      qspi_s1_agent_cfg.data_width == 4;
      qspi_s1_agent_cfg.drv_mode == UVMA_SPI_DRV_MODE_SLV;
      qspi_s1_agent_cfg.is_active == is_active;
   }

   /**
    * Sets Camera Parallel Interface transmitter agent configuration.
    */
   constraint camera_agent_cfg_cons {
      soft camera_agent_cfg.enabled == enabled;
      camera_agent_cfg.drv_mode == UVMA_CVMCU_CPI_DRV_MODE_TX;
      camera_agent_cfg.is_active == is_active;
   }

   /**
    * Sets I2C slave 0 agent configuration.
    */
   constraint i2c_s0_agent_cfg_cons {
      soft i2c_s0_agent_cfg.enabled == enabled;
      i2c_s0_agent_cfg.drv_mode == UVMA_I2C_DRV_MODE_SLV;
      i2c_s0_agent_cfg.is_active == is_active;
   }

   /**
    * Sets I2C slave 1 agent configuration.
    */
   constraint i2c_s1_agent_cfg_cons {
      soft i2c_s1_agent_cfg.enabled == enabled;
      i2c_s1_agent_cfg.drv_mode == UVMA_I2C_DRV_MODE_SLV;
      i2c_s1_agent_cfg.is_active == is_active;
   }

   /**
    * Sets UART 0 agent configuration.
    */
   constraint uart0_agent_cfg_cons {
      soft uart0_agent_cfg.enabled == enabled;
      uart0_agent_cfg.drv_mode == UVMA_UART_DRV_MODE_TX;
      uart0_agent_cfg.is_active == is_active;
   }

   /**
    * Sets UART 1 agent configuration.
    */
   constraint uart1_agent_cfg_cons {
      soft uart1_agent_cfg.enabled == enabled;
      uart1_agent_cfg.drv_mode == UVMA_UART_DRV_MODE_TX;
      uart1_agent_cfg.is_active == is_active;
   }

   /**
    * Sets Flash card agent configuration.
    */
   constraint sdio_agent_cfg_cons {
      soft sdio_agent_cfg.enabled == enabled;
      sdio_agent_cfg.drv_mode == UVMA_SDIO_DRV_MODE_DEV;
      sdio_agent_cfg.is_active == is_active;
   }

   /**
    * Sets I2C master agent configuration.
    */
   constraint i2c_m_agent_cfg_cons {
      soft i2c_m_agent_cfg.enabled == enabled;
      i2c_m_agent_cfg.drv_mode == UVMA_I2C_DRV_MODE_MSTR;
      i2c_m_agent_cfg.is_active == is_active;
   }

   /**
    * Sets Instruction memory OBI agent configuration.
    */
   constraint instr_obi_agent_cfg_cons {
      soft instr_obi_agent_cfg.enabled == enabled;
      instr_obi_agent_cfg.data_width == 32;
      instr_obi_agent_cfg.addr_width == 32;
      instr_obi_agent_cfg.drv_mode == UVMA_OBI_DRV_MODE_MSTR;
      instr_obi_agent_cfg.is_active == !use_cores;
   }

   /**
    * Sets Data memory OBI agent configuration.
    */
   constraint data_obi_agent_cfg_cons {
      soft data_obi_agent_cfg.enabled == enabled;
      data_obi_agent_cfg.data_width == 32;
      data_obi_agent_cfg.addr_width == 32;
      data_obi_agent_cfg.drv_mode == UVMA_OBI_DRV_MODE_MSTR;
      data_obi_agent_cfg.is_active == !use_cores;
   }

   /**
    * Sets Event agent configuration.
    */
   constraint event_agent_cfg_cons {
      soft event_agent_cfg.enabled == enabled;
      event_agent_cfg.is_active == UVM_PASSIVE;
   }

   /**
    * Sets Debug agent configuration.
    */
   constraint dbg_agent_cfg_cons {
      soft dbg_agent_cfg.enabled == enabled;
      dbg_agent_cfg.is_active == UVM_PASSIVE;
   }

   /**
    * Sets First Level IRQ agent configuration.
    */
   constraint irq_l1_agent_cfg_cons {
      soft irq_l1_agent_cfg.enabled == enabled;
      irq_l1_agent_cfg.num_lines == 32;
      irq_l1_agent_cfg.is_active == UVM_PASSIVE;
   }

   /**
    * Sets Platform-Specific (Second Level) IRQ agent configuration.
    */
   constraint irq_l2_agent_cfg_cons {
      soft irq_l2_agent_cfg.enabled == enabled;
      irq_l2_agent_cfg.num_lines == 256;
      irq_l2_agent_cfg.is_active == UVM_PASSIVE;
   }

   /**
    * Sets Simple timer sub-system environment configuration.
    */
   constraint apb_timer_ss_env_cfg_cons {
      soft apb_timer_ss_env_cfg.enabled == enabled;
      apb_timer_ss_env_cfg.is_active == UVM_PASSIVE;
      apb_timer_ss_env_cfg.scoreboarding_enabled == scoreboarding_enabled;
   }

   /**
    * Sets Advanced timer (PWM) sub-system environment configuration.
    */
   constraint apb_adv_timer_ss_env_cfg_cons {
      soft apb_adv_timer_ss_env_cfg.enabled == enabled;
      apb_adv_timer_ss_env_cfg.is_active == UVM_PASSIVE;
      apb_adv_timer_ss_env_cfg.scoreboarding_enabled == scoreboarding_enabled;
   }

   /**
    * Sets udma_qspi0_ingress scoreboard configuration.
    */
   constraint sb_udma_qspi0_ingress_cfg_cons {
      soft sb_udma_qspi0_ingress_cfg.enabled == scoreboarding_enabled;
      sb_udma_qspi0_ingress_cfg.mode == UVMX_SB_MODE_IN_ORDER;
   }

   /**
    * Sets udma_qspi1_ingress scoreboard configuration.
    */
   constraint sb_udma_qspi1_ingress_cfg_cons {
      soft sb_udma_qspi1_ingress_cfg.enabled == scoreboarding_enabled;
      sb_udma_qspi1_ingress_cfg.mode == UVMX_SB_MODE_IN_ORDER;
   }

   /**
    * Sets udma_camera scoreboard configuration.
    */
   constraint sb_udma_camera_cfg_cons {
      soft sb_udma_camera_cfg.enabled == scoreboarding_enabled;
      sb_udma_camera_cfg.mode == UVMX_SB_MODE_IN_ORDER;
   }

   /**
    * Sets udma_i2c0_ingress scoreboard configuration.
    */
   constraint sb_udma_i2c0_ingress_cfg_cons {
      soft sb_udma_i2c0_ingress_cfg.enabled == scoreboarding_enabled;
      sb_udma_i2c0_ingress_cfg.mode == UVMX_SB_MODE_IN_ORDER;
   }

   /**
    * Sets udma_i2c1_ingress scoreboard configuration.
    */
   constraint sb_udma_i2c1_ingress_cfg_cons {
      soft sb_udma_i2c1_ingress_cfg.enabled == scoreboarding_enabled;
      sb_udma_i2c1_ingress_cfg.mode == UVMX_SB_MODE_IN_ORDER;
   }

   /**
    * Sets udma_uart0_ingress scoreboard configuration.
    */
   constraint sb_udma_uart0_ingress_cfg_cons {
      soft sb_udma_uart0_ingress_cfg.enabled == scoreboarding_enabled;
      sb_udma_uart0_ingress_cfg.mode == UVMX_SB_MODE_IN_ORDER;
   }

   /**
    * Sets udma_uart1_ingress scoreboard configuration.
    */
   constraint sb_udma_uart1_ingress_cfg_cons {
      soft sb_udma_uart1_ingress_cfg.enabled == scoreboarding_enabled;
      sb_udma_uart1_ingress_cfg.mode == UVMX_SB_MODE_IN_ORDER;
   }

   /**
    * Sets apb_i2c_ingress scoreboard configuration.
    */
   constraint sb_apb_i2c_ingress_cfg_cons {
      soft sb_apb_i2c_ingress_cfg.enabled == scoreboarding_enabled;
      sb_apb_i2c_ingress_cfg.mode == UVMX_SB_MODE_IN_ORDER;
   }

   /**
    * Sets udma_qspi0_egress scoreboard configuration.
    */
   constraint sb_udma_qspi0_egress_cfg_cons {
      soft sb_udma_qspi0_egress_cfg.enabled == scoreboarding_enabled;
      sb_udma_qspi0_egress_cfg.mode == UVMX_SB_MODE_IN_ORDER;
   }

   /**
    * Sets udma_qspi1_egress scoreboard configuration.
    */
   constraint sb_udma_qspi1_egress_cfg_cons {
      soft sb_udma_qspi1_egress_cfg.enabled == scoreboarding_enabled;
      sb_udma_qspi1_egress_cfg.mode == UVMX_SB_MODE_IN_ORDER;
   }

   /**
    * Sets udma_i2c0_egress scoreboard configuration.
    */
   constraint sb_udma_i2c0_egress_cfg_cons {
      soft sb_udma_i2c0_egress_cfg.enabled == scoreboarding_enabled;
      sb_udma_i2c0_egress_cfg.mode == UVMX_SB_MODE_IN_ORDER;
   }

   /**
    * Sets udma_i2c1_egress scoreboard configuration.
    */
   constraint sb_udma_i2c1_egress_cfg_cons {
      soft sb_udma_i2c1_egress_cfg.enabled == scoreboarding_enabled;
      sb_udma_i2c1_egress_cfg.mode == UVMX_SB_MODE_IN_ORDER;
   }

   /**
    * Sets udma_uart0_egress scoreboard configuration.
    */
   constraint sb_udma_uart0_egress_cfg_cons {
      soft sb_udma_uart0_egress_cfg.enabled == scoreboarding_enabled;
      sb_udma_uart0_egress_cfg.mode == UVMX_SB_MODE_IN_ORDER;
   }

   /**
    * Sets udma_uart1_egress scoreboard configuration.
    */
   constraint sb_udma_uart1_egress_cfg_cons {
      soft sb_udma_uart1_egress_cfg.enabled == scoreboarding_enabled;
      sb_udma_uart1_egress_cfg.mode == UVMX_SB_MODE_IN_ORDER;
   }

   /**
    * Sets apb_i2c_egress scoreboard configuration.
    */
   constraint sb_apb_i2c_egress_cfg_cons {
      soft sb_apb_i2c_egress_cfg.enabled == scoreboarding_enabled;
      sb_apb_i2c_egress_cfg.mode == UVMX_SB_MODE_IN_ORDER;
   }

   /**
    * Sets dbg scoreboard configuration.
    */
   constraint sb_dbg_cfg_cons {
      soft sb_dbg_cfg.enabled == scoreboarding_enabled;
      sb_dbg_cfg.mode == UVMX_SB_MODE_IN_ORDER;
   }

   /**
    * TODO Implement or remove uvme_cvmcu_chip_cfg_c::rules_cons
    */
   constraint rules_cons {
   }


   /**
    * Default constructor.
    */
   function new(string name="uvme_cvmcu_chip_cfg");
      super.new(name);
   endfunction

   /**
    * Initializes objects and arrays.
    */
   virtual function void build();
      jtag_agent_cfg = uvma_jtag_cfg_c::type_id::create("jtag_cfg");
      qspi_s0_agent_cfg = uvma_spi_cfg_c::type_id::create("qspi_s0_cfg");
      qspi_s1_agent_cfg = uvma_spi_cfg_c::type_id::create("qspi_s1_cfg");
      camera_agent_cfg = uvma_cvmcu_cpi_cfg_c::type_id::create("camera_cfg");
      i2c_s0_agent_cfg = uvma_i2c_cfg_c::type_id::create("i2c_s0_cfg");
      i2c_s1_agent_cfg = uvma_i2c_cfg_c::type_id::create("i2c_s1_cfg");
      uart0_agent_cfg = uvma_uart_cfg_c::type_id::create("uart0_cfg");
      uart1_agent_cfg = uvma_uart_cfg_c::type_id::create("uart1_cfg");
      sdio_agent_cfg = uvma_sdio_cfg_c::type_id::create("sdio_cfg");
      i2c_m_agent_cfg = uvma_i2c_cfg_c::type_id::create("i2c_m_cfg");
      instr_obi_agent_cfg = uvma_obi_cfg_c::type_id::create("instr_obi_cfg");
      data_obi_agent_cfg = uvma_obi_cfg_c::type_id::create("data_obi_cfg");
      event_agent_cfg = uvma_cvmcu_event_cfg_c::type_id::create("event_cfg");
      dbg_agent_cfg = uvma_cvmcu_dbg_cfg_c::type_id::create("dbg_cfg");
      irq_l1_agent_cfg = uvma_irq_cfg_c::type_id::create("irq_l1_cfg");
      irq_l2_agent_cfg = uvma_irq_cfg_c::type_id::create("irq_l2_cfg");
      apb_timer_ss_env_cfg = uvme_apb_timer_ss_cfg_c::type_id::create("apb_timer_ss_env_cfg");
      apb_adv_timer_ss_env_cfg = uvme_apb_adv_timer_ss_cfg_c::type_id::create("apb_adv_timer_ss_env_cfg");
      sb_udma_qspi0_ingress_cfg = uvmx_sb_simplex_cfg_c::type_id::create("sb_udma_qspi0_ingress_cfg");
      sb_udma_qspi1_ingress_cfg = uvmx_sb_simplex_cfg_c::type_id::create("sb_udma_qspi1_ingress_cfg");
      sb_udma_camera_cfg = uvmx_sb_simplex_cfg_c::type_id::create("sb_udma_camera_cfg");
      sb_udma_i2c0_ingress_cfg = uvmx_sb_simplex_cfg_c::type_id::create("sb_udma_i2c0_ingress_cfg");
      sb_udma_i2c1_ingress_cfg = uvmx_sb_simplex_cfg_c::type_id::create("sb_udma_i2c1_ingress_cfg");
      sb_udma_uart0_ingress_cfg = uvmx_sb_simplex_cfg_c::type_id::create("sb_udma_uart0_ingress_cfg");
      sb_udma_uart1_ingress_cfg = uvmx_sb_simplex_cfg_c::type_id::create("sb_udma_uart1_ingress_cfg");
      sb_apb_i2c_ingress_cfg = uvmx_sb_simplex_cfg_c::type_id::create("sb_apb_i2c_ingress_cfg");
      sb_udma_qspi0_egress_cfg = uvmx_sb_simplex_cfg_c::type_id::create("sb_udma_qspi0_egress_cfg");
      sb_udma_qspi1_egress_cfg = uvmx_sb_simplex_cfg_c::type_id::create("sb_udma_qspi1_egress_cfg");
      sb_udma_i2c0_egress_cfg = uvmx_sb_simplex_cfg_c::type_id::create("sb_udma_i2c0_egress_cfg");
      sb_udma_i2c1_egress_cfg = uvmx_sb_simplex_cfg_c::type_id::create("sb_udma_i2c1_egress_cfg");
      sb_udma_uart0_egress_cfg = uvmx_sb_simplex_cfg_c::type_id::create("sb_udma_uart0_egress_cfg");
      sb_udma_uart1_egress_cfg = uvmx_sb_simplex_cfg_c::type_id::create("sb_udma_uart1_egress_cfg");
      sb_apb_i2c_egress_cfg = uvmx_sb_simplex_cfg_c::type_id::create("sb_apb_i2c_egress_cfg");
      sb_dbg_cfg = uvmx_sb_simplex_cfg_c::type_id::create("sb_dbg_cfg");
   endfunction

   /**
    * Configures IRQ lines.
    */
   virtual function void cfg_irq();
      irq_l1_agent_cfg.lines = uvme_cvmcu_chip_l1_irq_lines;
      irq_l2_agent_cfg.lines = uvme_cvmcu_chip_l2_irq_lines;
   endfunction

   /**
    * TODO Implement or remove uvme_cvmcu_chip_cfg_c::post_randomize()
    */
   virtual function void post_randomize_work();
   endfunction

endclass


`endif // __UVME_CVMCU_CHIP_CFG_SV__
