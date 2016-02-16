
type install_opts = {
    request : string option;
}


type commands =
    | Install of install_opts
    | Test
    | Config of string
    | Error of string


let default_install_opts = {
    request = None;
}


exception Argument_not_valid

let parse_opts ls =
    match ls with
    | x :: [] -> { request = Some x }
    | _       -> raise Argument_not_valid

let parse_arguments arguments =
    match Array.to_list arguments with
    | "install" :: []       -> Install default_install_opts
    | "install" :: xs       -> Install (parse_opts xs)
    | "test" :: _           -> Test
    | "config" :: x :: _    -> Config x
    | _                     -> Error "Command not valid"
