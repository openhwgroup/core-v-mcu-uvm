// Copyright 2022 Datum Technology Corporation
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMT_CVMCU_SMOKE_TEST_SV__
`define __UVMT_CVMCU_SMOKE_TEST_SV__


/**
 * Currently does not run any stimulus
 */
class uvmt_cvmcu_smoke_test_c extends uvmt_cvmcu_base_test_c;

   rand uvme_cvmcu_smoke_vseq_c  smoke_vseq;


   `uvm_component_utils(uvmt_cvmcu_smoke_test_c)


   /**
    * Creates smoke_vseq.
    */
   extern function new(string name="uvmt_cvmcu_smoke_test", uvm_component parent=null);

   /**
    * Does nothing
    */
   extern virtual task main_phase(uvm_phase phase);

endclass : uvmt_cvmcu_smoke_test_c


function uvmt_cvmcu_smoke_test_c::new(string name="uvmt_cvmcu_smoke_test", uvm_component parent=null);

   super.new(name, parent);
   smoke_vseq = uvme_cvmcu_smoke_vseq_c::type_id::create("smoke_vseq");

endfunction : new


task uvmt_cvmcu_smoke_test_c::main_phase(uvm_phase phase);

   super.main_phase(phase);

   phase.raise_objection(this);
   `uvm_info("TEST", $sformatf("Starting smoke virtual sequence:\n%s", smoke_vseq.sprint()), UVM_NONE)
   smoke_vseq.start(vsequencer);
   phase.drop_objection(this);
   `uvm_info("TEST", "Finished smoke virtual sequence", UVM_NONE)

endtask : main_phase


`endif // __UVMT_CVMCU_SMOKE_TEST_SV__
