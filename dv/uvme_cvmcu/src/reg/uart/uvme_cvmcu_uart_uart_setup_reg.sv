// Copyright 2022 Datum Technology Corporation
// All rights reserved
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


// WARNING: THE FOLLOWING IS GENERATED CODE.
// ANY CHANGES MADE WILL BE ERASED UPON THE NEXT RELEASE.


`ifndef __UVME_CVMCU_UART_UART_SETUP_REG_SV__
`define __UVME_CVMCU_UART_UART_SETUP_REG_SV__


class uvme_cvmcu_uart_uart_setup_reg_c extends uvmx_reg_c;

   rand uvmx_reg_field_c  div; ///< 
   rand uvmx_reg_field_c  en_rx; ///< Enable the reciever
   rand uvmx_reg_field_c  en_tx; ///< Enable the transmitter
   rand uvmx_reg_field_c  rx_clean_fifo; ///< Empty the receive FIFO
   rand uvmx_reg_field_c  rx_polling_en; ///< Enable polling mode for receiver
   rand uvmx_reg_field_c  stop_bits; ///< 0x0: 1 stop bit, 0x1: 2 stop bits
   rand uvmx_reg_field_c  bits; ///< 0x0: 5 bit transfers, 0x1: 6 bit transfers, 0x2: 7 bit transfers, 0x3: 8 bit transfers
   rand uvmx_reg_field_c  parity_en; ///< Enable parity


   `uvm_object_utils_begin(uvme_cvmcu_uart_uart_setup_reg_c)
      `uvm_field_object(div, UVM_DEFAULT)
      `uvm_field_object(en_rx, UVM_DEFAULT)
      `uvm_field_object(en_tx, UVM_DEFAULT)
      `uvm_field_object(rx_clean_fifo, UVM_DEFAULT)
      `uvm_field_object(rx_polling_en, UVM_DEFAULT)
      `uvm_field_object(stop_bits, UVM_DEFAULT)
      `uvm_field_object(bits, UVM_DEFAULT)
      `uvm_field_object(parity_en, UVM_DEFAULT)
   `uvm_object_utils_end


   /**
    * Default constructor.
    */
   function new(string name="uvme_cvmcu_uart_uart_setup_reg", int unsigned n_bits=32, int has_coverage=UVM_NO_COVERAGE);
      super.new(name, n_bits, has_coverage);
   endfunction

   /**
    * Creates and configures register fields.
    */
   virtual function void build();
      div = uvmx_reg_field_c::type_id::create("div");
      div.configure(
         .parent                 (this),
         .size                   (   16),
         .lsb_pos                (   16),
         .access                 ("RW"),
         .volatile               (   0),
         .reset                  (   0),
         .has_reset              (   1),
         .is_rand                (   1),
         .individually_accessible(   1)
      );
      en_rx = uvmx_reg_field_c::type_id::create("en_rx");
      en_rx.configure(
         .parent                 (this),
         .size                   (   1),
         .lsb_pos                (   9),
         .access                 ("RW"),
         .volatile               (   0),
         .reset                  (   0),
         .has_reset              (   1),
         .is_rand                (   1),
         .individually_accessible(   1)
      );
      en_tx = uvmx_reg_field_c::type_id::create("en_tx");
      en_tx.configure(
         .parent                 (this),
         .size                   (   1),
         .lsb_pos                (   8),
         .access                 ("RW"),
         .volatile               (   0),
         .reset                  (   0),
         .has_reset              (   1),
         .is_rand                (   1),
         .individually_accessible(   1)
      );
      rx_clean_fifo = uvmx_reg_field_c::type_id::create("rx_clean_fifo");
      rx_clean_fifo.configure(
         .parent                 (this),
         .size                   (   1),
         .lsb_pos                (   5),
         .access                 ("RW"),
         .volatile               (   0),
         .reset                  (   0),
         .has_reset              (   1),
         .is_rand                (   1),
         .individually_accessible(   1)
      );
      rx_polling_en = uvmx_reg_field_c::type_id::create("rx_polling_en");
      rx_polling_en.configure(
         .parent                 (this),
         .size                   (   1),
         .lsb_pos                (   4),
         .access                 ("RW"),
         .volatile               (   0),
         .reset                  (   0),
         .has_reset              (   1),
         .is_rand                (   1),
         .individually_accessible(   1)
      );
      stop_bits = uvmx_reg_field_c::type_id::create("stop_bits");
      stop_bits.configure(
         .parent                 (this),
         .size                   (   1),
         .lsb_pos                (   3),
         .access                 ("RW"),
         .volatile               (   0),
         .reset                  (   0),
         .has_reset              (   1),
         .is_rand                (   1),
         .individually_accessible(   1)
      );
      bits = uvmx_reg_field_c::type_id::create("bits");
      bits.configure(
         .parent                 (this),
         .size                   (   2),
         .lsb_pos                (   1),
         .access                 ("RW"),
         .volatile               (   0),
         .reset                  (   0),
         .has_reset              (   1),
         .is_rand                (   1),
         .individually_accessible(   1)
      );
      parity_en = uvmx_reg_field_c::type_id::create("parity_en");
      parity_en.configure(
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

endclass : uvme_cvmcu_uart_uart_setup_reg_c


`endif // __UVME_CVMCU_UART_UART_SETUP_REG_SV__