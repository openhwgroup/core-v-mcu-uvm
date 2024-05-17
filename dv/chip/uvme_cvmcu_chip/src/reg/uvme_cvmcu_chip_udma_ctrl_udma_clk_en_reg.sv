// Copyright 2024 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// THE FOLLOWING IS GENERATED CODE: ANY CHANGES MADE WILL BE ERASED UPON THE NEXT ITERATION


`ifndef __UVME_CVMCU_CHIP_UDMA_CTRL_UDMA_CTRL_UDMA_CLK_EN_REG_SV__
`define __UVME_CVMCU_CHIP_UDMA_CTRL_UDMA_CTRL_UDMA_CLK_EN_REG_SV__


class uvme_cvmcu_chip_udma_ctrl_udma_ctrl_udma_clk_en_reg_c extends uvmx_reg_c;

   rand uvmx_reg_field_c  uart0; ///< Enable for UART0 clock
   rand uvmx_reg_field_c  uart1; ///< Enable for UART1 clock
   rand uvmx_reg_field_c  qspim0; ///< Enable for QSPIM0 clock
   rand uvmx_reg_field_c  qspim1; ///< Enable for QSPIM1 clock
   rand uvmx_reg_field_c  i2cm0; ///< Enable for I2CM0 clock
   rand uvmx_reg_field_c  i2cm1; ///< Enable for I2CM1 clock
   rand uvmx_reg_field_c  i2cs_csi_hyper_sdio; ///< Enable for I2SC0, CSI20, HYPER0 and SDIO0 clock
   rand uvmx_reg_field_c  cam0; ///< Enable for CAM0 clock
   rand uvmx_reg_field_c  jtag_mram_filter; ///< Enable for JTAG, MRAM and FILTER clock
   rand uvmx_reg_field_c  fpga_ext_per; ///< Enable for FPGA and EXT_PER clock


   `uvm_object_utils_begin(uvme_cvmcu_chip_udma_ctrl_udma_ctrl_udma_clk_en_reg_c)
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
   function new(string name="uvme_cvmcu_chip_udma_ctrl_udma_ctrl_udma_clk_en_reg", int unsigned n_bits=32, int has_coverage=UVM_NO_COVERAGE);
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


`endif // __UVME_CVMCU_CHIP_UDMA_CTRL_UDMA_CTRL_UDMA_CLK_EN_REG_SV__