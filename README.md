# htslib-install-script

A script to install htslib on a linux system.

Tested against Docker images for Ubuntu 22.04, R Base 4.2.3 and Python 3.11.9 (slim-bookworm) for multiple versions of htslib.

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

## Requirements

The requirements for the script and the installation of htslib are the same
across all Dockerfiles. Read the Dockerfiles to see the exact requirements.


## Testing

The testing of script is done using Docker images to capture the minimal installation requirements.

| HTS Lib Version | Environment | Default install `/usr/local` | Custom install `/opt/install` |
| --------------- | ----------- | ---------------------------- | ----------------------------- |
| 1.14            | Ubuntu 22.04                               | ✅ | ✅ |
| 1.14            | R-Base 4.2.3 (*Debian*)                    | ✅ | ✅ |
| 1.14            | Python 3.11.9 (*Debian* slim-bookworm)     | ✅ | ✅ |
| 1.15.1          | Ubuntu 22.04                               | ✅ | ✅ |
| 1.15.1          | R-Base 4.2.3  (*Debian*)                   | ✅ | ✅ |
| 1.15.1          | Python 3.11.9 (*Debian* slim-bookworm)     | ✅ | ✅ |
| 1.16            | Ubuntu 22.04                               | ✅ | ✅ | 
| 1.16            | R-Base 4.2.3 (*Debian*)                    | ✅ | ✅ |
| 1.16            | Python 3.11.9 (*Debian* slim-bookworm)     | ✅ | ✅ |
| 1.17            | Ubuntu 22.04                               | ✅ | ✅ |
| 1.17            | R-Base 4.2.3 (*Debian*)                    | ✅ | ✅ |
| 1.17            | Python 3.11.9 (*Debian* slim-bookworm)     | ✅ | ✅ |
| 1.18            | Ubuntu 22.04                               | ✅ | ✅ |
| 1.18            | R-Base 4.2.3 (*Debian*)                    | ✅ | ✅ |
| 1.18            | Python 3.11.9 (*Debian* slim-bookworm)     | ✅ | ✅ |
| 1.19            | Ubuntu 22.04                               | ✅ | ✅ |
| 1.19            | R-Base 4.2.3 (*Debian*)                    | ✅ | ✅ |
| 1.19            | Python 3.11.9 (*Debian* slim-bookworm)     | ✅ | ✅ |
| 1.20            | Ubuntu 22.04                               | ✅ | ✅ |
| 1.20            | R-Base 4.2.3 (*Debian*)                    | ✅ | ✅ |
| 1.20            | Python 3.11.9 (*Debian* slim-bookworm)     | ✅ | ✅ |
