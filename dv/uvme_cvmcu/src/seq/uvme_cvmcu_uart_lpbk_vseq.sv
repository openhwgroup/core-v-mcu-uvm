// Copyright 2022-2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVME_CVMCU_UART_LPBK_VSEQ_SV__
`define __UVME_CVMCU_UART_LPBK_VSEQ_SV__


/**
 *
 */
class uvme_cvmcu_uart_lpbk_vseq_c extends uvme_cvmcu_base_vseq_c;

   `uvm_object_utils_begin(uvme_cvmcu_uart_lpbk_vseq_c)
   `uvm_object_utils_end

   /**
    * Default constructor.
    */
   function new(string name="uvme_cvmcu_uart_lpbk_vseq");
      super.new(name);
   endfunction

   /**
    * Reads/writes registers.
    */
   virtual task body();
      uvm_status_e        status ;
      uvm_reg_data_t      value  ;
      uvma_irq_mon_trn_c  irq_trn;
      bit                 saw_irq;

      // Write data to UART and start transfer
      //cntxt.reg_model.abc.xyz.write(status, 4'b1010);
      //cntxt.reg_model.abc.xyz.read (status, value  );
      if (value == 4'b1010) begin
         // ...
      end

      // Wait for irq
      saw_irq = 0;
      do begin
         p_sequencer.irq_mon_trn_fifo.get(irq_trn);
         foreach (irq_trn.asserted[ii]) begin
            if (irq_trn.asserted[ii] == "CLINT_SW") begin
               saw_irq = 1;
               break;
            end
         end
      end while (irq_trn);

      // Read back from mem and compare
      //cntxt.reg_model.abc.xyz.write(status, 4'b1010);
      //cntxt.reg_model.abc.xyz.read (status, value  );
      if (value == 4'b1010) begin
         // ...
      end
   endtask

endclass : uvme_cvmcu_uart_lpbk_vseq_c


`endif // __UVME_CVMCU_UART_LPBK_VSEQ_SV__
