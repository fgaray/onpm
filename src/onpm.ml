open Unix


let rec read_all_command channel =
    try
        let str = Pervasives.input_line channel in
        str ^ "\n" ^ read_all_command channel
    with
        End_of_file -> ""
;;


let () =
    let test_ls = open_process_in "ls" in
    print_string (read_all_command test_ls)
;;

