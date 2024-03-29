// Copyright 2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVME_CVMCU_CHIP_COV_MODEL_SV__
`define __UVME_CVMCU_CHIP_COV_MODEL_SV__


/**
 * Component encapsulating CORE-V-MCU Chip's functional coverage model.
 * @ingroup uvme_cvmcu_chip_comps
 */
class uvme_cvmcu_chip_cov_model_c extends uvmx_chip_env_cov_model_c #(
   .T_CFG  (uvme_cvmcu_chip_cfg_c  ),
   .T_CNTXT(uvme_cvmcu_chip_cntxt_c)
);

   /// @name Objects
   /// @{
   uvma_spi_mon_trn_c  udma_qspi0_ingress_exp_trn; ///< Transaction to be sampled for udma_qspi0_ingress expected
   uvma_spi_mon_trn_c  udma_qspi1_ingress_exp_trn; ///< Transaction to be sampled for udma_qspi1_ingress expected
   uvma_cvmcu_cpi_mon_trn_c  udma_camera_exp_trn; ///< Transaction to be sampled for udma_camera expected
   uvma_i2c_mon_trn_c  udma_i2c0_ingress_exp_trn; ///< Transaction to be sampled for udma_i2c0_ingress expected
   uvma_i2c_mon_trn_c  udma_i2c1_ingress_exp_trn; ///< Transaction to be sampled for udma_i2c1_ingress expected
   uvma_uart_mon_trn_c  udma_uart0_ingress_exp_trn; ///< Transaction to be sampled for udma_uart0_ingress expected
   uvma_uart_mon_trn_c  udma_uart1_ingress_exp_trn; ///< Transaction to be sampled for udma_uart1_ingress expected
   uvma_i2c_mon_trn_c  apb_i2c_ingress_exp_trn; ///< Transaction to be sampled for apb_i2c_ingress expected
   uvma_cvmcu_io_mon_trn_c  gpio_ingress_exp_trn; ///< Transaction to be sampled for gpio_ingress expected
   uvma_cvmcu_event_mon_trn_c  mon_event_exp_trn; ///< Transaction to be sampled for mon_event expected
   uvma_cvmcu_dbg_mon_trn_c  mon_dbg_exp_trn; ///< Transaction to be sampled for mon_dbg expected
   uvma_spi_mon_trn_c  udma_qspi0_egress_exp_trn; ///< Transaction to be sampled for udma_qspi0_egress expected
   uvma_spi_mon_trn_c  udma_qspi1_egress_exp_trn; ///< Transaction to be sampled for udma_qspi1_egress expected
   uvma_i2c_mon_trn_c  udma_i2c0_egress_exp_trn; ///< Transaction to be sampled for udma_i2c0_egress expected
   uvma_i2c_mon_trn_c  udma_i2c1_egress_exp_trn; ///< Transaction to be sampled for udma_i2c1_egress expected
   uvma_uart_mon_trn_c  udma_uart0_egress_exp_trn; ///< Transaction to be sampled for udma_uart0_egress expected
   uvma_uart_mon_trn_c  udma_uart1_egress_exp_trn; ///< Transaction to be sampled for udma_uart1_egress expected
   uvma_i2c_mon_trn_c  apb_i2c_egress_exp_trn; ///< Transaction to be sampled for apb_i2c_egress expected
   uvma_cvmcu_io_mon_trn_c  gpio_egress_exp_trn; ///< Transaction to be sampled for gpio_egress expected
   uvma_cvmcu_event_mon_trn_c  event_exp_trn; ///< Transaction to be sampled for event expected
   uvma_cvmcu_dbg_mon_trn_c  dbg_exp_trn; ///< Transaction to be sampled for dbg expected
   uvma_spi_mon_trn_c  udma_qspi0_egress_act_trn; ///< Transaction to be sampled for udma_qspi0_egress actual
   uvma_spi_mon_trn_c  udma_qspi1_egress_act_trn; ///< Transaction to be sampled for udma_qspi1_egress actual
   uvma_i2c_mon_trn_c  udma_i2c0_egress_act_trn; ///< Transaction to be sampled for udma_i2c0_egress actual
   uvma_i2c_mon_trn_c  udma_i2c1_egress_act_trn; ///< Transaction to be sampled for udma_i2c1_egress actual
   uvma_uart_mon_trn_c  udma_uart0_egress_act_trn; ///< Transaction to be sampled for udma_uart0_egress actual
   uvma_uart_mon_trn_c  udma_uart1_egress_act_trn; ///< Transaction to be sampled for udma_uart1_egress actual
   uvma_i2c_mon_trn_c  apb_i2c_egress_act_trn; ///< Transaction to be sampled for apb_i2c_egress actual
   uvma_cvmcu_io_mon_trn_c  gpio_egress_act_trn; ///< Transaction to be sampled for gpio_egress actual
   uvma_cvmcu_event_mon_trn_c  event_act_trn; ///< Transaction to be sampled for event actual
   uvma_cvmcu_dbg_mon_trn_c  dbg_act_trn; ///< Transaction to be sampled for dbg actual
   uvma_spi_mon_trn_c  udma_qspi0_ingress_act_trn; ///< Transaction to be sampled for udma_qspi0_ingress actual
   uvma_spi_mon_trn_c  udma_qspi1_ingress_act_trn; ///< Transaction to be sampled for udma_qspi1_ingress actual
   uvma_cvmcu_cpi_mon_trn_c  udma_camera_act_trn; ///< Transaction to be sampled for udma_camera actual
   uvma_i2c_mon_trn_c  udma_i2c0_ingress_act_trn; ///< Transaction to be sampled for udma_i2c0_ingress actual
   uvma_i2c_mon_trn_c  udma_i2c1_ingress_act_trn; ///< Transaction to be sampled for udma_i2c1_ingress actual
   uvma_uart_mon_trn_c  udma_uart0_ingress_act_trn; ///< Transaction to be sampled for udma_uart0_ingress actual
   uvma_uart_mon_trn_c  udma_uart1_ingress_act_trn; ///< Transaction to be sampled for udma_uart1_ingress actual
   uvma_i2c_mon_trn_c  apb_i2c_ingress_act_trn; ///< Transaction to be sampled for apb_i2c_ingress actual
   uvma_cvmcu_io_mon_trn_c  gpio_ingress_act_trn; ///< Transaction to be sampled for gpio_ingress actual
   /// @}

   /// @name TLM
   /// @{
   uvm_tlm_analysis_fifo #(uvma_spi_mon_trn_c)  udma_qspi0_ingress_exp_fifo; ///< Queue for udma_qspi0_ingress expected transactions
   uvm_tlm_analysis_fifo #(uvma_spi_mon_trn_c)  udma_qspi1_ingress_exp_fifo; ///< Queue for udma_qspi1_ingress expected transactions
   uvm_tlm_analysis_fifo #(uvma_cvmcu_cpi_mon_trn_c)  udma_camera_exp_fifo; ///< Queue for udma_camera expected transactions
   uvm_tlm_analysis_fifo #(uvma_i2c_mon_trn_c)  udma_i2c0_ingress_exp_fifo; ///< Queue for udma_i2c0_ingress expected transactions
   uvm_tlm_analysis_fifo #(uvma_i2c_mon_trn_c)  udma_i2c1_ingress_exp_fifo; ///< Queue for udma_i2c1_ingress expected transactions
   uvm_tlm_analysis_fifo #(uvma_uart_mon_trn_c)  udma_uart0_ingress_exp_fifo; ///< Queue for udma_uart0_ingress expected transactions
   uvm_tlm_analysis_fifo #(uvma_uart_mon_trn_c)  udma_uart1_ingress_exp_fifo; ///< Queue for udma_uart1_ingress expected transactions
   uvm_tlm_analysis_fifo #(uvma_i2c_mon_trn_c)  apb_i2c_ingress_exp_fifo; ///< Queue for apb_i2c_ingress expected transactions
   uvm_tlm_analysis_fifo #(uvma_cvmcu_io_mon_trn_c)  gpio_ingress_exp_fifo; ///< Queue for gpio_ingress expected transactions
   uvm_tlm_analysis_fifo #(uvma_cvmcu_event_mon_trn_c)  mon_event_exp_fifo; ///< Queue for mon_event expected transactions
   uvm_tlm_analysis_fifo #(uvma_cvmcu_dbg_mon_trn_c)  mon_dbg_exp_fifo; ///< Queue for mon_dbg expected transactions
   uvm_tlm_analysis_fifo #(uvma_spi_mon_trn_c)  udma_qspi0_egress_exp_fifo; ///< Queue for udma_qspi0_egress expected transactions
   uvm_tlm_analysis_fifo #(uvma_spi_mon_trn_c)  udma_qspi1_egress_exp_fifo; ///< Queue for udma_qspi1_egress expected transactions
   uvm_tlm_analysis_fifo #(uvma_i2c_mon_trn_c)  udma_i2c0_egress_exp_fifo; ///< Queue for udma_i2c0_egress expected transactions
   uvm_tlm_analysis_fifo #(uvma_i2c_mon_trn_c)  udma_i2c1_egress_exp_fifo; ///< Queue for udma_i2c1_egress expected transactions
   uvm_tlm_analysis_fifo #(uvma_uart_mon_trn_c)  udma_uart0_egress_exp_fifo; ///< Queue for udma_uart0_egress expected transactions
   uvm_tlm_analysis_fifo #(uvma_uart_mon_trn_c)  udma_uart1_egress_exp_fifo; ///< Queue for udma_uart1_egress expected transactions
   uvm_tlm_analysis_fifo #(uvma_i2c_mon_trn_c)  apb_i2c_egress_exp_fifo; ///< Queue for apb_i2c_egress expected transactions
   uvm_tlm_analysis_fifo #(uvma_cvmcu_io_mon_trn_c)  gpio_egress_exp_fifo; ///< Queue for gpio_egress expected transactions
   uvm_tlm_analysis_fifo #(uvma_cvmcu_event_mon_trn_c)  event_exp_fifo; ///< Queue for event expected transactions
   uvm_tlm_analysis_fifo #(uvma_cvmcu_dbg_mon_trn_c)  dbg_exp_fifo; ///< Queue for dbg expected transactions
   uvm_tlm_analysis_fifo #(uvma_spi_mon_trn_c)  udma_qspi0_egress_act_fifo; ///< Queue for udma_qspi0_egress actual transactions
   uvm_tlm_analysis_fifo #(uvma_spi_mon_trn_c)  udma_qspi1_egress_act_fifo; ///< Queue for udma_qspi1_egress actual transactions
   uvm_tlm_analysis_fifo #(uvma_i2c_mon_trn_c)  udma_i2c0_egress_act_fifo; ///< Queue for udma_i2c0_egress actual transactions
   uvm_tlm_analysis_fifo #(uvma_i2c_mon_trn_c)  udma_i2c1_egress_act_fifo; ///< Queue for udma_i2c1_egress actual transactions
   uvm_tlm_analysis_fifo #(uvma_uart_mon_trn_c)  udma_uart0_egress_act_fifo; ///< Queue for udma_uart0_egress actual transactions
   uvm_tlm_analysis_fifo #(uvma_uart_mon_trn_c)  udma_uart1_egress_act_fifo; ///< Queue for udma_uart1_egress actual transactions
   uvm_tlm_analysis_fifo #(uvma_i2c_mon_trn_c)  apb_i2c_egress_act_fifo; ///< Queue for apb_i2c_egress actual transactions
   uvm_tlm_analysis_fifo #(uvma_cvmcu_io_mon_trn_c)  gpio_egress_act_fifo; ///< Queue for gpio_egress actual transactions
   uvm_tlm_analysis_fifo #(uvma_cvmcu_event_mon_trn_c)  event_act_fifo; ///< Queue for event actual transactions
   uvm_tlm_analysis_fifo #(uvma_cvmcu_dbg_mon_trn_c)  dbg_act_fifo; ///< Queue for dbg actual transactions
   uvm_tlm_analysis_fifo #(uvma_spi_mon_trn_c)  udma_qspi0_ingress_act_fifo; ///< Queue for udma_qspi0_ingress actual transactions
   uvm_tlm_analysis_fifo #(uvma_spi_mon_trn_c)  udma_qspi1_ingress_act_fifo; ///< Queue for udma_qspi1_ingress actual transactions
   uvm_tlm_analysis_fifo #(uvma_cvmcu_cpi_mon_trn_c)  udma_camera_act_fifo; ///< Queue for udma_camera actual transactions
   uvm_tlm_analysis_fifo #(uvma_i2c_mon_trn_c)  udma_i2c0_ingress_act_fifo; ///< Queue for udma_i2c0_ingress actual transactions
   uvm_tlm_analysis_fifo #(uvma_i2c_mon_trn_c)  udma_i2c1_ingress_act_fifo; ///< Queue for udma_i2c1_ingress actual transactions
   uvm_tlm_analysis_fifo #(uvma_uart_mon_trn_c)  udma_uart0_ingress_act_fifo; ///< Queue for udma_uart0_ingress actual transactions
   uvm_tlm_analysis_fifo #(uvma_uart_mon_trn_c)  udma_uart1_ingress_act_fifo; ///< Queue for udma_uart1_ingress actual transactions
   uvm_tlm_analysis_fifo #(uvma_i2c_mon_trn_c)  apb_i2c_ingress_act_fifo; ///< Queue for apb_i2c_ingress actual transactions
   uvm_tlm_analysis_fifo #(uvma_cvmcu_io_mon_trn_c)  gpio_ingress_act_fifo; ///< Queue for gpio_ingress actual transactions
   /// @}


   `uvm_component_utils(uvme_cvmcu_chip_cov_model_c)


   /**
    * Coverage for #cfg
    */
   covergroup cvmcu_chip_cfg_cg;
      // TODO Implement cvmcu_chip_cfg_cg
      //      Ex: abc_cp : coverpoint cfg.abc;
   endgroup : cvmcu_chip_cfg_cg

   /**
    * Coverage for #cntxt
    */
   covergroup cvmcu_chip_cntxt_cg;
      // TODO Implement cvmcu_chip_cntxt_cg
      //      Ex: abc_cp : coverpoint cntxt.abc;
   endgroup : cvmcu_chip_cntxt_cg

   /**
    * Coverage for udma_qspi0_ingress expected transaction: udma_qspi0_ingress_exp_trn
    */
   covergroup cvmcu_chip_udma_qspi0_ingress_exp_cg;
      // TODO Implement cvmcu_chip_udma_qspi0_ingress_exp_cg
      //      Ex: abc_cp : coverpoint udma_qspi0_ingress_exp_trn.abc;
   endgroup

   /**
    * Coverage for udma_qspi1_ingress expected transaction: udma_qspi1_ingress_exp_trn
    */
   covergroup cvmcu_chip_udma_qspi1_ingress_exp_cg;
      // TODO Implement cvmcu_chip_udma_qspi1_ingress_exp_cg
      //      Ex: abc_cp : coverpoint udma_qspi1_ingress_exp_trn.abc;
   endgroup

   /**
    * Coverage for udma_camera expected transaction: udma_camera_exp_trn
    */
   covergroup cvmcu_chip_udma_camera_exp_cg;
      // TODO Implement cvmcu_chip_udma_camera_exp_cg
      //      Ex: abc_cp : coverpoint udma_camera_exp_trn.abc;
   endgroup

   /**
    * Coverage for udma_i2c0_ingress expected transaction: udma_i2c0_ingress_exp_trn
    */
   covergroup cvmcu_chip_udma_i2c0_ingress_exp_cg;
      // TODO Implement cvmcu_chip_udma_i2c0_ingress_exp_cg
      //      Ex: abc_cp : coverpoint udma_i2c0_ingress_exp_trn.abc;
   endgroup

   /**
    * Coverage for udma_i2c1_ingress expected transaction: udma_i2c1_ingress_exp_trn
    */
   covergroup cvmcu_chip_udma_i2c1_ingress_exp_cg;
      // TODO Implement cvmcu_chip_udma_i2c1_ingress_exp_cg
      //      Ex: abc_cp : coverpoint udma_i2c1_ingress_exp_trn.abc;
   endgroup

   /**
    * Coverage for udma_uart0_ingress expected transaction: udma_uart0_ingress_exp_trn
    */
   covergroup cvmcu_chip_udma_uart0_ingress_exp_cg;
      // TODO Implement cvmcu_chip_udma_uart0_ingress_exp_cg
      //      Ex: abc_cp : coverpoint udma_uart0_ingress_exp_trn.abc;
   endgroup

   /**
    * Coverage for udma_uart1_ingress expected transaction: udma_uart1_ingress_exp_trn
    */
   covergroup cvmcu_chip_udma_uart1_ingress_exp_cg;
      // TODO Implement cvmcu_chip_udma_uart1_ingress_exp_cg
      //      Ex: abc_cp : coverpoint udma_uart1_ingress_exp_trn.abc;
   endgroup

   /**
    * Coverage for apb_i2c_ingress expected transaction: apb_i2c_ingress_exp_trn
    */
   covergroup cvmcu_chip_apb_i2c_ingress_exp_cg;
      // TODO Implement cvmcu_chip_apb_i2c_ingress_exp_cg
      //      Ex: abc_cp : coverpoint apb_i2c_ingress_exp_trn.abc;
   endgroup

   /**
    * Coverage for gpio_ingress expected transaction: gpio_ingress_exp_trn
    */
   covergroup cvmcu_chip_gpio_ingress_exp_cg;
      // TODO Implement cvmcu_chip_gpio_ingress_exp_cg
      //      Ex: abc_cp : coverpoint gpio_ingress_exp_trn.abc;
   endgroup

   /**
    * Coverage for mon_event expected transaction: mon_event_exp_trn
    */
   covergroup cvmcu_chip_mon_event_exp_cg;
      // TODO Implement cvmcu_chip_mon_event_exp_cg
      //      Ex: abc_cp : coverpoint mon_event_exp_trn.abc;
   endgroup

   /**
    * Coverage for mon_dbg expected transaction: mon_dbg_exp_trn
    */
   covergroup cvmcu_chip_mon_dbg_exp_cg;
      // TODO Implement cvmcu_chip_mon_dbg_exp_cg
      //      Ex: abc_cp : coverpoint mon_dbg_exp_trn.abc;
   endgroup

   /**
    * Coverage for udma_qspi0_egress expected transaction: udma_qspi0_egress_exp_trn
    */
   covergroup cvmcu_chip_udma_qspi0_egress_exp_cg;
      // TODO Implement cvmcu_chip_udma_qspi0_egress_exp_cg
      //      Ex: abc_cp : coverpoint udma_qspi0_egress_exp_trn.abc;
   endgroup

   /**
    * Coverage for udma_qspi1_egress expected transaction: udma_qspi1_egress_exp_trn
    */
   covergroup cvmcu_chip_udma_qspi1_egress_exp_cg;
      // TODO Implement cvmcu_chip_udma_qspi1_egress_exp_cg
      //      Ex: abc_cp : coverpoint udma_qspi1_egress_exp_trn.abc;
   endgroup

   /**
    * Coverage for udma_i2c0_egress expected transaction: udma_i2c0_egress_exp_trn
    */
   covergroup cvmcu_chip_udma_i2c0_egress_exp_cg;
      // TODO Implement cvmcu_chip_udma_i2c0_egress_exp_cg
      //      Ex: abc_cp : coverpoint udma_i2c0_egress_exp_trn.abc;
   endgroup

   /**
    * Coverage for udma_i2c1_egress expected transaction: udma_i2c1_egress_exp_trn
    */
   covergroup cvmcu_chip_udma_i2c1_egress_exp_cg;
      // TODO Implement cvmcu_chip_udma_i2c1_egress_exp_cg
      //      Ex: abc_cp : coverpoint udma_i2c1_egress_exp_trn.abc;
   endgroup

   /**
    * Coverage for udma_uart0_egress expected transaction: udma_uart0_egress_exp_trn
    */
   covergroup cvmcu_chip_udma_uart0_egress_exp_cg;
      // TODO Implement cvmcu_chip_udma_uart0_egress_exp_cg
      //      Ex: abc_cp : coverpoint udma_uart0_egress_exp_trn.abc;
   endgroup

   /**
    * Coverage for udma_uart1_egress expected transaction: udma_uart1_egress_exp_trn
    */
   covergroup cvmcu_chip_udma_uart1_egress_exp_cg;
      // TODO Implement cvmcu_chip_udma_uart1_egress_exp_cg
      //      Ex: abc_cp : coverpoint udma_uart1_egress_exp_trn.abc;
   endgroup

   /**
    * Coverage for apb_i2c_egress expected transaction: apb_i2c_egress_exp_trn
    */
   covergroup cvmcu_chip_apb_i2c_egress_exp_cg;
      // TODO Implement cvmcu_chip_apb_i2c_egress_exp_cg
      //      Ex: abc_cp : coverpoint apb_i2c_egress_exp_trn.abc;
   endgroup

   /**
    * Coverage for gpio_egress expected transaction: gpio_egress_exp_trn
    */
   covergroup cvmcu_chip_gpio_egress_exp_cg;
      // TODO Implement cvmcu_chip_gpio_egress_exp_cg
      //      Ex: abc_cp : coverpoint gpio_egress_exp_trn.abc;
   endgroup

   /**
    * Coverage for event expected transaction: event_exp_trn
    */
   covergroup cvmcu_chip_event_exp_cg;
      // TODO Implement cvmcu_chip_event_exp_cg
      //      Ex: abc_cp : coverpoint event_exp_trn.abc;
   endgroup

   /**
    * Coverage for dbg expected transaction: dbg_exp_trn
    */
   covergroup cvmcu_chip_dbg_exp_cg;
      // TODO Implement cvmcu_chip_dbg_exp_cg
      //      Ex: abc_cp : coverpoint dbg_exp_trn.abc;
   endgroup

   /**
    * Coverage for udma_qspi0_egress actual transaction: udma_qspi0_egress_act_trn
    */
   covergroup cvmcu_chip_udma_qspi0_egress_act_cg;
      // TODO Implement cvmcu_chip_udma_qspi0_egress_act_cg
      //      Ex: abc_cp : coverpoint udma_qspi0_egress_act_trn.abc;
   endgroup

   /**
    * Coverage for udma_qspi1_egress actual transaction: udma_qspi1_egress_act_trn
    */
   covergroup cvmcu_chip_udma_qspi1_egress_act_cg;
      // TODO Implement cvmcu_chip_udma_qspi1_egress_act_cg
      //      Ex: abc_cp : coverpoint udma_qspi1_egress_act_trn.abc;
   endgroup

   /**
    * Coverage for udma_i2c0_egress actual transaction: udma_i2c0_egress_act_trn
    */
   covergroup cvmcu_chip_udma_i2c0_egress_act_cg;
      // TODO Implement cvmcu_chip_udma_i2c0_egress_act_cg
      //      Ex: abc_cp : coverpoint udma_i2c0_egress_act_trn.abc;
   endgroup

   /**
    * Coverage for udma_i2c1_egress actual transaction: udma_i2c1_egress_act_trn
    */
   covergroup cvmcu_chip_udma_i2c1_egress_act_cg;
      // TODO Implement cvmcu_chip_udma_i2c1_egress_act_cg
      //      Ex: abc_cp : coverpoint udma_i2c1_egress_act_trn.abc;
   endgroup

   /**
    * Coverage for udma_uart0_egress actual transaction: udma_uart0_egress_act_trn
    */
   covergroup cvmcu_chip_udma_uart0_egress_act_cg;
      // TODO Implement cvmcu_chip_udma_uart0_egress_act_cg
      //      Ex: abc_cp : coverpoint udma_uart0_egress_act_trn.abc;
   endgroup

   /**
    * Coverage for udma_uart1_egress actual transaction: udma_uart1_egress_act_trn
    */
   covergroup cvmcu_chip_udma_uart1_egress_act_cg;
      // TODO Implement cvmcu_chip_udma_uart1_egress_act_cg
      //      Ex: abc_cp : coverpoint udma_uart1_egress_act_trn.abc;
   endgroup

   /**
    * Coverage for apb_i2c_egress actual transaction: apb_i2c_egress_act_trn
    */
   covergroup cvmcu_chip_apb_i2c_egress_act_cg;
      // TODO Implement cvmcu_chip_apb_i2c_egress_act_cg
      //      Ex: abc_cp : coverpoint apb_i2c_egress_act_trn.abc;
   endgroup

   /**
    * Coverage for gpio_egress actual transaction: gpio_egress_act_trn
    */
   covergroup cvmcu_chip_gpio_egress_act_cg;
      // TODO Implement cvmcu_chip_gpio_egress_act_cg
      //      Ex: abc_cp : coverpoint gpio_egress_act_trn.abc;
   endgroup

   /**
    * Coverage for event actual transaction: event_act_trn
    */
   covergroup cvmcu_chip_event_act_cg;
      // TODO Implement cvmcu_chip_event_act_cg
      //      Ex: abc_cp : coverpoint event_act_trn.abc;
   endgroup

   /**
    * Coverage for dbg actual transaction: dbg_act_trn
    */
   covergroup cvmcu_chip_dbg_act_cg;
      // TODO Implement cvmcu_chip_dbg_act_cg
      //      Ex: abc_cp : coverpoint dbg_act_trn.abc;
   endgroup

   /**
    * Coverage for udma_qspi0_ingress actual transaction: udma_qspi0_ingress_act_trn
    */
   covergroup cvmcu_chip_udma_qspi0_ingress_act_cg;
      // TODO Implement cvmcu_chip_udma_qspi0_ingress_act_cg
      //      Ex: abc_cp : coverpoint udma_qspi0_ingress_act_trn.abc;
   endgroup

   /**
    * Coverage for udma_qspi1_ingress actual transaction: udma_qspi1_ingress_act_trn
    */
   covergroup cvmcu_chip_udma_qspi1_ingress_act_cg;
      // TODO Implement cvmcu_chip_udma_qspi1_ingress_act_cg
      //      Ex: abc_cp : coverpoint udma_qspi1_ingress_act_trn.abc;
   endgroup

   /**
    * Coverage for udma_camera actual transaction: udma_camera_act_trn
    */
   covergroup cvmcu_chip_udma_camera_act_cg;
      // TODO Implement cvmcu_chip_udma_camera_act_cg
      //      Ex: abc_cp : coverpoint udma_camera_act_trn.abc;
   endgroup

   /**
    * Coverage for udma_i2c0_ingress actual transaction: udma_i2c0_ingress_act_trn
    */
   covergroup cvmcu_chip_udma_i2c0_ingress_act_cg;
      // TODO Implement cvmcu_chip_udma_i2c0_ingress_act_cg
      //      Ex: abc_cp : coverpoint udma_i2c0_ingress_act_trn.abc;
   endgroup

   /**
    * Coverage for udma_i2c1_ingress actual transaction: udma_i2c1_ingress_act_trn
    */
   covergroup cvmcu_chip_udma_i2c1_ingress_act_cg;
      // TODO Implement cvmcu_chip_udma_i2c1_ingress_act_cg
      //      Ex: abc_cp : coverpoint udma_i2c1_ingress_act_trn.abc;
   endgroup

   /**
    * Coverage for udma_uart0_ingress actual transaction: udma_uart0_ingress_act_trn
    */
   covergroup cvmcu_chip_udma_uart0_ingress_act_cg;
      // TODO Implement cvmcu_chip_udma_uart0_ingress_act_cg
      //      Ex: abc_cp : coverpoint udma_uart0_ingress_act_trn.abc;
   endgroup

   /**
    * Coverage for udma_uart1_ingress actual transaction: udma_uart1_ingress_act_trn
    */
   covergroup cvmcu_chip_udma_uart1_ingress_act_cg;
      // TODO Implement cvmcu_chip_udma_uart1_ingress_act_cg
      //      Ex: abc_cp : coverpoint udma_uart1_ingress_act_trn.abc;
   endgroup

   /**
    * Coverage for apb_i2c_ingress actual transaction: apb_i2c_ingress_act_trn
    */
   covergroup cvmcu_chip_apb_i2c_ingress_act_cg;
      // TODO Implement cvmcu_chip_apb_i2c_ingress_act_cg
      //      Ex: abc_cp : coverpoint apb_i2c_ingress_act_trn.abc;
   endgroup

   /**
    * Coverage for gpio_ingress actual transaction: gpio_ingress_act_trn
    */
   covergroup cvmcu_chip_gpio_ingress_act_cg;
      // TODO Implement cvmcu_chip_gpio_ingress_act_cg
      //      Ex: abc_cp : coverpoint gpio_ingress_act_trn.abc;
   endgroup

   /**
    * Creates covergroups.
    */
   function new(string name="uvme_cvmcu_chip_cov_model", uvm_component parent=null);
      super.new(name, parent);
      cvmcu_chip_cfg_cg   = new();
      cvmcu_chip_cntxt_cg = new();
      cvmcu_chip_udma_qspi0_ingress_exp_cg = new();
      cvmcu_chip_udma_qspi1_ingress_exp_cg = new();
      cvmcu_chip_udma_camera_exp_cg = new();
      cvmcu_chip_udma_i2c0_ingress_exp_cg = new();
      cvmcu_chip_udma_i2c1_ingress_exp_cg = new();
      cvmcu_chip_udma_uart0_ingress_exp_cg = new();
      cvmcu_chip_udma_uart1_ingress_exp_cg = new();
      cvmcu_chip_apb_i2c_ingress_exp_cg = new();
      cvmcu_chip_gpio_ingress_exp_cg = new();
      cvmcu_chip_mon_event_exp_cg = new();
      cvmcu_chip_mon_dbg_exp_cg = new();
      cvmcu_chip_udma_qspi0_egress_exp_cg = new();
      cvmcu_chip_udma_qspi1_egress_exp_cg = new();
      cvmcu_chip_udma_i2c0_egress_exp_cg = new();
      cvmcu_chip_udma_i2c1_egress_exp_cg = new();
      cvmcu_chip_udma_uart0_egress_exp_cg = new();
      cvmcu_chip_udma_uart1_egress_exp_cg = new();
      cvmcu_chip_apb_i2c_egress_exp_cg = new();
      cvmcu_chip_gpio_egress_exp_cg = new();
      cvmcu_chip_event_exp_cg = new();
      cvmcu_chip_dbg_exp_cg = new();
      cvmcu_chip_udma_qspi0_egress_act_cg = new();
      cvmcu_chip_udma_qspi1_egress_act_cg = new();
      cvmcu_chip_udma_i2c0_egress_act_cg = new();
      cvmcu_chip_udma_i2c1_egress_act_cg = new();
      cvmcu_chip_udma_uart0_egress_act_cg = new();
      cvmcu_chip_udma_uart1_egress_act_cg = new();
      cvmcu_chip_apb_i2c_egress_act_cg = new();
      cvmcu_chip_gpio_egress_act_cg = new();
      cvmcu_chip_event_act_cg = new();
      cvmcu_chip_dbg_act_cg = new();
      cvmcu_chip_udma_qspi0_ingress_act_cg = new();
      cvmcu_chip_udma_qspi1_ingress_act_cg = new();
      cvmcu_chip_udma_camera_act_cg = new();
      cvmcu_chip_udma_i2c0_ingress_act_cg = new();
      cvmcu_chip_udma_i2c1_ingress_act_cg = new();
      cvmcu_chip_udma_uart0_ingress_act_cg = new();
      cvmcu_chip_udma_uart1_ingress_act_cg = new();
      cvmcu_chip_apb_i2c_ingress_act_cg = new();
      cvmcu_chip_gpio_ingress_act_cg = new();
   endfunction

   /**
    * Creates TLM FIFOs.
    */
   virtual function void create_fifos();
      udma_qspi0_ingress_exp_fifo = new("udma_qspi0_ingress_exp_fifo", this);
      udma_qspi1_ingress_exp_fifo = new("udma_qspi1_ingress_exp_fifo", this);
      udma_camera_exp_fifo = new("udma_camera_exp_fifo", this);
      udma_i2c0_ingress_exp_fifo = new("udma_i2c0_ingress_exp_fifo", this);
      udma_i2c1_ingress_exp_fifo = new("udma_i2c1_ingress_exp_fifo", this);
      udma_uart0_ingress_exp_fifo = new("udma_uart0_ingress_exp_fifo", this);
      udma_uart1_ingress_exp_fifo = new("udma_uart1_ingress_exp_fifo", this);
      apb_i2c_ingress_exp_fifo = new("apb_i2c_ingress_exp_fifo", this);
      gpio_ingress_exp_fifo = new("gpio_ingress_exp_fifo", this);
      mon_event_exp_fifo = new("mon_event_exp_fifo", this);
      mon_dbg_exp_fifo = new("mon_dbg_exp_fifo", this);
      udma_qspi0_egress_exp_fifo = new("udma_qspi0_egress_exp_fifo", this);
      udma_qspi1_egress_exp_fifo = new("udma_qspi1_egress_exp_fifo", this);
      udma_i2c0_egress_exp_fifo = new("udma_i2c0_egress_exp_fifo", this);
      udma_i2c1_egress_exp_fifo = new("udma_i2c1_egress_exp_fifo", this);
      udma_uart0_egress_exp_fifo = new("udma_uart0_egress_exp_fifo", this);
      udma_uart1_egress_exp_fifo = new("udma_uart1_egress_exp_fifo", this);
      apb_i2c_egress_exp_fifo = new("apb_i2c_egress_exp_fifo", this);
      gpio_egress_exp_fifo = new("gpio_egress_exp_fifo", this);
      event_exp_fifo = new("event_exp_fifo", this);
      dbg_exp_fifo = new("dbg_exp_fifo", this);
      udma_qspi0_egress_act_fifo = new("udma_qspi0_egress_act_fifo", this);
      udma_qspi1_egress_act_fifo = new("udma_qspi1_egress_act_fifo", this);
      udma_i2c0_egress_act_fifo = new("udma_i2c0_egress_act_fifo", this);
      udma_i2c1_egress_act_fifo = new("udma_i2c1_egress_act_fifo", this);
      udma_uart0_egress_act_fifo = new("udma_uart0_egress_act_fifo", this);
      udma_uart1_egress_act_fifo = new("udma_uart1_egress_act_fifo", this);
      apb_i2c_egress_act_fifo = new("apb_i2c_egress_act_fifo", this);
      gpio_egress_act_fifo = new("gpio_egress_act_fifo", this);
      event_act_fifo = new("event_act_fifo", this);
      dbg_act_fifo = new("dbg_act_fifo", this);
      udma_qspi0_ingress_act_fifo = new("udma_qspi0_ingress_act_fifo", this);
      udma_qspi1_ingress_act_fifo = new("udma_qspi1_ingress_act_fifo", this);
      udma_camera_act_fifo = new("udma_camera_act_fifo", this);
      udma_i2c0_ingress_act_fifo = new("udma_i2c0_ingress_act_fifo", this);
      udma_i2c1_ingress_act_fifo = new("udma_i2c1_ingress_act_fifo", this);
      udma_uart0_ingress_act_fifo = new("udma_uart0_ingress_act_fifo", this);
      udma_uart1_ingress_act_fifo = new("udma_uart1_ingress_act_fifo", this);
      apb_i2c_ingress_act_fifo = new("apb_i2c_ingress_act_fifo", this);
      gpio_ingress_act_fifo = new("gpio_ingress_act_fifo", this);
   endfunction

   /// @name Sampling functions
   /// @{
   virtual function void sample_cfg();
      cvmcu_chip_cfg_cg.sample();
   endfunction

   virtual function void sample_cntxt();
      cvmcu_chip_cntxt_cg.sample();
   endfunction

   virtual task sample_tlm();
      fork
         forever begin
            udma_qspi0_ingress_exp_fifo.get(udma_qspi0_ingress_exp_trn);
            cvmcu_chip_udma_qspi0_ingress_exp_cg.sample();
         end
         forever begin
            udma_qspi1_ingress_exp_fifo.get(udma_qspi1_ingress_exp_trn);
            cvmcu_chip_udma_qspi1_ingress_exp_cg.sample();
         end
         forever begin
            udma_camera_exp_fifo.get(udma_camera_exp_trn);
            cvmcu_chip_udma_camera_exp_cg.sample();
         end
         forever begin
            udma_i2c0_ingress_exp_fifo.get(udma_i2c0_ingress_exp_trn);
            cvmcu_chip_udma_i2c0_ingress_exp_cg.sample();
         end
         forever begin
            udma_i2c1_ingress_exp_fifo.get(udma_i2c1_ingress_exp_trn);
            cvmcu_chip_udma_i2c1_ingress_exp_cg.sample();
         end
         forever begin
            udma_uart0_ingress_exp_fifo.get(udma_uart0_ingress_exp_trn);
            cvmcu_chip_udma_uart0_ingress_exp_cg.sample();
         end
         forever begin
            udma_uart1_ingress_exp_fifo.get(udma_uart1_ingress_exp_trn);
            cvmcu_chip_udma_uart1_ingress_exp_cg.sample();
         end
         forever begin
            apb_i2c_ingress_exp_fifo.get(apb_i2c_ingress_exp_trn);
            cvmcu_chip_apb_i2c_ingress_exp_cg.sample();
         end
         forever begin
            gpio_ingress_exp_fifo.get(gpio_ingress_exp_trn);
            cvmcu_chip_gpio_ingress_exp_cg.sample();
         end
         forever begin
            mon_event_exp_fifo.get(mon_event_exp_trn);
            cvmcu_chip_mon_event_exp_cg.sample();
         end
         forever begin
            mon_dbg_exp_fifo.get(mon_dbg_exp_trn);
            cvmcu_chip_mon_dbg_exp_cg.sample();
         end
         forever begin
            udma_qspi0_egress_exp_fifo.get(udma_qspi0_egress_exp_trn);
            cvmcu_chip_udma_qspi0_egress_exp_cg.sample();
         end
         forever begin
            udma_qspi1_egress_exp_fifo.get(udma_qspi1_egress_exp_trn);
            cvmcu_chip_udma_qspi1_egress_exp_cg.sample();
         end
         forever begin
            udma_i2c0_egress_exp_fifo.get(udma_i2c0_egress_exp_trn);
            cvmcu_chip_udma_i2c0_egress_exp_cg.sample();
         end
         forever begin
            udma_i2c1_egress_exp_fifo.get(udma_i2c1_egress_exp_trn);
            cvmcu_chip_udma_i2c1_egress_exp_cg.sample();
         end
         forever begin
            udma_uart0_egress_exp_fifo.get(udma_uart0_egress_exp_trn);
            cvmcu_chip_udma_uart0_egress_exp_cg.sample();
         end
         forever begin
            udma_uart1_egress_exp_fifo.get(udma_uart1_egress_exp_trn);
            cvmcu_chip_udma_uart1_egress_exp_cg.sample();
         end
         forever begin
            apb_i2c_egress_exp_fifo.get(apb_i2c_egress_exp_trn);
            cvmcu_chip_apb_i2c_egress_exp_cg.sample();
         end
         forever begin
            gpio_egress_exp_fifo.get(gpio_egress_exp_trn);
            cvmcu_chip_gpio_egress_exp_cg.sample();
         end
         forever begin
            event_exp_fifo.get(event_exp_trn);
            cvmcu_chip_event_exp_cg.sample();
         end
         forever begin
            dbg_exp_fifo.get(dbg_exp_trn);
            cvmcu_chip_dbg_exp_cg.sample();
         end
         forever begin
            udma_qspi0_egress_act_fifo.get(udma_qspi0_egress_act_trn);
            cvmcu_chip_udma_qspi0_egress_act_cg.sample();
         end
         forever begin
            udma_qspi1_egress_act_fifo.get(udma_qspi1_egress_act_trn);
            cvmcu_chip_udma_qspi1_egress_act_cg.sample();
         end
         forever begin
            udma_i2c0_egress_act_fifo.get(udma_i2c0_egress_act_trn);
            cvmcu_chip_udma_i2c0_egress_act_cg.sample();
         end
         forever begin
            udma_i2c1_egress_act_fifo.get(udma_i2c1_egress_act_trn);
            cvmcu_chip_udma_i2c1_egress_act_cg.sample();
         end
         forever begin
            udma_uart0_egress_act_fifo.get(udma_uart0_egress_act_trn);
            cvmcu_chip_udma_uart0_egress_act_cg.sample();
         end
         forever begin
            udma_uart1_egress_act_fifo.get(udma_uart1_egress_act_trn);
            cvmcu_chip_udma_uart1_egress_act_cg.sample();
         end
         forever begin
            apb_i2c_egress_act_fifo.get(apb_i2c_egress_act_trn);
            cvmcu_chip_apb_i2c_egress_act_cg.sample();
         end
         forever begin
            gpio_egress_act_fifo.get(gpio_egress_act_trn);
            cvmcu_chip_gpio_egress_act_cg.sample();
         end
         forever begin
            event_act_fifo.get(event_act_trn);
            cvmcu_chip_event_act_cg.sample();
         end
         forever begin
            dbg_act_fifo.get(dbg_act_trn);
            cvmcu_chip_dbg_act_cg.sample();
         end
         forever begin
            udma_qspi0_ingress_act_fifo.get(udma_qspi0_ingress_act_trn);
            cvmcu_chip_udma_qspi0_ingress_act_cg.sample();
         end
         forever begin
            udma_qspi1_ingress_act_fifo.get(udma_qspi1_ingress_act_trn);
            cvmcu_chip_udma_qspi1_ingress_act_cg.sample();
         end
         forever begin
            udma_camera_act_fifo.get(udma_camera_act_trn);
            cvmcu_chip_udma_camera_act_cg.sample();
         end
         forever begin
            udma_i2c0_ingress_act_fifo.get(udma_i2c0_ingress_act_trn);
            cvmcu_chip_udma_i2c0_ingress_act_cg.sample();
         end
         forever begin
            udma_i2c1_ingress_act_fifo.get(udma_i2c1_ingress_act_trn);
            cvmcu_chip_udma_i2c1_ingress_act_cg.sample();
         end
         forever begin
            udma_uart0_ingress_act_fifo.get(udma_uart0_ingress_act_trn);
            cvmcu_chip_udma_uart0_ingress_act_cg.sample();
         end
         forever begin
            udma_uart1_ingress_act_fifo.get(udma_uart1_ingress_act_trn);
            cvmcu_chip_udma_uart1_ingress_act_cg.sample();
         end
         forever begin
            apb_i2c_ingress_act_fifo.get(apb_i2c_ingress_act_trn);
            cvmcu_chip_apb_i2c_ingress_act_cg.sample();
         end
         forever begin
            gpio_ingress_act_fifo.get(gpio_ingress_act_trn);
            cvmcu_chip_gpio_ingress_act_cg.sample();
         end
      join
   endtask
   /// @}

endclass : uvme_cvmcu_chip_cov_model_c


`endif // __UVME_CVMCU_CHIP_COV_MODEL_SV__