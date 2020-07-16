# Ultimate platform based on ubuntu:20.04

This is image is designed for multi-language teams and solutions, and doesn't enforce any solution structure.

## Tools included (extend via Dockerfile.base)

* standard unix tools (gawk, sed, binutils)
* C/C++ with GCC9, clang-10, boost and cmake
* perl 5.30
* Java 11
* Scala 2.12
* Python 3.8
* Rust 1.45+ (run `source /root/.cargo/env` to make it available)

## How to use:

1. Place you build logic into `build.sh`
2. Launch your code in `run.sh` (code will be located at `/source/`)


## Build algorithm:

* `docker build -f Dockerfile.base -t icfpcontest2020/ultimate:latest .`
* all code from the repository is placed under `container:/source/` folder
* `/source/build.sh` executed at the build step
* `/source/run.sh` executed as an entry point for your solution

### Notes:

* `/source/run.sh` might be generated or modified by `build.sh`
