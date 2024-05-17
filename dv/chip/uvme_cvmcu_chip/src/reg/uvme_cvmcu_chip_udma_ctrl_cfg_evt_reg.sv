// Copyright 2024 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// THE FOLLOWING IS GENERATED CODE: ANY CHANGES MADE WILL BE ERASED UPON THE NEXT ITERATION


`ifndef __UVME_CVMCU_CHIP_UDMA_CTRL_CFG_EVT_REG_SV__
`define __UVME_CVMCU_CHIP_UDMA_CTRL_CFG_EVT_REG_SV__


class uvme_cvmcu_chip_udma_ctrl_cfg_evt_reg_c extends uvmx_reg_c;

   rand uvmx_reg_field_c  cmp_event0; ///< Compare value for event0 detection
   rand uvmx_reg_field_c  cmp_event1; ///< Compare value for event1 detection
   rand uvmx_reg_field_c  cmp_event2; ///< Compare value for event2 detection
   rand uvmx_reg_field_c  cmp_event3; ///< Compare value for event3 detection


   `uvm_object_utils_begin(uvme_cvmcu_chip_udma_ctrl_cfg_evt_reg_c)
      `uvm_field_object(cmp_event0, UVM_DEFAULT)
      `uvm_field_object(cmp_event1, UVM_DEFAULT)
      `uvm_field_object(cmp_event2, UVM_DEFAULT)
      `uvm_field_object(cmp_event3, UVM_DEFAULT)
   `uvm_object_utils_end


   /**
    * Default constructor.
    */
   function new(string name="uvme_cvmcu_chip_udma_ctrl_cfg_evt_reg", int unsigned n_bits=32, int has_coverage=UVM_NO_COVERAGE);
      super.new(name, n_bits, has_coverage);
   endfunction

   /**
    * Creates and configures register fields.
    */
   virtual function void build();
      cmp_event0 = uvmx_reg_field_c::type_id::create("cmp_event0");
      cmp_event0.configure(
         .parent                 (this),
         .size                   (   8),
         .lsb_pos                (   0),
         .access                 ("RW"),
         .volatile               (   0),
         .reset                  (   3),
         .has_reset              (   1),
         .is_rand                (   1),
         .individually_accessible(   1)
      );
      cmp_event1 = uvmx_reg_field_c::type_id::create("cmp_event1");
      cmp_event1.configure(
         .parent                 (this),
         .size                   (   8),
         .lsb_pos                (   8),
         .access                 ("RW"),
         .volatile               (   0),
         .reset                  (   2),
         .has_reset              (   1),
         .is_rand                (   1),
         .individually_accessible(   1)
      );
      cmp_event2 = uvmx_reg_field_c::type_id::create("cmp_event2");
      cmp_event2.configure(
         .parent                 (this),
         .size                   (   8),
         .lsb_pos                (   16),
         .access                 ("RW"),
         .volatile               (   0),
         .reset                  (   1),
         .has_reset              (   1),
         .is_rand                (   1),
         .individually_accessible(   1)
      );
      cmp_event3 = uvmx_reg_field_c::type_id::create("cmp_event3");
      cmp_event3.configure(
         .parent                 (this),
         .size                   (   8),
         .lsb_pos                (   24),
         .access                 ("RW"),
         .volatile               (   0),
         .reset                  (   0),
         .has_reset              (   1),
         .is_rand                (   1),
         .individually_accessible(   1)
      );
   endfunction

endclass


`endif // __UVME_CVMCU_CHIP_UDMA_CTRL_CFG_EVT_REG_SV__