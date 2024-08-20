# htslib-install-script

A convenience script to install any version of `htslib` on an Ubuntu (`22.04`) or Debian system (`bookworm`).

## Table of Contents

- [Description](#description)
- [Installation - quick start](#installation---quick-start)
- [Installation - quick start with libdeflate](#installation---quick-start-with-libdeflate)
- [Installation - controlling the install location](#installation---controlling-the-install-location)
- [Requirements](#requirements)
- [Testing](#testing)
- [Development](#development)

## Description

The script `install_htslib.sh` is a convenience script to install
`htslib` ([GitHub: samtools/htslib](https://github.com/samtools/htslib)),
a popular library for fast compression and decompression that is often used by tools like
`samtools` and `htslib`.

The script encapsulates the steps to download, configure, compile and install
`htslib` to a specified location, for versions `1.14` to `1.20`.

The script is tested via a private GitLab CICD against Ubuntu 22.04 and Debian
bookworm with popular Docker images.

## Installation - quick start

With a single command the script can be downloaded and installed. For details on how to install to a custom location, 
see [Installation - controlling the install location](#installation---controlling-the-install-location) section. 
It is recommended to install `libdeflate` as well, go to the [quick start with libdeflate](#installation---quick-start-with-libdeflate) section.

For a Dockerised example of how to install `htslib`, see the `docker/Dockerfile.ubuntu22.via_github`.

Various version of the script can be downloaded from the [releases page](https://github.com/team113sanger/htslib-install-script/releases).

```bash
HTSLIB_VERSION="1.16"
HTSLIB_SCRIPT_URL="https://github.com/team113sanger/htslib-install-script/releases/download/1.0.1/install_htslib.sh"

curl -sSL $HTSLIB_SCRIPT_URL | bash -s -- $HTSLIB_VERSION

# or with wget if curl is not available
wget -qO- $HTSLIB_SCRIPT_URL | bash -s -- $HTSLIB_VERSION
```

## Installation - quick start with libdeflate

Libdeflate is a heavily optimized library for DEFLATE-based compression and
decompression, and is used by `htslib` for fast decompression of CRAM files,
among other things. If absent, `htslib` will fall back to gzip for
decompression.

For a Dockerised example of how to install `libdeflate` and `htslib`, see the `docker/Dockerfile.ubuntu22.via_github_w_libdeflate`.

For more information on how to install `libdeflate`, see the [libdeflate-install-script](https://github.com/team113sanger/libdeflate-install-script).

```bash
LIBDEFLATE_VERSION="v1.9"
HTSLIB_VERSION="1.16"
LIBDEFLATE_SCRIPT_URL="https://github.com/team113sanger/libdeflate-install-script/releases/download/1.0.1/install_libdeflate.sh"
HTSLIB_SCRIPT_URL="https://github.com/team113sanger/htslib-install-script/releases/download/1.0.1/install_htslib.sh"

curl -sSL $LIBDEFLATE_SCRIPT_URL | bash -s -- $LIBDEFLATE_VERSION
curl -sSL $HTSLIB_SCRIPT_URL | bash -s -- $HTSLIB_VERSION
```

**Note**: The `libdeflate` script is run first as `htslib` will use `libdeflate` if it is available.


## Installation - controlling the install location

**The easiset way is to look at the Dockerfiles in the repository** as this is tested and under CI.

But in general, you can run the following commands to install libdeflate which will install to `/usr/local`:

```bash
bash install_htslib.sh 1.16
```

Or you can specify a different install location e.g. `/path/to/install`:
```bash
DEST_DIR=/path/to/install

bash install_htslib.sh 1.16 $DEST_DIR

export PATH=$DEST_DIR/bin:$PATH
export LD_LIBRARY_PATH=$DEST_DIR/lib:$LD_LIBRARY_PATH
export LIBRARY_PATH=$DEST_DIR/lib:$LIBRARY_PATH
export C_INCLUDE_PATH=$DEST_DIR/include:$C_INCLUDE_PATH
export CPLUS_INCLUDE_PATH=$DEST_DIR/include:$CPLUS_INCLUDE_PATH
export PKG_CONFIG_PATH=$DEST_DIR/lib/pkgconfig:$PKG_CONFIG_PATH
```

## Requirements

The common requirements for the script and the installation of `htslib` are documented
clearly in the Dockerfiles in the repository. **It is strongly recommended to install `libdeflate`** 
though it is optional: please see this convenience script
[libdeflate-install-script](https://github.com/team113sanger/libdeflate-install-script).

`htslib` officially documents its required and optional system requirements in
the [INSTALL](https://github.com/samtools/htslib/blob/develop/INSTALL) file of
its repository.

If a required system library is missing, `htslib` compilation will fail with a
self-explanatory error message e.g. `configure: error: libbzip2 development files not found ...`.


## Testing

The testing of script is done using Docker images to capture the minimal installation requirements.

| HTS Lib Version | Environment | Default install `/usr/local` | Custom install `/opt/install` |
| --------------- | ----------- | ---------------------------- | ----------------------------- |
| 1.14            | Ubuntu 22.04                               | ✅ | ✅ |
| 1.14            | R-Base 4.2.3 (*Debian* bookworm)           | ✅ | ✅ |
| 1.14            | Python 3.11.9 (*Debian* bookworm)          | ✅ | ✅ |
| 1.15.1          | Ubuntu 22.04                               | ✅ | ✅ |
| 1.15.1          | R-Base 4.2.3 (*Debian bookworm*)           | ✅ | ✅ |
| 1.15.1          | Python 3.11.9 (*Debian* bookworm)          | ✅ | ✅ |
| 1.16            | Ubuntu 22.04                               | ✅ | ✅ | 
| 1.16            | R-Base 4.2.3 (*Debian* bookworm)           | ✅ | ✅ |
| 1.16            | Python 3.11.9 (*Debian* bookworm)          | ✅ | ✅ |
| 1.17            | Ubuntu 22.04                               | ✅ | ✅ |
| 1.17            | R-Base 4.2.3 (*Debian* bookworm)           | ✅ | ✅ |
| 1.17            | Python 3.11.9 (*Debian* bookworm)          | ✅ | ✅ |
| 1.18            | Ubuntu 22.04                               | ✅ | ✅ |
| 1.18            | R-Base 4.2.3 (*Debian* bookworm)           | ✅ | ✅ |
| 1.18            | Python 3.11.9 (*Debian* bookworm)          | ✅ | ✅ |
| 1.19            | Ubuntu 22.04                               | ✅ | ✅ |
| 1.19            | R-Base 4.2.3 (*Debian* bookworm)           | ✅ | ✅ |
| 1.19            | Python 3.11.9 (*Debian* bookworm)          | ✅ | ✅ |
| 1.20            | Ubuntu 22.04                               | ✅ | ✅ |
| 1.20            | R-Base 4.2.3 (*Debian* bookworm)           | ✅ | ✅ |
| 1.20            | Python 3.11.9 (*Debian* bookworm)          | ✅ | ✅ |


## Development

To build
```bash
docker build -f docker/Dockerfile.ubuntu22.usr_local -t example:local .

# or to build with a specific version
VERSION=1.16
docker build -f docker/Dockerfile.ubuntu22.usr_local --build-arg HTSLIB_VERSION=$VERSION -t example:local .

```

To run
```bash
docker run -it --rm example:local bash

# or if wanting to bind mount the repo
docker run -it --rm -v $(pwd):/opt/repo example:local bash
```

To test
```bash
VERSION=1.16
docker run --rm example:local bash run_tests.sh $VERSION
```

## Cutting a release

To cut a release, update the version in the script and the README.md. This
repository uses [semantic versioning](https://semver.org/spec/v2.0.0.html).

Tests are automatically run in the GitLab CI pipeline.

Tags will automatically create releases on GitHub.