// Copyright 2022-2023 Datum Technology Corporation
// All rights reserved
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


// WARNING: THE FOLLOWING IS GENERATED CODE.
// ANY CHANGES MADE WILL BE ERASED UPON THE NEXT RELEASE.


`ifndef __UVME_CVMCU_GPIO_REG_BLOCK_SV__
`define __UVME_CVMCU_GPIO_REG_BLOCK_SV__


`include "uvme_cvmcu_gpio_setgpio_reg.sv"
`include "uvme_cvmcu_gpio_clrgpio_reg.sv"
`include "uvme_cvmcu_gpio_toggpio_reg.sv"
`include "uvme_cvmcu_gpio_pin0_reg.sv"
`include "uvme_cvmcu_gpio_pin1_reg.sv"
`include "uvme_cvmcu_gpio_pin2_reg.sv"
`include "uvme_cvmcu_gpio_pin3_reg.sv"
`include "uvme_cvmcu_gpio_out0_reg.sv"
`include "uvme_cvmcu_gpio_out1_reg.sv"
`include "uvme_cvmcu_gpio_out2_reg.sv"
`include "uvme_cvmcu_gpio_out3_reg.sv"
`include "uvme_cvmcu_gpio_setsel_reg.sv"
`include "uvme_cvmcu_gpio_rdstat_reg.sv"
`include "uvme_cvmcu_gpio_setmode_reg.sv"
`include "uvme_cvmcu_gpio_setint_reg.sv"
`include "uvme_cvmcu_gpio_intack_reg.sv"


/**
 * Top-Level Register Block for cvmcu_gpio.
 */
