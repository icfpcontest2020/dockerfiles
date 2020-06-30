#!/bin/bash

set -e # do not proceed if we failed somewhere

# Replace contents with anything you need to do BEFORE the build step
# This is the best place to download any external dependency and install additional packages

# Note: if you install packages with apt-get don't forget to run
# `apt-get clean && rm -rf /var/lib/apt/lists/*`
# or you might end up in weird caching issues

# Note: this must be a self-contained file and should not depent on any other file in your repo

# Note: all the same can be done in build.sh, this file purely exists to speed-up build times
#       and help orgamizer's team with possible cache issues
#       Please be kind and move as much as possible here (and don't change it too often)


# Uncomment the following line and put some packages there
# apt-get install <something>

apt-get clean && rm -rf /var/lib/apt/lists/*
