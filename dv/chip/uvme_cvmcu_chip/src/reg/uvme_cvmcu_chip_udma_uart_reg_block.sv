// Copyright 2024 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// THE FOLLOWING IS GENERATED CODE: ANY CHANGES MADE WILL BE ERASED UPON THE NEXT ITERATION


`ifndef __UVME_CVMCU_CHIP_UDMA_UART_REG_BLOCK_SV__
`define __UVME_CVMCU_CHIP_UDMA_UART_REG_BLOCK_SV__


`include "uvme_cvmcu_chip_udma_uart_rx_saddr_reg.sv"
`include "uvme_cvmcu_chip_udma_uart_rx_size_reg.sv"
`include "uvme_cvmcu_chip_udma_uart_rx_cfg_reg.sv"
`include "uvme_cvmcu_chip_udma_uart_tx_saddr_reg.sv"
`include "uvme_cvmcu_chip_udma_uart_tx_size_reg.sv"
`include "uvme_cvmcu_chip_udma_uart_tx_cfg_reg.sv"
`include "uvme_cvmcu_chip_udma_uart_status_reg.sv"
`include "uvme_cvmcu_chip_udma_uart_uart_setup_reg.sv"
`include "uvme_cvmcu_chip_udma_uart_error_reg.sv"
`include "uvme_cvmcu_chip_udma_uart_irq_en_reg.sv"
`include "uvme_cvmcu_chip_udma_uart_valid_reg.sv"
`include "uvme_cvmcu_chip_udma_uart_data_reg.sv"


/**
 * Top-Level Register Block for uvme_cvmcu_chip_udma_uart.
 * @ingroup uvme_cvmcu_chip_udma_uart_reg
 */
