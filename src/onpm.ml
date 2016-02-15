open Sys
open Common



let () =
    print_array argv;
    match Arguments.parse_arguments (drop 1 argv) with
    | Arguments.Test         -> Tests.run_tests
    | Arguments.Install opts -> Install.install opts
    | Arguments.Error err    -> print_string err
