// Copyright 2023 Acme Enterprises
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// THE FOLLOWING IS GENERATED CODE: ANY CHANGES MADE WILL BE ERASED UPON THE NEXT ITERATION


`ifndef __UVME_CVMCU_CHIP_APB_GPIO_APB_GPIO_PIN2_REG_SV__
`define __UVME_CVMCU_CHIP_APB_GPIO_APB_GPIO_PIN2_REG_SV__


class uvme_cvmcu_chip_apb_gpio_apb_gpio_pin2_reg_c extends uvmx_reg_c;

   rand uvmx_reg_field_c  gpio_value; ///< gpio_value[31:0] = GPIO[95:64]


   `uvm_object_utils_begin(uvme_cvmcu_chip_apb_gpio_apb_gpio_pin2_reg_c)
      `uvm_field_object(gpio_value, UVM_DEFAULT)
   `uvm_object_utils_end


   /**
    * Default constructor.
    */
   function new(string name="uvme_cvmcu_chip_apb_gpio_apb_gpio_pin2_reg", int unsigned n_bits=32, int has_coverage=UVM_NO_COVERAGE);
      super.new(name, n_bits, has_coverage);
   endfunction

   /**
    * Creates and configures register fields.
    */
   virtual function void build();
      gpio_value = uvmx_reg_field_c::type_id::create("gpio_value");
      gpio_value.configure(
         .parent                 (this),
         .size                   (   32),
         .lsb_pos                (   0),
         .access                 ("RO"),
         .volatile               (   0),
         .reset                  (   0),
         .has_reset              (   1),
         .is_rand                (   1),
         .individually_accessible(   1)
      );
   endfunction

endclass : uvme_cvmcu_chip_apb_gpio_apb_gpio_pin2_reg_c


`endif // __UVME_CVMCU_CHIP_APB_GPIO_APB_GPIO_PIN2_REG_SV__