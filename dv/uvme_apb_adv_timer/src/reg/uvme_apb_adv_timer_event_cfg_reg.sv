// 
// Copyright 2021 Low Power Futures Inc.
// 


// WARNING: THE FOLLOWING IS AUTO-GENERATED CODE.
// ANY CHANGES MADE HERE WILL BE ERASED UPON THE NEXT RELEASE OF THIS RAL.


`ifndef __UVME_APB_ADV_TIMER_EVENT_CFG_REG_SV__
`define __UVME_APB_ADV_TIMER_EVENT_CFG_REG_SV__


class uvme_apb_adv_timer_event_cfg_reg_c extends uvml_ral_reg_c;
   
   rand uvml_ral_reg_field_c  sel0; ///< ADV_TIMER output event 0 source configuration bitfiled: - 4'h0: ADV_TIMER0 channel 0. - 4'h1: ADV_TIMER0 channel 1. - 4'h2: ADV_TIMER0 channel 2. - 4'h3: ADV_TIMER0 channel 3. - 4'h4: ADV_TIMER1 channel 0. - 4'h5: ADV_TIMER1 channel 1. - 4'h6: ADV_TIMER1 channel 2. - 4'h7: ADV_TIMER1 channel 3. - 4'h8: ADV_TIMER2 channel 0. - 4'h9: ADV_TIMER2 channel 1. - 4'hA: ADV_TIMER2 channel 2. - 4'hB: ADV_TIMER2 channel 3. - 4'hC: ADV_TIMER3 channel 0. - 4'hD: ADV_TIMER3 channel 1. - 4'hE: ADV_TIMER3 channel 2. - 4'hF: ADV_TIMER3 channel 3.
   rand uvml_ral_reg_field_c  sel1; ///< ADV_TIMER output event 1 source configuration bitfiled: - 4'h0: ADV_TIMER0 channel 0. - 4'h1: ADV_TIMER0 channel 1. - 4'h2: ADV_TIMER0 channel 2. - 4'h3: ADV_TIMER0 channel 3. - 4'h4: ADV_TIMER1 channel 0. - 4'h5: ADV_TIMER1 channel 1. - 4'h6: ADV_TIMER1 channel 2. - 4'h7: ADV_TIMER1 channel 3. - 4'h8: ADV_TIMER2 channel 0. - 4'h9: ADV_TIMER2 channel 1. - 4'hA: ADV_TIMER2 channel 2. - 4'hB: ADV_TIMER2 channel 3. - 4'hC: ADV_TIMER3 channel 0. - 4'hD: ADV_TIMER3 channel 1. - 4'hE: ADV_TIMER3 channel 2. - 4'hF: ADV_TIMER3 channel 3.
   rand uvml_ral_reg_field_c  sel2; ///< ADV_TIMER output event 2 source configuration bitfiled: - 4'h0: ADV_TIMER0 channel 0. - 4'h1: ADV_TIMER0 channel 1. - 4'h2: ADV_TIMER0 channel 2. - 4'h3: ADV_TIMER0 channel 3. - 4'h4: ADV_TIMER1 channel 0. - 4'h5: ADV_TIMER1 channel 1. - 4'h6: ADV_TIMER1 channel 2. - 4'h7: ADV_TIMER1 channel 3. - 4'h8: ADV_TIMER2 channel 0. - 4'h9: ADV_TIMER2 channel 1. - 4'hA: ADV_TIMER2 channel 2. - 4'hB: ADV_TIMER2 channel 3. - 4'hC: ADV_TIMER3 channel 0. - 4'hD: ADV_TIMER3 channel 1. - 4'hE: ADV_TIMER3 channel 2. - 4'hF: ADV_TIMER3 channel 3.
   rand uvml_ral_reg_field_c  sel3; ///< ADV_TIMER output event 3 source configuration bitfiled: - 4'h0: ADV_TIMER0 channel 0. - 4'h1: ADV_TIMER0 channel 1. - 4'h2: ADV_TIMER0 channel 2. - 4'h3: ADV_TIMER0 channel 3. - 4'h4: ADV_TIMER1 channel 0. - 4'h5: ADV_TIMER1 channel 1. - 4'h6: ADV_TIMER1 channel 2. - 4'h7: ADV_TIMER1 channel 3. - 4'h8: ADV_TIMER2 channel 0. - 4'h9: ADV_TIMER2 channel 1. - 4'hA: ADV_TIMER2 channel 2. - 4'hB: ADV_TIMER2 channel 3. - 4'hC: ADV_TIMER3 channel 0. - 4'hD: ADV_TIMER3 channel 1. - 4'hE: ADV_TIMER3 channel 2. - 4'hF: ADV_TIMER3 channel 3.
   rand uvml_ral_reg_field_c  ena; ///< ADV_TIMER output event enable configuration bitfield. ENA[i]=1 enables output event i generation.
   
   
   `uvm_object_utils_begin(uvme_apb_adv_timer_event_cfg_reg_c)
      `uvm_field_object(sel0, UVM_DEFAULT)
      `uvm_field_object(sel1, UVM_DEFAULT)
      `uvm_field_object(sel2, UVM_DEFAULT)
      `uvm_field_object(sel3, UVM_DEFAULT)
      `uvm_field_object(ena, UVM_DEFAULT)
   `uvm_object_utils_end
   
   
   /**
    * Default constructor.
    */
   extern function new(string name="uvme_apb_adv_timer_event_cfg_reg", int unsigned n_bits=32, int has_coverage=UVM_NO_COVERAGE);
   
   /**
    * Creates and configures register fields.
    */
   extern virtual function void build();
   
endclass : uvme_apb_adv_timer_event_cfg_reg_c


function uvme_apb_adv_timer_event_cfg_reg_c::new(string name="uvme_apb_adv_timer_event_cfg_reg", int unsigned n_bits=32, int has_coverage=UVM_NO_COVERAGE);
   
   super.new(name, n_bits, has_coverage);
   
endfunction : new


function void uvme_apb_adv_timer_event_cfg_reg_c::build();
   
   sel0 = uvml_ral_reg_field_c::type_id::create("sel0");
   sel0.configure(
      .parent                 (this),
      .size                   (   4),
      .lsb_pos                (   0),
      .access                 ("RW"),
      .volatile               (   0),
      .reset                  (   0),
      .has_reset              (   1),
      .is_rand                (   1),
      .individually_accessible(   0)
   );
   sel1 = uvml_ral_reg_field_c::type_id::create("sel1");
   sel1.configure(
      .parent                 (this),
      .size                   (   4),
      .lsb_pos                (   4),
      .access                 ("RW"),
      .volatile               (   0),
      .reset                  (   0),
      .has_reset              (   1),
      .is_rand                (   1),
      .individually_accessible(   0)
   );
   sel2 = uvml_ral_reg_field_c::type_id::create("sel2");
   sel2.configure(
      .parent                 (this),
      .size                   (   4),
      .lsb_pos                (   8),
      .access                 ("RW"),
      .volatile               (   0),
      .reset                  (   0),
      .has_reset              (   1),
      .is_rand                (   1),
      .individually_accessible(   0)
   );
   sel3 = uvml_ral_reg_field_c::type_id::create("sel3");
   sel3.configure(
      .parent                 (this),
      .size                   (   4),
      .lsb_pos                (   12),
      .access                 ("RW"),
      .volatile               (   0),
      .reset                  (   0),
      .has_reset              (   1),
      .is_rand                (   1),
      .individually_accessible(   0)
   );
   ena = uvml_ral_reg_field_c::type_id::create("ena");
   ena.configure(
      .parent                 (this),
      .size                   (   4),
      .lsb_pos                (   16),
      .access                 ("RW"),
      .volatile               (   0),
      .reset                  (   0),
      .has_reset              (   1),
      .is_rand                (   1),
      .individually_accessible(   0)
   );
   
endfunction: build


`endif // __UVME_APB_ADV_TIMER_EVENT_CFG_REG_SV__
