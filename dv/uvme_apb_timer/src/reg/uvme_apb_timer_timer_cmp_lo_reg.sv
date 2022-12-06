// Copyright 2022 Datum Technology Corporation
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


// WARNING: THE FOLLOWING IS GENERATED CODE.
// ANY CHANGES MADE WILL BE ERASED UPON THE NEXT RELEASE.


`ifndef __UVME_APB_TIMER_TIMER_CMP_LO_REG_SV__
`define __UVME_APB_TIMER_TIMER_CMP_LO_REG_SV__


class uvme_apb_timer_timer_cmp_lo_reg_c extends uvmx_reg_c;

   rand uvmx_reg_field_c  timer_cmp_lo; ///< compare value for low 32-bit counter


   `uvm_object_utils_begin(uvme_apb_timer_timer_cmp_lo_reg_c)
      `uvm_field_object(timer_cmp_lo, UVM_DEFAULT)
   `uvm_object_utils_end


   /**
    * Default constructor.
    */
   extern function new(string name="uvme_apb_timer_timer_cmp_lo_reg", int unsigned n_bits=32, int has_coverage=UVM_NO_COVERAGE);

   /**
    * Creates and configures register fields.
    */
   extern virtual function void build();

endclass : uvme_apb_timer_timer_cmp_lo_reg_c


function uvme_apb_timer_timer_cmp_lo_reg_c::new(string name="uvme_apb_timer_timer_cmp_lo_reg", int unsigned n_bits=32, int has_coverage=UVM_NO_COVERAGE);

   super.new(name, n_bits, has_coverage);

endfunction : new


function void uvme_apb_timer_timer_cmp_lo_reg_c::build();

   timer_cmp_lo = uvmx_reg_field_c::type_id::create("timer_cmp_lo");
   timer_cmp_lo.configure(
      .parent                 (this),
      .size                   (   32),
      .lsb_pos                (   0),
      .access                 ("RW"),
      .volatile               (   0),
      .reset                  (   0),
      .has_reset              (   1),
      .is_rand                (   1),
      .individually_accessible(   1)
   );

endfunction: build


`endif // __UVME_APB_TIMER_TIMER_CMP_LO_REG_SV__