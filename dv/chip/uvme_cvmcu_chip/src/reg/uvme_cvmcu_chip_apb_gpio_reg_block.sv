// Copyright 2024 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// THE FOLLOWING IS GENERATED CODE: ANY CHANGES MADE WILL BE ERASED UPON THE NEXT ITERATION


`ifndef __UVME_CVMCU_CHIP_APB_GPIO_REG_BLOCK_SV__
`define __UVME_CVMCU_CHIP_APB_GPIO_REG_BLOCK_SV__


`include "uvme_cvmcu_chip_apb_gpio_setgpio_reg.sv"
`include "uvme_cvmcu_chip_apb_gpio_clrgpio_reg.sv"
`include "uvme_cvmcu_chip_apb_gpio_toggpio_reg.sv"
`include "uvme_cvmcu_chip_apb_gpio_pin0_reg.sv"
`include "uvme_cvmcu_chip_apb_gpio_pin1_reg.sv"
`include "uvme_cvmcu_chip_apb_gpio_pin2_reg.sv"
`include "uvme_cvmcu_chip_apb_gpio_pin3_reg.sv"
`include "uvme_cvmcu_chip_apb_gpio_out0_reg.sv"
`include "uvme_cvmcu_chip_apb_gpio_out1_reg.sv"
`include "uvme_cvmcu_chip_apb_gpio_out2_reg.sv"
`include "uvme_cvmcu_chip_apb_gpio_out3_reg.sv"
`include "uvme_cvmcu_chip_apb_gpio_setsel_reg.sv"
`include "uvme_cvmcu_chip_apb_gpio_rdstat_reg.sv"
`include "uvme_cvmcu_chip_apb_gpio_setmode_reg.sv"
`include "uvme_cvmcu_chip_apb_gpio_setint_reg.sv"
`include "uvme_cvmcu_chip_apb_gpio_intack_reg.sv"


/**
 * Top-Level Register Block for uvme_cvmcu_chip_apb_gpio.
 * @ingroup uvme_cvmcu_chip_apb_gpio_reg
 */
