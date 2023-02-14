// Copyright 2022-2023 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVME_CVMCU_INIT_VSEQ_SV__
`define __UVME_CVMCU_INIT_VSEQ_SV__


/**
 * TODO Describe uvme_cvmcu_init_vseq_c
 */
class uvme_cvmcu_init_vseq_c extends uvme_cvmcu_base_vseq_c;

   /// @name Knobs
   /// @{
   // TODO Add randomizable fields to control stimulus
   //      Ex: rand int unsigned  num_items; ///< Number of sequence items to be generated.
   /// @}


   `uvm_object_utils_begin(uvme_cvmcu_init_vseq_c)
      // TODO Add UVM field macros for knobs
      //      Ex: `uvm_field_int(num_items, UVM_DEFAULT)
   `uvm_object_utils_end


   /**
    * Default values for random fields.
    */
   constraint defaults_cons {
      // TODO Add soft constraints to implement default values for knobs
      //      Ex: soft num_items == 10;
   }


   /**
    * Default constructor.
    */
   function new(string name="uvme_cvmcu_init_vseq");
      super.new(name);
   endfunction

   /**
    * TODO Describe uvme_cvmcu_init_vseq_c::body()
    */
   virtual task body();
      // TODO Add stimulus to uvme_cvmcu_init_vseq_c
      //
      //      Ex: Fixed number of random items:
      //          for (int unsigned ii=0; ii<num_items; ii++) begin
      //             `uvm_info("CVMCU_INIT_VSEQ", $sformatf("Starting item %0d/%0d", (ii+1), num_items), UVM_MEDIUM)
      //             `uvm_do_on(req, p_sequencer.obi_data_vsequencer)
      //             `uvm_info("CVMCU_INIT_VSEQ", $sformatf("Finished item %0d/%0d", (ii+1), num_items), UVM_MEDIUM)
      //          end
      //
      //      Ex: Register accesses:
      //          uvm_status_e    status;
      //          uvm_reg_data_t  value ;
      //          cntxt.reg_model.abc.xyz.write(status, 4'b1010);
      //          cntxt.reg_model.abc.xyz.read (status, value  );
      //          if (value == 4'b1010) begin
      //             // ...
      //          end
   endtask

endclass : uvme_cvmcu_init_vseq_c


`endif // __UVME_CVMCU_INIT_VSEQ_SV__
