#!/bin/sh

eval "$(opam env)"
ocamlfind opt -thread -linkpkg -package curl app/main.ml -o app/app