class uvme_cvmcu_chip_apb_gpio_reg_block_c extends uvmx_reg_block_c;

   /// @name Registers
   /// @{
   rand uvme_cvmcu_chip_apb_gpio_apb_gpio_setgpio_reg_c  setgpio; ///< Set GPIO[gpio_num] = 1
   rand uvme_cvmcu_chip_apb_gpio_apb_gpio_clrgpio_reg_c  clrgpio; ///< Set GPIO[gpio_num] = 0
   rand uvme_cvmcu_chip_apb_gpio_apb_gpio_toggpio_reg_c  toggpio; ///< Invert the output of GPIO[gpio_num]
   rand uvme_cvmcu_chip_apb_gpio_apb_gpio_pin0_reg_c  pin0; ///< gpio_value[31:0] = GPIO[31:0]
   rand uvme_cvmcu_chip_apb_gpio_apb_gpio_pin1_reg_c  pin1; ///< gpio_value[31:0] = GPIO[63:32]
   rand uvme_cvmcu_chip_apb_gpio_apb_gpio_pin2_reg_c  pin2; ///< gpio_value[31:0] = GPIO[95:64]
   rand uvme_cvmcu_chip_apb_gpio_apb_gpio_pin3_reg_c  pin3; ///< gpio_value[31:0] = GPIO[127:96]
   rand uvme_cvmcu_chip_apb_gpio_apb_gpio_out0_reg_c  out0; ///< Drive value[31:0] onto GPIO[31:0]
   rand uvme_cvmcu_chip_apb_gpio_apb_gpio_out1_reg_c  out1; ///< Drive value[31:0] onto GPIO[63:32]
   rand uvme_cvmcu_chip_apb_gpio_apb_gpio_out2_reg_c  out2; ///< Drive value[31:0] onto GPIO[95:64]
   rand uvme_cvmcu_chip_apb_gpio_apb_gpio_out3_reg_c  out3; ///< Drive value[31:0] onto GPIO[127:96]
   rand uvme_cvmcu_chip_apb_gpio_apb_gpio_setsel_reg_c  setsel; ///< Set gpio_num for use by RDSTAT. Note: SETGPIO, CLRGPIO, TOGGPIO and SETINT set gpio_num
   rand uvme_cvmcu_chip_apb_gpio_apb_gpio_rdstat_reg_c  rdstat; ///< Read the mode control for GPIO[gpio_num] (set gpio_num using SETSEL). 0x0: Input only (output is tri-stated). 0x1: Output active. 0x2: Open drain (value=0 drives 0, when value=1 tristated). 0x3: Open drain (value=0 drives 0, when value=1 tristated).
   rand uvme_cvmcu_chip_apb_gpio_apb_gpio_setmode_reg_c  setmode; ///< mode control for GPIO[gpio_num}. 0x0: Input only (output is tri-stated). 0x1: Output active. 0x2: Open drain (value=0 drives 0, when value=1 tristated). 0x3: Open drain (value=0 drives 0, when value=1 tristated)
   rand uvme_cvmcu_chip_apb_gpio_apb_gpio_setint_reg_c  setint; ///< Type of interrupt for GPIO[gpio_num]. 0x0: active low, level type interrupt. 0x1: rising edge type interupt. 0x2: falling edge type interrupt. 0x3: no interrupt. 0x4: active high, level type interrupt. 0x5 to 0x7: no interrupt.
   rand uvme_cvmcu_chip_apb_gpio_apb_gpio_intack_reg_c  intack; ///< Input value reported by GPIO[gpio_num]
   /// @}


   `uvm_object_utils_begin(uvme_cvmcu_chip_apb_gpio_reg_block_c)
      `uvm_field_object(setgpio, UVM_DEFAULT)
      `uvm_field_object(clrgpio, UVM_DEFAULT)
      `uvm_field_object(toggpio, UVM_DEFAULT)
      `uvm_field_object(pin0, UVM_DEFAULT)
      `uvm_field_object(pin1, UVM_DEFAULT)
      `uvm_field_object(pin2, UVM_DEFAULT)
      `uvm_field_object(pin3, UVM_DEFAULT)
      `uvm_field_object(out0, UVM_DEFAULT)
      `uvm_field_object(out1, UVM_DEFAULT)
      `uvm_field_object(out2, UVM_DEFAULT)
      `uvm_field_object(out3, UVM_DEFAULT)
      `uvm_field_object(setsel, UVM_DEFAULT)
      `uvm_field_object(rdstat, UVM_DEFAULT)
      `uvm_field_object(setmode, UVM_DEFAULT)
      `uvm_field_object(setint, UVM_DEFAULT)
      `uvm_field_object(intack, UVM_DEFAULT)
   `uvm_object_utils_end


   /**
    * Default constructor.
    */
   function new(string name="uvme_cvmcu_chip_apb_gpio_reg_block", int has_coverage=UVM_NO_COVERAGE);
      super.new(name, has_coverage);
   endfunction

   /**
    * Creates register(s).
    */
   virtual function void create_regs();
      setgpio = uvme_cvmcu_chip_apb_gpio_apb_gpio_setgpio_reg_c::type_id::create("setgpio");
      setgpio.configure(this);
      setgpio.build();
      clrgpio = uvme_cvmcu_chip_apb_gpio_apb_gpio_clrgpio_reg_c::type_id::create("clrgpio");
      clrgpio.configure(this);
      clrgpio.build();
      toggpio = uvme_cvmcu_chip_apb_gpio_apb_gpio_toggpio_reg_c::type_id::create("toggpio");
      toggpio.configure(this);
      toggpio.build();
      pin0 = uvme_cvmcu_chip_apb_gpio_apb_gpio_pin0_reg_c::type_id::create("pin0");
      pin0.configure(this);
      pin0.build();
      pin1 = uvme_cvmcu_chip_apb_gpio_apb_gpio_pin1_reg_c::type_id::create("pin1");
      pin1.configure(this);
      pin1.build();
      pin2 = uvme_cvmcu_chip_apb_gpio_apb_gpio_pin2_reg_c::type_id::create("pin2");
      pin2.configure(this);
      pin2.build();
      pin3 = uvme_cvmcu_chip_apb_gpio_apb_gpio_pin3_reg_c::type_id::create("pin3");
      pin3.configure(this);
      pin3.build();
      out0 = uvme_cvmcu_chip_apb_gpio_apb_gpio_out0_reg_c::type_id::create("out0");
      out0.configure(this);
      out0.build();
      out1 = uvme_cvmcu_chip_apb_gpio_apb_gpio_out1_reg_c::type_id::create("out1");
      out1.configure(this);
      out1.build();
      out2 = uvme_cvmcu_chip_apb_gpio_apb_gpio_out2_reg_c::type_id::create("out2");
      out2.configure(this);
      out2.build();
      out3 = uvme_cvmcu_chip_apb_gpio_apb_gpio_out3_reg_c::type_id::create("out3");
      out3.configure(this);
      out3.build();
      setsel = uvme_cvmcu_chip_apb_gpio_apb_gpio_setsel_reg_c::type_id::create("setsel");
      setsel.configure(this);
      setsel.build();
      rdstat = uvme_cvmcu_chip_apb_gpio_apb_gpio_rdstat_reg_c::type_id::create("rdstat");
      rdstat.configure(this);
      rdstat.build();
      setmode = uvme_cvmcu_chip_apb_gpio_apb_gpio_setmode_reg_c::type_id::create("setmode");
      setmode.configure(this);
      setmode.build();
      setint = uvme_cvmcu_chip_apb_gpio_apb_gpio_setint_reg_c::type_id::create("setint");
      setint.configure(this);
      setint.build();
      intack = uvme_cvmcu_chip_apb_gpio_apb_gpio_intack_reg_c::type_id::create("intack");
      intack.configure(this);
      intack.build();
   endfunction

   /**
    * Creates address maps.
    */
   virtual function void create_maps();
      // Create default register map (default_map)
      default_map = create_map(
         .name     ("default_map"),
         .base_addr(`UVM_REG_ADDR_WIDTH'h0),
         .n_bytes  (4),
         .endian   (UVM_LITTLE_ENDIAN)
      );
   endfunction

   /**
    * Adds registers to address maps.
    */
   virtual function void add_regs_to_map();
      default_map.add_reg(
         .rg    (setgpio),
         .offset(`UVM_REG_ADDR_WIDTH'h0),
         .rights("WO")
      );
      default_map.add_reg(
         .rg    (clrgpio),
         .offset(`UVM_REG_ADDR_WIDTH'h4),
         .rights("WO")
      );
      default_map.add_reg(
         .rg    (toggpio),
         .offset(`UVM_REG_ADDR_WIDTH'h8),
         .rights("WO")
      );
      default_map.add_reg(
         .rg    (pin0),
         .offset(`UVM_REG_ADDR_WIDTH'h10),
         .rights("RO")
      );
      default_map.add_reg(
         .rg    (pin1),
         .offset(`UVM_REG_ADDR_WIDTH'h14),
         .rights("RO")
      );
      default_map.add_reg(
         .rg    (pin2),
         .offset(`UVM_REG_ADDR_WIDTH'h18),
         .rights("RO")
      );
      default_map.add_reg(
         .rg    (pin3),
         .offset(`UVM_REG_ADDR_WIDTH'h1c),
         .rights("RO")
      );
      default_map.add_reg(
         .rg    (out0),
         .offset(`UVM_REG_ADDR_WIDTH'h20),
         .rights("WO")
      );
      default_map.add_reg(
         .rg    (out1),
         .offset(`UVM_REG_ADDR_WIDTH'h24),
         .rights("WO")
      );
      default_map.add_reg(
         .rg    (out2),
         .offset(`UVM_REG_ADDR_WIDTH'h28),
         .rights("WO")
      );
      default_map.add_reg(
         .rg    (out3),
         .offset(`UVM_REG_ADDR_WIDTH'h2c),
         .rights("WO")
      );
      default_map.add_reg(
         .rg    (setsel),
         .offset(`UVM_REG_ADDR_WIDTH'h30),
         .rights("WO")
      );
      default_map.add_reg(
         .rg    (rdstat),
         .offset(`UVM_REG_ADDR_WIDTH'h34),
         .rights("RW")
      );
      default_map.add_reg(
         .rg    (setmode),
         .offset(`UVM_REG_ADDR_WIDTH'h38),
         .rights("WO")
      );
      default_map.add_reg(
         .rg    (setint),
         .offset(`UVM_REG_ADDR_WIDTH'h3c),
         .rights("WO")
      );
      default_map.add_reg(
         .rg    (intack),
         .offset(`UVM_REG_ADDR_WIDTH'h40),
         .rights("RW")
      );
   endfunction

endclass


`endif // __UVME_CVMCU_CHIP_APB_GPIO_REG_BLOCK_SV__
