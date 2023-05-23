// Copyright 2023 Acme Enterprises
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// THE FOLLOWING IS GENERATED CODE: ANY CHANGES MADE WILL BE ERASED UPON THE NEXT ITERATION


`ifndef __UVME_APB_TIMER_SS_CFG_REG_LOW_REG_SV__
`define __UVME_APB_TIMER_SS_CFG_REG_LOW_REG_SV__


class uvme_apb_timer_ss_cfg_reg_low_reg_c extends uvmx_reg_c;

   rand uvmx_reg_field_c  mode_64_bit; ///< 1 = 64-bit mode, 0=32-bit mode
   rand uvmx_reg_field_c  mode_mtime_bit; ///< 1=MTIME mode Changes interrupt to be >= CMP value
   rand uvmx_reg_field_c  prescaler_count; ///< Prescaler divisor
   rand uvmx_reg_field_c  ref_clk_en_bit; ///< 1= use Refclk for counter, 0 = use APB bus clk for counter
   rand uvmx_reg_field_c  prescaler_en_bit; ///< 1= Use prescaler 0= no prescaler
   rand uvmx_reg_field_c  one_shot_bit; ///< 1= disable timer when counter == cmp value
   rand uvmx_reg_field_c  cmp_clr_bit; ///< 1=counter is reset once counter == cmp, 0=counter is not reset
   rand uvmx_reg_field_c  iem_bit; ///< 1 = event input is enabled
   rand uvmx_reg_field_c  irq_bit; ///< 1 = IRQ is enabled when counter ==cmp value
   rand uvmx_reg_field_c  reset_bit; ///< 1 = reset the counter
   rand uvmx_reg_field_c  enable_bit; ///< 1 = enable the counter to count


   `uvm_object_utils_begin(uvme_apb_timer_ss_cfg_reg_low_reg_c)
      `uvm_field_object(mode_64_bit, UVM_DEFAULT)
      `uvm_field_object(mode_mtime_bit, UVM_DEFAULT)
      `uvm_field_object(prescaler_count, UVM_DEFAULT)
      `uvm_field_object(ref_clk_en_bit, UVM_DEFAULT)
      `uvm_field_object(prescaler_en_bit, UVM_DEFAULT)
      `uvm_field_object(one_shot_bit, UVM_DEFAULT)
      `uvm_field_object(cmp_clr_bit, UVM_DEFAULT)
      `uvm_field_object(iem_bit, UVM_DEFAULT)
      `uvm_field_object(irq_bit, UVM_DEFAULT)
      `uvm_field_object(reset_bit, UVM_DEFAULT)
      `uvm_field_object(enable_bit, UVM_DEFAULT)
   `uvm_object_utils_end


   /**
    * Default constructor.
    */
   function new(string name="uvme_apb_timer_ss_cfg_reg_low_reg", int unsigned n_bits=32, int has_coverage=UVM_NO_COVERAGE);
      super.new(name, n_bits, has_coverage);
   endfunction

   /**
    * Creates and configures register fields.
    */
   virtual function void build();
      mode_64_bit = uvmx_reg_field_c::type_id::create("mode_64_bit");
      mode_64_bit.configure(
         .parent                 (this),
         .size                   (   1),
         .lsb_pos                (   31),
         .access                 ("RW"),
         .volatile               (   1),
         .reset                  (   0),
         .has_reset              (   1),
         .is_rand                (   1),
         .individually_accessible(   1)
      );
      mode_mtime_bit = uvmx_reg_field_c::type_id::create("mode_mtime_bit");
      mode_mtime_bit.configure(
         .parent                 (this),
         .size                   (   1),
         .lsb_pos                (   30),
         .access                 ("RW"),
         .volatile               (   1),
         .reset                  (   0),
         .has_reset              (   1),
         .is_rand                (   1),
         .individually_accessible(   1)
      );
      prescaler_count = uvmx_reg_field_c::type_id::create("prescaler_count");
      prescaler_count.configure(
         .parent                 (this),
         .size                   (   7),
         .lsb_pos                (   8),
         .access                 ("RW"),
         .volatile               (   1),
         .reset                  (   0),
         .has_reset              (   1),
         .is_rand                (   1),
         .individually_accessible(   1)
      );
      ref_clk_en_bit = uvmx_reg_field_c::type_id::create("ref_clk_en_bit");
      ref_clk_en_bit.configure(
         .parent                 (this),
         .size                   (   1),
         .lsb_pos                (   7),
         .access                 ("RW"),
         .volatile               (   1),
         .reset                  (   0),
         .has_reset              (   1),
         .is_rand                (   1),
         .individually_accessible(   1)
      );
      prescaler_en_bit = uvmx_reg_field_c::type_id::create("prescaler_en_bit");
      prescaler_en_bit.configure(
         .parent                 (this),
         .size                   (   1),
         .lsb_pos                (   6),
         .access                 ("RW"),
         .volatile               (   1),
         .reset                  (   0),
         .has_reset              (   1),
         .is_rand                (   1),
         .individually_accessible(   1)
      );
      one_shot_bit = uvmx_reg_field_c::type_id::create("one_shot_bit");
      one_shot_bit.configure(
         .parent                 (this),
         .size                   (   1),
         .lsb_pos                (   5),
         .access                 ("RW"),
         .volatile               (   1),
         .reset                  (   0),
         .has_reset              (   1),
         .is_rand                (   1),
         .individually_accessible(   1)
      );
      cmp_clr_bit = uvmx_reg_field_c::type_id::create("cmp_clr_bit");
      cmp_clr_bit.configure(
         .parent                 (this),
         .size                   (   1),
         .lsb_pos                (   4),
         .access                 ("RW"),
         .volatile               (   1),
         .reset                  (   0),
         .has_reset              (   1),
         .is_rand                (   1),
         .individually_accessible(   1)
      );
      iem_bit = uvmx_reg_field_c::type_id::create("iem_bit");
      iem_bit.configure(
         .parent                 (this),
         .size                   (   1),
         .lsb_pos                (   3),
         .access                 ("RW"),
         .volatile               (   1),
         .reset                  (   0),
         .has_reset              (   1),
         .is_rand                (   1),
         .individually_accessible(   1)
      );
      irq_bit = uvmx_reg_field_c::type_id::create("irq_bit");
      irq_bit.configure(
         .parent                 (this),
         .size                   (   1),
         .lsb_pos                (   2),
         .access                 ("RW"),
         .volatile               (   1),
         .reset                  (   0),
         .has_reset              (   1),
         .is_rand                (   1),
         .individually_accessible(   1)
      );
      reset_bit = uvmx_reg_field_c::type_id::create("reset_bit");
      reset_bit.configure(
         .parent                 (this),
         .size                   (   1),
         .lsb_pos                (   1),
         .access                 ("W1C"),
         .volatile               (   1),
         .reset                  (   0),
         .has_reset              (   1),
         .is_rand                (   1),
         .individually_accessible(   1)
      );
      enable_bit = uvmx_reg_field_c::type_id::create("enable_bit");
      enable_bit.configure(
         .parent                 (this),
         .size                   (   1),
         .lsb_pos                (   0),
         .access                 ("RW"),
         .volatile               (   1),
         .reset                  (   0),
         .has_reset              (   1),
         .is_rand                (   1),
         .individually_accessible(   1)
      );
   endfunction

endclass : uvme_apb_timer_ss_cfg_reg_low_reg_c


`endif // __UVME_APB_TIMER_SS_CFG_REG_LOW_REG_SV__