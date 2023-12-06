// Copyright 2023 Datum Technology Corporation
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
   uvmx_sb_simplex_c #(uvma_spi_mon_trn_c)  sb_udma_qspi0_ingress; ///< Scoreboard component for Udma_qspi0_ingress prediction path.
   uvmx_sb_simplex_c #(uvma_spi_mon_trn_c)  sb_udma_qspi1_ingress; ///< Scoreboard component for Udma_qspi1_ingress prediction path.
   uvmx_sb_simplex_c #(uvma_cvmcu_cpi_mon_trn_c)  sb_udma_camera; ///< Scoreboard component for Udma_camera prediction path.
   uvmx_sb_simplex_c #(uvma_i2c_mon_trn_c)  sb_udma_i2c0_ingress; ///< Scoreboard component for Udma_i2c0_ingress prediction path.
   uvmx_sb_simplex_c #(uvma_i2c_mon_trn_c)  sb_udma_i2c1_ingress; ///< Scoreboard component for Udma_i2c1_ingress prediction path.
   uvmx_sb_simplex_c #(uvma_uart_mon_trn_c)  sb_udma_uart0_ingress; ///< Scoreboard component for Udma_uart0_ingress prediction path.
   uvmx_sb_simplex_c #(uvma_uart_mon_trn_c)  sb_udma_uart1_ingress; ///< Scoreboard component for Udma_uart1_ingress prediction path.
   uvmx_sb_simplex_c #(uvma_i2c_mon_trn_c)  sb_apb_i2c_ingress; ///< Scoreboard component for Apb_i2c_ingress prediction path.
   uvmx_sb_simplex_c #(uvma_cvmcu_io_mon_trn_c)  sb_gpio_ingress; ///< Scoreboard component for Gpio_ingress prediction path.
   uvmx_sb_simplex_c #(uvma_spi_mon_trn_c)  sb_udma_qspi0_egress; ///< Scoreboard component for Udma_qspi0_egress prediction path.
   uvmx_sb_simplex_c #(uvma_spi_mon_trn_c)  sb_udma_qspi1_egress; ///< Scoreboard component for Udma_qspi1_egress prediction path.
   uvmx_sb_simplex_c #(uvma_i2c_mon_trn_c)  sb_udma_i2c0_egress; ///< Scoreboard component for Udma_i2c0_egress prediction path.
   uvmx_sb_simplex_c #(uvma_i2c_mon_trn_c)  sb_udma_i2c1_egress; ///< Scoreboard component for Udma_i2c1_egress prediction path.
   uvmx_sb_simplex_c #(uvma_uart_mon_trn_c)  sb_udma_uart0_egress; ///< Scoreboard component for Udma_uart0_egress prediction path.
   uvmx_sb_simplex_c #(uvma_uart_mon_trn_c)  sb_udma_uart1_egress; ///< Scoreboard component for Udma_uart1_egress prediction path.
   uvmx_sb_simplex_c #(uvma_i2c_mon_trn_c)  sb_apb_i2c_egress; ///< Scoreboard component for Apb_i2c_egress prediction path.
   uvmx_sb_simplex_c #(uvma_cvmcu_io_mon_trn_c)  sb_gpio_egress; ///< Scoreboard component for Gpio_egress prediction path.
   uvmx_sb_simplex_c #(uvma_cvmcu_dbg_mon_trn_c)  sb_dbg; ///< Scoreboard component for Dbg prediction path.
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
      uvm_config_db#(uvmx_sb_simplex_cfg_c)::set(this, "sb_udma_qspi0_ingress" , "cfg", cfg.sb_udma_qspi0_ingress_cfg );
      uvm_config_db#(uvmx_sb_simplex_cfg_c)::set(this, "sb_udma_qspi1_ingress" , "cfg", cfg.sb_udma_qspi1_ingress_cfg );
      uvm_config_db#(uvmx_sb_simplex_cfg_c)::set(this, "sb_udma_camera" , "cfg", cfg.sb_udma_camera_cfg );
      uvm_config_db#(uvmx_sb_simplex_cfg_c)::set(this, "sb_udma_i2c0_ingress" , "cfg", cfg.sb_udma_i2c0_ingress_cfg );
      uvm_config_db#(uvmx_sb_simplex_cfg_c)::set(this, "sb_udma_i2c1_ingress" , "cfg", cfg.sb_udma_i2c1_ingress_cfg );
      uvm_config_db#(uvmx_sb_simplex_cfg_c)::set(this, "sb_udma_uart0_ingress" , "cfg", cfg.sb_udma_uart0_ingress_cfg );
      uvm_config_db#(uvmx_sb_simplex_cfg_c)::set(this, "sb_udma_uart1_ingress" , "cfg", cfg.sb_udma_uart1_ingress_cfg );
      uvm_config_db#(uvmx_sb_simplex_cfg_c)::set(this, "sb_apb_i2c_ingress" , "cfg", cfg.sb_apb_i2c_ingress_cfg );
      uvm_config_db#(uvmx_sb_simplex_cfg_c)::set(this, "sb_gpio_ingress" , "cfg", cfg.sb_gpio_ingress_cfg );
      uvm_config_db#(uvmx_sb_simplex_cfg_c)::set(this, "sb_udma_qspi0_egress" , "cfg", cfg.sb_udma_qspi0_egress_cfg );
      uvm_config_db#(uvmx_sb_simplex_cfg_c)::set(this, "sb_udma_qspi1_egress" , "cfg", cfg.sb_udma_qspi1_egress_cfg );
      uvm_config_db#(uvmx_sb_simplex_cfg_c)::set(this, "sb_udma_i2c0_egress" , "cfg", cfg.sb_udma_i2c0_egress_cfg );
      uvm_config_db#(uvmx_sb_simplex_cfg_c)::set(this, "sb_udma_i2c1_egress" , "cfg", cfg.sb_udma_i2c1_egress_cfg );
      uvm_config_db#(uvmx_sb_simplex_cfg_c)::set(this, "sb_udma_uart0_egress" , "cfg", cfg.sb_udma_uart0_egress_cfg );
      uvm_config_db#(uvmx_sb_simplex_cfg_c)::set(this, "sb_udma_uart1_egress" , "cfg", cfg.sb_udma_uart1_egress_cfg );
      uvm_config_db#(uvmx_sb_simplex_cfg_c)::set(this, "sb_apb_i2c_egress" , "cfg", cfg.sb_apb_i2c_egress_cfg );
      uvm_config_db#(uvmx_sb_simplex_cfg_c)::set(this, "sb_gpio_egress" , "cfg", cfg.sb_gpio_egress_cfg );
      uvm_config_db#(uvmx_sb_simplex_cfg_c)::set(this, "sb_dbg" , "cfg", cfg.sb_dbg_cfg );
   endfunction

   /**
    * Assigns context handles.
    */
   virtual function void assign_cntxt();
      uvm_config_db#(uvmx_sb_simplex_cntxt_c)::set(this, "sb_udma_qspi0_ingress", "cntxt", cntxt.sb_udma_qspi0_ingress_cntxt);
      uvm_config_db#(uvmx_sb_simplex_cntxt_c)::set(this, "sb_udma_qspi1_ingress", "cntxt", cntxt.sb_udma_qspi1_ingress_cntxt);
      uvm_config_db#(uvmx_sb_simplex_cntxt_c)::set(this, "sb_udma_camera", "cntxt", cntxt.sb_udma_camera_cntxt);
      uvm_config_db#(uvmx_sb_simplex_cntxt_c)::set(this, "sb_udma_i2c0_ingress", "cntxt", cntxt.sb_udma_i2c0_ingress_cntxt);
      uvm_config_db#(uvmx_sb_simplex_cntxt_c)::set(this, "sb_udma_i2c1_ingress", "cntxt", cntxt.sb_udma_i2c1_ingress_cntxt);
      uvm_config_db#(uvmx_sb_simplex_cntxt_c)::set(this, "sb_udma_uart0_ingress", "cntxt", cntxt.sb_udma_uart0_ingress_cntxt);
      uvm_config_db#(uvmx_sb_simplex_cntxt_c)::set(this, "sb_udma_uart1_ingress", "cntxt", cntxt.sb_udma_uart1_ingress_cntxt);
      uvm_config_db#(uvmx_sb_simplex_cntxt_c)::set(this, "sb_apb_i2c_ingress", "cntxt", cntxt.sb_apb_i2c_ingress_cntxt);
      uvm_config_db#(uvmx_sb_simplex_cntxt_c)::set(this, "sb_gpio_ingress", "cntxt", cntxt.sb_gpio_ingress_cntxt);
      uvm_config_db#(uvmx_sb_simplex_cntxt_c)::set(this, "sb_udma_qspi0_egress", "cntxt", cntxt.sb_udma_qspi0_egress_cntxt);
      uvm_config_db#(uvmx_sb_simplex_cntxt_c)::set(this, "sb_udma_qspi1_egress", "cntxt", cntxt.sb_udma_qspi1_egress_cntxt);
      uvm_config_db#(uvmx_sb_simplex_cntxt_c)::set(this, "sb_udma_i2c0_egress", "cntxt", cntxt.sb_udma_i2c0_egress_cntxt);
      uvm_config_db#(uvmx_sb_simplex_cntxt_c)::set(this, "sb_udma_i2c1_egress", "cntxt", cntxt.sb_udma_i2c1_egress_cntxt);
      uvm_config_db#(uvmx_sb_simplex_cntxt_c)::set(this, "sb_udma_uart0_egress", "cntxt", cntxt.sb_udma_uart0_egress_cntxt);
      uvm_config_db#(uvmx_sb_simplex_cntxt_c)::set(this, "sb_udma_uart1_egress", "cntxt", cntxt.sb_udma_uart1_egress_cntxt);
      uvm_config_db#(uvmx_sb_simplex_cntxt_c)::set(this, "sb_apb_i2c_egress", "cntxt", cntxt.sb_apb_i2c_egress_cntxt);
      uvm_config_db#(uvmx_sb_simplex_cntxt_c)::set(this, "sb_gpio_egress", "cntxt", cntxt.sb_gpio_egress_cntxt);
      uvm_config_db#(uvmx_sb_simplex_cntxt_c)::set(this, "sb_dbg", "cntxt", cntxt.sb_dbg_cntxt);
   endfunction

   /**
    * Creates scoreboard components.
    */
   virtual function void create_components();
      sb_udma_qspi0_ingress = uvmx_sb_simplex_c#(uvma_spi_mon_trn_c)::type_id::create("sb_udma_qspi0_ingress", this);
      sb_udma_qspi1_ingress = uvmx_sb_simplex_c#(uvma_spi_mon_trn_c)::type_id::create("sb_udma_qspi1_ingress", this);
      sb_udma_camera = uvmx_sb_simplex_c#(uvma_cvmcu_cpi_mon_trn_c)::type_id::create("sb_udma_camera", this);
      sb_udma_i2c0_ingress = uvmx_sb_simplex_c#(uvma_i2c_mon_trn_c)::type_id::create("sb_udma_i2c0_ingress", this);
      sb_udma_i2c1_ingress = uvmx_sb_simplex_c#(uvma_i2c_mon_trn_c)::type_id::create("sb_udma_i2c1_ingress", this);
      sb_udma_uart0_ingress = uvmx_sb_simplex_c#(uvma_uart_mon_trn_c)::type_id::create("sb_udma_uart0_ingress", this);
      sb_udma_uart1_ingress = uvmx_sb_simplex_c#(uvma_uart_mon_trn_c)::type_id::create("sb_udma_uart1_ingress", this);
      sb_apb_i2c_ingress = uvmx_sb_simplex_c#(uvma_i2c_mon_trn_c)::type_id::create("sb_apb_i2c_ingress", this);
      sb_gpio_ingress = uvmx_sb_simplex_c#(uvma_cvmcu_io_mon_trn_c)::type_id::create("sb_gpio_ingress", this);
      sb_udma_qspi0_egress = uvmx_sb_simplex_c#(uvma_spi_mon_trn_c)::type_id::create("sb_udma_qspi0_egress", this);
      sb_udma_qspi1_egress = uvmx_sb_simplex_c#(uvma_spi_mon_trn_c)::type_id::create("sb_udma_qspi1_egress", this);
      sb_udma_i2c0_egress = uvmx_sb_simplex_c#(uvma_i2c_mon_trn_c)::type_id::create("sb_udma_i2c0_egress", this);
      sb_udma_i2c1_egress = uvmx_sb_simplex_c#(uvma_i2c_mon_trn_c)::type_id::create("sb_udma_i2c1_egress", this);
      sb_udma_uart0_egress = uvmx_sb_simplex_c#(uvma_uart_mon_trn_c)::type_id::create("sb_udma_uart0_egress", this);
      sb_udma_uart1_egress = uvmx_sb_simplex_c#(uvma_uart_mon_trn_c)::type_id::create("sb_udma_uart1_egress", this);
      sb_apb_i2c_egress = uvmx_sb_simplex_c#(uvma_i2c_mon_trn_c)::type_id::create("sb_apb_i2c_egress", this);
      sb_gpio_egress = uvmx_sb_simplex_c#(uvma_cvmcu_io_mon_trn_c)::type_id::create("sb_gpio_egress", this);
      sb_dbg = uvmx_sb_simplex_c#(uvma_cvmcu_dbg_mon_trn_c)::type_id::create("sb_dbg", this);
   endfunction

endclass


`endif // __UVME_CVMCU_CHIP_SB_SV__