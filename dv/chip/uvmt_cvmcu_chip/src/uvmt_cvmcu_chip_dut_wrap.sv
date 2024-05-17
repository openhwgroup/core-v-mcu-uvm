// Copyright 2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMT_CVMCU_CHIP_DUT_WRAP_SV__
`define __UVMT_CVMCU_CHIP_DUT_WRAP_SV__


/**
 * Module wrapper for CORE-V-MCU Chip DUT.  All ports are SV interfaces.
 * @ingroup uvmt_cvmcu_chip_tb
 */
module uvmt_cvmcu_chip_dut_wrap (
   uvma_jtag_if  jtag_if, ///< JTAG controller agent interface
   uvma_obi_if  instr_obi_if, ///< Instruction memory OBI agent interface
   uvma_obi_if  data_obi_if, ///< Data memory OBI agent interface
   uvma_cvmcu_event_if  event_if, ///< Event agent interface
   uvma_cvmcu_dbg_if  dbg_if, ///< Debug agent interface
   uvma_irq_if  irq_l1_if, ///< First Level IRQ agent interface
   uvma_irq_if  irq_l2_if, ///< Platform-Specific (Second Level) IRQ agent interface
   uvma_apb_if  apb_timer__proc_if, ///< apb_timer sub-system Processor interface agent interface
   uvma_irq_if  apb_timer__irq_events_if, ///< apb_timer sub-system Events IRQ agent interface
   uvma_tcounter_b_if  apb_timer__counter_lo_if, ///< apb_timer sub-system Counter block 0 block interface
   uvma_tcounter_b_if  apb_timer__counter_hi_if, ///< apb_timer sub-system Counter block 1 block interface
   uvma_tprescaler_b_if  apb_timer__prescaler_lo_if, ///< apb_timer sub-system Prescaler block 0 block interface
   uvma_tprescaler_b_if  apb_timer__prescaler_hi_if, ///< apb_timer sub-system Prescaler block 1 block interface
   uvme_apb_timer_ss_probe_if  apb_timer__probe_if, ///< apb_timer sub-system probe interface
   uvma_apb_if  apb_adv_timer__proc_if, ///< apb_adv_timer sub-system Processor access agent interface
   uvma_irq_if  apb_adv_timer__irq_events_if, ///< apb_adv_timer sub-system Events IRQ agent interface
   uvma_adv_timer_b_if  apb_adv_timer__adv_timer0_if, ///< apb_adv_timer sub-system Advanced timer 0 block interface
   uvma_adv_timer_b_if  apb_adv_timer__adv_timer1_if, ///< apb_adv_timer sub-system Advanced timer 1 block interface
   uvma_adv_timer_b_if  apb_adv_timer__adv_timer2_if, ///< apb_adv_timer sub-system Advanced timer 2 block interface
   uvma_adv_timer_b_if  apb_adv_timer__adv_timer3_if, ///< apb_adv_timer sub-system Advanced timer 3 block interface
   uvme_apb_adv_timer_ss_probe_if  apb_adv_timer__probe_if, ///< apb_adv_timer sub-system probe interface
   uvme_cvmcu_chip_probe_if  probe_if, ///< Misc. signals interface
   uvma_clk_if    sys_clk_if, ///< System clock interface
   uvma_clk_if    jtag_clk_if, ///< JTAG clock interface
   uvma_reset_if  sys_reset_if, ///< System reset interface
   uvma_reset_if  jtag_reset_if ///< JTAG reset interface
);

   /**
    * CORE-V-MCU Chip Device Under Test from '/fsoc/core-v-mcu#sim'.
    */
   core_v_mcu #(
      .USE_CORES(`UVMT_CVMCU_CHIP_USE_CORES)
   ) dut (
      .jtag_tdi_i(jtag_if.tdi),
      .jtag_tms_i(jtag_if.tms),
      .jtag_tdo_o(jtag_if.tdo),
      .bootsel_i(probe_if.bootsel_i),
      .stm_i(probe_if.stm_i),
      .io_in_i(probe_if.io_in_i),
      .io_out_o(probe_if.io_out_o),
      .pad_cfg_o(probe_if.pad_cfg_o),
      .io_oe_o(probe_if.io_oe_o),
      .slow_clk_o(probe_if.slow_clk_o),
      .ref_clk_i(sys_clk_if.clk),
      .jtag_tck_i(jtag_clk_if.clk),
      .rstn_i(sys_reset_if.reset_n),
      .jtag_trst_i(jtag_reset_if.reset_n)
   );

   /// @name instr_obi agent
   /// @{
   generate
      if (`UVMT_CVMCU_CHIP_USE_CORES) begin
         assign instr_obi_if.req = dut.i_soc_domain.fc_subsystem_i.core_instr_req;
         assign instr_obi_if.addr = dut.i_soc_domain.fc_subsystem_i.core_instr_addr;
      end
      else begin
         assign dut.i_soc_domain.fc_subsystem_i.core_instr_req = instr_obi_if.req;
         assign dut.i_soc_domain.fc_subsystem_i.core_instr_addr = instr_obi_if.addr;
      end
      assign instr_obi_if.clk = dut.i_soc_domain.fc_subsystem_i.clk_i;
      assign instr_obi_if.reset_n = dut.i_soc_domain.fc_subsystem_i.rst_ni;
      assign instr_obi_if.rvalid = dut.i_soc_domain.fc_subsystem_i.core_instr_rvalid;
      assign instr_obi_if.rdata = dut.i_soc_domain.fc_subsystem_i.core_instr_rdata;
      assign instr_obi_if.gnt = 1;
      assign instr_obi_if.we = 0;
      assign instr_obi_if.be = 0;
      assign instr_obi_if.wdata = 0;
      assign instr_obi_if.auser = 0;
      assign instr_obi_if.wuser = 0;
      assign instr_obi_if.aid = 0;
      assign instr_obi_if.atop = 0;
      assign instr_obi_if.memtype = 0;
      assign instr_obi_if.prot = 0;
      assign instr_obi_if.reqpar = 0;
      assign instr_obi_if.gntpar = 0;
      assign instr_obi_if.achk = 0;
      assign instr_obi_if.rready = 1;
      assign instr_obi_if.err = 0;
      assign instr_obi_if.ruser = 0;
      assign instr_obi_if.rid = 0;
      assign instr_obi_if.exokay = 0;
      assign instr_obi_if.rvalidpar = 0;
      assign instr_obi_if.rreadypar = 0;
      assign instr_obi_if.rchk = 0;
   endgenerate
   /// @}

   /// @name data_obi agent
   /// @{
   generate
      if (`UVMT_CVMCU_CHIP_USE_CORES) begin
         assign data_obi_if.req = dut.i_soc_domain.fc_subsystem_i.core_data_req;
         assign data_obi_if.addr = dut.i_soc_domain.fc_subsystem_i.core_data_addr;
         assign data_obi_if.we = dut.i_soc_domain.fc_subsystem_i.core_data_we;
         assign data_obi_if.be = dut.i_soc_domain.fc_subsystem_i.core_data_be;
         assign data_obi_if.wdata = dut.i_soc_domain.fc_subsystem_i.core_data_wdata;
      end
      else begin
         assign dut.i_soc_domain.fc_subsystem_i.core_data_req = data_obi_if.req;
         assign dut.i_soc_domain.fc_subsystem_i.core_data_addr = data_obi_if.addr;
         assign dut.i_soc_domain.fc_subsystem_i.core_data_we = data_obi_if.we;
         assign dut.i_soc_domain.fc_subsystem_i.core_data_be = data_obi_if.be;
         assign dut.i_soc_domain.fc_subsystem_i.core_data_wdata = data_obi_if.wdata;
      end
      assign data_obi_if.clk = dut.i_soc_domain.fc_subsystem_i.clk_i;
      assign data_obi_if.reset_n = dut.i_soc_domain.fc_subsystem_i.rst_ni;
      assign data_obi_if.gnt = dut.i_soc_domain.fc_subsystem_i.core_data_gnt;
      assign data_obi_if.rvalid = dut.i_soc_domain.fc_subsystem_i.core_data_rvalid;
      assign data_obi_if.rdata = dut.i_soc_domain.fc_subsystem_i.core_data_rdata;
      assign data_obi_if.auser = 0;
      assign data_obi_if.wuser = 0;
      assign data_obi_if.aid = 0;
      assign data_obi_if.atop = 0;
      assign data_obi_if.memtype = 0;
      assign data_obi_if.prot = 0;
      assign data_obi_if.reqpar = 0;
      assign data_obi_if.gntpar = 0;
      assign data_obi_if.achk = 0;
      assign data_obi_if.rready = 1;
      assign data_obi_if.err = 0;
      assign data_obi_if.ruser = 0;
      assign data_obi_if.rid = 0;
      assign data_obi_if.exokay = 0;
      assign data_obi_if.rvalidpar = 0;
      assign data_obi_if.rreadypar = 0;
      assign data_obi_if.rchk = 0;
   endgenerate
   /// @}

   /// @name IRQ Lines
   /// @{
   assign irq_l1_if.clk = dut.i_soc_domain.fc_subsystem_i.clk_i;
   assign irq_l1_if.reset_n = dut.i_soc_domain.fc_subsystem_i.rst_ni;
   assign irq_l1_if.lines = dut.i_soc_domain.fc_subsystem_i.r_int;
   assign irq_l2_if.clk = dut.i_soc_domain.soc_peripherals_i.u_evnt_gen.u_arbiter.clk_i;
   assign irq_l2_if.reset_n = dut.i_soc_domain.soc_peripherals_i.u_evnt_gen.u_arbiter.rstn_i;
   assign irq_l2_if.lines = dut.i_soc_domain.soc_peripherals_i.u_evnt_gen.u_arbiter.grant_o;
   assign apb_timer__irq_events_if.lines[0] = dut.i_soc_domain.soc_peripherals_i.i_apb_timer_unit.irq_lo_o;
   assign apb_timer__irq_events_if.lines[1] = dut.i_soc_domain.soc_peripherals_i.i_apb_timer_unit.irq_hi_o;
   assign apb_adv_timer__irq_events_if.lines = dut.i_soc_domain.soc_peripherals_i.i_apb_adv_timer.events_o;
   /// @}

   /// @name apb_timer.counter_lo block
   /// @{
   assign apb_timer__counter_lo_if.clk_i = dut.i_soc_domain.soc_peripherals_i.i_apb_timer_unit.counter_lo_i.clk_i;
   assign apb_timer__counter_lo_if.rst_ni = dut.i_soc_domain.soc_peripherals_i.i_apb_timer_unit.counter_lo_i.rst_ni;
   assign apb_timer__counter_lo_if.reset_count_i = dut.i_soc_domain.soc_peripherals_i.i_apb_timer_unit.counter_lo_i.reset_count_i;
   assign apb_timer__counter_lo_if.enable_count_i = dut.i_soc_domain.soc_peripherals_i.i_apb_timer_unit.counter_lo_i.enable_count_i;
   assign apb_timer__counter_lo_if.compare_value_i = dut.i_soc_domain.soc_peripherals_i.i_apb_timer_unit.counter_lo_i.compare_value_i;
   assign apb_timer__counter_lo_if.write_counter_i = dut.i_soc_domain.soc_peripherals_i.i_apb_timer_unit.counter_lo_i.write_counter_i;
   assign apb_timer__counter_lo_if.counter_value_i = dut.i_soc_domain.soc_peripherals_i.i_apb_timer_unit.counter_lo_i.counter_value_i;
   assign apb_timer__counter_lo_if.counter_value_o = dut.i_soc_domain.soc_peripherals_i.i_apb_timer_unit.counter_lo_i.counter_value_o;
   assign apb_timer__counter_lo_if.target_reached_o = dut.i_soc_domain.soc_peripherals_i.i_apb_timer_unit.counter_lo_i.target_reached_o;
   assign apb_timer__counter_lo_if.target_greater_o = dut.i_soc_domain.soc_peripherals_i.i_apb_timer_unit.counter_lo_i.target_greater_o;
   /// @}

   /// @name apb_timer.counter_hi block
   /// @{
   assign apb_timer__counter_hi_if.clk_i = dut.i_soc_domain.soc_peripherals_i.i_apb_timer_unit.counter_hi_i.clk_i;
   assign apb_timer__counter_hi_if.rst_ni = dut.i_soc_domain.soc_peripherals_i.i_apb_timer_unit.counter_hi_i.rst_ni;
   assign apb_timer__counter_hi_if.reset_count_i = dut.i_soc_domain.soc_peripherals_i.i_apb_timer_unit.counter_hi_i.reset_count_i;
   assign apb_timer__counter_hi_if.enable_count_i = dut.i_soc_domain.soc_peripherals_i.i_apb_timer_unit.counter_hi_i.enable_count_i;
   assign apb_timer__counter_hi_if.compare_value_i = dut.i_soc_domain.soc_peripherals_i.i_apb_timer_unit.counter_hi_i.compare_value_i;
   assign apb_timer__counter_hi_if.write_counter_i = dut.i_soc_domain.soc_peripherals_i.i_apb_timer_unit.counter_hi_i.write_counter_i;
   assign apb_timer__counter_hi_if.counter_value_i = dut.i_soc_domain.soc_peripherals_i.i_apb_timer_unit.counter_hi_i.counter_value_i;
   assign apb_timer__counter_hi_if.counter_value_o = dut.i_soc_domain.soc_peripherals_i.i_apb_timer_unit.counter_hi_i.counter_value_o;
   assign apb_timer__counter_hi_if.target_reached_o = dut.i_soc_domain.soc_peripherals_i.i_apb_timer_unit.counter_hi_i.target_reached_o;
   assign apb_timer__counter_hi_if.target_greater_o = dut.i_soc_domain.soc_peripherals_i.i_apb_timer_unit.counter_hi_i.target_greater_o;
   /// @}

   /// @name apb_timer.prescaler_lo block
   /// @{
   assign apb_timer__prescaler_lo_if.clk_i = dut.i_soc_domain.soc_peripherals_i.i_apb_timer_unit.prescaler_lo_i.clk_i;
   assign apb_timer__prescaler_lo_if.rst_ni = dut.i_soc_domain.soc_peripherals_i.i_apb_timer_unit.prescaler_lo_i.rst_ni;
   assign apb_timer__prescaler_lo_if.reset_count_i = dut.i_soc_domain.soc_peripherals_i.i_apb_timer_unit.prescaler_lo_i.reset_count_i;
   assign apb_timer__prescaler_lo_if.enable_count_i = dut.i_soc_domain.soc_peripherals_i.i_apb_timer_unit.prescaler_lo_i.enable_count_i;
   assign apb_timer__prescaler_lo_if.compare_value_i = dut.i_soc_domain.soc_peripherals_i.i_apb_timer_unit.prescaler_lo_i.compare_value_i;
   assign apb_timer__prescaler_lo_if.write_counter_i = dut.i_soc_domain.soc_peripherals_i.i_apb_timer_unit.prescaler_lo_i.write_counter_i;
   assign apb_timer__prescaler_lo_if.counter_value_i = dut.i_soc_domain.soc_peripherals_i.i_apb_timer_unit.prescaler_lo_i.counter_value_i;
   assign apb_timer__prescaler_lo_if.counter_value_o = dut.i_soc_domain.soc_peripherals_i.i_apb_timer_unit.prescaler_lo_i.counter_value_o;
   assign apb_timer__prescaler_lo_if.target_reached_o = dut.i_soc_domain.soc_peripherals_i.i_apb_timer_unit.prescaler_lo_i.target_reached_o;
   /// @}

   /// @name apb_timer.prescaler_hi block
   /// @{
   assign apb_timer__prescaler_hi_if.clk_i = dut.i_soc_domain.soc_peripherals_i.i_apb_timer_unit.prescaler_hi_i.clk_i;
   assign apb_timer__prescaler_hi_if.rst_ni = dut.i_soc_domain.soc_peripherals_i.i_apb_timer_unit.prescaler_hi_i.rst_ni;
   assign apb_timer__prescaler_hi_if.reset_count_i = dut.i_soc_domain.soc_peripherals_i.i_apb_timer_unit.prescaler_hi_i.reset_count_i;
   assign apb_timer__prescaler_hi_if.enable_count_i = dut.i_soc_domain.soc_peripherals_i.i_apb_timer_unit.prescaler_hi_i.enable_count_i;
   assign apb_timer__prescaler_hi_if.compare_value_i = dut.i_soc_domain.soc_peripherals_i.i_apb_timer_unit.prescaler_hi_i.compare_value_i;
   assign apb_timer__prescaler_hi_if.write_counter_i = dut.i_soc_domain.soc_peripherals_i.i_apb_timer_unit.prescaler_hi_i.write_counter_i;
   assign apb_timer__prescaler_hi_if.counter_value_i = dut.i_soc_domain.soc_peripherals_i.i_apb_timer_unit.prescaler_hi_i.counter_value_i;
   assign apb_timer__prescaler_hi_if.counter_value_o = dut.i_soc_domain.soc_peripherals_i.i_apb_timer_unit.prescaler_hi_i.counter_value_o;
   assign apb_timer__prescaler_hi_if.target_reached_o = dut.i_soc_domain.soc_peripherals_i.i_apb_timer_unit.prescaler_hi_i.target_reached_o;
   /// @}

   /// @name apb_adv_timer.adv_timer0 block
   /// @{
   assign apb_adv_timer__adv_timer0_if.clk_i = dut.i_soc_domain.soc_peripherals_i.i_apb_adv_timer.u_tim0.clk_i;
   assign apb_adv_timer__adv_timer0_if.rstn_i = dut.i_soc_domain.soc_peripherals_i.i_apb_adv_timer.u_tim0.rstn_i;
   assign apb_adv_timer__adv_timer0_if.cfg_start_i = dut.i_soc_domain.soc_peripherals_i.i_apb_adv_timer.u_tim0.cfg_start_i;
   assign apb_adv_timer__adv_timer0_if.cfg_stop_i = dut.i_soc_domain.soc_peripherals_i.i_apb_adv_timer.u_tim0.cfg_stop_i;
   assign apb_adv_timer__adv_timer0_if.cfg_rst_i = dut.i_soc_domain.soc_peripherals_i.i_apb_adv_timer.u_tim0.cfg_rst_i;
   assign apb_adv_timer__adv_timer0_if.cfg_update_i = dut.i_soc_domain.soc_peripherals_i.i_apb_adv_timer.u_tim0.cfg_update_i;
   assign apb_adv_timer__adv_timer0_if.cfg_arm_i = dut.i_soc_domain.soc_peripherals_i.i_apb_adv_timer.u_tim0.cfg_arm_i;
   assign apb_adv_timer__adv_timer0_if.cfg_sel_i = dut.i_soc_domain.soc_peripherals_i.i_apb_adv_timer.u_tim0.cfg_sel_i;
   assign apb_adv_timer__adv_timer0_if.cfg_sel_clk_i = dut.i_soc_domain.soc_peripherals_i.i_apb_adv_timer.u_tim0.cfg_sel_clk_i;
   assign apb_adv_timer__adv_timer0_if.cfg_mode_i = dut.i_soc_domain.soc_peripherals_i.i_apb_adv_timer.u_tim0.cfg_mode_i;
   assign apb_adv_timer__adv_timer0_if.cfg_presc_i = dut.i_soc_domain.soc_peripherals_i.i_apb_adv_timer.u_tim0.cfg_presc_i;
   assign apb_adv_timer__adv_timer0_if.cfg_sawtooth_i = dut.i_soc_domain.soc_peripherals_i.i_apb_adv_timer.u_tim0.cfg_sawtooth_i;
   assign apb_adv_timer__adv_timer0_if.cfg_cnt_start_i = dut.i_soc_domain.soc_peripherals_i.i_apb_adv_timer.u_tim0.cfg_cnt_start_i;
   assign apb_adv_timer__adv_timer0_if.cfg_cnt_end_i = dut.i_soc_domain.soc_peripherals_i.i_apb_adv_timer.u_tim0.cfg_cnt_end_i;
   assign apb_adv_timer__adv_timer0_if.cfg_comp_ch0_i = dut.i_soc_domain.soc_peripherals_i.i_apb_adv_timer.u_tim0.cfg_comp_ch0_i;
   assign apb_adv_timer__adv_timer0_if.cfg_comp_op_ch0_i = dut.i_soc_domain.soc_peripherals_i.i_apb_adv_timer.u_tim0.cfg_comp_op_ch0_i;
   assign apb_adv_timer__adv_timer0_if.cfg_comp_ch1_i = dut.i_soc_domain.soc_peripherals_i.i_apb_adv_timer.u_tim0.cfg_comp_ch1_i;
   assign apb_adv_timer__adv_timer0_if.cfg_comp_op_ch1_i = dut.i_soc_domain.soc_peripherals_i.i_apb_adv_timer.u_tim0.cfg_comp_op_ch1_i;
   assign apb_adv_timer__adv_timer0_if.cfg_comp_ch2_i = dut.i_soc_domain.soc_peripherals_i.i_apb_adv_timer.u_tim0.cfg_comp_ch2_i;
   assign apb_adv_timer__adv_timer0_if.cfg_comp_op_ch2_i = dut.i_soc_domain.soc_peripherals_i.i_apb_adv_timer.u_tim0.cfg_comp_op_ch2_i;
   assign apb_adv_timer__adv_timer0_if.cfg_comp_ch3_i = dut.i_soc_domain.soc_peripherals_i.i_apb_adv_timer.u_tim0.cfg_comp_ch3_i;
   assign apb_adv_timer__adv_timer0_if.cfg_comp_op_ch3_i = dut.i_soc_domain.soc_peripherals_i.i_apb_adv_timer.u_tim0.cfg_comp_op_ch3_i;
   assign apb_adv_timer__adv_timer0_if.signal_i = dut.i_soc_domain.soc_peripherals_i.i_apb_adv_timer.u_tim0.signal_i;
   assign apb_adv_timer__adv_timer0_if.counter_o = dut.i_soc_domain.soc_peripherals_i.i_apb_adv_timer.u_tim0.counter_o;
   assign apb_adv_timer__adv_timer0_if.pwm_o = dut.i_soc_domain.soc_peripherals_i.i_apb_adv_timer.u_tim0.pwm_o;
   assign apb_adv_timer__adv_timer0_if.status_o = dut.i_soc_domain.soc_peripherals_i.i_apb_adv_timer.u_tim0.status_o;
   /// @}

   /// @name apb_adv_timer.adv_timer1 block
   /// @{
   assign apb_adv_timer__adv_timer1_if.clk_i = dut.i_soc_domain.soc_peripherals_i.i_apb_adv_timer.u_tim1.clk_i;
   assign apb_adv_timer__adv_timer1_if.rstn_i = dut.i_soc_domain.soc_peripherals_i.i_apb_adv_timer.u_tim1.rstn_i;
   assign apb_adv_timer__adv_timer1_if.cfg_start_i = dut.i_soc_domain.soc_peripherals_i.i_apb_adv_timer.u_tim1.cfg_start_i;
   assign apb_adv_timer__adv_timer1_if.cfg_stop_i = dut.i_soc_domain.soc_peripherals_i.i_apb_adv_timer.u_tim1.cfg_stop_i;
   assign apb_adv_timer__adv_timer1_if.cfg_rst_i = dut.i_soc_domain.soc_peripherals_i.i_apb_adv_timer.u_tim1.cfg_rst_i;
   assign apb_adv_timer__adv_timer1_if.cfg_update_i = dut.i_soc_domain.soc_peripherals_i.i_apb_adv_timer.u_tim1.cfg_update_i;
   assign apb_adv_timer__adv_timer1_if.cfg_arm_i = dut.i_soc_domain.soc_peripherals_i.i_apb_adv_timer.u_tim1.cfg_arm_i;
   assign apb_adv_timer__adv_timer1_if.cfg_sel_i = dut.i_soc_domain.soc_peripherals_i.i_apb_adv_timer.u_tim1.cfg_sel_i;
   assign apb_adv_timer__adv_timer1_if.cfg_sel_clk_i = dut.i_soc_domain.soc_peripherals_i.i_apb_adv_timer.u_tim1.cfg_sel_clk_i;
   assign apb_adv_timer__adv_timer1_if.cfg_mode_i = dut.i_soc_domain.soc_peripherals_i.i_apb_adv_timer.u_tim1.cfg_mode_i;
   assign apb_adv_timer__adv_timer1_if.cfg_presc_i = dut.i_soc_domain.soc_peripherals_i.i_apb_adv_timer.u_tim1.cfg_presc_i;
   assign apb_adv_timer__adv_timer1_if.cfg_sawtooth_i = dut.i_soc_domain.soc_peripherals_i.i_apb_adv_timer.u_tim1.cfg_sawtooth_i;
   assign apb_adv_timer__adv_timer1_if.cfg_cnt_start_i = dut.i_soc_domain.soc_peripherals_i.i_apb_adv_timer.u_tim1.cfg_cnt_start_i;
   assign apb_adv_timer__adv_timer1_if.cfg_cnt_end_i = dut.i_soc_domain.soc_peripherals_i.i_apb_adv_timer.u_tim1.cfg_cnt_end_i;
   assign apb_adv_timer__adv_timer1_if.cfg_comp_ch0_i = dut.i_soc_domain.soc_peripherals_i.i_apb_adv_timer.u_tim1.cfg_comp_ch0_i;
   assign apb_adv_timer__adv_timer1_if.cfg_comp_op_ch0_i = dut.i_soc_domain.soc_peripherals_i.i_apb_adv_timer.u_tim1.cfg_comp_op_ch0_i;
   assign apb_adv_timer__adv_timer1_if.cfg_comp_ch1_i = dut.i_soc_domain.soc_peripherals_i.i_apb_adv_timer.u_tim1.cfg_comp_ch1_i;
   assign apb_adv_timer__adv_timer1_if.cfg_comp_op_ch1_i = dut.i_soc_domain.soc_peripherals_i.i_apb_adv_timer.u_tim1.cfg_comp_op_ch1_i;
   assign apb_adv_timer__adv_timer1_if.cfg_comp_ch2_i = dut.i_soc_domain.soc_peripherals_i.i_apb_adv_timer.u_tim1.cfg_comp_ch2_i;
   assign apb_adv_timer__adv_timer1_if.cfg_comp_op_ch2_i = dut.i_soc_domain.soc_peripherals_i.i_apb_adv_timer.u_tim1.cfg_comp_op_ch2_i;
   assign apb_adv_timer__adv_timer1_if.cfg_comp_ch3_i = dut.i_soc_domain.soc_peripherals_i.i_apb_adv_timer.u_tim1.cfg_comp_ch3_i;
   assign apb_adv_timer__adv_timer1_if.cfg_comp_op_ch3_i = dut.i_soc_domain.soc_peripherals_i.i_apb_adv_timer.u_tim1.cfg_comp_op_ch3_i;
   assign apb_adv_timer__adv_timer1_if.signal_i = dut.i_soc_domain.soc_peripherals_i.i_apb_adv_timer.u_tim1.signal_i;
   assign apb_adv_timer__adv_timer1_if.counter_o = dut.i_soc_domain.soc_peripherals_i.i_apb_adv_timer.u_tim1.counter_o;
   assign apb_adv_timer__adv_timer1_if.pwm_o = dut.i_soc_domain.soc_peripherals_i.i_apb_adv_timer.u_tim1.pwm_o;
   assign apb_adv_timer__adv_timer1_if.status_o = dut.i_soc_domain.soc_peripherals_i.i_apb_adv_timer.u_tim1.status_o;
   /// @}

   /// @name apb_adv_timer.adv_timer2 block
   /// @{
   assign apb_adv_timer__adv_timer2_if.clk_i = dut.i_soc_domain.soc_peripherals_i.i_apb_adv_timer.u_tim2.clk_i;
   assign apb_adv_timer__adv_timer2_if.rstn_i = dut.i_soc_domain.soc_peripherals_i.i_apb_adv_timer.u_tim2.rstn_i;
   assign apb_adv_timer__adv_timer2_if.cfg_start_i = dut.i_soc_domain.soc_peripherals_i.i_apb_adv_timer.u_tim2.cfg_start_i;
   assign apb_adv_timer__adv_timer2_if.cfg_stop_i = dut.i_soc_domain.soc_peripherals_i.i_apb_adv_timer.u_tim2.cfg_stop_i;
   assign apb_adv_timer__adv_timer2_if.cfg_rst_i = dut.i_soc_domain.soc_peripherals_i.i_apb_adv_timer.u_tim2.cfg_rst_i;
   assign apb_adv_timer__adv_timer2_if.cfg_update_i = dut.i_soc_domain.soc_peripherals_i.i_apb_adv_timer.u_tim2.cfg_update_i;
   assign apb_adv_timer__adv_timer2_if.cfg_arm_i = dut.i_soc_domain.soc_peripherals_i.i_apb_adv_timer.u_tim2.cfg_arm_i;
   assign apb_adv_timer__adv_timer2_if.cfg_sel_i = dut.i_soc_domain.soc_peripherals_i.i_apb_adv_timer.u_tim2.cfg_sel_i;
   assign apb_adv_timer__adv_timer2_if.cfg_sel_clk_i = dut.i_soc_domain.soc_peripherals_i.i_apb_adv_timer.u_tim2.cfg_sel_clk_i;
   assign apb_adv_timer__adv_timer2_if.cfg_mode_i = dut.i_soc_domain.soc_peripherals_i.i_apb_adv_timer.u_tim2.cfg_mode_i;
   assign apb_adv_timer__adv_timer2_if.cfg_presc_i = dut.i_soc_domain.soc_peripherals_i.i_apb_adv_timer.u_tim2.cfg_presc_i;
   assign apb_adv_timer__adv_timer2_if.cfg_sawtooth_i = dut.i_soc_domain.soc_peripherals_i.i_apb_adv_timer.u_tim2.cfg_sawtooth_i;
   assign apb_adv_timer__adv_timer2_if.cfg_cnt_start_i = dut.i_soc_domain.soc_peripherals_i.i_apb_adv_timer.u_tim2.cfg_cnt_start_i;
   assign apb_adv_timer__adv_timer2_if.cfg_cnt_end_i = dut.i_soc_domain.soc_peripherals_i.i_apb_adv_timer.u_tim2.cfg_cnt_end_i;
   assign apb_adv_timer__adv_timer2_if.cfg_comp_ch0_i = dut.i_soc_domain.soc_peripherals_i.i_apb_adv_timer.u_tim2.cfg_comp_ch0_i;
   assign apb_adv_timer__adv_timer2_if.cfg_comp_op_ch0_i = dut.i_soc_domain.soc_peripherals_i.i_apb_adv_timer.u_tim2.cfg_comp_op_ch0_i;
   assign apb_adv_timer__adv_timer2_if.cfg_comp_ch1_i = dut.i_soc_domain.soc_peripherals_i.i_apb_adv_timer.u_tim2.cfg_comp_ch1_i;
   assign apb_adv_timer__adv_timer2_if.cfg_comp_op_ch1_i = dut.i_soc_domain.soc_peripherals_i.i_apb_adv_timer.u_tim2.cfg_comp_op_ch1_i;
   assign apb_adv_timer__adv_timer2_if.cfg_comp_ch2_i = dut.i_soc_domain.soc_peripherals_i.i_apb_adv_timer.u_tim2.cfg_comp_ch2_i;
   assign apb_adv_timer__adv_timer2_if.cfg_comp_op_ch2_i = dut.i_soc_domain.soc_peripherals_i.i_apb_adv_timer.u_tim2.cfg_comp_op_ch2_i;
   assign apb_adv_timer__adv_timer2_if.cfg_comp_ch3_i = dut.i_soc_domain.soc_peripherals_i.i_apb_adv_timer.u_tim2.cfg_comp_ch3_i;
   assign apb_adv_timer__adv_timer2_if.cfg_comp_op_ch3_i = dut.i_soc_domain.soc_peripherals_i.i_apb_adv_timer.u_tim2.cfg_comp_op_ch3_i;
   assign apb_adv_timer__adv_timer2_if.signal_i = dut.i_soc_domain.soc_peripherals_i.i_apb_adv_timer.u_tim2.signal_i;
   assign apb_adv_timer__adv_timer2_if.counter_o = dut.i_soc_domain.soc_peripherals_i.i_apb_adv_timer.u_tim2.counter_o;
   assign apb_adv_timer__adv_timer2_if.pwm_o = dut.i_soc_domain.soc_peripherals_i.i_apb_adv_timer.u_tim2.pwm_o;
   assign apb_adv_timer__adv_timer2_if.status_o = dut.i_soc_domain.soc_peripherals_i.i_apb_adv_timer.u_tim2.status_o;
   /// @}

   /// @name apb_adv_timer.adv_timer3 block
   /// @{
   assign apb_adv_timer__adv_timer3_if.clk_i = dut.i_soc_domain.soc_peripherals_i.i_apb_adv_timer.u_tim3.clk_i;
   assign apb_adv_timer__adv_timer3_if.rstn_i = dut.i_soc_domain.soc_peripherals_i.i_apb_adv_timer.u_tim3.rstn_i;
   assign apb_adv_timer__adv_timer3_if.cfg_start_i = dut.i_soc_domain.soc_peripherals_i.i_apb_adv_timer.u_tim3.cfg_start_i;
   assign apb_adv_timer__adv_timer3_if.cfg_stop_i = dut.i_soc_domain.soc_peripherals_i.i_apb_adv_timer.u_tim3.cfg_stop_i;
   assign apb_adv_timer__adv_timer3_if.cfg_rst_i = dut.i_soc_domain.soc_peripherals_i.i_apb_adv_timer.u_tim3.cfg_rst_i;
   assign apb_adv_timer__adv_timer3_if.cfg_update_i = dut.i_soc_domain.soc_peripherals_i.i_apb_adv_timer.u_tim3.cfg_update_i;
   assign apb_adv_timer__adv_timer3_if.cfg_arm_i = dut.i_soc_domain.soc_peripherals_i.i_apb_adv_timer.u_tim3.cfg_arm_i;
   assign apb_adv_timer__adv_timer3_if.cfg_sel_i = dut.i_soc_domain.soc_peripherals_i.i_apb_adv_timer.u_tim3.cfg_sel_i;
   assign apb_adv_timer__adv_timer3_if.cfg_sel_clk_i = dut.i_soc_domain.soc_peripherals_i.i_apb_adv_timer.u_tim3.cfg_sel_clk_i;
   assign apb_adv_timer__adv_timer3_if.cfg_mode_i = dut.i_soc_domain.soc_peripherals_i.i_apb_adv_timer.u_tim3.cfg_mode_i;
   assign apb_adv_timer__adv_timer3_if.cfg_presc_i = dut.i_soc_domain.soc_peripherals_i.i_apb_adv_timer.u_tim3.cfg_presc_i;
   assign apb_adv_timer__adv_timer3_if.cfg_sawtooth_i = dut.i_soc_domain.soc_peripherals_i.i_apb_adv_timer.u_tim3.cfg_sawtooth_i;
   assign apb_adv_timer__adv_timer3_if.cfg_cnt_start_i = dut.i_soc_domain.soc_peripherals_i.i_apb_adv_timer.u_tim3.cfg_cnt_start_i;
   assign apb_adv_timer__adv_timer3_if.cfg_cnt_end_i = dut.i_soc_domain.soc_peripherals_i.i_apb_adv_timer.u_tim3.cfg_cnt_end_i;
   assign apb_adv_timer__adv_timer3_if.cfg_comp_ch0_i = dut.i_soc_domain.soc_peripherals_i.i_apb_adv_timer.u_tim3.cfg_comp_ch0_i;
   assign apb_adv_timer__adv_timer3_if.cfg_comp_op_ch0_i = dut.i_soc_domain.soc_peripherals_i.i_apb_adv_timer.u_tim3.cfg_comp_op_ch0_i;
   assign apb_adv_timer__adv_timer3_if.cfg_comp_ch1_i = dut.i_soc_domain.soc_peripherals_i.i_apb_adv_timer.u_tim3.cfg_comp_ch1_i;
   assign apb_adv_timer__adv_timer3_if.cfg_comp_op_ch1_i = dut.i_soc_domain.soc_peripherals_i.i_apb_adv_timer.u_tim3.cfg_comp_op_ch1_i;
   assign apb_adv_timer__adv_timer3_if.cfg_comp_ch2_i = dut.i_soc_domain.soc_peripherals_i.i_apb_adv_timer.u_tim3.cfg_comp_ch2_i;
   assign apb_adv_timer__adv_timer3_if.cfg_comp_op_ch2_i = dut.i_soc_domain.soc_peripherals_i.i_apb_adv_timer.u_tim3.cfg_comp_op_ch2_i;
   assign apb_adv_timer__adv_timer3_if.cfg_comp_ch3_i = dut.i_soc_domain.soc_peripherals_i.i_apb_adv_timer.u_tim3.cfg_comp_ch3_i;
   assign apb_adv_timer__adv_timer3_if.cfg_comp_op_ch3_i = dut.i_soc_domain.soc_peripherals_i.i_apb_adv_timer.u_tim3.cfg_comp_op_ch3_i;
   assign apb_adv_timer__adv_timer3_if.signal_i = dut.i_soc_domain.soc_peripherals_i.i_apb_adv_timer.u_tim3.signal_i;
   assign apb_adv_timer__adv_timer3_if.counter_o = dut.i_soc_domain.soc_peripherals_i.i_apb_adv_timer.u_tim3.counter_o;
   assign apb_adv_timer__adv_timer3_if.pwm_o = dut.i_soc_domain.soc_peripherals_i.i_apb_adv_timer.u_tim3.pwm_o;
   assign apb_adv_timer__adv_timer3_if.status_o = dut.i_soc_domain.soc_peripherals_i.i_apb_adv_timer.u_tim3.status_o;
   /// @}

   /// @name event agent
   /// @{
   assign event_if.low_speed_clk_i = dut.i_soc_domain.soc_peripherals_i.clk_i;
   assign event_if.HRESETn = dut.i_soc_domain.soc_peripherals_i.rst_ni;
   assign event_if.timer_event_lo_o = dut.i_soc_domain.soc_peripherals_i.u_evnt_gen.timer_event_lo_o;
   assign event_if.timer_event_hi_o = dut.i_soc_domain.soc_peripherals_i.u_evnt_gen.timer_event_hi_o;
   assign event_if.err_event_o = dut.i_soc_domain.soc_peripherals_i.u_evnt_gen.err_event_o;
   assign event_if.fc_events_o = dut.i_soc_domain.soc_peripherals_i.u_evnt_gen.fc_events_o;
   assign event_if.event_fifo_valid_o = dut.i_soc_domain.soc_peripherals_i.u_evnt_gen.event_fifo_valid_o;
   assign event_if.cl_event_valid_o = dut.i_soc_domain.soc_peripherals_i.u_evnt_gen.cl_event_valid_o;
   assign event_if.cl_event_data_o = dut.i_soc_domain.soc_peripherals_i.u_evnt_gen.cl_event_data_o;
   assign event_if.pr_event_valid_o = dut.i_soc_domain.soc_peripherals_i.u_evnt_gen.pr_event_valid_o;
   assign event_if.pr_event_data_o = dut.i_soc_domain.soc_peripherals_i.u_evnt_gen.pr_event_data_o;
   assign event_if.cl_event_ready_i = dut.i_soc_domain.soc_peripherals_i.u_evnt_gen.cl_event_ready_i;
   assign event_if.pr_event_ready_i = dut.i_soc_domain.soc_peripherals_i.u_evnt_gen.pr_event_ready_i;
   assign event_if.per_events_i = dut.i_soc_domain.soc_peripherals_i.u_evnt_gen.per_events_i;
   /// @}

   /// @name dbg agent
   /// @{
   assign dbg_if.clk = dut.i_soc_domain.fc_subsystem_i.clk_i;
   assign dbg_if.reset_n = dut.i_soc_domain.fc_subsystem_i.rst_ni;
   assign dbg_if.debug_req_i = dut.i_soc_domain.fc_subsystem_i.debug_req_i;
   assign dbg_if.stoptimer_o = dut.i_soc_domain.fc_subsystem_i.stoptimer_o;
   /// @}

   /// @name apb_timer.proc agent
   /// @{
   assign apb_timer__proc_if.psel = dut.i_soc_domain.soc_peripherals_i.i_apb_timer_unit.PSEL;
   assign apb_timer__proc_if.penable = dut.i_soc_domain.soc_peripherals_i.i_apb_timer_unit.PENABLE;
   assign apb_timer__proc_if.pwrite = dut.i_soc_domain.soc_peripherals_i.i_apb_timer_unit.PWRITE;
   assign apb_timer__proc_if.paddr = dut.i_soc_domain.soc_peripherals_i.i_apb_timer_unit.PADDR;
   assign apb_timer__proc_if.pwdata = dut.i_soc_domain.soc_peripherals_i.i_apb_timer_unit.PWDATA;
   assign apb_timer__proc_if.clk = dut.i_soc_domain.soc_peripherals_i.i_apb_timer_unit.HCLK;
   assign apb_timer__proc_if.reset_n = dut.i_soc_domain.soc_peripherals_i.i_apb_timer_unit.HRESETn;
   assign apb_timer__proc_if.pready = dut.i_soc_domain.soc_peripherals_i.i_apb_timer_unit.PREADY;
   assign apb_timer__proc_if.prdata = dut.i_soc_domain.soc_peripherals_i.i_apb_timer_unit.PRDATA;
   assign apb_timer__proc_if.pslverr = dut.i_soc_domain.soc_peripherals_i.i_apb_timer_unit.PSLVERR;
   /// @}

   /// @name apb_adv_timer.proc agent
   /// @{
   assign apb_adv_timer__proc_if.psel = dut.i_soc_domain.soc_peripherals_i.i_apb_adv_timer.PSEL;
   assign apb_adv_timer__proc_if.penable = dut.i_soc_domain.soc_peripherals_i.i_apb_adv_timer.PENABLE;
   assign apb_adv_timer__proc_if.pwrite = dut.i_soc_domain.soc_peripherals_i.i_apb_adv_timer.PWRITE;
   assign apb_adv_timer__proc_if.paddr = dut.i_soc_domain.soc_peripherals_i.i_apb_adv_timer.PADDR;
   assign apb_adv_timer__proc_if.pwdata = dut.i_soc_domain.soc_peripherals_i.i_apb_adv_timer.PWDATA;
   assign apb_adv_timer__proc_if.clk = dut.i_soc_domain.soc_peripherals_i.i_apb_adv_timer.HCLK;
   assign apb_adv_timer__proc_if.reset_n = dut.i_soc_domain.soc_peripherals_i.i_apb_adv_timer.HRESETn;
   assign apb_adv_timer__proc_if.pready = dut.i_soc_domain.soc_peripherals_i.i_apb_adv_timer.PREADY;
   assign apb_adv_timer__proc_if.prdata = dut.i_soc_domain.soc_peripherals_i.i_apb_adv_timer.PRDATA;
   assign apb_adv_timer__proc_if.pslverr = dut.i_soc_domain.soc_peripherals_i.i_apb_adv_timer.PSLVERR;
   /// @}

   /// @name apb_timer probe
   /// @{
   assign apb_timer__probe_if.HCLK = dut.i_soc_domain.soc_peripherals_i.i_apb_timer_unit.HCLK;
   assign apb_timer__probe_if.ref_clk_i = dut.i_soc_domain.soc_peripherals_i.i_apb_timer_unit.ref_clk_i;
   assign apb_timer__probe_if.HRESETn = dut.i_soc_domain.soc_peripherals_i.i_apb_timer_unit.HRESETn;
   assign apb_timer__probe_if.stoptimer_i = dut.i_soc_domain.soc_peripherals_i.i_apb_timer_unit.stoptimer_i;
   assign apb_timer__probe_if.event_lo_i = dut.i_soc_domain.soc_peripherals_i.i_apb_timer_unit.event_lo_i;
   assign apb_timer__probe_if.event_hi_i = dut.i_soc_domain.soc_peripherals_i.i_apb_timer_unit.event_hi_i;
   assign apb_timer__probe_if.busy_o = dut.i_soc_domain.soc_peripherals_i.i_apb_timer_unit.busy_o;
   /// @}

   /// @name apb_adv_timer probe
   /// @{
   assign apb_adv_timer__probe_if.HCLK = dut.i_soc_domain.soc_peripherals_i.i_apb_adv_timer.HCLK;
   assign apb_adv_timer__probe_if.low_speed_clk_i = dut.i_soc_domain.soc_peripherals_i.i_apb_adv_timer.low_speed_clk_i;
   assign apb_adv_timer__probe_if.HRESETn = dut.i_soc_domain.soc_peripherals_i.i_apb_adv_timer.HRESETn;
   assign apb_adv_timer__probe_if.dft_cg_enable_i = dut.i_soc_domain.soc_peripherals_i.i_apb_adv_timer.dft_cg_enable_i;
   assign apb_adv_timer__probe_if.ext_sig_i = dut.i_soc_domain.soc_peripherals_i.i_apb_adv_timer.ext_sig_i;
   /// @}

endmodule


`endif // __UVMT_CVMCU_CHIP_DUT_WRAP_SV__