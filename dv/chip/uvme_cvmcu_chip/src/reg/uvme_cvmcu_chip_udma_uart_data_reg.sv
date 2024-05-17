// Copyright 2024 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// THE FOLLOWING IS GENERATED CODE: ANY CHANGES MADE WILL BE ERASED UPON THE NEXT ITERATION


`ifndef __UVME_CVMCU_CHIP_UDMA_UART_DATA_REG_SV__
`define __UVME_CVMCU_CHIP_UDMA_UART_DATA_REG_SV__


class uvme_cvmcu_chip_udma_uart_data_reg_c extends uvmx_reg_c;

   rand uvmx_reg_field_c  rx_data; ///< Receive data; reading clears RX_DATA_VALID


   `uvm_object_utils_begin(uvme_cvmcu_chip_udma_uart_data_reg_c)
      `uvm_field_object(rx_data, UVM_DEFAULT)
   `uvm_object_utils_end


   /**
    * Default constructor.
    */
   function new(string name="uvme_cvmcu_chip_udma_uart_data_reg", int unsigned n_bits=32, int has_coverage=UVM_NO_COVERAGE);
      super.new(name, n_bits, has_coverage);
   endfunction

   /**
    * Creates and configures register fields.
    */
   virtual function void build();
      rx_data = uvmx_reg_field_c::type_id::create("rx_data");
      rx_data.configure(
         .parent                 (this),
         .size                   (   8),
         .lsb_pos                (   0),
         .access                 ("RC"),
         .volatile               (   0),
         .reset                  (   0),
         .has_reset              (   1),
         .is_rand                (   1),
         .individually_accessible(   1)
      );
   endfunction

endclass


`endif // __UVME_CVMCU_CHIP_UDMA_UART_DATA_REG_SV__