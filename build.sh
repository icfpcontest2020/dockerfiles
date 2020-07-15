#!/bin/sh

ocamlfind opt -thread -linkpkg -package cohttp-lwt-unix app/main.ml -o app/app
