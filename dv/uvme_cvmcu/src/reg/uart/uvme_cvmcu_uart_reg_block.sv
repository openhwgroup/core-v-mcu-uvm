// Copyright 2022 Datum Technology Corporation
// All rights reserved
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


// WARNING: THE FOLLOWING IS GENERATED CODE.
// ANY CHANGES MADE WILL BE ERASED UPON THE NEXT RELEASE.


`ifndef __UVME_CVMCU_UART_REG_BLOCK_SV__
`define __UVME_CVMCU_UART_REG_BLOCK_SV__


`include "uvme_cvmcu_uart_rx_saddr_reg.sv"
`include "uvme_cvmcu_uart_rx_size_reg.sv"
`include "uvme_cvmcu_uart_rx_cfg_reg.sv"
`include "uvme_cvmcu_uart_tx_saddr_reg.sv"
`include "uvme_cvmcu_uart_tx_size_reg.sv"
`include "uvme_cvmcu_uart_tx_cfg_reg.sv"
`include "uvme_cvmcu_uart_status_reg.sv"
`include "uvme_cvmcu_uart_uart_setup_reg.sv"
`include "uvme_cvmcu_uart_error_reg.sv"
`include "uvme_cvmcu_uart_irq_en_reg.sv"
`include "uvme_cvmcu_uart_valid_reg.sv"
`include "uvme_cvmcu_uart_data_reg.sv"


/**
 * Top-Level Register Block for cvmcu_uart.
 */
class uvme_cvmcu_uart_reg_block_c extends uvmx_reg_block_c;

   /// @name Registers
   /// @{
  rand uvme_cvmcu_uart_rx_saddr_reg_c  rx_saddr;
  rand uvme_cvmcu_uart_rx_size_reg_c  rx_size;
  rand uvme_cvmcu_uart_rx_cfg_reg_c  rx_cfg;
  rand uvme_cvmcu_uart_tx_saddr_reg_c  tx_saddr;
  rand uvme_cvmcu_uart_tx_size_reg_c  tx_size;
  rand uvme_cvmcu_uart_tx_cfg_reg_c  tx_cfg;
  rand uvme_cvmcu_uart_status_reg_c  status;
  rand uvme_cvmcu_uart_uart_setup_reg_c  uart_setup;
  rand uvme_cvmcu_uart_error_reg_c  error;
  rand uvme_cvmcu_uart_irq_en_reg_c  irq_en;
  rand uvme_cvmcu_uart_valid_reg_c  valid;
  rand uvme_cvmcu_uart_data_reg_c  data;
   /// @}


   `uvm_object_utils_begin(uvme_cvmcu_uart_reg_block_c)
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
   function new(string name="uvme_cvmcu_uart_reg_block", int has_coverage=UVM_NO_COVERAGE);
      super.new(name, has_coverage);
   endfunction

   /**
    * Creates register(s).
    */
   virtual function void create_regs();
      rx_saddr = uvme_cvmcu_uart_rx_saddr_reg_c::type_id::create("rx_saddr");
      rx_saddr.configure(this);
      rx_saddr.build();   
      rx_size = uvme_cvmcu_uart_rx_size_reg_c::type_id::create("rx_size");
      rx_size.configure(this);
      rx_size.build();   
      rx_cfg = uvme_cvmcu_uart_rx_cfg_reg_c::type_id::create("rx_cfg");
      rx_cfg.configure(this);
      rx_cfg.build();   
      tx_saddr = uvme_cvmcu_uart_tx_saddr_reg_c::type_id::create("tx_saddr");
      tx_saddr.configure(this);
      tx_saddr.build();   
      tx_size = uvme_cvmcu_uart_tx_size_reg_c::type_id::create("tx_size");
      tx_size.configure(this);
      tx_size.build();   
      tx_cfg = uvme_cvmcu_uart_tx_cfg_reg_c::type_id::create("tx_cfg");
      tx_cfg.configure(this);
      tx_cfg.build();   
      status = uvme_cvmcu_uart_status_reg_c::type_id::create("status");
      status.configure(this);
      status.build();   
      uart_setup = uvme_cvmcu_uart_uart_setup_reg_c::type_id::create("uart_setup");
      uart_setup.configure(this);
      uart_setup.build();   
      error = uvme_cvmcu_uart_error_reg_c::type_id::create("error");
      error.configure(this);
      error.build();   
      irq_en = uvme_cvmcu_uart_irq_en_reg_c::type_id::create("irq_en");
      irq_en.configure(this);
      irq_en.build();   
      valid = uvme_cvmcu_uart_valid_reg_c::type_id::create("valid");
      valid.configure(this);
      valid.build();   
      data = uvme_cvmcu_uart_data_reg_c::type_id::create("data");
      data.configure(this);
      data.build();   
   endfunction

   /**
    * Creates default register map.
    */
   virtual function void create_reg_map();
      // Create default register map (default_map)
      default_map = create_map(
         .name     ("default_map"),
         .base_addr(32'h1a10_2000),
         .n_bytes  (4),
         .endian   (UVM_LITTLE_ENDIAN)
      );
   endfunction

   /**
    * Adds register(s) to register map.
    */
   virtual function void add_regs_to_map();
      default_map.add_reg(
         .rg    (rx_saddr),
         .offset(32'h00),
         .rights("RW")
      );
      default_map.add_reg(
         .rg    (rx_size),
         .offset(32'h04),
         .rights("RW")
      );
      default_map.add_reg(
         .rg    (rx_cfg),
         .offset(32'h08),
         .rights("RW")
      );
      default_map.add_reg(
         .rg    (tx_saddr),
         .offset(32'h10),
         .rights("RW")
      );
      default_map.add_reg(
         .rg    (tx_size),
         .offset(32'h14),
         .rights("RW")
      );
      default_map.add_reg(
         .rg    (tx_cfg),
         .offset(32'h18),
         .rights("RW")
      );
      default_map.add_reg(
         .rg    (status),
         .offset(32'h20),
         .rights("RW")
      );
      default_map.add_reg(
         .rg    (uart_setup),
         .offset(32'h24),
         .rights("RW")
      );
      default_map.add_reg(
         .rg    (error),
         .offset(32'h28),
         .rights("RW")
      );
      default_map.add_reg(
         .rg    (irq_en),
         .offset(32'h2c),
         .rights("RW")
      );
      default_map.add_reg(
         .rg    (valid),
         .offset(32'h30),
         .rights("RW")
      );
      default_map.add_reg(
         .rg    (data),
         .offset(32'h34),
         .rights("RW")
      );
   endfunction

endclass : uvme_cvmcu_uart_reg_block_c


`endif // _UVME_CVMCU_UART_REG_BLOCK_SV__
