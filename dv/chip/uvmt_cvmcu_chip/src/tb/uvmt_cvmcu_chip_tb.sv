// Copyright 2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMT_CVMCU_CHIP_TB_SV__
`define __UVMT_CVMCU_CHIP_TB_SV__


/**
 * Module encapsulating the CORE-V-MCU Chip DUT wrapper, agents and clock/reset generating interfaces.
 * @ingroup uvmt_cvmcu_chip_tb
 */
module uvmt_cvmcu_chip_tb;

   import uvm_pkg ::*;
   import uvmx_pkg::*;
   import uvmt_cvmcu_chip_pkg::*;

   /// @name Clock & Reset
   /// @{
   logic  ref_clk_i; ///< System clock signal
   logic  jtag_tck_i; ///< JTAG clock signal
   logic  rstn_i; ///< System reset signal
   logic  jtag_trst_i; ///< JTAG reset signal
   uvma_clk_if    sys_clk_if(); ///< System clock interface
   uvma_clk_if    jtag_clk_if(); ///< JTAG clock interface
   uvma_reset_if  sys_reset_if(.clk(ref_clk_i)); ///< System reset interface
   uvma_reset_if  jtag_reset_if(.clk(jtag_tck_i)); ///< JTAG reset interface
   assign ref_clk_i = sys_clk_if.clk;
   assign jtag_tck_i = jtag_clk_if.clk;
   assign rstn_i = sys_reset_if.reset_n;
   assign jtag_trst_i = jtag_reset_if.reset_n;
   /// @}

   /// @name CORE-V-MCU chip
   /// @{
   uvma_jtag_if  jtag_if(.tck(jtag_tck_i), .trst(rstn_i)); ///< JTAG controller agent interface
   uvma_cvmcu_io_if  io_if(.ref_clk_i(ref_clk_i), .rstn_i(rstn_i)); ///< IO ports agent interface
   uvma_obi_if  instr_obi_if(); ///< Instruction memory OBI agent interface
   uvma_obi_if  data_obi_if(); ///< Data memory OBI agent interface
   uvma_cvmcu_event_if  event_if(); ///< Event agent interface
   uvma_cvmcu_dbg_if  dbg_if(); ///< Debug agent interface
   uvma_irq_if  irq_l1_if(); ///< First Level IRQ agent interface
   uvma_irq_if  irq_l2_if(); ///< Platform-Specific (Second Level) IRQ agent interface
   uvme_cvmcu_chip_probe_if  probe_if(.*); ///< Misc. signals interface
   /// @}

   /// @name apb_timer sub-system
   /// @{
   uvma_apb_if  apb_timer__proc_if(); ///< Processor interface agent interface
   uvma_irq_if  apb_timer__irq_events_if(); ///< Events IRQ agent interface
   uvme_apb_timer_ss_probe_if  apb_timer__probe_if(); ///< Misc. signals interface
   uvma_tcounter_b_if  apb_timer__counter_lo_if(); ///< Counter block 0 block agent interface
   uvma_tcounter_b_if  apb_timer__counter_hi_if(); ///< Counter block 1 block agent interface
   uvma_tprescaler_b_if  apb_timer__prescaler_lo_if(); ///< Prescaler block 0 block agent interface
   uvma_tprescaler_b_if  apb_timer__prescaler_hi_if(); ///< Prescaler block 1 block agent interface
   /// @}

   /// @name apb_adv_timer sub-system
   /// @{
   uvma_apb_if  apb_adv_timer__proc_if(); ///< Processor access agent interface
   uvma_irq_if  apb_adv_timer__irq_events_if(); ///< Events IRQ agent interface
   uvme_apb_adv_timer_ss_probe_if  apb_adv_timer__probe_if(); ///< Misc. signals interface
   uvma_adv_timer_b_if  apb_adv_timer__adv_timer0_if(); ///< Advanced timer 0 block agent interface
   uvma_adv_timer_b_if  apb_adv_timer__adv_timer1_if(); ///< Advanced timer 1 block agent interface
   uvma_adv_timer_b_if  apb_adv_timer__adv_timer2_if(); ///< Advanced timer 2 block agent interface
   uvma_adv_timer_b_if  apb_adv_timer__adv_timer3_if(); ///< Advanced timer 3 block agent interface
   /// @}

   /// @name Checker instantiation and binding
   /// @{
   bind uvmt_cvmcu_chip_dut_wrap : dut_wrap  uvme_cvmcu_chip_chkr chkr(.*); ///< CORE-V-MCU chip
   bind uvmt_cvmcu_chip_dut_wrap : dut_wrap  uvme_apb_timer_ss_chkr apb_timer_chkr( ///< apb_timer sub-system
      .proc_if(apb_timer__proc_if),
      .irq_events_if(apb_timer__irq_events_if),
      .counter_lo_if(apb_timer__counter_lo_if),
      .counter_hi_if(apb_timer__counter_hi_if),
      .prescaler_lo_if(apb_timer__prescaler_lo_if),
      .prescaler_hi_if(apb_timer__prescaler_hi_if),
      .probe_if(apb_timer__probe_if)
   );
   bind uvmt_cvmcu_chip_dut_wrap : dut_wrap  uvma_tcounter_b_if_chkr apb_timer__counter_lo_if_chkr( ///< apb_timer sub-system Counter block 0 block
      .agent_if(apb_timer__counter_lo_if)
   );
   bind uvmt_cvmcu_chip_dut_wrap : dut_wrap  uvma_tcounter_b_if_chkr apb_timer__counter_hi_if_chkr( ///< apb_timer sub-system Counter block 1 block
      .agent_if(apb_timer__counter_hi_if)
   );
   bind uvmt_cvmcu_chip_dut_wrap : dut_wrap  uvma_tprescaler_b_if_chkr apb_timer__prescaler_lo_if_chkr( ///< apb_timer sub-system Prescaler block 0 block
      .agent_if(apb_timer__prescaler_lo_if)
   );
   bind uvmt_cvmcu_chip_dut_wrap : dut_wrap  uvma_tprescaler_b_if_chkr apb_timer__prescaler_hi_if_chkr( ///< apb_timer sub-system Prescaler block 1 block
      .agent_if(apb_timer__prescaler_hi_if)
   );
   bind uvmt_cvmcu_chip_dut_wrap : dut_wrap  uvme_apb_adv_timer_ss_chkr apb_adv_timer_chkr( ///< apb_adv_timer sub-system
      .proc_if(apb_adv_timer__proc_if),
      .irq_events_if(apb_adv_timer__irq_events_if),
      .adv_timer0_if(apb_adv_timer__adv_timer0_if),
      .adv_timer1_if(apb_adv_timer__adv_timer1_if),
      .adv_timer2_if(apb_adv_timer__adv_timer2_if),
      .adv_timer3_if(apb_adv_timer__adv_timer3_if),
      .probe_if(apb_adv_timer__probe_if)
   );
   bind uvmt_cvmcu_chip_dut_wrap : dut_wrap  uvma_adv_timer_b_if_chkr apb_adv_timer__adv_timer0_if_chkr( ///< apb_adv_timer sub-system Advanced timer 0 block
      .agent_if(apb_adv_timer__adv_timer0_if)
   );
   bind uvmt_cvmcu_chip_dut_wrap : dut_wrap  uvma_adv_timer_b_if_chkr apb_adv_timer__adv_timer1_if_chkr( ///< apb_adv_timer sub-system Advanced timer 1 block
      .agent_if(apb_adv_timer__adv_timer1_if)
   );
   bind uvmt_cvmcu_chip_dut_wrap : dut_wrap  uvma_adv_timer_b_if_chkr apb_adv_timer__adv_timer2_if_chkr( ///< apb_adv_timer sub-system Advanced timer 2 block
      .agent_if(apb_adv_timer__adv_timer2_if)
   );
   bind uvmt_cvmcu_chip_dut_wrap : dut_wrap  uvma_adv_timer_b_if_chkr apb_adv_timer__adv_timer3_if_chkr( ///< apb_adv_timer sub-system Advanced timer 3 block
      .agent_if(apb_adv_timer__adv_timer3_if)
   );
   /// @}

   /**
    * DUT instance wrapper.
    */
   uvmt_cvmcu_chip_dut_wrap  dut_wrap(.*);

   /**
    * Test bench entry point.
    */
   initial begin
      // CORE-V-MCU chip interfaces
      uvm_config_db#(virtual uvma_clk_if)::set(null, "uvm_test_top.sys_clk_agent", "vif", sys_clk_if);
      uvm_config_db#(virtual uvma_clk_if)::set(null, "uvm_test_top.jtag_clk_agent", "vif", jtag_clk_if);
      uvm_config_db#(virtual uvma_reset_if)::set(null, "uvm_test_top.sys_reset_agent", "vif", sys_reset_if);
      uvm_config_db#(virtual uvma_reset_if)::set(null, "uvm_test_top.jtag_reset_agent", "vif", jtag_reset_if);
      uvm_config_db#(virtual uvma_jtag_if)::set(null, "uvm_test_top.env.jtag_agent", "vif", jtag_if);
      uvm_config_db#(virtual uvma_cvmcu_io_if)::set(null, "uvm_test_top.env.io_agent", "vif", io_if);
      uvm_config_db#(virtual uvma_obi_if)::set(null, "uvm_test_top.env.instr_obi_agent", "vif", instr_obi_if);
      uvm_config_db#(virtual uvma_obi_if)::set(null, "uvm_test_top.env.data_obi_agent", "vif", data_obi_if);
      uvm_config_db#(virtual uvma_cvmcu_event_if)::set(null, "uvm_test_top.env.event_agent", "vif", event_if);
      uvm_config_db#(virtual uvma_cvmcu_dbg_if)::set(null, "uvm_test_top.env.dbg_agent", "vif", dbg_if);
      uvm_config_db#(virtual uvma_irq_if)::set(null, "uvm_test_top.env.irq_l1_agent", "vif", irq_l1_if);
      uvm_config_db#(virtual uvma_irq_if)::set(null, "uvm_test_top.env.irq_l2_agent", "vif", irq_l2_if);
      uvm_config_db#(virtual uvme_cvmcu_chip_probe_if)::set(null, "uvm_test_top.env", "vif", probe_if);
      // apb_timer sub-system interfaces
      uvm_config_db#(virtual uvma_apb_if)::set(null, "uvm_test_top.env.apb_timer_ss_env.proc_agent", "vif", apb_timer__proc_if);
      uvm_config_db#(virtual uvma_irq_if)::set(null, "uvm_test_top.env.apb_timer_ss_env.irq_events_agent", "vif", apb_timer__irq_events_if);
      uvm_config_db#(virtual uvma_tcounter_b_if)::set(null, "uvm_test_top.env.apb_timer_ss_env.counter_lo_b_env.agent", "vif", apb_timer__counter_lo_if);
      uvm_config_db#(virtual uvma_tcounter_b_if)::set(null, "uvm_test_top.env.apb_timer_ss_env.counter_hi_b_env.agent", "vif", apb_timer__counter_hi_if);
      uvm_config_db#(virtual uvma_tprescaler_b_if)::set(null, "uvm_test_top.env.apb_timer_ss_env.prescaler_lo_b_env.agent", "vif", apb_timer__prescaler_lo_if);
      uvm_config_db#(virtual uvma_tprescaler_b_if)::set(null, "uvm_test_top.env.apb_timer_ss_env.prescaler_hi_b_env.agent", "vif", apb_timer__prescaler_hi_if);
      uvm_config_db#(virtual uvme_apb_timer_ss_probe_if)::set(null, "uvm_test_top.env.apb_timer_ss_env", "vif", apb_timer__probe_if);
      // apb_adv_timer sub-system interfaces
      uvm_config_db#(virtual uvma_apb_if)::set(null, "uvm_test_top.env.apb_adv_timer_ss_env.proc_agent", "vif", apb_adv_timer__proc_if);
      uvm_config_db#(virtual uvma_irq_if)::set(null, "uvm_test_top.env.apb_adv_timer_ss_env.irq_events_agent", "vif", apb_adv_timer__irq_events_if);
      uvm_config_db#(virtual uvma_adv_timer_b_if)::set(null, "uvm_test_top.env.apb_adv_timer_ss_env.adv_timer0_b_env.agent", "vif", apb_adv_timer__adv_timer0_if);
      uvm_config_db#(virtual uvma_adv_timer_b_if)::set(null, "uvm_test_top.env.apb_adv_timer_ss_env.adv_timer1_b_env.agent", "vif", apb_adv_timer__adv_timer1_if);
      uvm_config_db#(virtual uvma_adv_timer_b_if)::set(null, "uvm_test_top.env.apb_adv_timer_ss_env.adv_timer2_b_env.agent", "vif", apb_adv_timer__adv_timer2_if);
      uvm_config_db#(virtual uvma_adv_timer_b_if)::set(null, "uvm_test_top.env.apb_adv_timer_ss_env.adv_timer3_b_env.agent", "vif", apb_adv_timer__adv_timer3_if);
      uvm_config_db#(virtual uvme_apb_adv_timer_ss_probe_if)::set(null, "uvm_test_top.env.apb_adv_timer_ss_env", "vif", apb_adv_timer__probe_if);
      // Test entry point
      uvmx_top.run_test();
   end

endmodule : uvmt_cvmcu_chip_tb


`endif // __UVMT_CVMCU_CHIP_TB_SV__