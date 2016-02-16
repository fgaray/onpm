open Package
open Opam_interface
open Arguments
open Common




let install opts =
    (*parse json*)
    let current_switch = ref "global-js" in
    try
        let package = parse_package_json "package.json" in
        current_switch := package.name
    with
        (* We are going to use the default for js *)
        Sys_error _ -> current_switch := "global-js";

    if not (switch_exists !current_switch) then 
        begin
            print_string ("Creating switch " ^ !current_switch ^ "...\n");
            create_switch !current_switch
        end
    ;


    ignore (run_opam_switch_change !current_switch);
    (* Now we need to check if we have an argument, if the user wants to install
     * a package we only install that, if not, we check the dependencies of the
     * current package.json and try to install them all *)

    match opts.request with
    | None   -> print_string "You need to specify a package to install"
    | Some x -> 
        begin
            print_list (fun x -> x ^ "\n") (run_opam_install_package x);
            print_string "done"
        end
    ;
    
    print_string ("Run now:\neval `onpm config " ^ !current_switch ^ "`\n");
