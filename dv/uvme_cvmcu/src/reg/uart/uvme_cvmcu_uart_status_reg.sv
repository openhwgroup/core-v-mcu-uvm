// Copyright 2022 Datum Technology Corporation
// All rights reserved
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


// WARNING: THE FOLLOWING IS GENERATED CODE.
// ANY CHANGES MADE WILL BE ERASED UPON THE NEXT RELEASE.


`ifndef __UVME_CVMCU_UART_STATUS_REG_SV__
`define __UVME_CVMCU_UART_STATUS_REG_SV__


class uvme_cvmcu_uart_status_reg_c extends uvmx_reg_c;

   rand uvmx_reg_field_c  rx_busy; ///< 0x1: receiver is busy
   rand uvmx_reg_field_c  tx_busy; ///< 0x1: transmitter is busy


   `uvm_object_utils_begin(uvme_cvmcu_uart_status_reg_c)
      `uvm_field_object(rx_busy, UVM_DEFAULT)
      `uvm_field_object(tx_busy, UVM_DEFAULT)
   `uvm_object_utils_end


   /**
    * Default constructor.
    */
   function new(string name="uvme_cvmcu_uart_status_reg", int unsigned n_bits=32, int has_coverage=UVM_NO_COVERAGE);
      super.new(name, n_bits, has_coverage);
   endfunction

   /**
    * Creates and configures register fields.
    */
   virtual function void build();
      rx_busy = uvmx_reg_field_c::type_id::create("rx_busy");
      rx_busy.configure(
         .parent                 (this),
         .size                   (   2),
         .lsb_pos                (   1),
         .access                 ("RO"),
         .volatile               (   0),
         .reset                  (   0),
         .has_reset              (   1),
         .is_rand                (   1),
         .individually_accessible(   1)
      );
      tx_busy = uvmx_reg_field_c::type_id::create("tx_busy");
      tx_busy.configure(
         .parent                 (this),
         .size                   (   1),
         .lsb_pos                (   0),
         .access                 ("RO"),
         .volatile               (   0),
         .reset                  (   0),
         .has_reset              (   1),
         .is_rand                (   1),
         .individually_accessible(   1)
      );
   endfunction

endclass : uvme_cvmcu_uart_status_reg_c


`endif // __UVME_CVMCU_UART_STATUS_REG_SV__