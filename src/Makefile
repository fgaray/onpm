SRC = common.ml opam_interface.ml config.ml arguments.ml package.ml install.ml tests.ml onpm.ml 


all:
	ocamlfind ocamlopt -package str -package unix -package yojson -package oUnit -linkpkg $(SRC)

clean:
	rm -f *.o *.cmi *.cmx
