
type install_opts = unit


type commands =
    | Install of install_opts
    | Test
    | Error of string


let default_install_opts = ()

let parse_arguments arguments =
    match arguments with
    | [| "install"; xs |] -> Install default_install_opts
    | [| "install"; |]    -> Install default_install_opts
    | [| "test"; |]       -> Test
    | _                   -> Error "Command not valid"
