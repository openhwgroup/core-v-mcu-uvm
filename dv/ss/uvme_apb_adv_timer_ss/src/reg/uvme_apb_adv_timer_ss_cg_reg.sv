// Copyright 2023 Acme Enterprises
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// THE FOLLOWING IS GENERATED CODE: ANY CHANGES MADE WILL BE ERASED UPON THE NEXT ITERATION


`ifndef __UVME_APB_ADV_TIMER_SS_CG_REG_SV__
`define __UVME_APB_ADV_TIMER_SS_CG_REG_SV__


class uvme_apb_adv_timer_ss_cg_reg_c extends uvmx_reg_c;

   rand uvmx_reg_field_c  ena; ///< ADV_TIMER clock gating configuration bitfield.


   `uvm_object_utils_begin(uvme_apb_adv_timer_ss_cg_reg_c)
      `uvm_field_object(ena, UVM_DEFAULT)
   `uvm_object_utils_end


   /**
    * Default constructor.
    */
   function new(string name="uvme_apb_adv_timer_ss_cg_reg", int unsigned n_bits=32, int has_coverage=UVM_NO_COVERAGE);
      super.new(name, n_bits, has_coverage);
   endfunction

   /**
    * Creates and configures register fields.
    */
   virtual function void build();
      ena = uvmx_reg_field_c::type_id::create("ena");
      ena.configure(
         .parent                 (this),
         .size                   (   4),
         .lsb_pos                (   0),
         .access                 ("RW"),
         .volatile               (   0),
         .reset                  (   0),
         .has_reset              (   1),
         .is_rand                (   1),
         .individually_accessible(   1)
      );
   endfunction

endclass : uvme_apb_adv_timer_ss_cg_reg_c


`endif // __UVME_APB_ADV_TIMER_SS_CG_REG_SV__