// Copyright 2022-2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVME_CVMCU_REG_BLOCK_SV__
`define __UVME_CVMCU_REG_BLOCK_SV__


`include "uvme_cvmcu_gpio_reg_block.sv"
`include "uvme_cvmcu_uart_reg_block.sv"


/**
 * Top-level object encapsulating CORE-V MCU Register Block.
 * @ingroup uvme_cvmcu_reg
 */
class uvme_cvmcu_reg_block_c extends uvmx_reg_block_c;

   /// @name Sub-Blocks
   /// @{
   rand uvme_apb_timer_reg_block_c      apb_timer    ; ///< APB Timer Unit
   rand uvme_apb_adv_timer_reg_block_c  apb_adv_timer; ///< Advanced APB Timer Unit
   rand uvme_cvmcu_gpio_reg_block_c     gpio         ; ///< GPIO
   rand uvme_cvmcu_uart_reg_block_c     uart0        ; ///< UART0
   rand uvme_cvmcu_uart_reg_block_c     uart1        ; ///< UART1
   /// @}

   /// @name Memories
   /// @{
   //rand uvmx_reg_mem_c  rom   ; ///< Boot ROM
   rand uvmx_reg_mem_c  ram_b0; ///< Non-Interleaved Memory Bank 0
   rand uvmx_reg_mem_c  ram_b1; ///< Non-Interleaved Memory Bank 1
   rand uvmx_reg_mem_c  ram   ; ///< Interleaved Memory
   /// @}


   `uvm_object_utils_begin(uvme_cvmcu_reg_block_c)
      `uvm_field_object(apb_timer    , UVM_DEFAULT)
      `uvm_field_object(apb_adv_timer, UVM_DEFAULT)
      `uvm_field_object(gpio         , UVM_DEFAULT)
      `uvm_field_object(uart0        , UVM_DEFAULT)
      `uvm_field_object(uart1        , UVM_DEFAULT)
   `uvm_object_utils_end


   /**
    * Default constructor.
    */
   function new(string name="uvme_cvmcu_reg_block", int has_coverage=UVM_NO_COVERAGE);
      super.new(name, has_coverage);
   endfunction

   /**
    * Creates sub-block(s).
    */
   virtual function void create_blocks();
      apb_timer = uvme_apb_timer_reg_block_c::type_id::create("apb_timer");
      apb_timer.configure(this);
      apb_timer.build();
      apb_adv_timer = uvme_apb_adv_timer_reg_block_c::type_id::create("apb_adv_timer");
      apb_adv_timer.configure(this);
      apb_adv_timer.build();
      gpio = uvme_cvmcu_gpio_reg_block_c::type_id::create("gpio");
      gpio.configure(this);
      gpio.build();
      uart0 = uvme_cvmcu_uart_reg_block_c::type_id::create("uart0");
      uart0.configure(this);
      uart0.build();
      uart1 = uvme_cvmcu_uart_reg_block_c::type_id::create("uart1");
      uart1.configure(this);
      uart1.build();
   endfunction

   /**
    * Creates memories.
    */
   virtual function void create_mems();
      //rom    = new("rom"   , 4_0000, 32);
      ram_b0 = new("ram_b0", 0_8000, 32);
      ram_b1 = new("ram_b1", 0_8000, 32);
      ram    = new("ram"   , 7_0000, 32);
      //rom   .configure(this);
      ram_b0.configure(this);
      ram_b1.configure(this);
      ram   .configure(this);
   endfunction

   /**
    * Creates register map.
    */
   virtual function void create_reg_map();
      default_map = create_map(
         .name     ("default_map"),
         .base_addr(0),
         .n_bytes  (uvme_cvmcu_reg_block_reg_n_bytes),
         .endian   (UVM_LITTLE_ENDIAN)
      );
   endfunction

   /**
    * Adds memories to register map.
    */
   virtual function void add_mems_to_map();
      //default_map.add_mem(rom   , `UVM_REG_ADDR_WIDTH'h1A00_0000, "RO");
      default_map.add_mem(ram_b0, `UVM_REG_ADDR_WIDTH'h1C00_0000, "RW");
      default_map.add_mem(ram_b1, `UVM_REG_ADDR_WIDTH'h1C00_8000, "RW");
      default_map.add_mem(ram   , `UVM_REG_ADDR_WIDTH'h1C01_0000, "RW");
   endfunction

   /**
    * Adds block(s) to register map.
    */
   virtual function void add_blocks_to_map();
      default_map.add_submap(apb_timer    .default_map, `UVM_REG_ADDR_WIDTH'h1A10_B000);
      default_map.add_submap(apb_adv_timer.default_map, `UVM_REG_ADDR_WIDTH'h1A10_5000);
      default_map.add_submap(gpio         .default_map, `UVM_REG_ADDR_WIDTH'h1A10_1000);
      default_map.add_submap(uart0        .default_map, `UVM_REG_ADDR_WIDTH'h1A10_2080);
      default_map.add_submap(uart1        .default_map, `UVM_REG_ADDR_WIDTH'h1A10_2100);
   endfunction

endclass : uvme_cvmcu_reg_block_c


`endif // _UVME_CVMCU_REG_BLOCK_SV__
