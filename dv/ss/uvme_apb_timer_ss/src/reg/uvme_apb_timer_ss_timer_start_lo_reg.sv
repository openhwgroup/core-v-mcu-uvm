// Copyright 2023 Acme Enterprises
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// THE FOLLOWING IS GENERATED CODE: ANY CHANGES MADE WILL BE ERASED UPON THE NEXT ITERATION


`ifndef __UVME_APB_TIMER_SS_TIMER_START_LO_REG_SV__
`define __UVME_APB_TIMER_SS_TIMER_START_LO_REG_SV__


class uvme_apb_timer_ss_timer_start_lo_reg_c extends uvmx_reg_c;

   rand uvmx_reg_field_c  timer_start_lo; ///< Write strobe address for starting low counter


   `uvm_object_utils_begin(uvme_apb_timer_ss_timer_start_lo_reg_c)
      `uvm_field_object(timer_start_lo, UVM_DEFAULT)
   `uvm_object_utils_end


   /**
    * Default constructor.
    */
   function new(string name="uvme_apb_timer_ss_timer_start_lo_reg", int unsigned n_bits=32, int has_coverage=UVM_NO_COVERAGE);
      super.new(name, n_bits, has_coverage);
   endfunction

   /**
    * Creates and configures register fields.
    */
   virtual function void build();
      timer_start_lo = uvmx_reg_field_c::type_id::create("timer_start_lo");
      timer_start_lo.configure(
         .parent                 (this),
         .size                   (   32),
         .lsb_pos                (   0),
         .access                 ("WO"),
         .volatile               (   0),
         .reset                  (   0),
         .has_reset              (   1),
         .is_rand                (   1),
         .individually_accessible(   1)
      );
   endfunction

endclass : uvme_apb_timer_ss_timer_start_lo_reg_c


`endif // __UVME_APB_TIMER_SS_TIMER_START_LO_REG_SV__