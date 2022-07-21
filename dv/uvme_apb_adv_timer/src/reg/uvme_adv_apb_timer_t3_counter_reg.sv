// 
// Copyright 2021 Low Power Futures Inc.
// 


// WARNING: THE FOLLOWING IS AUTO-GENERATED CODE.
// ANY CHANGES MADE HERE WILL BE ERASED UPON THE NEXT RELEASE OF THIS RAL.


`ifndef __UVME_ADV_APB_TIMER_T3_COUNTER_REG_SV__
`define __UVME_ADV_APB_TIMER_T3_COUNTER_REG_SV__


class uvme_adv_apb_timer_t3_counter_reg_c extends uvml_ral_reg_c;
   
   rand uvml_ral_reg_field_c  counter; ///< ADV_TIMER0 counter value.
   
   
   `uvm_object_utils_begin(uvme_adv_apb_timer_t3_counter_reg_c)
      `uvm_field_object(counter, UVM_DEFAULT)
   `uvm_object_utils_end
   
   
   /**
    * Default constructor.
    */
   extern function new(string name="uvme_adv_apb_timer_t3_counter_reg", int unsigned n_bits=32, int has_coverage=UVM_NO_COVERAGE);
   
   /**
    * Creates and configures register fields.
    */
   extern virtual function void build();
   
endclass : uvme_adv_apb_timer_t3_counter_reg_c


function uvme_adv_apb_timer_t3_counter_reg_c::new(string name="uvme_adv_apb_timer_t3_counter_reg", int unsigned n_bits=32, int has_coverage=UVM_NO_COVERAGE);
   
   super.new(name, n_bits, has_coverage);
   
endfunction : new


function void uvme_adv_apb_timer_t3_counter_reg_c::build();
   
   counter = uvml_ral_reg_field_c::type_id::create("counter");
   counter.configure(
      .parent                 (this),
      .size                   (   0),
      .lsb_pos                (   16),
      .access                 ("WO"),
      .volatile               (   0),
      .reset                  (   0),
      .has_reset              (   1),
      .is_rand                (   1),
      .individually_accessible(   0)
   );
   
endfunction: build


`endif // __UVME_ADV_APB_TIMER_T3_COUNTER_REG_SV__
