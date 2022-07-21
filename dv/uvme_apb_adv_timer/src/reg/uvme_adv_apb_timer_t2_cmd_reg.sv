// 
// Copyright 2021 Low Power Futures Inc.
// 


// WARNING: THE FOLLOWING IS AUTO-GENERATED CODE.
// ANY CHANGES MADE HERE WILL BE ERASED UPON THE NEXT RELEASE OF THIS RAL.


`ifndef __UVME_ADV_APB_TIMER_T2_CMD_REG_SV__
`define __UVME_ADV_APB_TIMER_T2_CMD_REG_SV__


class uvme_adv_apb_timer_t2_cmd_reg_c extends uvml_ral_reg_c;
   
   rand uvml_ral_reg_field_c  start; ///< ADV_TIMER0 start command bitfield.
   rand uvml_ral_reg_field_c  stop; ///< ADV_TIMER0 stop command bitfield.
   rand uvml_ral_reg_field_c  update; ///< ADV_TIMER0 update command bitfield.
   rand uvml_ral_reg_field_c  reset; ///< ADV_TIMER0 reset command bitfield.
   rand uvml_ral_reg_field_c  arm; ///< ADV_TIMER0 arm command bitfield.
   rand uvml_ral_reg_field_c  rfu; ///< 
   
   
   `uvm_object_utils_begin(uvme_adv_apb_timer_t2_cmd_reg_c)
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
   extern function new(string name="uvme_adv_apb_timer_t2_cmd_reg", int unsigned n_bits=32, int has_coverage=UVM_NO_COVERAGE);
   
   /**
    * Creates and configures register fields.
    */
   extern virtual function void build();
   
endclass : uvme_adv_apb_timer_t2_cmd_reg_c


function uvme_adv_apb_timer_t2_cmd_reg_c::new(string name="uvme_adv_apb_timer_t2_cmd_reg", int unsigned n_bits=32, int has_coverage=UVM_NO_COVERAGE);
   
   super.new(name, n_bits, has_coverage);
   
endfunction : new


function void uvme_adv_apb_timer_t2_cmd_reg_c::build();
   
   start = uvml_ral_reg_field_c::type_id::create("start");
   start.configure(
      .parent                 (this),
      .size                   (   1),
      .lsb_pos                (   0),
      .access                 ("WO"),
      .volatile               (   0),
      .reset                  (   0),
      .has_reset              (   1),
      .is_rand                (   1),
      .individually_accessible(   0)
   );
   stop = uvml_ral_reg_field_c::type_id::create("stop");
   stop.configure(
      .parent                 (this),
      .size                   (   1),
      .lsb_pos                (   1),
      .access                 ("WO"),
      .volatile               (   0),
      .reset                  (   0),
      .has_reset              (   1),
      .is_rand                (   1),
      .individually_accessible(   0)
   );
   update = uvml_ral_reg_field_c::type_id::create("update");
   update.configure(
      .parent                 (this),
      .size                   (   1),
      .lsb_pos                (   2),
      .access                 ("WO"),
      .volatile               (   0),
      .reset                  (   0),
      .has_reset              (   1),
      .is_rand                (   1),
      .individually_accessible(   0)
   );
   reset = uvml_ral_reg_field_c::type_id::create("reset");
   reset.configure(
      .parent                 (this),
      .size                   (   1),
      .lsb_pos                (   3),
      .access                 ("WO"),
      .volatile               (   0),
      .reset                  (   0),
      .has_reset              (   1),
      .is_rand                (   1),
      .individually_accessible(   0)
   );
   arm = uvml_ral_reg_field_c::type_id::create("arm");
   arm.configure(
      .parent                 (this),
      .size                   (   1),
      .lsb_pos                (   4),
      .access                 ("WO"),
      .volatile               (   0),
      .reset                  (   0),
      .has_reset              (   1),
      .is_rand                (   1),
      .individually_accessible(   0)
   );
   rfu = uvml_ral_reg_field_c::type_id::create("rfu");
   rfu.configure(
      .parent                 (this),
      .size                   (   27),
      .lsb_pos                (   5),
      .access                 (""),
      .volatile               (   0),
      .reset                  (   0),
      .has_reset              (   1),
      .is_rand                (   1),
      .individually_accessible(   0)
   );
   
endfunction: build


`endif // __UVME_ADV_APB_TIMER_T2_CMD_REG_SV__
