open Opam_interface
open Common


let build_path name = 
    let home = Sys.getenv "HOME" in
    home ^ "/.opam/" ^ name ^ "/lib/"



let config name =
    print_list (fun x -> x ^ "\n") run_opam_config_env;
    print_string ("NODE_PATH=" ^ build_path name)
