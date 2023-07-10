// Copyright 2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// THE FOLLOWING IS GENERATED CODE: ANY CHANGES MADE WILL BE ERASED UPON THE NEXT ITERATION


`ifndef __UVME_APB_ADV_TIMER_SS_EVENT_CFG_REG_SV__
`define __UVME_APB_ADV_TIMER_SS_EVENT_CFG_REG_SV__


class uvme_apb_adv_timer_ss_event_cfg_reg_c extends uvmx_reg_c;

   rand uvmx_reg_field_c  sel0; ///< ADV_TIMER output event 0 source configuration bitfiled:
   rand uvmx_reg_field_c  sel1; ///< ADV_TIMER output event 1 source configuration bitfiled:
   rand uvmx_reg_field_c  sel2; ///< ADV_TIMER output event 2 source configuration bitfiled:
   rand uvmx_reg_field_c  sel3; ///< ADV_TIMER output event 3 source configuration bitfiled:
   rand uvmx_reg_field_c  ena; ///< ADV_TIMER output event enable configuration bitfield. ENA[i]=1 enables output event i generation.


   `uvm_object_utils_begin(uvme_apb_adv_timer_ss_event_cfg_reg_c)
      `uvm_field_object(sel0, UVM_DEFAULT)
      `uvm_field_object(sel1, UVM_DEFAULT)
      `uvm_field_object(sel2, UVM_DEFAULT)
      `uvm_field_object(sel3, UVM_DEFAULT)
      `uvm_field_object(ena, UVM_DEFAULT)
   `uvm_object_utils_end


   /**
    * Default constructor.
    */
   function new(string name="uvme_apb_adv_timer_ss_event_cfg_reg", int unsigned n_bits=32, int has_coverage=UVM_NO_COVERAGE);
      super.new(name, n_bits, has_coverage);
   endfunction

   /**
    * Creates and configures register fields.
    */
   virtual function void build();
      sel0 = uvmx_reg_field_c::type_id::create("sel0");
      sel0.configure(
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
      sel1 = uvmx_reg_field_c::type_id::create("sel1");
      sel1.configure(
         .parent                 (this),
         .size                   (   4),
         .lsb_pos                (   4),
         .access                 ("RW"),
         .volatile               (   0),
         .reset                  (   0),
         .has_reset              (   1),
         .is_rand                (   1),
         .individually_accessible(   1)
      );
      sel2 = uvmx_reg_field_c::type_id::create("sel2");
      sel2.configure(
         .parent                 (this),
         .size                   (   4),
         .lsb_pos                (   8),
         .access                 ("RW"),
         .volatile               (   0),
         .reset                  (   0),
         .has_reset              (   1),
         .is_rand                (   1),
         .individually_accessible(   1)
      );
      sel3 = uvmx_reg_field_c::type_id::create("sel3");
      sel3.configure(
         .parent                 (this),
         .size                   (   4),
         .lsb_pos                (   12),
         .access                 ("RW"),
         .volatile               (   0),
         .reset                  (   0),
         .has_reset              (   1),
         .is_rand                (   1),
         .individually_accessible(   1)
      );
      ena = uvmx_reg_field_c::type_id::create("ena");
      ena.configure(
         .parent                 (this),
         .size                   (   4),
         .lsb_pos                (   16),
         .access                 ("RW"),
         .volatile               (   0),
         .reset                  (   0),
         .has_reset              (   1),
         .is_rand                (   1),
         .individually_accessible(   1)
      );
   endfunction

endclass : uvme_apb_adv_timer_ss_event_cfg_reg_c


`endif // __UVME_APB_ADV_TIMER_SS_EVENT_CFG_REG_SV__