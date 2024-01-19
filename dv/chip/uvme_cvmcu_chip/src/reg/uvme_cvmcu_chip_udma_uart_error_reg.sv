// Copyright 2024 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// THE FOLLOWING IS GENERATED CODE: ANY CHANGES MADE WILL BE ERASED UPON THE NEXT ITERATION


`ifndef __UVME_CVMCU_CHIP_UDMA_UART_ERROR_REG_SV__
`define __UVME_CVMCU_CHIP_UDMA_UART_ERROR_REG_SV__


class uvme_cvmcu_chip_udma_uart_error_reg_c extends uvmx_reg_c;

   rand uvmx_reg_field_c  parity_err; ///< 0x1 indicates parity error; read clears the bit
   rand uvmx_reg_field_c  overflow_err; ///< 0x1 indicates overflow error; read clears the bit


   `uvm_object_utils_begin(uvme_cvmcu_chip_udma_uart_error_reg_c)
      `uvm_field_object(parity_err, UVM_DEFAULT)
      `uvm_field_object(overflow_err, UVM_DEFAULT)
   `uvm_object_utils_end


   /**
    * Default constructor.
    */
   function new(string name="uvme_cvmcu_chip_udma_uart_error_reg", int unsigned n_bits=32, int has_coverage=UVM_NO_COVERAGE);
      super.new(name, n_bits, has_coverage);
   endfunction

   /**
    * Creates and configures register fields.
    */
   virtual function void build();
      parity_err = uvmx_reg_field_c::type_id::create("parity_err");
      parity_err.configure(
         .parent                 (this),
         .size                   (   1),
         .lsb_pos                (   1),
         .access                 ("RC"),
         .volatile               (   0),
         .reset                  (   0),
         .has_reset              (   1),
         .is_rand                (   1),
         .individually_accessible(   1)
      );
      overflow_err = uvmx_reg_field_c::type_id::create("overflow_err");
      overflow_err.configure(
         .parent                 (this),
         .size                   (   1),
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


`endif // __UVME_CVMCU_CHIP_UDMA_UART_ERROR_REG_SV__