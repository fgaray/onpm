open Package
open Opam_interface

let install opts =
    (*parse json*)
    let package = parse_package_json "package.json" in
    (*Check if there is already a switch with the name of the proyect*)
    switch_exists package.name
