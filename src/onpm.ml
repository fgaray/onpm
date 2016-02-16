open Sys
open Common



let () =
    match Arguments.parse_arguments (drop 1 argv) with
    | Arguments.Test         -> Tests.run_tests
    | Arguments.Install opts -> Install.install opts
    | Arguments.Config opts  -> Config.config opts
    | Arguments.Error err    -> print_string err
