# About
## No Home Page Yet
This project aims to build a UVM test bench and environment for the CORE-V MCU.

## IP
* DV
> * uvme_cvmcu
> * uvmt_cvmcu
* RTL
* Tools


# Simulation
**1. Change directory to 'sim'**

This is from where all jobs will be launched.
```
cd ./sim
```

**2. Project Setup**

Only needs to be done once, or when libraries must be updated. This will pull in dependencies from the web.
```
./setup_project.py
```

**3. Terminal Setup**

This must be done per terminal. The script included in this project is for bash:

```
export VIVADO=/path/to/vivado/bin # Set locaton of Vivado installation
source ./setup_terminal.sh
```

**4. Launch**

All jobs for simulation are performed via `mio`.

> At any time, you can invoke its built-in documentation:

```
mio --help
```

> To run compilation and elaboration:

```
clear && mio all uvmt_cvmcu -t smoke -s 1
```
