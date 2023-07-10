// Copyright 2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// THE FOLLOWING IS GENERATED CODE: ANY CHANGES MADE WILL BE ERASED UPON THE NEXT ITERATION


`ifndef __UVME_APB_TIMER_SS_REG_BLOCK_SV__
`define __UVME_APB_TIMER_SS_REG_BLOCK_SV__


`include "uvme_apb_timer_ss_cfg_reg_low_reg.sv"
`include "uvme_apb_timer_ss_cfg_reg_hi_reg.sv"
`include "uvme_apb_timer_ss_timer_val_lo_reg.sv"
`include "uvme_apb_timer_ss_timer_val_hi_reg.sv"
`include "uvme_apb_timer_ss_timer_cmp_lo_reg.sv"
`include "uvme_apb_timer_ss_timer_cmp_hi_reg.sv"
`include "uvme_apb_timer_ss_timer_start_lo_reg.sv"
`include "uvme_apb_timer_ss_timer_start_hi_reg.sv"
`include "uvme_apb_timer_ss_timer_reset_lo_reg.sv"
`include "uvme_apb_timer_ss_timer_reset_hi_reg.sv"


/**
 * Top-Level Register Block for uvme_apb_timer_ss.
 * @ingroup uvme_apb_timer_ss_reg
 */
