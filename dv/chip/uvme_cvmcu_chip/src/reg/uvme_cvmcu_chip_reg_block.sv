// Copyright 2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// THE FOLLOWING IS GENERATED CODE: ANY CHANGES MADE WILL BE ERASED UPON THE NEXT ITERATION


`ifndef __UVME_CVMCU_CHIP_REG_BLOCK_SV__
`define __UVME_CVMCU_CHIP_REG_BLOCK_SV__


`include "uvme_cvmcu_chip_apb_soc_ctrl_reg_block.sv"
`include "uvme_cvmcu_chip_apb_gpio_reg_block.sv"
`include "uvme_cvmcu_chip_apb_fll_reg_block.sv"
`include "uvme_cvmcu_chip_apb_i2cs_reg_block.sv"
`include "uvme_cvmcu_chip_apb_event_ctrl_reg_block.sv"
`include "uvme_cvmcu_chip_udma_ctrl_reg_block.sv"
`include "uvme_cvmcu_chip_udma_uart_reg_block.sv"
`include "uvme_cvmcu_chip_udma_uart_reg_block.sv"
`include "uvme_cvmcu_chip_udma_qspi_reg_block.sv"
`include "uvme_cvmcu_chip_udma_qspi_reg_block.sv"
`include "uvme_cvmcu_chip_udma_i2cm_reg_block.sv"
`include "uvme_cvmcu_chip_udma_i2cm_reg_block.sv"
`include "uvme_cvmcu_chip_udma_sdio_reg_block.sv"
`include "uvme_cvmcu_chip_udma_camera_reg_block.sv"
`include "uvme_cvmcu_chip_efpga_reg_block.sv"
`include "uvme_cvmcu_chip_debug_reg_block.sv"


/**
 * Top-Level Register Block for uvme_cvmcu_chip.
 * @ingroup uvme_cvmcu_chip_reg
 */
