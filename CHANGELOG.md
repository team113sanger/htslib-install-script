# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).


## [1.0.2] - 2024-08-30
### Added
- Extend testing to cover installation of htslib on 1.10, 1.11, 1.12 and 1.13,
  as well as the existing coverage of 1.14 to 1.20.
    - **NOTE**: No changes to the script were necessary to support these versions, so you can
      use the existing script to install these versions.


## [1.0.1] - 2024-08-20
### Fixed
- Fix missing dependencies for libdeflate from `docker/Dockerfile.ubuntu22.via_github_w_libdeflate`.

## [1.0.0] - 2024-08-20
### Added
- A script to install htslib on a linux system.
- Coverage of htslib versions from 1.14 to 1.20.
- Testing htlib installation on Ubuntu 22.04, R Base 4.2.3 and Python 3.11.9 for multiple versions of htslib.
- Add CICD for testing the script on multiple versions of htslib.