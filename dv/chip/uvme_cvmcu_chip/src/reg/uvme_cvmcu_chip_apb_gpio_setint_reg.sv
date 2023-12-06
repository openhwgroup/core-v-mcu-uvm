// Copyright 2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// THE FOLLOWING IS GENERATED CODE: ANY CHANGES MADE WILL BE ERASED UPON THE NEXT ITERATION


`ifndef __UVME_CVMCU_CHIP_APB_GPIO_APB_GPIO_SETINT_REG_SV__
`define __UVME_CVMCU_CHIP_APB_GPIO_APB_GPIO_SETINT_REG_SV__


class uvme_cvmcu_chip_apb_gpio_apb_gpio_setint_reg_c extends uvmx_reg_c;

   rand uvmx_reg_field_c  inttype; ///< Type of interrupt for GPIO[gpio_num]. 0x0: active low, level type interrupt. 0x1: rising edge type interupt. 0x2: falling edge type interrupt. 0x3: no interrupt. 0x4: active high, level type interrupt. 0x5 to 0x7: no interrupt.
   rand uvmx_reg_field_c  intenable; ///< Enable interrupt on GPIO[GPIO_ADDDR]
   rand uvmx_reg_field_c  gpio_num; ///< Address of GPIO to set interrupt type and enable for


   `uvm_object_utils_begin(uvme_cvmcu_chip_apb_gpio_apb_gpio_setint_reg_c)
      `uvm_field_object(inttype, UVM_DEFAULT)
      `uvm_field_object(intenable, UVM_DEFAULT)
      `uvm_field_object(gpio_num, UVM_DEFAULT)
   `uvm_object_utils_end


   /**
    * Default constructor.
    */
   function new(string name="uvme_cvmcu_chip_apb_gpio_apb_gpio_setint_reg", int unsigned n_bits=32, int has_coverage=UVM_NO_COVERAGE);
      super.new(name, n_bits, has_coverage);
   endfunction

   /**
    * Creates and configures register fields.
    */
   virtual function void build();
      inttype = uvmx_reg_field_c::type_id::create("inttype");
      inttype.configure(
         .parent                 (this),
         .size                   (   3),
         .lsb_pos                (   17),
         .access                 ("WO"),
         .volatile               (   0),
         .reset                  (   0),
         .has_reset              (   1),
         .is_rand                (   1),
         .individually_accessible(   1)
      );
      intenable = uvmx_reg_field_c::type_id::create("intenable");
      intenable.configure(
         .parent                 (this),
         .size                   (   1),
         .lsb_pos                (   16),
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

endclass


`endif // __UVME_CVMCU_CHIP_APB_GPIO_APB_GPIO_SETINT_REG_SV__