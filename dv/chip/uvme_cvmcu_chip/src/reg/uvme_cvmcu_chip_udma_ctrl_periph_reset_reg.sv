// Copyright 2024 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// THE FOLLOWING IS GENERATED CODE: ANY CHANGES MADE WILL BE ERASED UPON THE NEXT ITERATION


`ifndef __UVME_CVMCU_CHIP_UDMA_CTRL_PERIPH_RESET_REG_SV__
`define __UVME_CVMCU_CHIP_UDMA_CTRL_PERIPH_RESET_REG_SV__


class uvme_cvmcu_chip_udma_ctrl_periph_reset_reg_c extends uvmx_reg_c;

   rand uvmx_reg_field_c  uart0; ///< Reset for UART0
   rand uvmx_reg_field_c  uart1; ///< Reset for UART1
   rand uvmx_reg_field_c  qspim0; ///< Reset for QSPIM0
   rand uvmx_reg_field_c  qspim1; ///< Reset for QSPIM1
   rand uvmx_reg_field_c  i2cm0; ///< Reset for I2CM0
   rand uvmx_reg_field_c  i2cm1; ///< Reset for I2CM1
   rand uvmx_reg_field_c  i2cs_csi_hyper_sdio; ///< Reset for I2SC0, CSI20, HYPER0 and SDIO0
   rand uvmx_reg_field_c  cam0; ///< Reset for CAM0
   rand uvmx_reg_field_c  jtag_mram_filter; ///< Reset for JTAG, MRAM and FILTER
   rand uvmx_reg_field_c  fpga_ext_per; ///< Reset for FPGA and EXT_PER


   `uvm_object_utils_begin(uvme_cvmcu_chip_udma_ctrl_periph_reset_reg_c)
      `uvm_field_object(uart0, UVM_DEFAULT)
      `uvm_field_object(uart1, UVM_DEFAULT)
      `uvm_field_object(qspim0, UVM_DEFAULT)
      `uvm_field_object(qspim1, UVM_DEFAULT)
      `uvm_field_object(i2cm0, UVM_DEFAULT)
      `uvm_field_object(i2cm1, UVM_DEFAULT)
      `uvm_field_object(i2cs_csi_hyper_sdio, UVM_DEFAULT)
      `uvm_field_object(cam0, UVM_DEFAULT)
      `uvm_field_object(jtag_mram_filter, UVM_DEFAULT)
      `uvm_field_object(fpga_ext_per, UVM_DEFAULT)
   `uvm_object_utils_end


   /**
    * Default constructor.
    */
   function new(string name="uvme_cvmcu_chip_udma_ctrl_periph_reset_reg", int unsigned n_bits=32, int has_coverage=UVM_NO_COVERAGE);
      super.new(name, n_bits, has_coverage);
   endfunction

   /**
    * Creates and configures register fields.
    */
   virtual function void build();
      uart0 = uvmx_reg_field_c::type_id::create("uart0");
      uart0.configure(
         .parent                 (this),
         .size                   (   1),
         .lsb_pos                (   0),
         .access                 ("RW"),
         .volatile               (   0),
         .reset                  (   0),
         .has_reset              (   1),
         .is_rand                (   1),
         .individually_accessible(   1)
      );
      uart1 = uvmx_reg_field_c::type_id::create("uart1");
      uart1.configure(
         .parent                 (this),
         .size                   (   1),
         .lsb_pos                (   1),
         .access                 ("RW"),
         .volatile               (   0),
         .reset                  (   0),
         .has_reset              (   1),
         .is_rand                (   1),
         .individually_accessible(   1)
      );
      qspim0 = uvmx_reg_field_c::type_id::create("qspim0");
      qspim0.configure(
         .parent                 (this),
         .size                   (   1),
         .lsb_pos                (   2),
         .access                 ("RW"),
         .volatile               (   0),
         .reset                  (   0),
         .has_reset              (   1),
         .is_rand                (   1),
         .individually_accessible(   1)
      );
      qspim1 = uvmx_reg_field_c::type_id::create("qspim1");
      qspim1.configure(
         .parent                 (this),
         .size                   (   1),
         .lsb_pos                (   3),
         .access                 ("RW"),
         .volatile               (   0),
         .reset                  (   0),
         .has_reset              (   1),
         .is_rand                (   1),
         .individually_accessible(   1)
      );
      i2cm0 = uvmx_reg_field_c::type_id::create("i2cm0");
      i2cm0.configure(
         .parent                 (this),
         .size                   (   1),
         .lsb_pos                (   4),
         .access                 ("RW"),
         .volatile               (   0),
         .reset                  (   0),
         .has_reset              (   1),
         .is_rand                (   1),
         .individually_accessible(   1)
      );
      i2cm1 = uvmx_reg_field_c::type_id::create("i2cm1");
      i2cm1.configure(
         .parent                 (this),
         .size                   (   1),
         .lsb_pos                (   5),
         .access                 ("RW"),
         .volatile               (   0),
         .reset                  (   0),
         .has_reset              (   1),
         .is_rand                (   1),
         .individually_accessible(   1)
      );
      i2cs_csi_hyper_sdio = uvmx_reg_field_c::type_id::create("i2cs_csi_hyper_sdio");
      i2cs_csi_hyper_sdio.configure(
         .parent                 (this),
         .size                   (   1),
         .lsb_pos                (   6),
         .access                 ("RW"),
         .volatile               (   0),
         .reset                  (   0),
         .has_reset              (   1),
         .is_rand                (   1),
         .individually_accessible(   1)
      );
      cam0 = uvmx_reg_field_c::type_id::create("cam0");
      cam0.configure(
         .parent                 (this),
         .size                   (   1),
         .lsb_pos                (   7),
         .access                 ("RW"),
         .volatile               (   0),
         .reset                  (   0),
         .has_reset              (   1),
         .is_rand                (   1),
         .individually_accessible(   1)
      );
      jtag_mram_filter = uvmx_reg_field_c::type_id::create("jtag_mram_filter");
      jtag_mram_filter.configure(
         .parent                 (this),
         .size                   (   1),
         .lsb_pos                (   8),
         .access                 ("RW"),
         .volatile               (   0),
         .reset                  (   0),
         .has_reset              (   1),
         .is_rand                (   1),
         .individually_accessible(   1)
      );
      fpga_ext_per = uvmx_reg_field_c::type_id::create("fpga_ext_per");
      fpga_ext_per.configure(
         .parent                 (this),
         .size                   (   1),
         .lsb_pos                (   9),
         .access                 ("RW"),
         .volatile               (   0),
         .reset                  (   0),
         .has_reset              (   1),
         .is_rand                (   1),
         .individually_accessible(   1)
      );
   endfunction

endclass


`endif // __UVME_CVMCU_CHIP_UDMA_CTRL_PERIPH_RESET_REG_SV__