// Copyright 2022 Datum Technology Corporation
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMT_CVMCU_DUT_WRAP_SV__
`define __UVMT_CVMCU_DUT_WRAP_SV__


/**
 * Module wrapper for CORE-V MCU RTL DUT.  All ports are SV interfaces.
 */
module uvmt_cvmcu_dut_wrap (
   uvma_obi_if          obi_instr_if,
   uvma_obi_if          obi_data_if,
   uvma_cvmcu_intr_if   intr_if,
   uvmt_cvmcu_probe_if  probe_if
);

   // \/ CODE BELOW IS RESPONSABILITY OF DESIGNERS \/

   reg  jtag_tck_i  = 0;
   reg  jtag_tdi_i  = 0;
   reg  jtag_tdo_o     ;
   reg  jtag_tms_i  = 0;
   reg  jtag_trst_i = 0;
   reg  bootsel_i   = 0;
   reg  stm_i       = 0;
   reg  [ 47:0]  io_in_i     = 0;
   reg  [ 47:0]  io_out_o       ;
   reg  [287:0]  pad_cfg_o      ;
   reg  [ 47:0]  io_oe_o        ;

   core_v_mcu #(.USE_CORES(1)) dut (
     .jtag_tck_i (jtag_tck_i),
     .jtag_tdi_i (jtag_tdi_i),
     .jtag_tdo_o (jtag_tdo_o),
     .jtag_tms_i (jtag_tms_i),
     .jtag_trst_i(jtag_trst_i),
     .ref_clk_i(obi_instr_if.clk    ),
     .rstn_i   (obi_instr_if.reset_n),
     .bootsel_i(bootsel_i),
     .stm_i    (stm_i    ),
     .io_in_i  (io_in_i  ),
     .io_out_o (io_out_o ),
     .pad_cfg_o(pad_cfg_o),
     .io_oe_o  (io_oe_o  )
   );

   // Instruction OBI Interface
   //assign obi_instr_if.addr = dut.i_soc_domain.fc_subsystem_i.core_instr_addr;
   //assign obi_instr_if.req  = dut.i_soc_domain.fc_subsystem_i.core_instr_req ;
   //assign dut.i_soc_domain.fc_subsystem_i.core_instr_rdata  = obi_instr_if.rdata ;
   //assign dut.i_soc_domain.fc_subsystem_i.core_instr_gnt    = obi_instr_if.gnt   ;
   //assign dut.i_soc_domain.fc_subsystem_i.core_instr_rvalid = obi_instr_if.rvalid;

   // Data OBI Interface
   //assign obi_data_if.addr  = dut.i_soc_domain.fc_subsystem_i.core_data_addr ;
   //assign obi_data_if.req   = dut.i_soc_domain.fc_subsystem_i.core_data_req  ;
   //assign obi_data_if.be    = dut.i_soc_domain.fc_subsystem_i.core_data_be   ;
   //assign obi_data_if.we    = dut.i_soc_domain.fc_subsystem_i.core_data_we   ;
   //assign obi_data_if.wdata = dut.i_soc_domain.fc_subsystem_i.core_data_wdata;
   //assign dut.i_soc_domain.fc_subsystem_i.core_data_rdata  = obi_data_if.rdata ;
   //assign dut.i_soc_domain.fc_subsystem_i.core_data_gnt    = obi_data_if.gnt   ;
   //assign dut.i_soc_domain.fc_subsystem_i.core_data_rvalid = obi_data_if.rvalid;

   // /\ CODE ABOVE IS RESPONSABILITY OF DESIGNERS /\

endmodule : uvmt_cvmcu_dut_wrap


`endif // __UVMT_CVMCU_DUT_WRAP_SV__
