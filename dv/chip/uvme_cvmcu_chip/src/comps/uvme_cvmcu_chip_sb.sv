// Copyright 2023 Acme Enterprises
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVME_CVMCU_CHIP_SB_SV__
`define __UVME_CVMCU_CHIP_SB_SV__


/**
 * Component encapsulating scoreboards which compare CORE-V-MCU Chip's expected (from predictor) vs. actual (monitored) transactions.
 * @ingroup uvme_cvmcu_chip_comps
 */
class uvme_cvmcu_chip_sb_c extends uvmx_chip_sb_c #(
   .T_CFG  (uvme_cvmcu_chip_cfg_c  ),
   .T_CNTXT(uvme_cvmcu_chip_cntxt_c)
);

   /// @name Components
   /// @{
   uvml_sb_simplex_c #(uvma_spi_mon_trn_c)  udma_qspi0_ingress_sb; ///< Scoreboard component for udma_qspi0_ingress prediction path.
   uvml_sb_simplex_c #(uvma_spi_mon_trn_c)  udma_qspi1_ingress_sb; ///< Scoreboard component for udma_qspi1_ingress prediction path.
   uvml_sb_simplex_c #(uvma_cvmcu_cpi_mon_trn_c)  udma_camera_sb; ///< Scoreboard component for udma_camera prediction path.
   uvml_sb_simplex_c #(uvma_i2c_mon_trn_c)  udma_i2c0_ingress_sb; ///< Scoreboard component for udma_i2c0_ingress prediction path.
   uvml_sb_simplex_c #(uvma_i2c_mon_trn_c)  udma_i2c1_ingress_sb; ///< Scoreboard component for udma_i2c1_ingress prediction path.
   uvml_sb_simplex_c #(uvma_uart_mon_trn_c)  udma_uart0_ingress_sb; ///< Scoreboard component for udma_uart0_ingress prediction path.
   uvml_sb_simplex_c #(uvma_uart_mon_trn_c)  udma_uart1_ingress_sb; ///< Scoreboard component for udma_uart1_ingress prediction path.
   uvml_sb_simplex_c #(uvma_i2c_mon_trn_c)  apb_i2c_ingress_sb; ///< Scoreboard component for apb_i2c_ingress prediction path.
   uvml_sb_simplex_c #(uvma_cvmcu_io_mon_trn_c)  gpio_ingress_sb; ///< Scoreboard component for gpio_ingress prediction path.
   uvml_sb_simplex_c #(uvma_spi_mon_trn_c)  udma_qspi0_egress_sb; ///< Scoreboard component for udma_qspi0_egress prediction path.
   uvml_sb_simplex_c #(uvma_spi_mon_trn_c)  udma_qspi1_egress_sb; ///< Scoreboard component for udma_qspi1_egress prediction path.
   uvml_sb_simplex_c #(uvma_i2c_mon_trn_c)  udma_i2c0_egress_sb; ///< Scoreboard component for udma_i2c0_egress prediction path.
   uvml_sb_simplex_c #(uvma_i2c_mon_trn_c)  udma_i2c1_egress_sb; ///< Scoreboard component for udma_i2c1_egress prediction path.
   uvml_sb_simplex_c #(uvma_uart_mon_trn_c)  udma_uart0_egress_sb; ///< Scoreboard component for udma_uart0_egress prediction path.
   uvml_sb_simplex_c #(uvma_uart_mon_trn_c)  udma_uart1_egress_sb; ///< Scoreboard component for udma_uart1_egress prediction path.
   uvml_sb_simplex_c #(uvma_i2c_mon_trn_c)  apb_i2c_egress_sb; ///< Scoreboard component for apb_i2c_egress prediction path.
   uvml_sb_simplex_c #(uvma_cvmcu_io_mon_trn_c)  gpio_egress_sb; ///< Scoreboard component for gpio_egress prediction path.
   uvml_sb_simplex_c #(uvma_cvmcu_event_mon_trn_c)  event_sb; ///< Scoreboard component for event prediction path.
   uvml_sb_simplex_c #(uvma_cvmcu_dbg_mon_trn_c)  dbg_sb; ///< Scoreboard component for dbg prediction path.
   /// @}


   `uvm_component_utils(uvme_cvmcu_chip_sb_c)


   /**
    * Default constructor.
    */
   function new(string name="uvme_cvmcu_chip_sb", uvm_component parent=null);
      super.new(name, parent);
   endfunction

   /**
    * Assigns configuration handles.
    */
   virtual function void assign_cfg();
      uvm_config_db#(uvml_sb_simplex_cfg_c)::set(this, "udma_qspi0_ingress_sb" , "cfg", cfg.udma_qspi0_ingress_sb_cfg );
      uvm_config_db#(uvml_sb_simplex_cfg_c)::set(this, "udma_qspi1_ingress_sb" , "cfg", cfg.udma_qspi1_ingress_sb_cfg );
      uvm_config_db#(uvml_sb_simplex_cfg_c)::set(this, "udma_camera_sb" , "cfg", cfg.udma_camera_sb_cfg );
      uvm_config_db#(uvml_sb_simplex_cfg_c)::set(this, "udma_i2c0_ingress_sb" , "cfg", cfg.udma_i2c0_ingress_sb_cfg );
      uvm_config_db#(uvml_sb_simplex_cfg_c)::set(this, "udma_i2c1_ingress_sb" , "cfg", cfg.udma_i2c1_ingress_sb_cfg );
      uvm_config_db#(uvml_sb_simplex_cfg_c)::set(this, "udma_uart0_ingress_sb" , "cfg", cfg.udma_uart0_ingress_sb_cfg );
      uvm_config_db#(uvml_sb_simplex_cfg_c)::set(this, "udma_uart1_ingress_sb" , "cfg", cfg.udma_uart1_ingress_sb_cfg );
      uvm_config_db#(uvml_sb_simplex_cfg_c)::set(this, "apb_i2c_ingress_sb" , "cfg", cfg.apb_i2c_ingress_sb_cfg );
      uvm_config_db#(uvml_sb_simplex_cfg_c)::set(this, "gpio_ingress_sb" , "cfg", cfg.gpio_ingress_sb_cfg );
      uvm_config_db#(uvml_sb_simplex_cfg_c)::set(this, "udma_qspi0_egress_sb" , "cfg", cfg.udma_qspi0_egress_sb_cfg );
      uvm_config_db#(uvml_sb_simplex_cfg_c)::set(this, "udma_qspi1_egress_sb" , "cfg", cfg.udma_qspi1_egress_sb_cfg );
      uvm_config_db#(uvml_sb_simplex_cfg_c)::set(this, "udma_i2c0_egress_sb" , "cfg", cfg.udma_i2c0_egress_sb_cfg );
      uvm_config_db#(uvml_sb_simplex_cfg_c)::set(this, "udma_i2c1_egress_sb" , "cfg", cfg.udma_i2c1_egress_sb_cfg );
      uvm_config_db#(uvml_sb_simplex_cfg_c)::set(this, "udma_uart0_egress_sb" , "cfg", cfg.udma_uart0_egress_sb_cfg );
      uvm_config_db#(uvml_sb_simplex_cfg_c)::set(this, "udma_uart1_egress_sb" , "cfg", cfg.udma_uart1_egress_sb_cfg );
      uvm_config_db#(uvml_sb_simplex_cfg_c)::set(this, "apb_i2c_egress_sb" , "cfg", cfg.apb_i2c_egress_sb_cfg );
      uvm_config_db#(uvml_sb_simplex_cfg_c)::set(this, "gpio_egress_sb" , "cfg", cfg.gpio_egress_sb_cfg );
      uvm_config_db#(uvml_sb_simplex_cfg_c)::set(this, "event_sb" , "cfg", cfg.event_sb_cfg );
      uvm_config_db#(uvml_sb_simplex_cfg_c)::set(this, "dbg_sb" , "cfg", cfg.dbg_sb_cfg );
   endfunction

   /**
    * Assigns context handles.
    */
   virtual function void assign_cntxt();
      uvm_config_db#(uvml_sb_simplex_cntxt_c)::set(this, "udma_qspi0_ingress_sb", "cntxt", cntxt.udma_qspi0_ingress_sb_cntxt);
      uvm_config_db#(uvml_sb_simplex_cntxt_c)::set(this, "udma_qspi1_ingress_sb", "cntxt", cntxt.udma_qspi1_ingress_sb_cntxt);
      uvm_config_db#(uvml_sb_simplex_cntxt_c)::set(this, "udma_camera_sb", "cntxt", cntxt.udma_camera_sb_cntxt);
      uvm_config_db#(uvml_sb_simplex_cntxt_c)::set(this, "udma_i2c0_ingress_sb", "cntxt", cntxt.udma_i2c0_ingress_sb_cntxt);
      uvm_config_db#(uvml_sb_simplex_cntxt_c)::set(this, "udma_i2c1_ingress_sb", "cntxt", cntxt.udma_i2c1_ingress_sb_cntxt);
      uvm_config_db#(uvml_sb_simplex_cntxt_c)::set(this, "udma_uart0_ingress_sb", "cntxt", cntxt.udma_uart0_ingress_sb_cntxt);
      uvm_config_db#(uvml_sb_simplex_cntxt_c)::set(this, "udma_uart1_ingress_sb", "cntxt", cntxt.udma_uart1_ingress_sb_cntxt);
      uvm_config_db#(uvml_sb_simplex_cntxt_c)::set(this, "apb_i2c_ingress_sb", "cntxt", cntxt.apb_i2c_ingress_sb_cntxt);
      uvm_config_db#(uvml_sb_simplex_cntxt_c)::set(this, "gpio_ingress_sb", "cntxt", cntxt.gpio_ingress_sb_cntxt);
      uvm_config_db#(uvml_sb_simplex_cntxt_c)::set(this, "udma_qspi0_egress_sb", "cntxt", cntxt.udma_qspi0_egress_sb_cntxt);
      uvm_config_db#(uvml_sb_simplex_cntxt_c)::set(this, "udma_qspi1_egress_sb", "cntxt", cntxt.udma_qspi1_egress_sb_cntxt);
      uvm_config_db#(uvml_sb_simplex_cntxt_c)::set(this, "udma_i2c0_egress_sb", "cntxt", cntxt.udma_i2c0_egress_sb_cntxt);
      uvm_config_db#(uvml_sb_simplex_cntxt_c)::set(this, "udma_i2c1_egress_sb", "cntxt", cntxt.udma_i2c1_egress_sb_cntxt);
      uvm_config_db#(uvml_sb_simplex_cntxt_c)::set(this, "udma_uart0_egress_sb", "cntxt", cntxt.udma_uart0_egress_sb_cntxt);
      uvm_config_db#(uvml_sb_simplex_cntxt_c)::set(this, "udma_uart1_egress_sb", "cntxt", cntxt.udma_uart1_egress_sb_cntxt);
      uvm_config_db#(uvml_sb_simplex_cntxt_c)::set(this, "apb_i2c_egress_sb", "cntxt", cntxt.apb_i2c_egress_sb_cntxt);
      uvm_config_db#(uvml_sb_simplex_cntxt_c)::set(this, "gpio_egress_sb", "cntxt", cntxt.gpio_egress_sb_cntxt);
      uvm_config_db#(uvml_sb_simplex_cntxt_c)::set(this, "event_sb", "cntxt", cntxt.event_sb_cntxt);
      uvm_config_db#(uvml_sb_simplex_cntxt_c)::set(this, "dbg_sb", "cntxt", cntxt.dbg_sb_cntxt);
   endfunction

   /**
    * Creates scoreboard components.
    */
   virtual function void create_components();
      udma_qspi0_ingress_sb = uvml_sb_simplex_c#(uvma_spi_mon_trn_c)::type_id::create("udma_qspi0_ingress_sb", this);
      udma_qspi1_ingress_sb = uvml_sb_simplex_c#(uvma_spi_mon_trn_c)::type_id::create("udma_qspi1_ingress_sb", this);
      udma_camera_sb = uvml_sb_simplex_c#(uvma_cvmcu_cpi_mon_trn_c)::type_id::create("udma_camera_sb", this);
      udma_i2c0_ingress_sb = uvml_sb_simplex_c#(uvma_i2c_mon_trn_c)::type_id::create("udma_i2c0_ingress_sb", this);
      udma_i2c1_ingress_sb = uvml_sb_simplex_c#(uvma_i2c_mon_trn_c)::type_id::create("udma_i2c1_ingress_sb", this);
      udma_uart0_ingress_sb = uvml_sb_simplex_c#(uvma_uart_mon_trn_c)::type_id::create("udma_uart0_ingress_sb", this);
      udma_uart1_ingress_sb = uvml_sb_simplex_c#(uvma_uart_mon_trn_c)::type_id::create("udma_uart1_ingress_sb", this);
      apb_i2c_ingress_sb = uvml_sb_simplex_c#(uvma_i2c_mon_trn_c)::type_id::create("apb_i2c_ingress_sb", this);
      gpio_ingress_sb = uvml_sb_simplex_c#(uvma_cvmcu_io_mon_trn_c)::type_id::create("gpio_ingress_sb", this);
      udma_qspi0_egress_sb = uvml_sb_simplex_c#(uvma_spi_mon_trn_c)::type_id::create("udma_qspi0_egress_sb", this);
      udma_qspi1_egress_sb = uvml_sb_simplex_c#(uvma_spi_mon_trn_c)::type_id::create("udma_qspi1_egress_sb", this);
      udma_i2c0_egress_sb = uvml_sb_simplex_c#(uvma_i2c_mon_trn_c)::type_id::create("udma_i2c0_egress_sb", this);
      udma_i2c1_egress_sb = uvml_sb_simplex_c#(uvma_i2c_mon_trn_c)::type_id::create("udma_i2c1_egress_sb", this);
      udma_uart0_egress_sb = uvml_sb_simplex_c#(uvma_uart_mon_trn_c)::type_id::create("udma_uart0_egress_sb", this);
      udma_uart1_egress_sb = uvml_sb_simplex_c#(uvma_uart_mon_trn_c)::type_id::create("udma_uart1_egress_sb", this);
      apb_i2c_egress_sb = uvml_sb_simplex_c#(uvma_i2c_mon_trn_c)::type_id::create("apb_i2c_egress_sb", this);
      gpio_egress_sb = uvml_sb_simplex_c#(uvma_cvmcu_io_mon_trn_c)::type_id::create("gpio_egress_sb", this);
      event_sb = uvml_sb_simplex_c#(uvma_cvmcu_event_mon_trn_c)::type_id::create("event_sb", this);
      dbg_sb = uvml_sb_simplex_c#(uvma_cvmcu_dbg_mon_trn_c)::type_id::create("dbg_sb", this);
   endfunction

endclass : uvme_cvmcu_chip_sb_c


`endif // __UVME_CVMCU_CHIP_SB_SV__