// Copyright 2022-2023 Datum Technology Corporation
// All rights reserved
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


// WARNING: THE FOLLOWING IS GENERATED CODE.
// ANY CHANGES MADE WILL BE ERASED UPON THE NEXT RELEASE.


`ifndef __UVME_CVMCU_UART_RX_CFG_REG_SV__
`define __UVME_CVMCU_UART_RX_CFG_REG_SV__


class uvme_cvmcu_uart_rx_cfg_reg_c extends uvmx_reg_c;

   rand uvmx_reg_field_c  clear; ///< Clear the receive channel
   rand uvmx_reg_field_c  pending; ///< Receive transaction is pending
   rand uvmx_reg_field_c  en; ///< Enable the receive channel
   rand uvmx_reg_field_c  continuous; ///< 0x0: stop after last transfer for channel, 0x1: after last transfer for channel, reload buffer size and start address and restart channel


   `uvm_object_utils_begin(uvme_cvmcu_uart_rx_cfg_reg_c)
      `uvm_field_object(clear, UVM_DEFAULT)
      `uvm_field_object(pending, UVM_DEFAULT)
      `uvm_field_object(en, UVM_DEFAULT)
      `uvm_field_object(continuous, UVM_DEFAULT)
   `uvm_object_utils_end


   /**
    * Default constructor.
    */
   function new(string name="uvme_cvmcu_uart_rx_cfg_reg", int unsigned n_bits=32, int has_coverage=UVM_NO_COVERAGE);
      super.new(name, n_bits, has_coverage);
   endfunction

   /**
    * Creates and configures register fields.
    */
   virtual function void build();
      clear = uvmx_reg_field_c::type_id::create("clear");
      clear.configure(
         .parent                 (this),
         .size                   (   1),
         .lsb_pos                (   6),
         .access                 ("WO"),
         .volatile               (   0),
         .reset                  (   0),
         .has_reset              (   1),
         .is_rand                (   1),
         .individually_accessible(   1)
      );
      pending = uvmx_reg_field_c::type_id::create("pending");
      pending.configure(
         .parent                 (this),
         .size                   (   1),
         .lsb_pos                (   5),
         .access                 ("RO"),
         .volatile               (   0),
         .reset                  (   0),
         .has_reset              (   1),
         .is_rand                (   1),
         .individually_accessible(   1)
      );
      en = uvmx_reg_field_c::type_id::create("en");
      en.configure(
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
      continuous = uvmx_reg_field_c::type_id::create("continuous");
      continuous.configure(
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

endclass : uvme_cvmcu_uart_rx_cfg_reg_c


`endif // __UVME_CVMCU_UART_RX_CFG_REG_SV__