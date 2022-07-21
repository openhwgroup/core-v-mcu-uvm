// 
// Copyright 2021 Low Power Futures Inc.
// 


// WARNING: THE FOLLOWING IS AUTO-GENERATED CODE.
// ANY CHANGES MADE HERE WILL BE ERASED UPON THE NEXT RELEASE OF THIS RAL.


`ifndef __UVME_ADV_APB_TIMER_T3_CONFIG_REG_SV__
`define __UVME_ADV_APB_TIMER_T3_CONFIG_REG_SV__


class uvme_adv_apb_timer_t3_config_reg_c extends uvml_ral_reg_c;
   
   rand uvml_ral_reg_field_c  insel; ///< ADV_TIMER0 input source configuration bitfield:
- 0-31: GPIO[0] to GPIO[31]
- 32-35: Channel 0 to 3 of ADV_TIMER0
- 36-39: Channel 0 to 3 of ADV_TIMER1
- 40-43: Channel 0 to 3 of ADV_TIMER2
- 44-47: Channel 0 to 3 of ADV_TIMER3
   rand uvml_ral_reg_field_c  mode; ///< ADV_TIMER0 trigger mode configuration bitfield:
- 3'h0: trigger event at each clock cycle.
- 3'h1: trigger event if input source is 0
- 3'h2: trigger event if input source is 1
- 3'h3: trigger event on input source rising edge
- 3'h4: trigger event on input source falling edge
- 3'h5: trigger event on input source falling or rising edge
- 3'h6: trigger event on input source rising edge when armed
- 3'h7: trigger event on input source falling edge when armed
   rand uvml_ral_reg_field_c  clksel; ///< ADV_TIMER0 clock source configuration bitfield:
- 1'b0: FLL
- 1'b1: reference clock at 32kHz
   rand uvml_ral_reg_field_c  updownsel; ///< ADV_TIMER0 center-aligned mode configuration bitfield:
- 1'b0: The counter counts up and down alternatively.
- 1'b1: The counter counts up and resets to 0 when reach threshold.
   rand uvml_ral_reg_field_c  presc; ///< ADV_TIMER0 prescaler value configuration bitfield.
   
   
   `uvm_object_utils_begin(uvme_adv_apb_timer_t3_config_reg_c)
      `uvm_field_object(insel, UVM_DEFAULT)
      `uvm_field_object(mode, UVM_DEFAULT)
      `uvm_field_object(clksel, UVM_DEFAULT)
      `uvm_field_object(updownsel, UVM_DEFAULT)
      `uvm_field_object(presc, UVM_DEFAULT)
   `uvm_object_utils_end
   
   
   /**
    * Default constructor.
    */
   extern function new(string name="uvme_adv_apb_timer_t3_config_reg", int unsigned n_bits=32, int has_coverage=UVM_NO_COVERAGE);
   
   /**
    * Creates and configures register fields.
    */
   extern virtual function void build();
   
endclass : uvme_adv_apb_timer_t3_config_reg_c


function uvme_adv_apb_timer_t3_config_reg_c::new(string name="uvme_adv_apb_timer_t3_config_reg", int unsigned n_bits=32, int has_coverage=UVM_NO_COVERAGE);
   
   super.new(name, n_bits, has_coverage);
   
endfunction : new


function void uvme_adv_apb_timer_t3_config_reg_c::build();
   
   insel = uvml_ral_reg_field_c::type_id::create("insel");
   insel.configure(
      .parent                 (this),
      .size                   (   8),
      .lsb_pos                (   0),
      .access                 ("RW"),
      .volatile               (   0),
      .reset                  (   0),
      .has_reset              (   1),
      .is_rand                (   1),
      .individually_accessible(   0)
   );
   mode = uvml_ral_reg_field_c::type_id::create("mode");
   mode.configure(
      .parent                 (this),
      .size                   (   3),
      .lsb_pos                (   8),
      .access                 ("RW"),
      .volatile               (   0),
      .reset                  (   0),
      .has_reset              (   1),
      .is_rand                (   1),
      .individually_accessible(   0)
   );
   clksel = uvml_ral_reg_field_c::type_id::create("clksel");
   clksel.configure(
      .parent                 (this),
      .size                   (   1),
      .lsb_pos                (   11),
      .access                 ("RW"),
      .volatile               (   0),
      .reset                  (   0),
      .has_reset              (   1),
      .is_rand                (   1),
      .individually_accessible(   0)
   );
   updownsel = uvml_ral_reg_field_c::type_id::create("updownsel");
   updownsel.configure(
      .parent                 (this),
      .size                   (   1),
      .lsb_pos                (   12),
      .access                 ("RW"),
      .volatile               (   0),
      .reset                  (   1),
      .has_reset              (   1),
      .is_rand                (   1),
      .individually_accessible(   0)
   );
   presc = uvml_ral_reg_field_c::type_id::create("presc");
   presc.configure(
      .parent                 (this),
      .size                   (   8),
      .lsb_pos                (   16),
      .access                 ("RW"),
      .volatile               (   0),
      .reset                  (   0),
      .has_reset              (   1),
      .is_rand                (   1),
      .individually_accessible(   0)
   );
   
endfunction: build


`endif // __UVME_ADV_APB_TIMER_T3_CONFIG_REG_SV__
