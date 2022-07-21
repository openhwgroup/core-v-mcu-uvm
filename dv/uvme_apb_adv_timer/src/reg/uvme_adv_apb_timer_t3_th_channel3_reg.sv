// 
// Copyright 2021 Low Power Futures Inc.
// 


// WARNING: THE FOLLOWING IS AUTO-GENERATED CODE.
// ANY CHANGES MADE HERE WILL BE ERASED UPON THE NEXT RELEASE OF THIS RAL.


`ifndef __UVME_ADV_APB_TIMER_T3_TH_CHANNEL3_REG_SV__
`define __UVME_ADV_APB_TIMER_T3_TH_CHANNEL3_REG_SV__


class uvme_adv_apb_timer_t3_th_channel3_reg_c extends uvml_ral_reg_c;
   
   rand uvml_ral_reg_field_c  th; ///< ADV_TIMER0 channel 0 threshold configuration bitfield.
   rand uvml_ral_reg_field_c  mode; ///< ADV_TIMER0 channel 0 threshold match action on channel output signal configuration bitfield:
- 3'h0: set.
- 3'h1: toggle then next threshold match action is clear.
- 3'h2: set then next threshold match action is clear.
- 3'h3: toggle.
- 3'h4: clear.
- 3'h5: toggle then next threshold match action is set.
- 3'h6: clear then next threshold match action is set.
   
   
   `uvm_object_utils_begin(uvme_adv_apb_timer_t3_th_channel3_reg_c)
      `uvm_field_object(th, UVM_DEFAULT)
      `uvm_field_object(mode, UVM_DEFAULT)
   `uvm_object_utils_end
   
   
   /**
    * Default constructor.
    */
   extern function new(string name="uvme_adv_apb_timer_t3_th_channel3_reg", int unsigned n_bits=32, int has_coverage=UVM_NO_COVERAGE);
   
   /**
    * Creates and configures register fields.
    */
   extern virtual function void build();
   
endclass : uvme_adv_apb_timer_t3_th_channel3_reg_c


function uvme_adv_apb_timer_t3_th_channel3_reg_c::new(string name="uvme_adv_apb_timer_t3_th_channel3_reg", int unsigned n_bits=32, int has_coverage=UVM_NO_COVERAGE);
   
   super.new(name, n_bits, has_coverage);
   
endfunction : new


function void uvme_adv_apb_timer_t3_th_channel3_reg_c::build();
   
   th = uvml_ral_reg_field_c::type_id::create("th");
   th.configure(
      .parent                 (this),
      .size                   (   16),
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
      .lsb_pos                (   16),
      .access                 ("RW"),
      .volatile               (   0),
      .reset                  (   0),
      .has_reset              (   1),
      .is_rand                (   1),
      .individually_accessible(   0)
   );
   
endfunction: build


`endif // __UVME_ADV_APB_TIMER_T3_TH_CHANNEL3_REG_SV__
