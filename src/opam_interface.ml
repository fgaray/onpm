open Unix
open Common


type switch_list =
    {
        name : string;
        state : string;
        origin : string; 
    }

let switch_list_to_string sl = "{ name = " ^ sl.name ^ "; origin = '" ^ sl.origin ^ "'; state = " ^ sl.state ^ "}"


let run_opam_switch_list = 
    let process = open_process_in "opam switch list" in
    read_all_command process


let parse_output_switch_list xs =
    let parse_line item = 
        let name = take_while_string (neq ' ') item in
        let name_droped = drop_while_string (neq ' ') item in
        let space_droped = drop_while_string (eq ' ') name_droped in
        let state = take_while_string (neq ' ' ) space_droped in
        let state_droped = drop_while_string (neq ' ') space_droped in
        let space_droped = drop_while_string (eq ' ') state_droped in
        let origin = take_while_string (neq ' ' ) space_droped in
        { name = name;
          state = state;
          origin = origin;
        }
    in
    List.map parse_line xs


let switch_exists switch =
    let result = run_opam_switch_list in
    let parsed = parse_output_switch_list result in
    let named = List.filter (fun x -> x.origin = "node_modules") parsed in
    print_list switch_list_to_string named;
    ()
