// Copyright 2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// THE FOLLOWING IS GENERATED CODE: ANY CHANGES MADE WILL BE ERASED UPON THE NEXT ITERATION


`ifndef __UVME_CVMCU_CHIP_APB_GPIO_APB_GPIO_INTACK_REG_SV__
`define __UVME_CVMCU_CHIP_APB_GPIO_APB_GPIO_INTACK_REG_SV__


class uvme_cvmcu_chip_apb_gpio_apb_gpio_intack_reg_c extends uvmx_reg_c;

   rand uvmx_reg_field_c  gpio_num; ///< Input value reported by GPIO[gpio_num]
   rand uvmx_reg_field_c  reserved; ///< Enable interrupt for GPIO[gpio_num]


   `uvm_object_utils_begin(uvme_cvmcu_chip_apb_gpio_apb_gpio_intack_reg_c)
      `uvm_field_object(gpio_num, UVM_DEFAULT)
      `uvm_field_object(reserved, UVM_DEFAULT)
   `uvm_object_utils_end


   /**
    * Default constructor.
    */
   function new(string name="uvme_cvmcu_chip_apb_gpio_apb_gpio_intack_reg", int unsigned n_bits=32, int has_coverage=UVM_NO_COVERAGE);
      super.new(name, n_bits, has_coverage);
   endfunction

   /**
    * Creates and configures register fields.
    */
   virtual function void build();
      gpio_num = uvmx_reg_field_c::type_id::create("gpio_num");
      gpio_num.configure(
         .parent                 (this),
         .size                   (   8),
         .lsb_pos                (   0),
         .access                 ("RW"),
         .volatile               (   0),
         .reset                  (   0),
         .has_reset              (   1),
         .is_rand                (   1),
         .individually_accessible(   1)
      );
      reserved = uvmx_reg_field_c::type_id::create("reserved");
      reserved.configure(
         .parent                 (this),
         .size                   (   24),
         .lsb_pos                (   8),
         .access                 ("RW"),
         .volatile               (   0),
         .reset                  (   0),
         .has_reset              (   1),
         .is_rand                (   1),
         .individually_accessible(   1)
      );
   endfunction

endclass


`endif // __UVME_CVMCU_CHIP_APB_GPIO_APB_GPIO_INTACK_REG_SV__