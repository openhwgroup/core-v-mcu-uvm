// Copyright 2024 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// THE FOLLOWING IS GENERATED CODE: ANY CHANGES MADE WILL BE ERASED UPON THE NEXT ITERATION


`ifndef __UVME_CVMCU_CHIP_APB_EVENT_CTRL_REG_BLOCK_SV__
`define __UVME_CVMCU_CHIP_APB_EVENT_CTRL_REG_BLOCK_SV__


`include "uvme_cvmcu_chip_apb_event_ctrl_apb_events_reg.sv"
`include "uvme_cvmcu_chip_apb_event_ctrl_event_mask0_reg.sv"
`include "uvme_cvmcu_chip_apb_event_ctrl_event_mask1_reg.sv"
`include "uvme_cvmcu_chip_apb_event_ctrl_event_mask2_reg.sv"
`include "uvme_cvmcu_chip_apb_event_ctrl_event_mask3_reg.sv"
`include "uvme_cvmcu_chip_apb_event_ctrl_event_mask4_reg.sv"
`include "uvme_cvmcu_chip_apb_event_ctrl_event_mask5_reg.sv"
`include "uvme_cvmcu_chip_apb_event_ctrl_event_mask6_reg.sv"
`include "uvme_cvmcu_chip_apb_event_ctrl_event_mask7_reg.sv"
`include "uvme_cvmcu_chip_apb_event_ctrl_event_err0_reg.sv"
`include "uvme_cvmcu_chip_apb_event_ctrl_event_err1_reg.sv"
`include "uvme_cvmcu_chip_apb_event_ctrl_event_err2_reg.sv"
`include "uvme_cvmcu_chip_apb_event_ctrl_event_err3_reg.sv"
`include "uvme_cvmcu_chip_apb_event_ctrl_event_err4_reg.sv"
`include "uvme_cvmcu_chip_apb_event_ctrl_event_err5_reg.sv"
`include "uvme_cvmcu_chip_apb_event_ctrl_event_err6_reg.sv"
`include "uvme_cvmcu_chip_apb_event_ctrl_event_err7_reg.sv"
`include "uvme_cvmcu_chip_apb_event_ctrl_timer_lo_event_reg.sv"
`include "uvme_cvmcu_chip_apb_event_ctrl_timer_hi_event_reg.sv"
`include "uvme_cvmcu_chip_apb_event_ctrl_event_fifo_reg.sv"


/**
 * Top-Level Register Block for uvme_cvmcu_chip_apb_event_ctrl.
 * @ingroup uvme_cvmcu_chip_apb_event_ctrl_reg
 */
