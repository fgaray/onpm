open Unix
open Common


type switch_list =
    {
        name : string;
        origin : string; 
    }


let run_opam_switch_list = 
    let process = open_process_in "opam switch list" in
    read_all_command process


let parse_output_switch_list xs =
    let parse_line item = Str.split (Str.regexp " ") item in
    List.map parse_line xs


let switch_exists switch =
    let result = run_opam_switch_list in
    print_list result;
    List.map print_list (parse_output_switch_list result);
    ()
