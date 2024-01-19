// Copyright 2024 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// THE FOLLOWING IS GENERATED CODE: ANY CHANGES MADE WILL BE ERASED UPON THE NEXT ITERATION


`ifndef __UVME_CVMCU_CHIP_APB_GPIO_RDSTAT_REG_SV__
`define __UVME_CVMCU_CHIP_APB_GPIO_RDSTAT_REG_SV__


class uvme_cvmcu_chip_apb_gpio_rdstat_reg_c extends uvmx_reg_c;

   rand uvmx_reg_field_c  mode; ///< Read the mode control for GPIO[gpio_num] (set gpio_num using SETSEL). 0x0: Input only (output is tri-stated). 0x1: Output active. 0x2: Open drain (value=0 drives 0, when value=1 tristated). 0x3: Open drain (value=0 drives 0, when value=1 tristated).
   rand uvmx_reg_field_c  inttype; ///< Type of interrupt for GPIO[gpio_num]. 0x0: active low, level type interrupt. 0x1: rising edge type interupt. 0x2: falling edge type interrupt. 0x3: no interrupt. 0x4: active high, level type interrupt. 0x5 to 0x7: no interrupt
   rand uvmx_reg_field_c  inten; ///< Enable interrupt for GPIO[gpio_num]
   rand uvmx_reg_field_c  input_val; ///< Input value reported by GPIO[gpio_num]
   rand uvmx_reg_field_c  output_val; ///< Output value that is set on GPIO[gpio_num]
   rand uvmx_reg_field_c  gpio_sel; ///< Selected gpio


   `uvm_object_utils_begin(uvme_cvmcu_chip_apb_gpio_rdstat_reg_c)
      `uvm_field_object(mode, UVM_DEFAULT)
      `uvm_field_object(inttype, UVM_DEFAULT)
      `uvm_field_object(inten, UVM_DEFAULT)
      `uvm_field_object(input_val, UVM_DEFAULT)
      `uvm_field_object(output_val, UVM_DEFAULT)
      `uvm_field_object(gpio_sel, UVM_DEFAULT)
   `uvm_object_utils_end


   /**
    * Default constructor.
    */
   function new(string name="uvme_cvmcu_chip_apb_gpio_rdstat_reg", int unsigned n_bits=32, int has_coverage=UVM_NO_COVERAGE);
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
         .access                 ("RO"),
         .volatile               (   1),
         .reset                  (   0),
         .has_reset              (   1),
         .is_rand                (   1),
         .individually_accessible(   1)
      );
      inttype = uvmx_reg_field_c::type_id::create("inttype");
      inttype.configure(
         .parent                 (this),
         .size                   (   3),
         .lsb_pos                (   17),
         .access                 ("RO"),
         .volatile               (   1),
         .reset                  (   0),
         .has_reset              (   1),
         .is_rand                (   1),
         .individually_accessible(   1)
      );
      inten = uvmx_reg_field_c::type_id::create("inten");
      inten.configure(
         .parent                 (this),
         .size                   (   1),
         .lsb_pos                (   16),
         .access                 ("RW"),
         .volatile               (   1),
         .reset                  (   0),
         .has_reset              (   1),
         .is_rand                (   1),
         .individually_accessible(   1)
      );
      input_val = uvmx_reg_field_c::type_id::create("input_val");
      input_val.configure(
         .parent                 (this),
         .size                   (   1),
         .lsb_pos                (   12),
         .access                 ("RO"),
         .volatile               (   1),
         .reset                  (   0),
         .has_reset              (   1),
         .is_rand                (   1),
         .individually_accessible(   1)
      );
      output_val = uvmx_reg_field_c::type_id::create("output_val");
      output_val.configure(
         .parent                 (this),
         .size                   (   1),
         .lsb_pos                (   8),
         .access                 ("RO"),
         .volatile               (   1),
         .reset                  (   0),
         .has_reset              (   1),
         .is_rand                (   1),
         .individually_accessible(   1)
      );
      gpio_sel = uvmx_reg_field_c::type_id::create("gpio_sel");
      gpio_sel.configure(
         .parent                 (this),
         .size                   (   8),
         .lsb_pos                (   0),
         .access                 ("RO"),
         .volatile               (   1),
         .reset                  (   0),
         .has_reset              (   1),
         .is_rand                (   1),
         .individually_accessible(   1)
      );
   endfunction

endclass


`endif // __UVME_CVMCU_CHIP_APB_GPIO_RDSTAT_REG_SV__