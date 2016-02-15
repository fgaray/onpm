
let print_array a = 
    Array.map (fun x -> print_string (x ^ " ")) a;
    print_string "\n"

let print_list l =
    List.map (fun x -> print_string (x ^ " ")) l;
    print_string "\n"

let drop i xs = Array.sub xs 1 (Array.length xs - 1)

let rec read_all_command channel =
    try
        let str = Pervasives.input_line channel in
        str :: read_all_command channel
    with
        End_of_file -> []
