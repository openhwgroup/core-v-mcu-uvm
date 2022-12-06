// Copyright 2022 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMT_CVMCU_REG_ACCESS_TEST_SV__
`define __UVMT_CVMCU_REG_ACCESS_TEST_SV__


/**
 *
 * @ingroup uvmt_cvmcu_tests
 */
class uvmt_cvmcu_reg_access_test_c extends uvmt_cvmcu_base_test_c;

   `uvm_component_utils(uvmt_cvmcu_reg_access_test_c)
   `uvmx_test_reg(UVM_DO_REG_ACCESS)

   /**
    * Default constructor.
    */
   function new(string name="uvmt_cvmcu_reg_access_test", uvm_component parent=null);
      super.new(name, parent);
   endfunction

endclass : uvmt_cvmcu_reg_access_test_c


`endif // __UVMT_CVMCU_REG_ACCESS_TEST_SV__