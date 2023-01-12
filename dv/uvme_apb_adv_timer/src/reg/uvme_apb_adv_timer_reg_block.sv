// Copyright 2022-2023 Datum Technology Corporation
// All rights reserved
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


// WARNING: THE FOLLOWING IS GENERATED CODE.
// ANY CHANGES MADE WILL BE ERASED UPON THE NEXT RELEASE.


`ifndef __UVME_APB_ADV_TIMER_REG_BLOCK_SV__
`define __UVME_APB_ADV_TIMER_REG_BLOCK_SV__


`include "uvme_apb_adv_timer_t0_cmd_reg.sv"
`include "uvme_apb_adv_timer_t0_config_reg.sv"
`include "uvme_apb_adv_timer_t0_threshold_reg.sv"
`include "uvme_apb_adv_timer_t0_th_channel0_reg.sv"
`include "uvme_apb_adv_timer_t0_th_channel1_reg.sv"
`include "uvme_apb_adv_timer_t0_th_channel2_reg.sv"
`include "uvme_apb_adv_timer_t0_th_channel3_reg.sv"
`include "uvme_apb_adv_timer_t0_counter_reg.sv"
`include "uvme_apb_adv_timer_t1_cmd_reg.sv"
`include "uvme_apb_adv_timer_t1_config_reg.sv"
`include "uvme_apb_adv_timer_t1_threshold_reg.sv"
`include "uvme_apb_adv_timer_t1_th_channel0_reg.sv"
`include "uvme_apb_adv_timer_t1_th_channel1_reg.sv"
`include "uvme_apb_adv_timer_t1_th_channel2_reg.sv"
`include "uvme_apb_adv_timer_t1_th_channel3_reg.sv"
`include "uvme_apb_adv_timer_t1_counter_reg.sv"
`include "uvme_apb_adv_timer_t2_cmd_reg.sv"
`include "uvme_apb_adv_timer_t2_config_reg.sv"
`include "uvme_apb_adv_timer_t2_threshold_reg.sv"
`include "uvme_apb_adv_timer_t2_th_channel0_reg.sv"
`include "uvme_apb_adv_timer_t2_th_channel1_reg.sv"
`include "uvme_apb_adv_timer_t2_th_channel2_reg.sv"
`include "uvme_apb_adv_timer_t2_th_channel3_reg.sv"
`include "uvme_apb_adv_timer_t2_counter_reg.sv"
`include "uvme_apb_adv_timer_t3_cmd_reg.sv"
`include "uvme_apb_adv_timer_t3_config_reg.sv"
`include "uvme_apb_adv_timer_t3_threshold_reg.sv"
`include "uvme_apb_adv_timer_t3_th_channel0_reg.sv"
`include "uvme_apb_adv_timer_t3_th_channel1_reg.sv"
`include "uvme_apb_adv_timer_t3_th_channel2_reg.sv"
`include "uvme_apb_adv_timer_t3_th_channel3_reg.sv"
`include "uvme_apb_adv_timer_t3_counter_reg.sv"
`include "uvme_apb_adv_timer_event_cfg_reg.sv"
`include "uvme_apb_adv_timer_cg_reg.sv"


/**
 * Top-Level Register Block for apb_adv_timer.
 */
