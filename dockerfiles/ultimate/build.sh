#!/bin/bash

set -e # do not proceed if we failed somewhere

# Replace contents with anything you need to do on the build step
# Here you can access internet and install additional packages with apt-get install
# You can also compile you application and place all the needed data where you expect it

# Note: if you install packages with apt-get don't forget to run 
# apt-get clean && rm -rf /var/lib/apt/lists/*
# or you might end up in weird caching issues


mkdir -p /data
echo "Hello, World!" > /data/greeting.txt

