// Copyright 2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVME_CVMCU_CHIP_BASE_SEQ_SV__
`define __UVME_CVMCU_CHIP_BASE_SEQ_SV__


/**
 * Abstract Sequence from which all other CORE-V-MCU Chip environment Sequences extend.
 * Subclasses must be run on uvme_cvmcu_chip_sqr_c.
 * @ingroup uvme_cvmcu_chip_seq
 */
class uvme_cvmcu_chip_base_seq_c extends uvmx_chip_env_seq_c #(
   .T_CFG  (uvme_cvmcu_chip_cfg_c  ),
   .T_CNTXT(uvme_cvmcu_chip_cntxt_c),
   .T_SQR  (uvme_cvmcu_chip_sqr_c  )
);

   `uvm_object_utils(uvme_cvmcu_chip_base_seq_c)

   /**
    * Default constructor.
    */
   function new(string name="uvme_cvmcu_chip_base_seq");
      super.new(name);
   endfunction

   /**
    * Re-constitutes UART0 transactions from memory.
    */
   task uart0_rx();
      uvma_uart_mon_trn_c  trn;
      uvm_reg_data_t       data_valid;
      uvm_reg_addr_t       address;
      uvm_reg_data_t       num_bytes;
      uvm_reg_data_t       r_data;
      bit                  data[];
      bit                  data_q[$];
      forever begin
         trn = uvma_uart_mon_trn_c::type_id::create("trn");
         trn.cfg   = cfg  .uart0_agent_cfg  ;
         trn.cntxt = cntxt.uart0_agent_cntxt;
         do begin
            `uvmx_mirror_reg_obj(uart0.valid, trn)
            `uvmx_get_field(data_valid, uart0.valid.rx_data_valid)
         end while (!data_valid);
         `uvmx_mirror_reg_obj(uart0.rx_saddr, trn)
         `uvmx_get_field(address, uart0.rx_saddr)
         `uvmx_mirror_reg_obj(uart0.rx_size, trn)
         `uvmx_get_field(num_bytes, uart0.rx_size.size)
         //for (int unsigned ii=0; ii<num_bytes; ii++) begin
         //   `uvmx_read_mem_obj(r_data, ram, address+ii, trn)
         //   for (int unsigned jj=0; jj<8; jj++) begin
         //      data_q.push_back(r_data[jj]);
         //   end
         //end
         //data = new[cfg.uart0_agent_cfg.frame_size];
         //foreach (data_q[ii]) begin
         //   data[ii] = data_q[ii];
         //end
         p_sequencer.udma_uart0_ingress_act_ap.write(trn);
      end
   endtask

   /**
    * Re-constitutes UART1 transactions from memory.
    */
   task uart1_rx();
      uvma_uart_mon_trn_c  trn;
      uvm_reg_data_t       data_valid;
      uvm_reg_addr_t       address;
      uvm_reg_data_t       num_bytes;
      forever begin
         trn = uvma_uart_mon_trn_c::type_id::create("trn");
         trn.cfg   = cfg  .uart1_agent_cfg  ;
         trn.cntxt = cntxt.uart1_agent_cntxt;
         do begin
            `uvmx_mirror_reg_obj(uart1.valid, trn)
            `uvmx_get_field(data_valid, uart1.valid.rx_data_valid)
         end while (!data_valid);
         `uvmx_mirror_reg_obj(uart1.rx_saddr, trn)
         `uvmx_get_field(address, uart1.rx_saddr)
         `uvmx_mirror_reg_obj(uart1.rx_size, trn)
         `uvmx_get_field(num_bytes, uart1.rx_size.size)
         repeat (num_bytes) begin
            // TODO
         end
         p_sequencer.udma_uart1_ingress_act_ap.write(trn);
      end
   endtask

endclass


`endif // __UVME_CVMCU_CHIP_BASE_SEQ_SV__