class uvme_apb_adv_timer_reg_block_c extends uvmx_reg_block_c;

   /// @name Registers
   /// @{
  rand uvme_apb_adv_timer_t0_cmd_reg_c  t0_cmd;
  rand uvme_apb_adv_timer_t0_config_reg_c  t0_config;
  rand uvme_apb_adv_timer_t0_threshold_reg_c  t0_threshold;
  rand uvme_apb_adv_timer_t0_th_channel0_reg_c  t0_th_channel0;
  rand uvme_apb_adv_timer_t0_th_channel1_reg_c  t0_th_channel1;
  rand uvme_apb_adv_timer_t0_th_channel2_reg_c  t0_th_channel2;
  rand uvme_apb_adv_timer_t0_th_channel3_reg_c  t0_th_channel3;
  rand uvme_apb_adv_timer_t0_counter_reg_c  t0_counter;
  rand uvme_apb_adv_timer_t1_cmd_reg_c  t1_cmd;
  rand uvme_apb_adv_timer_t1_config_reg_c  t1_config;
  rand uvme_apb_adv_timer_t1_threshold_reg_c  t1_threshold;
  rand uvme_apb_adv_timer_t1_th_channel0_reg_c  t1_th_channel0;
  rand uvme_apb_adv_timer_t1_th_channel1_reg_c  t1_th_channel1;
  rand uvme_apb_adv_timer_t1_th_channel2_reg_c  t1_th_channel2;
  rand uvme_apb_adv_timer_t1_th_channel3_reg_c  t1_th_channel3;
  rand uvme_apb_adv_timer_t1_counter_reg_c  t1_counter;
  rand uvme_apb_adv_timer_t2_cmd_reg_c  t2_cmd;
  rand uvme_apb_adv_timer_t2_config_reg_c  t2_config;
  rand uvme_apb_adv_timer_t2_threshold_reg_c  t2_threshold;
  rand uvme_apb_adv_timer_t2_th_channel0_reg_c  t2_th_channel0;
  rand uvme_apb_adv_timer_t2_th_channel1_reg_c  t2_th_channel1;
  rand uvme_apb_adv_timer_t2_th_channel2_reg_c  t2_th_channel2;
  rand uvme_apb_adv_timer_t2_th_channel3_reg_c  t2_th_channel3;
  rand uvme_apb_adv_timer_t2_counter_reg_c  t2_counter;
  rand uvme_apb_adv_timer_t3_cmd_reg_c  t3_cmd;
  rand uvme_apb_adv_timer_t3_config_reg_c  t3_config;
  rand uvme_apb_adv_timer_t3_threshold_reg_c  t3_threshold;
  rand uvme_apb_adv_timer_t3_th_channel0_reg_c  t3_th_channel0;
  rand uvme_apb_adv_timer_t3_th_channel1_reg_c  t3_th_channel1;
  rand uvme_apb_adv_timer_t3_th_channel2_reg_c  t3_th_channel2;
  rand uvme_apb_adv_timer_t3_th_channel3_reg_c  t3_th_channel3;
  rand uvme_apb_adv_timer_t3_counter_reg_c  t3_counter;
  rand uvme_apb_adv_timer_event_cfg_reg_c  event_cfg;
  rand uvme_apb_adv_timer_cg_reg_c  cg;
   /// @}


   `uvm_object_utils_begin(uvme_apb_adv_timer_reg_block_c)
      `uvm_field_object(t0_cmd, UVM_DEFAULT)
      `uvm_field_object(t0_config, UVM_DEFAULT)
      `uvm_field_object(t0_threshold, UVM_DEFAULT)
      `uvm_field_object(t0_th_channel0, UVM_DEFAULT)
      `uvm_field_object(t0_th_channel1, UVM_DEFAULT)
      `uvm_field_object(t0_th_channel2, UVM_DEFAULT)
      `uvm_field_object(t0_th_channel3, UVM_DEFAULT)
      `uvm_field_object(t0_counter, UVM_DEFAULT)
      `uvm_field_object(t1_cmd, UVM_DEFAULT)
      `uvm_field_object(t1_config, UVM_DEFAULT)
      `uvm_field_object(t1_threshold, UVM_DEFAULT)
      `uvm_field_object(t1_th_channel0, UVM_DEFAULT)
      `uvm_field_object(t1_th_channel1, UVM_DEFAULT)
      `uvm_field_object(t1_th_channel2, UVM_DEFAULT)
      `uvm_field_object(t1_th_channel3, UVM_DEFAULT)
      `uvm_field_object(t1_counter, UVM_DEFAULT)
      `uvm_field_object(t2_cmd, UVM_DEFAULT)
      `uvm_field_object(t2_config, UVM_DEFAULT)
      `uvm_field_object(t2_threshold, UVM_DEFAULT)
      `uvm_field_object(t2_th_channel0, UVM_DEFAULT)
      `uvm_field_object(t2_th_channel1, UVM_DEFAULT)
      `uvm_field_object(t2_th_channel2, UVM_DEFAULT)
      `uvm_field_object(t2_th_channel3, UVM_DEFAULT)
      `uvm_field_object(t2_counter, UVM_DEFAULT)
      `uvm_field_object(t3_cmd, UVM_DEFAULT)
      `uvm_field_object(t3_config, UVM_DEFAULT)
      `uvm_field_object(t3_threshold, UVM_DEFAULT)
      `uvm_field_object(t3_th_channel0, UVM_DEFAULT)
      `uvm_field_object(t3_th_channel1, UVM_DEFAULT)
      `uvm_field_object(t3_th_channel2, UVM_DEFAULT)
      `uvm_field_object(t3_th_channel3, UVM_DEFAULT)
      `uvm_field_object(t3_counter, UVM_DEFAULT)
      `uvm_field_object(event_cfg, UVM_DEFAULT)
      `uvm_field_object(cg, UVM_DEFAULT)
   `uvm_object_utils_end


   /**
    * Default constructor.
    */
   function new(string name="uvme_apb_adv_timer_reg_block", int has_coverage=UVM_NO_COVERAGE);
      super.new(name, has_coverage);
   endfunction

   /**
    * Creates register(s).
    */
   virtual function void create_regs();
      t0_cmd = uvme_apb_adv_timer_t0_cmd_reg_c::type_id::create("t0_cmd");
      t0_cmd.configure(this);
      t0_cmd.build();   
      t0_config = uvme_apb_adv_timer_t0_config_reg_c::type_id::create("t0_config");
      t0_config.configure(this);
      t0_config.build();   
      t0_threshold = uvme_apb_adv_timer_t0_threshold_reg_c::type_id::create("t0_threshold");
      t0_threshold.configure(this);
      t0_threshold.build();   
      t0_th_channel0 = uvme_apb_adv_timer_t0_th_channel0_reg_c::type_id::create("t0_th_channel0");
      t0_th_channel0.configure(this);
      t0_th_channel0.build();   
      t0_th_channel1 = uvme_apb_adv_timer_t0_th_channel1_reg_c::type_id::create("t0_th_channel1");
      t0_th_channel1.configure(this);
      t0_th_channel1.build();   
      t0_th_channel2 = uvme_apb_adv_timer_t0_th_channel2_reg_c::type_id::create("t0_th_channel2");
      t0_th_channel2.configure(this);
      t0_th_channel2.build();   
      t0_th_channel3 = uvme_apb_adv_timer_t0_th_channel3_reg_c::type_id::create("t0_th_channel3");
      t0_th_channel3.configure(this);
      t0_th_channel3.build();   
      t0_counter = uvme_apb_adv_timer_t0_counter_reg_c::type_id::create("t0_counter");
      t0_counter.configure(this);
      t0_counter.build();   
      t1_cmd = uvme_apb_adv_timer_t1_cmd_reg_c::type_id::create("t1_cmd");
      t1_cmd.configure(this);
      t1_cmd.build();   
      t1_config = uvme_apb_adv_timer_t1_config_reg_c::type_id::create("t1_config");
      t1_config.configure(this);
      t1_config.build();   
      t1_threshold = uvme_apb_adv_timer_t1_threshold_reg_c::type_id::create("t1_threshold");
      t1_threshold.configure(this);
      t1_threshold.build();   
      t1_th_channel0 = uvme_apb_adv_timer_t1_th_channel0_reg_c::type_id::create("t1_th_channel0");
      t1_th_channel0.configure(this);
      t1_th_channel0.build();   
      t1_th_channel1 = uvme_apb_adv_timer_t1_th_channel1_reg_c::type_id::create("t1_th_channel1");
      t1_th_channel1.configure(this);
      t1_th_channel1.build();   
      t1_th_channel2 = uvme_apb_adv_timer_t1_th_channel2_reg_c::type_id::create("t1_th_channel2");
      t1_th_channel2.configure(this);
      t1_th_channel2.build();   
      t1_th_channel3 = uvme_apb_adv_timer_t1_th_channel3_reg_c::type_id::create("t1_th_channel3");
      t1_th_channel3.configure(this);
      t1_th_channel3.build();   
      t1_counter = uvme_apb_adv_timer_t1_counter_reg_c::type_id::create("t1_counter");
      t1_counter.configure(this);
      t1_counter.build();   
      t2_cmd = uvme_apb_adv_timer_t2_cmd_reg_c::type_id::create("t2_cmd");
      t2_cmd.configure(this);
      t2_cmd.build();   
      t2_config = uvme_apb_adv_timer_t2_config_reg_c::type_id::create("t2_config");
      t2_config.configure(this);
      t2_config.build();   
      t2_threshold = uvme_apb_adv_timer_t2_threshold_reg_c::type_id::create("t2_threshold");
      t2_threshold.configure(this);
      t2_threshold.build();   
      t2_th_channel0 = uvme_apb_adv_timer_t2_th_channel0_reg_c::type_id::create("t2_th_channel0");
      t2_th_channel0.configure(this);
      t2_th_channel0.build();   
      t2_th_channel1 = uvme_apb_adv_timer_t2_th_channel1_reg_c::type_id::create("t2_th_channel1");
      t2_th_channel1.configure(this);
      t2_th_channel1.build();   
      t2_th_channel2 = uvme_apb_adv_timer_t2_th_channel2_reg_c::type_id::create("t2_th_channel2");
      t2_th_channel2.configure(this);
      t2_th_channel2.build();   
      t2_th_channel3 = uvme_apb_adv_timer_t2_th_channel3_reg_c::type_id::create("t2_th_channel3");
      t2_th_channel3.configure(this);
      t2_th_channel3.build();   
      t2_counter = uvme_apb_adv_timer_t2_counter_reg_c::type_id::create("t2_counter");
      t2_counter.configure(this);
      t2_counter.build();   
      t3_cmd = uvme_apb_adv_timer_t3_cmd_reg_c::type_id::create("t3_cmd");
      t3_cmd.configure(this);
      t3_cmd.build();   
      t3_config = uvme_apb_adv_timer_t3_config_reg_c::type_id::create("t3_config");
      t3_config.configure(this);
      t3_config.build();   
      t3_threshold = uvme_apb_adv_timer_t3_threshold_reg_c::type_id::create("t3_threshold");
      t3_threshold.configure(this);
      t3_threshold.build();   
      t3_th_channel0 = uvme_apb_adv_timer_t3_th_channel0_reg_c::type_id::create("t3_th_channel0");
      t3_th_channel0.configure(this);
      t3_th_channel0.build();   
      t3_th_channel1 = uvme_apb_adv_timer_t3_th_channel1_reg_c::type_id::create("t3_th_channel1");
      t3_th_channel1.configure(this);
      t3_th_channel1.build();   
      t3_th_channel2 = uvme_apb_adv_timer_t3_th_channel2_reg_c::type_id::create("t3_th_channel2");
      t3_th_channel2.configure(this);
      t3_th_channel2.build();   
      t3_th_channel3 = uvme_apb_adv_timer_t3_th_channel3_reg_c::type_id::create("t3_th_channel3");
      t3_th_channel3.configure(this);
      t3_th_channel3.build();   
      t3_counter = uvme_apb_adv_timer_t3_counter_reg_c::type_id::create("t3_counter");
      t3_counter.configure(this);
      t3_counter.build();   
      event_cfg = uvme_apb_adv_timer_event_cfg_reg_c::type_id::create("event_cfg");
      event_cfg.configure(this);
      event_cfg.build();   
      cg = uvme_apb_adv_timer_cg_reg_c::type_id::create("cg");
      cg.configure(this);
      cg.build();   
   endfunction

   /**
    * Creates default register map.
    */
   virtual function void create_reg_map();
      // Create default register map (default_map)
      default_map = create_map(
         .name     ("default_map"),
         .base_addr(32'h1a10_5000),
         .n_bytes  (4),
         .endian   (UVM_LITTLE_ENDIAN)
      );
   endfunction

   /**
    * Adds register(s) to register map.
    */
   virtual function void add_regs_to_map();
      default_map.add_reg(
         .rg    (t0_cmd),
         .offset(32'h0),
         .rights("RW")
      );
      default_map.add_reg(
         .rg    (t0_config),
         .offset(32'h4),
         .rights("RW")
      );
      default_map.add_reg(
         .rg    (t0_threshold),
         .offset(32'h8),
         .rights("RW")
      );
      default_map.add_reg(
         .rg    (t0_th_channel0),
         .offset(32'hc),
         .rights("RW")
      );
      default_map.add_reg(
         .rg    (t0_th_channel1),
         .offset(32'h10),
         .rights("RW")
      );
      default_map.add_reg(
         .rg    (t0_th_channel2),
         .offset(32'h14),
         .rights("RW")
      );
      default_map.add_reg(
         .rg    (t0_th_channel3),
         .offset(32'h18),
         .rights("RW")
      );
      default_map.add_reg(
         .rg    (t0_counter),
         .offset(32'h2c),
         .rights("RW")
      );
      default_map.add_reg(
         .rg    (t1_cmd),
         .offset(32'h40),
         .rights("RW")
      );
      default_map.add_reg(
         .rg    (t1_config),
         .offset(32'h44),
         .rights("RW")
      );
      default_map.add_reg(
         .rg    (t1_threshold),
         .offset(32'h48),
         .rights("RW")
      );
      default_map.add_reg(
         .rg    (t1_th_channel0),
         .offset(32'h4c),
         .rights("RW")
      );
      default_map.add_reg(
         .rg    (t1_th_channel1),
         .offset(32'h50),
         .rights("RW")
      );
      default_map.add_reg(
         .rg    (t1_th_channel2),
         .offset(32'h54),
         .rights("RW")
      );
      default_map.add_reg(
         .rg    (t1_th_channel3),
         .offset(32'h58),
         .rights("RW")
      );
      default_map.add_reg(
         .rg    (t1_counter),
         .offset(32'h6c),
         .rights("RW")
      );
      default_map.add_reg(
         .rg    (t2_cmd),
         .offset(32'h80),
         .rights("RW")
      );
      default_map.add_reg(
         .rg    (t2_config),
         .offset(32'h84),
         .rights("RW")
      );
      default_map.add_reg(
         .rg    (t2_threshold),
         .offset(32'h88),
         .rights("RW")
      );
      default_map.add_reg(
         .rg    (t2_th_channel0),
         .offset(32'h8c),
         .rights("RW")
      );
      default_map.add_reg(
         .rg    (t2_th_channel1),
         .offset(32'h90),
         .rights("RW")
      );
      default_map.add_reg(
         .rg    (t2_th_channel2),
         .offset(32'h94),
         .rights("RW")
      );
      default_map.add_reg(
         .rg    (t2_th_channel3),
         .offset(32'h98),
         .rights("RW")
      );
      default_map.add_reg(
         .rg    (t2_counter),
         .offset(32'hac),
         .rights("RW")
      );
      default_map.add_reg(
         .rg    (t3_cmd),
         .offset(32'hc0),
         .rights("RW")
      );
      default_map.add_reg(
         .rg    (t3_config),
         .offset(32'hc4),
         .rights("RW")
      );
      default_map.add_reg(
         .rg    (t3_threshold),
         .offset(32'hc8),
         .rights("RW")
      );
      default_map.add_reg(
         .rg    (t3_th_channel0),
         .offset(32'hcc),
         .rights("RW")
      );
      default_map.add_reg(
         .rg    (t3_th_channel1),
         .offset(32'hd0),
         .rights("RW")
      );
      default_map.add_reg(
         .rg    (t3_th_channel2),
         .offset(32'hd4),
         .rights("RW")
      );
      default_map.add_reg(
         .rg    (t3_th_channel3),
         .offset(32'hd8),
         .rights("RW")
      );
      default_map.add_reg(
         .rg    (t3_counter),
         .offset(32'hec),
         .rights("RW")
      );
      default_map.add_reg(
         .rg    (event_cfg),
         .offset(32'h100),
         .rights("RW")
      );
      default_map.add_reg(
         .rg    (cg),
         .offset(32'h104),
         .rights("RW")
      );
   endfunction

endclass : uvme_apb_adv_timer_reg_block_c


`endif // _UVME_APB_ADV_TIMER_REG_BLOCK_SV__