class uvme_cvmcu_gpio_reg_block_c extends uvmx_reg_block_c;

   /// @name Registers
   /// @{
  rand uvme_cvmcu_gpio_setgpio_reg_c  setgpio;
  rand uvme_cvmcu_gpio_clrgpio_reg_c  clrgpio;
  rand uvme_cvmcu_gpio_toggpio_reg_c  toggpio;
  rand uvme_cvmcu_gpio_pin0_reg_c  pin0;
  rand uvme_cvmcu_gpio_pin1_reg_c  pin1;
  rand uvme_cvmcu_gpio_pin2_reg_c  pin2;
  rand uvme_cvmcu_gpio_pin3_reg_c  pin3;
  rand uvme_cvmcu_gpio_out0_reg_c  out0;
  rand uvme_cvmcu_gpio_out1_reg_c  out1;
  rand uvme_cvmcu_gpio_out2_reg_c  out2;
  rand uvme_cvmcu_gpio_out3_reg_c  out3;
  rand uvme_cvmcu_gpio_setsel_reg_c  setsel;
  rand uvme_cvmcu_gpio_rdstat_reg_c  rdstat;
  rand uvme_cvmcu_gpio_setmode_reg_c  setmode;
  rand uvme_cvmcu_gpio_setint_reg_c  setint;
  rand uvme_cvmcu_gpio_intack_reg_c  intack;
   /// @}


   `uvm_object_utils_begin(uvme_cvmcu_gpio_reg_block_c)
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
   function new(string name="uvme_cvmcu_gpio_reg_block", int has_coverage=UVM_NO_COVERAGE);
      super.new(name, has_coverage);
   endfunction

   /**
    * Creates register(s).
    */
   virtual function void create_regs();
      setgpio = uvme_cvmcu_gpio_setgpio_reg_c::type_id::create("setgpio");
      setgpio.configure(this);
      setgpio.build();   
      clrgpio = uvme_cvmcu_gpio_clrgpio_reg_c::type_id::create("clrgpio");
      clrgpio.configure(this);
      clrgpio.build();   
      toggpio = uvme_cvmcu_gpio_toggpio_reg_c::type_id::create("toggpio");
      toggpio.configure(this);
      toggpio.build();   
      pin0 = uvme_cvmcu_gpio_pin0_reg_c::type_id::create("pin0");
      pin0.configure(this);
      pin0.build();   
      pin1 = uvme_cvmcu_gpio_pin1_reg_c::type_id::create("pin1");
      pin1.configure(this);
      pin1.build();   
      pin2 = uvme_cvmcu_gpio_pin2_reg_c::type_id::create("pin2");
      pin2.configure(this);
      pin2.build();   
      pin3 = uvme_cvmcu_gpio_pin3_reg_c::type_id::create("pin3");
      pin3.configure(this);
      pin3.build();   
      out0 = uvme_cvmcu_gpio_out0_reg_c::type_id::create("out0");
      out0.configure(this);
      out0.build();   
      out1 = uvme_cvmcu_gpio_out1_reg_c::type_id::create("out1");
      out1.configure(this);
      out1.build();   
      out2 = uvme_cvmcu_gpio_out2_reg_c::type_id::create("out2");
      out2.configure(this);
      out2.build();   
      out3 = uvme_cvmcu_gpio_out3_reg_c::type_id::create("out3");
      out3.configure(this);
      out3.build();   
      setsel = uvme_cvmcu_gpio_setsel_reg_c::type_id::create("setsel");
      setsel.configure(this);
      setsel.build();   
      rdstat = uvme_cvmcu_gpio_rdstat_reg_c::type_id::create("rdstat");
      rdstat.configure(this);
      rdstat.build();   
      setmode = uvme_cvmcu_gpio_setmode_reg_c::type_id::create("setmode");
      setmode.configure(this);
      setmode.build();   
      setint = uvme_cvmcu_gpio_setint_reg_c::type_id::create("setint");
      setint.configure(this);
      setint.build();   
      intack = uvme_cvmcu_gpio_intack_reg_c::type_id::create("intack");
      intack.configure(this);
      intack.build();   
   endfunction

   /**
    * Creates default register map.
    */
   virtual function void create_reg_map();
      // Create default register map (default_map)
      default_map = create_map(
         .name     ("default_map"),
         .base_addr(32'h1a10_1000),
         .n_bytes  (4),
         .endian   (UVM_LITTLE_ENDIAN)
      );
   endfunction

   /**
    * Adds register(s) to register map.
    */
   virtual function void add_regs_to_map();
      default_map.add_reg(
         .rg    (setgpio),
         .offset(32'h00),
         .rights("RW")
      );
      default_map.add_reg(
         .rg    (clrgpio),
         .offset(32'h04),
         .rights("RW")
      );
      default_map.add_reg(
         .rg    (toggpio),
         .offset(32'h08),
         .rights("RW")
      );
      default_map.add_reg(
         .rg    (pin0),
         .offset(32'h10),
         .rights("RW")
      );
      default_map.add_reg(
         .rg    (pin1),
         .offset(32'h14),
         .rights("RW")
      );
      default_map.add_reg(
         .rg    (pin2),
         .offset(32'h18),
         .rights("RW")
      );
      default_map.add_reg(
         .rg    (pin3),
         .offset(32'h1c),
         .rights("RW")
      );
      default_map.add_reg(
         .rg    (out0),
         .offset(32'h20),
         .rights("RW")
      );
      default_map.add_reg(
         .rg    (out1),
         .offset(32'h24),
         .rights("RW")
      );
      default_map.add_reg(
         .rg    (out2),
         .offset(32'h28),
         .rights("RW")
      );
      default_map.add_reg(
         .rg    (out3),
         .offset(32'h2c),
         .rights("RW")
      );
      default_map.add_reg(
         .rg    (setsel),
         .offset(32'h30),
         .rights("RW")
      );
      default_map.add_reg(
         .rg    (rdstat),
         .offset(32'h34),
         .rights("RW")
      );
      default_map.add_reg(
         .rg    (setmode),
         .offset(32'h38),
         .rights("RW")
      );
      default_map.add_reg(
         .rg    (setint),
         .offset(32'h3c),
         .rights("RW")
      );
      default_map.add_reg(
         .rg    (intack),
         .offset(32'h40),
         .rights("RW")
      );
   endfunction

endclass : uvme_cvmcu_gpio_reg_block_c


`endif // _UVME_CVMCU_GPIO_REG_BLOCK_SV__
