// Copyright 2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMA_TCOUNTER_B_MON_SEQ_SV__
`define __UVMA_TCOUNTER_B_MON_SEQ_SV__


/**
 * Sequence taking in CP, DPI & DPO Monitor Transactions and creating Timer unit counter Agent Monitor Transactions
 * (uvma_tcounter_b_mon_trn_c) in both directions.
 * @ingroup uvma_tcounter_b_seq
 */
class uvma_tcounter_b_mon_seq_c extends uvma_tcounter_b_base_seq_c;

   `uvm_object_utils(uvma_tcounter_b_mon_seq_c)
   `uvmx_mon_seq()

   /**
    * Default constructor.
    */
   function new(string name="uvma_tcounter_b_mon_seq");
      super.new(name);
   endfunction

   /**
    * Forks off `monitor_x()` tasks.
    */
   task monitor();
      fork
         monitor_in ();
         monitor_out();
      join
   endtask

   /**
    * Creates Timer unit counter Agent Monitor Transactions for input direction (relative to DUT).
    */
   task monitor_in();
      uvma_tcounter_b_mon_trn_c      in_trn ;
      uvma_tcounter_b_cp_mon_trn_c   cp_trn ;
      uvma_tcounter_b_dpi_mon_trn_c  dpi_trn;
      forever begin
         `uvmx_get_mon_trn(dpi_trn, dpi_mon_trn_fifo)
         // TODO Implement uvma_tcounter_b_mon_seq_c::monitor()
         //      Ex: if (dpi_trn.vld) begin
         //             in_trn = uvma_tcounter_b_mon_trn_c::type_id::create("in_trn");
         //             in_trn.dir_in = 1;
         //             in_trn.abc = dpi_trn.abc;
         //             in_trn.from(dpi_trn);
         //          end
         //          `uvmx_get_mon_trn(dpi_trn, dpi_mon_trn_fifo)
         //          // ...
         //          in_trn.from(dpi_trn);
         //          `uvmx_write_mon_trn(in_trn, in_mon_trn_fifo)
      end
   endtask

   /**
    * Creates Timer unit counter Agent Monitor Transactions for output direction (relative to DUT).
    */
   task monitor_out();
      uvma_tcounter_b_mon_trn_c      out_trn;
      uvma_tcounter_b_cp_mon_trn_c   cp_trn ;
      uvma_tcounter_b_dpo_mon_trn_c  dpo_trn;
      forever begin
         fork
            `uvmx_get_mon_trn(cp_trn , cp_mon_trn_fifo )
            `uvmx_get_mon_trn(dpo_trn, dpo_mon_trn_fifo)
         join
         // TODO Implement uvma_tcounter_b_mon_seq_c::monitor()
         //      Ex: if (dpo_trn.vld) begin
         //             out_trn = uvma_tcounter_b_mon_trn_c::type_id::create("out_trn");
         //             out_trn.dir_in = 0;
         //             out_trn.def = dpo_trn.def;
         //             out_trn.from(dpo_trn);
         //          end
         //          // ...
         //          out_trn.xyz = cp_trn.xyz;
         //          out_trn.from(cp_trn);
         //          `uvmx_write_mon_trn(out_trn, out_mon_trn_fifo)
      end
   endtask

endclass


`endif // __UVMA_TCOUNTER_B_MON_SEQ_SV__