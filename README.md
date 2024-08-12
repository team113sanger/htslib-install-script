# htslib-install-script

A script to install htslib on a linux system.

Tested against Docker images for Ubuntu 22.04, R Base 4.2.3 and Python 3.11.9 (slim-bookworm).

## Installation

**The easiset way is to look at the Dockerfiles in the repository** as this is tested and under CI.

But in general, you can run the following commands to install htslib which will install to `/usr/local`:

```bash
bash install_htslib.sh 1.14
```

Or you can specify a different install location e.g. `/path/to/install`:
```bash
bash install_htslib.sh 1.14 /path/to/install

export PATH=/path/to/install/bin:$PATH
export LD_LIBRARY_PATH=/path/to/install/lib:$LD_LIBRARY_PATH
export LIBRARY_PATH=/path/to/install/lib:$LIBRARY_PATH
export C_INCLUDE_PATH=/path/to/install/include:$C_INCLUDE_PATH
export CPLUS_INCLUDE_PATH=/path/to/install/include:$CPLUS_INCLUDE_PATH
export PKG_CONFIG_PATH=/path/to/install/lib/pkgconfig:$PKG_CONFIG_PATH
```