class uvme_apb_timer_ss_reg_block_c extends uvmx_reg_block_c;

   /// @name Registers
   /// @{
   rand uvme_apb_timer_ss_cfg_reg_low_reg_c  cfg_reg_low; ///< 1 = 64-bit mode, 0=32-bit mode
   rand uvme_apb_timer_ss_cfg_reg_hi_reg_c  cfg_reg_hi; ///< 1 = 64-bit mode, 0=32-bit mode
   rand uvme_apb_timer_ss_timer_val_lo_reg_c  timer_val_lo; ///< 32-bit counter value low 32-bits in 64-bit mode
   rand uvme_apb_timer_ss_timer_val_hi_reg_c  timer_val_hi; ///< 32-bit counter value high 32-bits in 64-bit mode
   rand uvme_apb_timer_ss_timer_cmp_lo_reg_c  timer_cmp_lo; ///< compare value for low 32-bit counter
   rand uvme_apb_timer_ss_timer_cmp_hi_reg_c  timer_cmp_hi; ///< compare value for high 32-bit counter
   rand uvme_apb_timer_ss_timer_start_lo_reg_c  timer_start_lo; ///< Write strobe address for starting low counter
   rand uvme_apb_timer_ss_timer_start_hi_reg_c  timer_start_hi; ///< Write strobe address for starting high counter
   rand uvme_apb_timer_ss_timer_reset_lo_reg_c  timer_reset_lo; ///< Write strobe address for resetting the low counter
   rand uvme_apb_timer_ss_timer_reset_hi_reg_c  timer_reset_hi; ///< Write strobe address for resetting the high counter
   /// @}


   `uvm_object_utils_begin(uvme_apb_timer_ss_reg_block_c)
      `uvm_field_object(cfg_reg_low, UVM_DEFAULT)
      `uvm_field_object(cfg_reg_hi, UVM_DEFAULT)
      `uvm_field_object(timer_val_lo, UVM_DEFAULT)
      `uvm_field_object(timer_val_hi, UVM_DEFAULT)
      `uvm_field_object(timer_cmp_lo, UVM_DEFAULT)
      `uvm_field_object(timer_cmp_hi, UVM_DEFAULT)
      `uvm_field_object(timer_start_lo, UVM_DEFAULT)
      `uvm_field_object(timer_start_hi, UVM_DEFAULT)
      `uvm_field_object(timer_reset_lo, UVM_DEFAULT)
      `uvm_field_object(timer_reset_hi, UVM_DEFAULT)
   `uvm_object_utils_end


   /**
    * Default constructor.
    */
   function new(string name="uvme_apb_timer_ss_reg_block", int has_coverage=UVM_NO_COVERAGE);
      super.new(name, has_coverage);
   endfunction

   /**
    * Creates register(s).
    */
   virtual function void create_regs();
      cfg_reg_low = uvme_apb_timer_ss_cfg_reg_low_reg_c::type_id::create("cfg_reg_low");
      cfg_reg_low.configure(this);
      cfg_reg_low.build();
      cfg_reg_hi = uvme_apb_timer_ss_cfg_reg_hi_reg_c::type_id::create("cfg_reg_hi");
      cfg_reg_hi.configure(this);
      cfg_reg_hi.build();
      timer_val_lo = uvme_apb_timer_ss_timer_val_lo_reg_c::type_id::create("timer_val_lo");
      timer_val_lo.configure(this);
      timer_val_lo.build();
      timer_val_hi = uvme_apb_timer_ss_timer_val_hi_reg_c::type_id::create("timer_val_hi");
      timer_val_hi.configure(this);
      timer_val_hi.build();
      timer_cmp_lo = uvme_apb_timer_ss_timer_cmp_lo_reg_c::type_id::create("timer_cmp_lo");
      timer_cmp_lo.configure(this);
      timer_cmp_lo.build();
      timer_cmp_hi = uvme_apb_timer_ss_timer_cmp_hi_reg_c::type_id::create("timer_cmp_hi");
      timer_cmp_hi.configure(this);
      timer_cmp_hi.build();
      timer_start_lo = uvme_apb_timer_ss_timer_start_lo_reg_c::type_id::create("timer_start_lo");
      timer_start_lo.configure(this);
      timer_start_lo.build();
      timer_start_hi = uvme_apb_timer_ss_timer_start_hi_reg_c::type_id::create("timer_start_hi");
      timer_start_hi.configure(this);
      timer_start_hi.build();
      timer_reset_lo = uvme_apb_timer_ss_timer_reset_lo_reg_c::type_id::create("timer_reset_lo");
      timer_reset_lo.configure(this);
      timer_reset_lo.build();
      timer_reset_hi = uvme_apb_timer_ss_timer_reset_hi_reg_c::type_id::create("timer_reset_hi");
      timer_reset_hi.configure(this);
      timer_reset_hi.build();
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
         .rg    (cfg_reg_low),
         .offset(`UVM_REG_ADDR_WIDTH'h0),
         .rights("RW")
      );
      default_map.add_reg(
         .rg    (cfg_reg_hi),
         .offset(`UVM_REG_ADDR_WIDTH'h4),
         .rights("RW")
      );
      default_map.add_reg(
         .rg    (timer_val_lo),
         .offset(`UVM_REG_ADDR_WIDTH'h8),
         .rights("RW")
      );
      default_map.add_reg(
         .rg    (timer_val_hi),
         .offset(`UVM_REG_ADDR_WIDTH'hc),
         .rights("RW")
      );
      default_map.add_reg(
         .rg    (timer_cmp_lo),
         .offset(`UVM_REG_ADDR_WIDTH'h10),
         .rights("RW")
      );
      default_map.add_reg(
         .rg    (timer_cmp_hi),
         .offset(`UVM_REG_ADDR_WIDTH'h14),
         .rights("RW")
      );
      default_map.add_reg(
         .rg    (timer_start_lo),
         .offset(`UVM_REG_ADDR_WIDTH'h18),
         .rights("WO")
      );
      default_map.add_reg(
         .rg    (timer_start_hi),
         .offset(`UVM_REG_ADDR_WIDTH'h1c),
         .rights("WO")
      );
      default_map.add_reg(
         .rg    (timer_reset_lo),
         .offset(`UVM_REG_ADDR_WIDTH'h20),
         .rights("WO")
      );
      default_map.add_reg(
         .rg    (timer_reset_hi),
         .offset(`UVM_REG_ADDR_WIDTH'h24),
         .rights("WO")
      );
   endfunction

endclass : uvme_apb_timer_ss_reg_block_c


`endif // __UVME_APB_TIMER_SS_REG_BLOCK_SV__
