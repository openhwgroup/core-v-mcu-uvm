// Copyright 2024 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// THE FOLLOWING IS GENERATED CODE: ANY CHANGES MADE WILL BE ERASED UPON THE NEXT ITERATION


`ifndef __UVME_CVMCU_CHIP_APB_GPIO_OUT1_REG_SV__
`define __UVME_CVMCU_CHIP_APB_GPIO_OUT1_REG_SV__


class uvme_cvmcu_chip_apb_gpio_out1_reg_c extends uvmx_reg_c;

   rand uvmx_reg_field_c  value; ///< Drive value[31:0] onto GPIO[63:32]


   `uvm_object_utils_begin(uvme_cvmcu_chip_apb_gpio_out1_reg_c)
      `uvm_field_object(value, UVM_DEFAULT)
   `uvm_object_utils_end


   /**
    * Default constructor.
    */
   function new(string name="uvme_cvmcu_chip_apb_gpio_out1_reg", int unsigned n_bits=32, int has_coverage=UVM_NO_COVERAGE);
      super.new(name, n_bits, has_coverage);
   endfunction

   /**
    * Creates and configures register fields.
    */
   virtual function void build();
      value = uvmx_reg_field_c::type_id::create("value");
      value.configure(
         .parent                 (this),
         .size                   (   32),
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


`endif // __UVME_CVMCU_CHIP_APB_GPIO_OUT1_REG_SV__