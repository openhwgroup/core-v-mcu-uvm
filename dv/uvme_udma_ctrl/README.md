# Hello from your Code Generator!
Thank you for using the Moore.io Block-Level UVM Agents+Environment+TB Code Template v1.0!

Your parameters are:
* Name: 'udma_ctrl'
* Full Name: 'uDMA Controller'

If this is incorrect, it is recommended to delete the generated IP and re-generate with the correct parameters.

This code template assumes the DUT has a single datapath (DP) direction and control plane (CP) signals.

What follows is a short guide for developers of this new UVM Environment.  You may also use `grep -nr TODO .` for a full list.

## 1 - Connect the DUT to the Interfaces
 1. - [ ] Predictor - `comps/uvma_udma_ctrl_prd.sv` - Use the sample code as a guide to convert input DP transactions into output DP transactions.

## Have fun!
Make sure to check out the other IP generated along with this test bench:
* `uvma_udma_ctrl_cp`
* `uvma_udma_ctrl_dp_in`
* `uvma_udma_ctrl_dp_out`
* `uvmt_udma_ctrl`




# uDMA Controller Block UVM Environment


# About
This IP contains the uDMA Controller Block UVM Environment.

TODO Describe uDMA Controller


# Block Diagram
![alt text](./docs/env_block_diagram.svg "uDMA Controller Block UVM Environment Block Diagram")

# Directory Structure
* `bin` - Scripts, metadata and other miscellaneous files
* `docs` - Reference documentation
* `examples` - Code samples for using and extending this environment
* `src` - Source code


# Dependencies
It is dependent on the following IP:

* `uvm`
* `uvml`
* `uvml_logs`
* `uvml_sb`
* `uvml_ral`
* `uvma_clk`
* `uvma_reset`
* `uvma_udma_ctrl_cp`
* `uvma_udma_ctrl_dp_in`
* `uvma_udma_ctrl_dp_out`
