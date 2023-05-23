// Copyright 2023 Acme Enterprises
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// THE FOLLOWING IS GENERATED CODE: ANY CHANGES MADE WILL BE ERASED UPON THE NEXT ITERATION


`ifndef __UVME_CVMCU_CHIP_APB_GPIO_APB_GPIO_SETMODE_REG_SV__
`define __UVME_CVMCU_CHIP_APB_GPIO_APB_GPIO_SETMODE_REG_SV__


class uvme_cvmcu_chip_apb_gpio_apb_gpio_setmode_reg_c extends uvmx_reg_c;

   rand uvmx_reg_field_c  mode; ///< mode control for GPIO[gpio_num}. 0x0: Input only (output is tri-stated). 0x1: Output active. 0x2: Open drain (value=0 drives 0, when value=1 tristated). 0x3: Open drain (value=0 drives 0, when value=1 tristated)
   rand uvmx_reg_field_c  gpio_num; ///< Address of GPIO to set mode for


   `uvm_object_utils_begin(uvme_cvmcu_chip_apb_gpio_apb_gpio_setmode_reg_c)
      `uvm_field_object(mode, UVM_DEFAULT)
      `uvm_field_object(gpio_num, UVM_DEFAULT)
   `uvm_object_utils_end


   /**
    * Default constructor.
    */
   function new(string name="uvme_cvmcu_chip_apb_gpio_apb_gpio_setmode_reg", int unsigned n_bits=32, int has_coverage=UVM_NO_COVERAGE);
      super.new(name, n_bits, has_coverage);
   endfunction

   /**
    * Creates and configures register fields.
    */
   virtual function void build();
      mode = uvmx_reg_field_c::type_id::create("mode");
      mode.configure(
         .parent                 (this),
         .size                   (   2),
         .lsb_pos                (   24),
         .access                 ("WO"),
         .volatile               (   0),
         .reset                  (   0),
         .has_reset              (   1),
         .is_rand                (   1),
         .individually_accessible(   1)
      );
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

endclass : uvme_cvmcu_chip_apb_gpio_apb_gpio_setmode_reg_c


`endif // __UVME_CVMCU_CHIP_APB_GPIO_APB_GPIO_SETMODE_REG_SV__