class uvme_cvmcu_chip_apb_event_ctrl_reg_block_c extends uvmx_reg_block_c;

   /// @name Registers
   /// @{
   rand uvme_cvmcu_chip_apb_event_ctrl_apb_events_reg_c  apb_events; ///< 16-bits of software generated events
   rand uvme_cvmcu_chip_apb_event_ctrl_event_mask0_reg_c  event_mask0; ///< individual masks for events 0 - 31 1=mask event
   rand uvme_cvmcu_chip_apb_event_ctrl_event_mask1_reg_c  event_mask1; ///< individual masks for events 32 - 63 1=mask event
   rand uvme_cvmcu_chip_apb_event_ctrl_event_mask2_reg_c  event_mask2; ///< individual masks for events 64 - 95 1=mask event
   rand uvme_cvmcu_chip_apb_event_ctrl_event_mask3_reg_c  event_mask3; ///< individual masks for events 96 - 127 1=mask event
   rand uvme_cvmcu_chip_apb_event_ctrl_event_mask4_reg_c  event_mask4; ///< individual masks for events 128 - 159 1=mask event
   rand uvme_cvmcu_chip_apb_event_ctrl_event_mask5_reg_c  event_mask5; ///< individual masks for events 160 - 191 1=mask event
   rand uvme_cvmcu_chip_apb_event_ctrl_event_mask6_reg_c  event_mask6; ///< individual masks for events 192 - 223 1=mask event
   rand uvme_cvmcu_chip_apb_event_ctrl_event_mask7_reg_c  event_mask7; ///< individual masks for events 224 - 255 1=mask event
   rand uvme_cvmcu_chip_apb_event_ctrl_event_err0_reg_c  event_err0; ///< individual error bits to indicate event queue overflow for events 0 - 31
   rand uvme_cvmcu_chip_apb_event_ctrl_event_err1_reg_c  event_err1; ///< individual error bits to indicate event queue overflow for events 32 - 63
   rand uvme_cvmcu_chip_apb_event_ctrl_event_err2_reg_c  event_err2; ///< individual error bits to indicate event queue overflow for events 64 - 95
   rand uvme_cvmcu_chip_apb_event_ctrl_event_err3_reg_c  event_err3; ///< individual error bits to indicate event queue overflow for events 96 - 127
   rand uvme_cvmcu_chip_apb_event_ctrl_event_err4_reg_c  event_err4; ///< individual error bits to indicate event queue overflow for events 128 - 159
   rand uvme_cvmcu_chip_apb_event_ctrl_event_err5_reg_c  event_err5; ///< individual error bits to indicate event queue overflow for events 160 - 191
   rand uvme_cvmcu_chip_apb_event_ctrl_event_err6_reg_c  event_err6; ///< individual error bits to indicate event queue overflow for events 192 - 223
   rand uvme_cvmcu_chip_apb_event_ctrl_event_err7_reg_c  event_err7; ///< individual error bits to indicate event queue overflow for events 224 - 255
   rand uvme_cvmcu_chip_apb_event_ctrl_timer_lo_event_reg_c  timer_lo_event; ///< specifies which event should be routed to the lo timer
   rand uvme_cvmcu_chip_apb_event_ctrl_timer_hi_event_reg_c  timer_hi_event; ///< specifies which event should be routed to the hi timer
   rand uvme_cvmcu_chip_apb_event_ctrl_event_fifo_reg_c  event_fifo; ///< ID of triggering event to be read by interrupt handler
   /// @}


   `uvm_object_utils_begin(uvme_cvmcu_chip_apb_event_ctrl_reg_block_c)
      `uvm_field_object(apb_events, UVM_DEFAULT)
      `uvm_field_object(event_mask0, UVM_DEFAULT)
      `uvm_field_object(event_mask1, UVM_DEFAULT)
      `uvm_field_object(event_mask2, UVM_DEFAULT)
      `uvm_field_object(event_mask3, UVM_DEFAULT)
      `uvm_field_object(event_mask4, UVM_DEFAULT)
      `uvm_field_object(event_mask5, UVM_DEFAULT)
      `uvm_field_object(event_mask6, UVM_DEFAULT)
      `uvm_field_object(event_mask7, UVM_DEFAULT)
      `uvm_field_object(event_err0, UVM_DEFAULT)
      `uvm_field_object(event_err1, UVM_DEFAULT)
      `uvm_field_object(event_err2, UVM_DEFAULT)
      `uvm_field_object(event_err3, UVM_DEFAULT)
      `uvm_field_object(event_err4, UVM_DEFAULT)
      `uvm_field_object(event_err5, UVM_DEFAULT)
      `uvm_field_object(event_err6, UVM_DEFAULT)
      `uvm_field_object(event_err7, UVM_DEFAULT)
      `uvm_field_object(timer_lo_event, UVM_DEFAULT)
      `uvm_field_object(timer_hi_event, UVM_DEFAULT)
      `uvm_field_object(event_fifo, UVM_DEFAULT)
   `uvm_object_utils_end


   /**
    * Default constructor.
    */
   function new(string name="uvme_cvmcu_chip_apb_event_ctrl_reg_block", int has_coverage=UVM_NO_COVERAGE);
      super.new(name, has_coverage);
   endfunction

   /**
    * Creates register(s).
    */
   virtual function void create_regs();
      apb_events = uvme_cvmcu_chip_apb_event_ctrl_apb_events_reg_c::type_id::create("apb_events");
      apb_events.configure(this);
      apb_events.build();
      event_mask0 = uvme_cvmcu_chip_apb_event_ctrl_event_mask0_reg_c::type_id::create("event_mask0");
      event_mask0.configure(this);
      event_mask0.build();
      event_mask1 = uvme_cvmcu_chip_apb_event_ctrl_event_mask1_reg_c::type_id::create("event_mask1");
      event_mask1.configure(this);
      event_mask1.build();
      event_mask2 = uvme_cvmcu_chip_apb_event_ctrl_event_mask2_reg_c::type_id::create("event_mask2");
      event_mask2.configure(this);
      event_mask2.build();
      event_mask3 = uvme_cvmcu_chip_apb_event_ctrl_event_mask3_reg_c::type_id::create("event_mask3");
      event_mask3.configure(this);
      event_mask3.build();
      event_mask4 = uvme_cvmcu_chip_apb_event_ctrl_event_mask4_reg_c::type_id::create("event_mask4");
      event_mask4.configure(this);
      event_mask4.build();
      event_mask5 = uvme_cvmcu_chip_apb_event_ctrl_event_mask5_reg_c::type_id::create("event_mask5");
      event_mask5.configure(this);
      event_mask5.build();
      event_mask6 = uvme_cvmcu_chip_apb_event_ctrl_event_mask6_reg_c::type_id::create("event_mask6");
      event_mask6.configure(this);
      event_mask6.build();
      event_mask7 = uvme_cvmcu_chip_apb_event_ctrl_event_mask7_reg_c::type_id::create("event_mask7");
      event_mask7.configure(this);
      event_mask7.build();
      event_err0 = uvme_cvmcu_chip_apb_event_ctrl_event_err0_reg_c::type_id::create("event_err0");
      event_err0.configure(this);
      event_err0.build();
      event_err1 = uvme_cvmcu_chip_apb_event_ctrl_event_err1_reg_c::type_id::create("event_err1");
      event_err1.configure(this);
      event_err1.build();
      event_err2 = uvme_cvmcu_chip_apb_event_ctrl_event_err2_reg_c::type_id::create("event_err2");
      event_err2.configure(this);
      event_err2.build();
      event_err3 = uvme_cvmcu_chip_apb_event_ctrl_event_err3_reg_c::type_id::create("event_err3");
      event_err3.configure(this);
      event_err3.build();
      event_err4 = uvme_cvmcu_chip_apb_event_ctrl_event_err4_reg_c::type_id::create("event_err4");
      event_err4.configure(this);
      event_err4.build();
      event_err5 = uvme_cvmcu_chip_apb_event_ctrl_event_err5_reg_c::type_id::create("event_err5");
      event_err5.configure(this);
      event_err5.build();
      event_err6 = uvme_cvmcu_chip_apb_event_ctrl_event_err6_reg_c::type_id::create("event_err6");
      event_err6.configure(this);
      event_err6.build();
      event_err7 = uvme_cvmcu_chip_apb_event_ctrl_event_err7_reg_c::type_id::create("event_err7");
      event_err7.configure(this);
      event_err7.build();
      timer_lo_event = uvme_cvmcu_chip_apb_event_ctrl_timer_lo_event_reg_c::type_id::create("timer_lo_event");
      timer_lo_event.configure(this);
      timer_lo_event.build();
      timer_hi_event = uvme_cvmcu_chip_apb_event_ctrl_timer_hi_event_reg_c::type_id::create("timer_hi_event");
      timer_hi_event.configure(this);
      timer_hi_event.build();
      event_fifo = uvme_cvmcu_chip_apb_event_ctrl_event_fifo_reg_c::type_id::create("event_fifo");
      event_fifo.configure(this);
      event_fifo.build();
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
         .rg    (apb_events),
         .offset(`UVM_REG_ADDR_WIDTH'h0),
         .rights("RW")
      );
      default_map.add_reg(
         .rg    (event_mask0),
         .offset(`UVM_REG_ADDR_WIDTH'h4),
         .rights("RW")
      );
      default_map.add_reg(
         .rg    (event_mask1),
         .offset(`UVM_REG_ADDR_WIDTH'h8),
         .rights("RW")
      );
      default_map.add_reg(
         .rg    (event_mask2),
         .offset(`UVM_REG_ADDR_WIDTH'hc),
         .rights("RW")
      );
      default_map.add_reg(
         .rg    (event_mask3),
         .offset(`UVM_REG_ADDR_WIDTH'h10),
         .rights("RW")
      );
      default_map.add_reg(
         .rg    (event_mask4),
         .offset(`UVM_REG_ADDR_WIDTH'h14),
         .rights("RW")
      );
      default_map.add_reg(
         .rg    (event_mask5),
         .offset(`UVM_REG_ADDR_WIDTH'h18),
         .rights("RW")
      );
      default_map.add_reg(
         .rg    (event_mask6),
         .offset(`UVM_REG_ADDR_WIDTH'h1c),
         .rights("RW")
      );
      default_map.add_reg(
         .rg    (event_mask7),
         .offset(`UVM_REG_ADDR_WIDTH'h20),
         .rights("RW")
      );
      default_map.add_reg(
         .rg    (event_err0),
         .offset(`UVM_REG_ADDR_WIDTH'h64),
         .rights("RW")
      );
      default_map.add_reg(
         .rg    (event_err1),
         .offset(`UVM_REG_ADDR_WIDTH'h68),
         .rights("RW")
      );
      default_map.add_reg(
         .rg    (event_err2),
         .offset(`UVM_REG_ADDR_WIDTH'h6c),
         .rights("RW")
      );
      default_map.add_reg(
         .rg    (event_err3),
         .offset(`UVM_REG_ADDR_WIDTH'h70),
         .rights("RW")
      );
      default_map.add_reg(
         .rg    (event_err4),
         .offset(`UVM_REG_ADDR_WIDTH'h74),
         .rights("RW")
      );
      default_map.add_reg(
         .rg    (event_err5),
         .offset(`UVM_REG_ADDR_WIDTH'h78),
         .rights("RW")
      );
      default_map.add_reg(
         .rg    (event_err6),
         .offset(`UVM_REG_ADDR_WIDTH'h7c),
         .rights("RW")
      );
      default_map.add_reg(
         .rg    (event_err7),
         .offset(`UVM_REG_ADDR_WIDTH'h80),
         .rights("RW")
      );
      default_map.add_reg(
         .rg    (timer_lo_event),
         .offset(`UVM_REG_ADDR_WIDTH'h84),
         .rights("RW")
      );
      default_map.add_reg(
         .rg    (timer_hi_event),
         .offset(`UVM_REG_ADDR_WIDTH'h88),
         .rights("RW")
      );
      default_map.add_reg(
         .rg    (event_fifo),
         .offset(`UVM_REG_ADDR_WIDTH'h90),
         .rights("RO")
      );
   endfunction

endclass


`endif // __UVME_CVMCU_CHIP_APB_EVENT_CTRL_REG_BLOCK_SV__
