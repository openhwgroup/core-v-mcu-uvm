// Copyright 2023 Acme Enterprises
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// THE FOLLOWING IS GENERATED CODE: ANY CHANGES MADE WILL BE ERASED UPON THE NEXT ITERATION


`ifndef __UVME_CVMCU_CHIP_APB_EVENT_CTRL_APB_EVENT_CTRL_EVENT_ERR7_REG_SV__
`define __UVME_CVMCU_CHIP_APB_EVENT_CTRL_APB_EVENT_CTRL_EVENT_ERR7_REG_SV__


class uvme_cvmcu_chip_apb_event_ctrl_apb_event_ctrl_event_err7_reg_c extends uvmx_reg_c;

   rand uvmx_reg_field_c  event_err; ///< individual error bits to indicate event queue overflow for events 224 - 255


   `uvm_object_utils_begin(uvme_cvmcu_chip_apb_event_ctrl_apb_event_ctrl_event_err7_reg_c)
      `uvm_field_object(event_err, UVM_DEFAULT)
   `uvm_object_utils_end


   /**
    * Default constructor.
    */
   function new(string name="uvme_cvmcu_chip_apb_event_ctrl_apb_event_ctrl_event_err7_reg", int unsigned n_bits=32, int has_coverage=UVM_NO_COVERAGE);
      super.new(name, n_bits, has_coverage);
   endfunction

   /**
    * Creates and configures register fields.
    */
   virtual function void build();
      event_err = uvmx_reg_field_c::type_id::create("event_err");
      event_err.configure(
         .parent                 (this),
         .size                   (   32),
         .lsb_pos                (   0),
         .access                 ("RC"),
         .volatile               (   0),
         .reset                  (   0),
         .has_reset              (   1),
         .is_rand                (   1),
         .individually_accessible(   1)
      );
   endfunction

endclass : uvme_cvmcu_chip_apb_event_ctrl_apb_event_ctrl_event_err7_reg_c


`endif // __UVME_CVMCU_CHIP_APB_EVENT_CTRL_APB_EVENT_CTRL_EVENT_ERR7_REG_SV__