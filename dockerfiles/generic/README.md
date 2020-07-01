# Customizable platform based on ubuntu:latest

## How to use generic platform:

1. Place your dependencies in `prepare_build.sh` (you can skip it)
2. Place you build logic into `build.sh` (you can skip it)
3. Launch your code in `run.sh` (code will be located at `/source/`)


## Build algorithm:

* a single file `./prepare_build.sh` copied under `container:/source/prepare_build.sh`
* `/source/prepare_build.sh` is launched before the build step to setup dependencies and caches
* all code from the repository is placed under `container:/source/` folder
* `/source/build.sh` will be called at the build step
* `/source/run.sh` will be called as an entry point for your solution

### Notes:

* `/source/run.sh` might be generated or modified by `build.sh`
* `prepare_build.sh` must not depend on any other file in the repository
* `prepare_build.sh` should be used for installing packages and getting extra dependencies, it should not change too frequently and required to make builds faster
