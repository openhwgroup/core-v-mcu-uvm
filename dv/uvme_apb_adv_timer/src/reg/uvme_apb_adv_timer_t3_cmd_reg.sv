// Copyright 2022 Datum Technology Corporation
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


// WARNING: THE FOLLOWING IS GENERATED CODE.
// ANY CHANGES MADE WILL BE ERASED UPON THE NEXT RELEASE.


`ifndef __UVME_APB_ADV_TIMER_T3_CMD_REG_SV__
`define __UVME_APB_ADV_TIMER_T3_CMD_REG_SV__


class uvme_apb_adv_timer_t3_cmd_reg_c extends uvmx_reg_c;

   rand uvmx_reg_field_c  start; ///< ADV_TIMER0 start command bitfield.
   rand uvmx_reg_field_c  stop; ///< ADV_TIMER0 stop command bitfield.
   rand uvmx_reg_field_c  update; ///< ADV_TIMER0 update command bitfield.
   rand uvmx_reg_field_c  reset; ///< ADV_TIMER0 reset command bitfield.
   rand uvmx_reg_field_c  arm; ///< ADV_TIMER0 arm command bitfield.
   rand uvmx_reg_field_c  rfu; ///< 


   `uvm_object_utils_begin(uvme_apb_adv_timer_t3_cmd_reg_c)
      `uvm_field_object(start, UVM_DEFAULT)
      `uvm_field_object(stop, UVM_DEFAULT)
      `uvm_field_object(update, UVM_DEFAULT)
      `uvm_field_object(reset, UVM_DEFAULT)
      `uvm_field_object(arm, UVM_DEFAULT)
      `uvm_field_object(rfu, UVM_DEFAULT)
   `uvm_object_utils_end


   /**
    * Default constructor.
    */
   extern function new(string name="uvme_apb_adv_timer_t3_cmd_reg", int unsigned n_bits=32, int has_coverage=UVM_NO_COVERAGE);

   /**
    * Creates and configures register fields.
    */
   extern virtual function void build();

endclass : uvme_apb_adv_timer_t3_cmd_reg_c


function uvme_apb_adv_timer_t3_cmd_reg_c::new(string name="uvme_apb_adv_timer_t3_cmd_reg", int unsigned n_bits=32, int has_coverage=UVM_NO_COVERAGE);

   super.new(name, n_bits, has_coverage);

endfunction : new


function void uvme_apb_adv_timer_t3_cmd_reg_c::build();

   start = uvmx_reg_field_c::type_id::create("start");
   start.configure(
      .parent                 (this),
      .size                   (   1),
      .lsb_pos                (   0),
      .access                 ("WO"),
      .volatile               (   0),
      .reset                  (   0),
      .has_reset              (   1),
      .is_rand                (   1),
      .individually_accessible(   1)
   );
   stop = uvmx_reg_field_c::type_id::create("stop");
   stop.configure(
      .parent                 (this),
      .size                   (   1),
      .lsb_pos                (   1),
      .access                 ("WO"),
      .volatile               (   0),
      .reset                  (   0),
      .has_reset              (   1),
      .is_rand                (   1),
      .individually_accessible(   1)
   );
   update = uvmx_reg_field_c::type_id::create("update");
   update.configure(
      .parent                 (this),
      .size                   (   1),
      .lsb_pos                (   2),
      .access                 ("WO"),
      .volatile               (   0),
      .reset                  (   0),
      .has_reset              (   1),
      .is_rand                (   1),
      .individually_accessible(   1)
   );
   reset = uvmx_reg_field_c::type_id::create("reset");
   reset.configure(
      .parent                 (this),
      .size                   (   1),
      .lsb_pos                (   3),
      .access                 ("WO"),
      .volatile               (   0),
      .reset                  (   0),
      .has_reset              (   1),
      .is_rand                (   1),
      .individually_accessible(   1)
   );
   arm = uvmx_reg_field_c::type_id::create("arm");
   arm.configure(
      .parent                 (this),
      .size                   (   1),
      .lsb_pos                (   4),
      .access                 ("WO"),
      .volatile               (   0),
      .reset                  (   0),
      .has_reset              (   1),
      .is_rand                (   1),
      .individually_accessible(   1)
   );
   rfu = uvmx_reg_field_c::type_id::create("rfu");
   rfu.configure(
      .parent                 (this),
      .size                   (   27),
      .lsb_pos                (   5),
      .access                 ("WO"),
      .volatile               (   0),
      .reset                  (   0),
      .has_reset              (   1),
      .is_rand                (   1),
      .individually_accessible(   1)
   );

endfunction: build


`endif // __UVME_APB_ADV_TIMER_T3_CMD_REG_SV__