class uvme_cvmcu_chip_reg_block_c extends uvmx_reg_block_c;

   /// @name Register Blocks
   /// @{
   rand uvme_apb_timer_ss_reg_block_c  timer; ///< Timer
   rand uvme_apb_adv_timer_ss_reg_block_c  adv_timer; ///< Advanced timer (PWM)
   rand uvme_cvmcu_chip_apb_soc_ctrl_reg_block_c  soc_ctrl; ///< SoC controller
   rand uvme_cvmcu_chip_apb_gpio_reg_block_c  gpio; ///< GPIO
   rand uvme_cvmcu_chip_apb_fll_reg_block_c  fll; ///< Frequency-locked loop unit
   rand uvme_cvmcu_chip_apb_i2cs_reg_block_c  i2cs; ///< I2C Slave
   rand uvme_cvmcu_chip_apb_event_ctrl_reg_block_c  event_ctrl; ///< Event unit
   rand uvme_cvmcu_chip_udma_ctrl_reg_block_c  udma; ///< UDMA control
   rand uvme_cvmcu_chip_udma_uart_reg_block_c  uart0; ///< UART #0
   rand uvme_cvmcu_chip_udma_uart_reg_block_c  uart1; ///< UART #1
   rand uvme_cvmcu_chip_udma_qspi_reg_block_c  qspi0; ///< SPI Master #0
   rand uvme_cvmcu_chip_udma_qspi_reg_block_c  qspi1; ///< SPI Master #1
   rand uvme_cvmcu_chip_udma_i2cm_reg_block_c  i2cm0; ///< I2C Master #0
   rand uvme_cvmcu_chip_udma_i2cm_reg_block_c  i2cm1; ///< I2C Master #1
   rand uvme_cvmcu_chip_udma_sdio_reg_block_c  sdio; ///< SDIO
   rand uvme_cvmcu_chip_udma_camera_reg_block_c  camera; ///< Camera port
   rand uvme_cvmcu_chip_efpga_reg_block_c  efpga_cfg; ///< eFPGA sub-system
   rand uvme_cvmcu_chip_debug_reg_block_c  debug; ///< Debug unit
   /// @}

   /// @name Memories
   /// @{
   rand uvmx_reg_mem_c  rom; ///< Boot ROM
   rand uvmx_reg_mem_c  ram_b0; ///< Non-interleaved SRAM bank #0
   rand uvmx_reg_mem_c  ram_b1; ///< Non-interleaved SRAM bank #1
   rand uvmx_reg_mem_c  ram; ///< Interleaved SRAM (4x112K banks)
   /// @}


   `uvm_object_utils_begin(uvme_cvmcu_chip_reg_block_c)
      `uvm_field_object(rom, UVM_DEFAULT)
      `uvm_field_object(ram_b0, UVM_DEFAULT)
      `uvm_field_object(ram_b1, UVM_DEFAULT)
      `uvm_field_object(ram, UVM_DEFAULT)
      `uvm_field_object(timer, UVM_DEFAULT)
      `uvm_field_object(adv_timer, UVM_DEFAULT)
      `uvm_field_object(soc_ctrl, UVM_DEFAULT)
      `uvm_field_object(gpio, UVM_DEFAULT)
      `uvm_field_object(fll, UVM_DEFAULT)
      `uvm_field_object(i2cs, UVM_DEFAULT)
      `uvm_field_object(event_ctrl, UVM_DEFAULT)
      `uvm_field_object(udma, UVM_DEFAULT)
      `uvm_field_object(uart0, UVM_DEFAULT)
      `uvm_field_object(uart1, UVM_DEFAULT)
      `uvm_field_object(qspi0, UVM_DEFAULT)
      `uvm_field_object(qspi1, UVM_DEFAULT)
      `uvm_field_object(i2cm0, UVM_DEFAULT)
      `uvm_field_object(i2cm1, UVM_DEFAULT)
      `uvm_field_object(sdio, UVM_DEFAULT)
      `uvm_field_object(camera, UVM_DEFAULT)
      `uvm_field_object(efpga_cfg, UVM_DEFAULT)
      `uvm_field_object(debug, UVM_DEFAULT)
   `uvm_object_utils_end


   /**
    * Default constructor.
    */
   function new(string name="uvme_cvmcu_chip_reg_block", int has_coverage=UVM_NO_COVERAGE);
      super.new(name, has_coverage);
   endfunction

   /**
    * Creates sub-block(s).
    */
   virtual function void create_blocks();
      timer = uvme_apb_timer_ss_reg_block_c::type_id::create("timer");
      timer.configure(this);
      timer.build();
      adv_timer = uvme_apb_adv_timer_ss_reg_block_c::type_id::create("adv_timer");
      adv_timer.configure(this);
      adv_timer.build();
      soc_ctrl = uvme_cvmcu_chip_apb_soc_ctrl_reg_block_c::type_id::create("soc_ctrl");
      soc_ctrl.configure(this);
      soc_ctrl.build();
      gpio = uvme_cvmcu_chip_apb_gpio_reg_block_c::type_id::create("gpio");
      gpio.configure(this);
      gpio.build();
      fll = uvme_cvmcu_chip_apb_fll_reg_block_c::type_id::create("fll");
      fll.configure(this);
      fll.build();
      i2cs = uvme_cvmcu_chip_apb_i2cs_reg_block_c::type_id::create("i2cs");
      i2cs.configure(this);
      i2cs.build();
      event_ctrl = uvme_cvmcu_chip_apb_event_ctrl_reg_block_c::type_id::create("event_ctrl");
      event_ctrl.configure(this);
      event_ctrl.build();
      udma = uvme_cvmcu_chip_udma_ctrl_reg_block_c::type_id::create("udma");
      udma.configure(this);
      udma.build();
      uart0 = uvme_cvmcu_chip_udma_uart_reg_block_c::type_id::create("uart0");
      uart0.configure(this);
      uart0.build();
      uart1 = uvme_cvmcu_chip_udma_uart_reg_block_c::type_id::create("uart1");
      uart1.configure(this);
      uart1.build();
      qspi0 = uvme_cvmcu_chip_udma_qspi_reg_block_c::type_id::create("qspi0");
      qspi0.configure(this);
      qspi0.build();
      qspi1 = uvme_cvmcu_chip_udma_qspi_reg_block_c::type_id::create("qspi1");
      qspi1.configure(this);
      qspi1.build();
      i2cm0 = uvme_cvmcu_chip_udma_i2cm_reg_block_c::type_id::create("i2cm0");
      i2cm0.configure(this);
      i2cm0.build();
      i2cm1 = uvme_cvmcu_chip_udma_i2cm_reg_block_c::type_id::create("i2cm1");
      i2cm1.configure(this);
      i2cm1.build();
      sdio = uvme_cvmcu_chip_udma_sdio_reg_block_c::type_id::create("sdio");
      sdio.configure(this);
      sdio.build();
      camera = uvme_cvmcu_chip_udma_camera_reg_block_c::type_id::create("camera");
      camera.configure(this);
      camera.build();
      efpga_cfg = uvme_cvmcu_chip_efpga_reg_block_c::type_id::create("efpga_cfg");
      efpga_cfg.configure(this);
      efpga_cfg.build();
      debug = uvme_cvmcu_chip_debug_reg_block_c::type_id::create("debug");
      debug.configure(this);
      debug.build();
   endfunction

   /**
    * Creates memories.
    */
   virtual function void create_mems();
      rom = new("rom", 4000, 32, "RO");
      ram_b0 = new("ram_b0", 8000, 32, "RW");
      ram_b1 = new("ram_b1", 8000, 32, "RW");
      ram = new("ram", 448000, 32, "RW");
      rom.configure(this);
      ram_b0.configure(this);
      ram_b1.configure(this);
      ram.configure(this);
   endfunction

   /**
    * Creates address maps.
    */
   virtual function void create_maps();
      // Create default register map (default_map)
      default_map = create_map(
         .name     ("default_map"),
         .base_addr(`UVM_REG_ADDR_WIDTH'h0),
         .n_bytes  (4),
         .endian   (UVM_LITTLE_ENDIAN)
      );
   endfunction

   /**
    * Adds block(s) to address maps.
    */
   virtual function void add_blocks_to_map();
      default_map.add_submap(timer.default_map, `UVM_REG_ADDR_WIDTH'h1a108000);
      default_map.add_submap(adv_timer.default_map, `UVM_REG_ADDR_WIDTH'h1a105000);
      default_map.add_submap(soc_ctrl.default_map, `UVM_REG_ADDR_WIDTH'h1a104000);
      default_map.add_submap(gpio.default_map, `UVM_REG_ADDR_WIDTH'h1a101000);
      default_map.add_submap(fll.default_map, `UVM_REG_ADDR_WIDTH'h1a100000);
      default_map.add_submap(i2cs.default_map, `UVM_REG_ADDR_WIDTH'h1a107000);
      default_map.add_submap(event_ctrl.default_map, `UVM_REG_ADDR_WIDTH'h1a106000);
      default_map.add_submap(udma.default_map, `UVM_REG_ADDR_WIDTH'h1a102000);
      default_map.add_submap(uart0.default_map, `UVM_REG_ADDR_WIDTH'h1a102080);
      default_map.add_submap(uart1.default_map, `UVM_REG_ADDR_WIDTH'h1a102100);
      default_map.add_submap(qspi0.default_map, `UVM_REG_ADDR_WIDTH'h1a102180);
      default_map.add_submap(qspi1.default_map, `UVM_REG_ADDR_WIDTH'h1a102200);
      default_map.add_submap(i2cm0.default_map, `UVM_REG_ADDR_WIDTH'h1a102280);
      default_map.add_submap(i2cm1.default_map, `UVM_REG_ADDR_WIDTH'h1a102300);
      default_map.add_submap(sdio.default_map, `UVM_REG_ADDR_WIDTH'h1a102380);
      default_map.add_submap(camera.default_map, `UVM_REG_ADDR_WIDTH'h1a102400);
      default_map.add_submap(efpga_cfg.default_map, `UVM_REG_ADDR_WIDTH'h1a200000);
      default_map.add_submap(debug.default_map, `UVM_REG_ADDR_WIDTH'h1a110000);
   endfunction

   /**
    * Adds memories to address maps.
    */
   virtual function void add_mems_to_map();
      default_map.add_mem(rom, `UVM_REG_ADDR_WIDTH'h1a000000);
      default_map.add_mem(ram_b0, `UVM_REG_ADDR_WIDTH'h1c000000);
      default_map.add_mem(ram_b1, `UVM_REG_ADDR_WIDTH'h1c008000);
      default_map.add_mem(ram, `UVM_REG_ADDR_WIDTH'h1c010000);
   endfunction

endclass : uvme_cvmcu_chip_reg_block_c


`endif // __UVME_CVMCU_CHIP_REG_BLOCK_SV__
