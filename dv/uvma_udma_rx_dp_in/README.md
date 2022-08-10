# Hello from your Code Generator!
Thank you for using the Moore.io Block-Level UVM Agents+Environment+TB Code Template v1.0!

Your parameters are:
* Name: 'udma_rx_dp_in'
* Full Name: 'uDMA Rx Channels Block Data Plane Input'

If this is incorrect, it is recommended to delete the generated IP and re-generate with the correct parameters.

What follows is a short guide for developers of this new UVM Agent. You may also use `grep -nr TODO .` for a full list.


 1. - [ ] Physical Interface - `uvma_{{ name }}_if.sv` - Modify the signals to match your protocol's physical interface.
 1. - [ ] Monitor Transaction - `obj/uvma_{{ name }}_phy_mon_trn.sv` - Modify the fields to match your interface definition.
 1. - [ ] Sequence Item - `seq/uvma_{{ name }}_phy_seq_item.sv` - Modify the fields to match your interface definition.
 1. - [ ] Driver - `comps/uvma_{{ name }}_phy_drv.sv` - Modify the code driving the modport signals to match your interface definition.
 1. - [ ] Monitor - `comps/uvma_{{ name }}_mon.sv` - Modify the code sampling the modport signals to match your interface definition.


## Have fun!
Make sure to check out the other IP generated along with this test bench:
* `uvma_udma_rx_dp_in_cp`
* `uvma_udma_rx_dp_in_dp_in`
* `uvma_udma_rx_dp_in_dp_out`
* `uvme_udma_rx_dp_in`
* `uvmt_udma_rx_dp_in`




# uDMA Rx Channels Block Data Plane Input UVM Agent


# About
This package contains the uDMA Rx Channels Block Data Plane Input UVM Agent.
TODO Describe uDMA Rx Channels Block Data Plane Input


# Block Diagram
![alt text](./docs/agent_block_diagram.svg "uDMA Rx Channels Block Data Plane Input UVM Agent Block Diagram")

# Directory Structure
* `bin` - Scripts, metadata and other miscellaneous files
* `docs` - Reference documentation
* `examples` - Code samples for using and extending this agent
* `src` - Source code


# Dependencies
It is dependent on the following packages:

* `uvm_pkg`
* `uvml_pkg`
* `uvml_logs_pkg`
