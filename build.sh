#!/bin/sh

# can't build without the environment set up in profile
. /home/opam/.profile
ocamlfind opt -thread -linkpkg -package cohttp-lwt-unix app/main.ml -o app/app
