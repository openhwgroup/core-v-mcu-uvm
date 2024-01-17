// Copyright 2024 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// THE FOLLOWING IS GENERATED CODE: ANY CHANGES MADE WILL BE ERASED UPON THE NEXT ITERATION


`ifndef __UVME_CVMCU_CHIP_UDMA_CTRL_REG_BLOCK_SV__
`define __UVME_CVMCU_CHIP_UDMA_CTRL_REG_BLOCK_SV__


`include "uvme_cvmcu_chip_udma_ctrl_udma_clk_en_reg.sv"
`include "uvme_cvmcu_chip_udma_ctrl_udma_cfg_evt_reg.sv"
`include "uvme_cvmcu_chip_udma_ctrl_periph_reset_reg.sv"


/**
 * Top-Level Register Block for uvme_cvmcu_chip_udma_ctrl.
 * @ingroup uvme_cvmcu_chip_udma_ctrl_reg
 */
class uvme_cvmcu_chip_udma_ctrl_reg_block_c extends uvmx_reg_block_c;

   /// @name Registers
   /// @{
   rand uvme_cvmcu_chip_udma_ctrl_udma_ctrl_udma_clk_en_reg_c  udma_clk_en; ///< Enable for UART0 clock
   rand uvme_cvmcu_chip_udma_ctrl_udma_ctrl_udma_cfg_evt_reg_c  udma_cfg_evt; ///< Compare value for event0 detection
   rand uvme_cvmcu_chip_udma_ctrl_udma_ctrl_periph_reset_reg_c  periph_reset; ///< Reset for UART0
   /// @}


   `uvm_object_utils_begin(uvme_cvmcu_chip_udma_ctrl_reg_block_c)
      `uvm_field_object(udma_clk_en, UVM_DEFAULT)
      `uvm_field_object(udma_cfg_evt, UVM_DEFAULT)
      `uvm_field_object(periph_reset, UVM_DEFAULT)
   `uvm_object_utils_end


   /**
    * Default constructor.
    */
   function new(string name="uvme_cvmcu_chip_udma_ctrl_reg_block", int has_coverage=UVM_NO_COVERAGE);
      super.new(name, has_coverage);
   endfunction

   /**
    * Creates register(s).
    */
   virtual function void create_regs();
      udma_clk_en = uvme_cvmcu_chip_udma_ctrl_udma_ctrl_udma_clk_en_reg_c::type_id::create("udma_clk_en");
      udma_clk_en.configure(this);
      udma_clk_en.build();
      udma_cfg_evt = uvme_cvmcu_chip_udma_ctrl_udma_ctrl_udma_cfg_evt_reg_c::type_id::create("udma_cfg_evt");
      udma_cfg_evt.configure(this);
      udma_cfg_evt.build();
      periph_reset = uvme_cvmcu_chip_udma_ctrl_udma_ctrl_periph_reset_reg_c::type_id::create("periph_reset");
      periph_reset.configure(this);
      periph_reset.build();
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
         .rg    (udma_clk_en),
         .offset(`UVM_REG_ADDR_WIDTH'h0),
         .rights("RW")
      );
      default_map.add_reg(
         .rg    (udma_cfg_evt),
         .offset(`UVM_REG_ADDR_WIDTH'h4),
         .rights("RW")
      );
      default_map.add_reg(
         .rg    (periph_reset),
         .offset(`UVM_REG_ADDR_WIDTH'h8),
         .rights("RW")
      );
   endfunction

endclass


`endif // __UVME_CVMCU_CHIP_UDMA_CTRL_REG_BLOCK_SV__
