// Copyright 2024 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// THE FOLLOWING IS GENERATED CODE: ANY CHANGES MADE WILL BE ERASED UPON THE NEXT ITERATION


`ifndef __UVME_CVMCU_CHIP_UDMA_UART_UDMA_UART_TX_SIZE_REG_SV__
`define __UVME_CVMCU_CHIP_UDMA_UART_UDMA_UART_TX_SIZE_REG_SV__


class uvme_cvmcu_chip_udma_uart_udma_uart_tx_size_reg_c extends uvmx_reg_c;

   rand uvmx_reg_field_c  size; ///< Size of receive buffer on write; bytes left on read


   `uvm_object_utils_begin(uvme_cvmcu_chip_udma_uart_udma_uart_tx_size_reg_c)
      `uvm_field_object(size, UVM_DEFAULT)
   `uvm_object_utils_end


   /**
    * Default constructor.
    */
   function new(string name="uvme_cvmcu_chip_udma_uart_udma_uart_tx_size_reg", int unsigned n_bits=32, int has_coverage=UVM_NO_COVERAGE);
      super.new(name, n_bits, has_coverage);
   endfunction

   /**
    * Creates and configures register fields.
    */
   virtual function void build();
      size = uvmx_reg_field_c::type_id::create("size");
      size.configure(
         .parent                 (this),
         .size                   (   16),
         .lsb_pos                (   0),
         .access                 ("RW"),
         .volatile               (   1),
         .reset                  (   0),
         .has_reset              (   1),
         .is_rand                (   1),
         .individually_accessible(   1)
      );
   endfunction

endclass


`endif // __UVME_CVMCU_CHIP_UDMA_UART_UDMA_UART_TX_SIZE_REG_SV__