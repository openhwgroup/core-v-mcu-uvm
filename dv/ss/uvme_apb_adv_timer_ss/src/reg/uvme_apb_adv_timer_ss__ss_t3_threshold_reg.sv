// Copyright 2023 Acme Enterprises
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// THE FOLLOWING IS GENERATED CODE: ANY CHANGES MADE WILL BE ERASED UPON THE NEXT ITERATION


`ifndef __UVME_APB_ADV_TIMER_SS_T3_THRESHOLD_REG_SV__
`define __UVME_APB_ADV_TIMER_SS_T3_THRESHOLD_REG_SV__


class uvme_apb_adv_timer_ss_t3_threshold_reg_c extends uvmx_reg_c;

   rand uvmx_reg_field_c  th_lo; ///< ADV_TIMER0 threshold low part configuration bitfield. It defines start counter value.
   rand uvmx_reg_field_c  th_hi; ///< ADV_TIMER0 threshold high part configuration bitfield. It defines end counter value.


   `uvm_object_utils_begin(uvme_apb_adv_timer_ss_t3_threshold_reg_c)
      `uvm_field_object(th_lo, UVM_DEFAULT)
      `uvm_field_object(th_hi, UVM_DEFAULT)
   `uvm_object_utils_end


   /**
    * Default constructor.
    */
   function new(string name="uvme_apb_adv_timer_ss_t3_threshold_reg", int unsigned n_bits=32, int has_coverage=UVM_NO_COVERAGE);
      super.new(name, n_bits, has_coverage);
   endfunction

   /**
    * Creates and configures register fields.
    */
   virtual function void build();
      th_lo = uvmx_reg_field_c::type_id::create("th_lo");
      th_lo.configure(
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
      th_hi = uvmx_reg_field_c::type_id::create("th_hi");
      th_hi.configure(
         .parent                 (this),
         .size                   (   16),
         .lsb_pos                (   16),
         .access                 ("RW"),
         .volatile               (   0),
         .reset                  (   0),
         .has_reset              (   1),
         .is_rand                (   1),
         .individually_accessible(   1)
      );
   endfunction

endclass : uvme_apb_adv_timer_ss_t3_threshold_reg_c


`endif // __UVME_APB_ADV_TIMER_SS_T3_THRESHOLD_REG_SV__