class uvme_cvmcu_chip_udma_uart_reg_block_c extends uvmx_reg_block_c;

   /// @name Registers
   /// @{
   rand uvme_cvmcu_chip_udma_uart_rx_saddr_reg_c  rx_saddr; ///< Address of receive buffer on write; current address on read
   rand uvme_cvmcu_chip_udma_uart_rx_size_reg_c  rx_size; ///< Size of receive buffer on write; bytes left on read
   rand uvme_cvmcu_chip_udma_uart_rx_cfg_reg_c  rx_cfg; ///< Clear the receive channel
   rand uvme_cvmcu_chip_udma_uart_tx_saddr_reg_c  tx_saddr; ///< Address of transmit buffer on write; current address on read
   rand uvme_cvmcu_chip_udma_uart_tx_size_reg_c  tx_size; ///< Size of receive buffer on write; bytes left on read
   rand uvme_cvmcu_chip_udma_uart_tx_cfg_reg_c  tx_cfg; ///< Clear the transmit channel
   rand uvme_cvmcu_chip_udma_uart_status_reg_c  status; ///< 0x1: receiver is busy
   rand uvme_cvmcu_chip_udma_uart_uart_setup_reg_c  uart_setup; ///< 
   rand uvme_cvmcu_chip_udma_uart_error_reg_c  error; ///< 0x1 indicates parity error; read clears the bit
   rand uvme_cvmcu_chip_udma_uart_irq_en_reg_c  irq_en; ///< Enable the error interrupt
   rand uvme_cvmcu_chip_udma_uart_valid_reg_c  valid; ///< Cleared when RX_DATA is read
   rand uvme_cvmcu_chip_udma_uart_data_reg_c  data; ///< Receive data; reading clears RX_DATA_VALID
   /// @}


   `uvm_object_utils_begin(uvme_cvmcu_chip_udma_uart_reg_block_c)
      `uvm_field_object(rx_saddr, UVM_DEFAULT)
      `uvm_field_object(rx_size, UVM_DEFAULT)
      `uvm_field_object(rx_cfg, UVM_DEFAULT)
      `uvm_field_object(tx_saddr, UVM_DEFAULT)
      `uvm_field_object(tx_size, UVM_DEFAULT)
      `uvm_field_object(tx_cfg, UVM_DEFAULT)
      `uvm_field_object(status, UVM_DEFAULT)
      `uvm_field_object(uart_setup, UVM_DEFAULT)
      `uvm_field_object(error, UVM_DEFAULT)
      `uvm_field_object(irq_en, UVM_DEFAULT)
      `uvm_field_object(valid, UVM_DEFAULT)
      `uvm_field_object(data, UVM_DEFAULT)
   `uvm_object_utils_end


   /**
    * Default constructor.
    */
   function new(string name="uvme_cvmcu_chip_udma_uart_reg_block", int has_coverage=UVM_NO_COVERAGE);
      super.new(name, has_coverage);
   endfunction

   /**
    * Creates register(s).
    */
   virtual function void create_regs();
      rx_saddr = uvme_cvmcu_chip_udma_uart_rx_saddr_reg_c::type_id::create("rx_saddr");
      rx_saddr.configure(this);
      rx_saddr.build();
      rx_size = uvme_cvmcu_chip_udma_uart_rx_size_reg_c::type_id::create("rx_size");
      rx_size.configure(this);
      rx_size.build();
      rx_cfg = uvme_cvmcu_chip_udma_uart_rx_cfg_reg_c::type_id::create("rx_cfg");
      rx_cfg.configure(this);
      rx_cfg.build();
      tx_saddr = uvme_cvmcu_chip_udma_uart_tx_saddr_reg_c::type_id::create("tx_saddr");
      tx_saddr.configure(this);
      tx_saddr.build();
      tx_size = uvme_cvmcu_chip_udma_uart_tx_size_reg_c::type_id::create("tx_size");
      tx_size.configure(this);
      tx_size.build();
      tx_cfg = uvme_cvmcu_chip_udma_uart_tx_cfg_reg_c::type_id::create("tx_cfg");
      tx_cfg.configure(this);
      tx_cfg.build();
      status = uvme_cvmcu_chip_udma_uart_status_reg_c::type_id::create("status");
      status.configure(this);
      status.build();
      uart_setup = uvme_cvmcu_chip_udma_uart_uart_setup_reg_c::type_id::create("uart_setup");
      uart_setup.configure(this);
      uart_setup.build();
      error = uvme_cvmcu_chip_udma_uart_error_reg_c::type_id::create("error");
      error.configure(this);
      error.build();
      irq_en = uvme_cvmcu_chip_udma_uart_irq_en_reg_c::type_id::create("irq_en");
      irq_en.configure(this);
      irq_en.build();
      valid = uvme_cvmcu_chip_udma_uart_valid_reg_c::type_id::create("valid");
      valid.configure(this);
      valid.build();
      data = uvme_cvmcu_chip_udma_uart_data_reg_c::type_id::create("data");
      data.configure(this);
      data.build();
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
    * Adds registers to address maps.
    */
   virtual function void add_regs_to_map();
      default_map.add_reg(
         .rg    (rx_saddr),
         .offset(`UVM_REG_ADDR_WIDTH'h0),
         .rights("RW")
      );
      default_map.add_reg(
         .rg    (rx_size),
         .offset(`UVM_REG_ADDR_WIDTH'h4),
         .rights("RW")
      );
      default_map.add_reg(
         .rg    (rx_cfg),
         .offset(`UVM_REG_ADDR_WIDTH'h8),
         .rights("RW")
      );
      default_map.add_reg(
         .rg    (tx_saddr),
         .offset(`UVM_REG_ADDR_WIDTH'h10),
         .rights("RW")
      );
      default_map.add_reg(
         .rg    (tx_size),
         .offset(`UVM_REG_ADDR_WIDTH'h14),
         .rights("RW")
      );
      default_map.add_reg(
         .rg    (tx_cfg),
         .offset(`UVM_REG_ADDR_WIDTH'h18),
         .rights("RW")
      );
      default_map.add_reg(
         .rg    (status),
         .offset(`UVM_REG_ADDR_WIDTH'h20),
         .rights("RO")
      );
      default_map.add_reg(
         .rg    (uart_setup),
         .offset(`UVM_REG_ADDR_WIDTH'h24),
         .rights("RW")
      );
      default_map.add_reg(
         .rg    (error),
         .offset(`UVM_REG_ADDR_WIDTH'h28),
         .rights("RW")
      );
      default_map.add_reg(
         .rg    (irq_en),
         .offset(`UVM_REG_ADDR_WIDTH'h2c),
         .rights("RW")
      );
      default_map.add_reg(
         .rg    (valid),
         .offset(`UVM_REG_ADDR_WIDTH'h30),
         .rights("RW")
      );
      default_map.add_reg(
         .rg    (data),
         .offset(`UVM_REG_ADDR_WIDTH'h34),
         .rights("RW")
      );
   endfunction

endclass


`endif // __UVME_CVMCU_CHIP_UDMA_UART_REG_BLOCK_SV__
