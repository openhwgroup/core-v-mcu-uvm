// Copyright 2022 Datum Technology Corporation
// All rights reserved
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


// WARNING: THE FOLLOWING IS GENERATED CODE.
// ANY CHANGES MADE WILL BE ERASED UPON THE NEXT RELEASE.


`ifndef __UVME_CVMCU_GPIO_TOGGPIO_REG_SV__
`define __UVME_CVMCU_GPIO_TOGGPIO_REG_SV__


class uvme_cvmcu_gpio_toggpio_reg_c extends uvmx_reg_c;

   rand uvmx_reg_field_c  gpio_num; ///< Invert the output of GPIO[gpio_num]


   `uvm_object_utils_begin(uvme_cvmcu_gpio_toggpio_reg_c)
      `uvm_field_object(gpio_num, UVM_DEFAULT)
   `uvm_object_utils_end


   /**
    * Default constructor.
    */
   function new(string name="uvme_cvmcu_gpio_toggpio_reg", int unsigned n_bits=32, int has_coverage=UVM_NO_COVERAGE);
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
         .access                 ("WO"),
         .volatile               (   0),
         .reset                  (   0),
         .has_reset              (   1),
         .is_rand                (   1),
         .individually_accessible(   1)
      );
   endfunction

endclass : uvme_cvmcu_gpio_toggpio_reg_c


`endif // __UVME_CVMCU_GPIO_TOGGPIO_REG_SV__