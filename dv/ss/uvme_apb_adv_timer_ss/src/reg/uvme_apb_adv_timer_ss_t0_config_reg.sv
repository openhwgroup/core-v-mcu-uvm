// Copyright 2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// THE FOLLOWING IS GENERATED CODE: ANY CHANGES MADE WILL BE ERASED UPON THE NEXT ITERATION


`ifndef __UVME_APB_ADV_TIMER_SS_T0_CONFIG_REG_SV__
`define __UVME_APB_ADV_TIMER_SS_T0_CONFIG_REG_SV__


class uvme_apb_adv_timer_ss_t0_config_reg_c extends uvmx_reg_c;

   rand uvmx_reg_field_c  insel; ///< ADV_TIMER0 input source configuration bitfield:
   rand uvmx_reg_field_c  mode; ///< ADV_TIMER0 trigger mode configuration bitfield:
   rand uvmx_reg_field_c  clksel; ///< ADV_TIMER0 clock source configuration bitfield:
   rand uvmx_reg_field_c  updownsel; ///< ADV_TIMER0 center-aligned mode configuration bitfield:
   rand uvmx_reg_field_c  presc; ///< ADV_TIMER0 prescaler value configuration bitfield.


   `uvm_object_utils_begin(uvme_apb_adv_timer_ss_t0_config_reg_c)
      `uvm_field_object(insel, UVM_DEFAULT)
      `uvm_field_object(mode, UVM_DEFAULT)
      `uvm_field_object(clksel, UVM_DEFAULT)
      `uvm_field_object(updownsel, UVM_DEFAULT)
      `uvm_field_object(presc, UVM_DEFAULT)
   `uvm_object_utils_end


   /**
    * Default constructor.
    */
   function new(string name="uvme_apb_adv_timer_ss_t0_config_reg", int unsigned n_bits=32, int has_coverage=UVM_NO_COVERAGE);
      super.new(name, n_bits, has_coverage);
   endfunction

   /**
    * Creates and configures register fields.
    */
   virtual function void build();
      insel = uvmx_reg_field_c::type_id::create("insel");
      insel.configure(
         .parent                 (this),
         .size                   (   8),
         .lsb_pos                (   0),
         .access                 ("RW"),
         .volatile               (   0),
         .reset                  (   0),
         .has_reset              (   1),
         .is_rand                (   1),
         .individually_accessible(   1)
      );
      mode = uvmx_reg_field_c::type_id::create("mode");
      mode.configure(
         .parent                 (this),
         .size                   (   3),
         .lsb_pos                (   8),
         .access                 ("RW"),
         .volatile               (   0),
         .reset                  (   0),
         .has_reset              (   1),
         .is_rand                (   1),
         .individually_accessible(   1)
      );
      clksel = uvmx_reg_field_c::type_id::create("clksel");
      clksel.configure(
         .parent                 (this),
         .size                   (   1),
         .lsb_pos                (   11),
         .access                 ("RW"),
         .volatile               (   0),
         .reset                  (   0),
         .has_reset              (   1),
         .is_rand                (   1),
         .individually_accessible(   1)
      );
      updownsel = uvmx_reg_field_c::type_id::create("updownsel");
      updownsel.configure(
         .parent                 (this),
         .size                   (   1),
         .lsb_pos                (   12),
         .access                 ("RW"),
         .volatile               (   0),
         .reset                  (   1),
         .has_reset              (   1),
         .is_rand                (   1),
         .individually_accessible(   1)
      );
      presc = uvmx_reg_field_c::type_id::create("presc");
      presc.configure(
         .parent                 (this),
         .size                   (   8),
         .lsb_pos                (   16),
         .access                 ("RW"),
         .volatile               (   0),
         .reset                  (   0),
         .has_reset              (   1),
         .is_rand                (   1),
         .individually_accessible(   1)
      );
   endfunction

endclass : uvme_apb_adv_timer_ss_t0_config_reg_c


`endif // __UVME_APB_ADV_TIMER_SS_T0_CONFIG_REG_SV__