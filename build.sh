#!/bin/sh

eval "$(opam env)"
ocamlfind opt -thread -linkpkg -package cohttp-lwt-unix app/main.ml -o app/app
