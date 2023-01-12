// Copyright 2022-2023 Datum Technology Corporation
// All rights reserved
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


// WARNING: THE FOLLOWING IS GENERATED CODE.
// ANY CHANGES MADE WILL BE ERASED UPON THE NEXT RELEASE.


`ifndef __UVME_APB_ADV_TIMER_T2_TH_CHANNEL0_REG_SV__
`define __UVME_APB_ADV_TIMER_T2_TH_CHANNEL0_REG_SV__


class uvme_apb_adv_timer_t2_th_channel0_reg_c extends uvmx_reg_c;

   rand uvmx_reg_field_c  th; ///< ADV_TIMER0 channel 0 threshold configuration bitfield.
   rand uvmx_reg_field_c  mode; ///< ADV_TIMER0 channel 0 threshold match action on channel output signal configuration bitfield:


   `uvm_object_utils_begin(uvme_apb_adv_timer_t2_th_channel0_reg_c)
      `uvm_field_object(th, UVM_DEFAULT)
      `uvm_field_object(mode, UVM_DEFAULT)
   `uvm_object_utils_end


   /**
    * Default constructor.
    */
   function new(string name="uvme_apb_adv_timer_t2_th_channel0_reg", int unsigned n_bits=32, int has_coverage=UVM_NO_COVERAGE);
      super.new(name, n_bits, has_coverage);
   endfunction

   /**
    * Creates and configures register fields.
    */
   virtual function void build();
      th = uvmx_reg_field_c::type_id::create("th");
      th.configure(
         .parent                 (this),
         .size                   (   16),
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
         .lsb_pos                (   16),
         .access                 ("RW"),
         .volatile               (   0),
         .reset                  (   0),
         .has_reset              (   1),
         .is_rand                (   1),
         .individually_accessible(   1)
      );
   endfunction

endclass : uvme_apb_adv_timer_t2_th_channel0_reg_c


`endif // __UVME_APB_ADV_TIMER_T2_TH_CHANNEL0_REG_SV__