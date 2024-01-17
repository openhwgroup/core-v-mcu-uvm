// Copyright 2024 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// THE FOLLOWING IS GENERATED CODE: ANY CHANGES MADE WILL BE ERASED UPON THE NEXT ITERATION


`ifndef __UVME_CVMCU_CHIP_UDMA_UART_UDMA_UART_IRQ_EN_REG_SV__
`define __UVME_CVMCU_CHIP_UDMA_UART_UDMA_UART_IRQ_EN_REG_SV__


class uvme_cvmcu_chip_udma_uart_udma_uart_irq_en_reg_c extends uvmx_reg_c;

   rand uvmx_reg_field_c  err_irq_en; ///< Enable the error interrupt
   rand uvmx_reg_field_c  rx_irq_en; ///< Enable the receiver interrupt


   `uvm_object_utils_begin(uvme_cvmcu_chip_udma_uart_udma_uart_irq_en_reg_c)
      `uvm_field_object(err_irq_en, UVM_DEFAULT)
      `uvm_field_object(rx_irq_en, UVM_DEFAULT)
   `uvm_object_utils_end


   /**
    * Default constructor.
    */
   function new(string name="uvme_cvmcu_chip_udma_uart_udma_uart_irq_en_reg", int unsigned n_bits=32, int has_coverage=UVM_NO_COVERAGE);
      super.new(name, n_bits, has_coverage);
   endfunction

   /**
    * Creates and configures register fields.
    */
   virtual function void build();
      err_irq_en = uvmx_reg_field_c::type_id::create("err_irq_en");
      err_irq_en.configure(
         .parent                 (this),
         .size                   (   1),
         .lsb_pos                (   1),
         .access                 ("RW"),
         .volatile               (   0),
         .reset                  (   0),
         .has_reset              (   1),
         .is_rand                (   1),
         .individually_accessible(   1)
      );
      rx_irq_en = uvmx_reg_field_c::type_id::create("rx_irq_en");
      rx_irq_en.configure(
         .parent                 (this),
         .size                   (   1),
         .lsb_pos                (   0),
         .access                 ("RW"),
         .volatile               (   0),
         .reset                  (   0),
         .has_reset              (   1),
         .is_rand                (   1),
         .individually_accessible(   1)
      );
   endfunction

endclass


`endif // __UVME_CVMCU_CHIP_UDMA_UART_UDMA_UART_IRQ_EN_REG_SV__