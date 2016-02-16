
let print_array a = 
    ignore (Array.map (fun x -> print_string (x ^ " ")) a);
    print_string "\n"

let print_list fn l =
    ignore (List.map (fun x -> print_string ((fn x) ^ "; ")) l);
    print_string "\n"

let drop i xs = Array.sub xs 1 (Array.length xs - 1)


let rec read_all_command channel =
    try
        let str = Pervasives.input_line channel in
        str :: read_all_command channel
    with
        End_of_file -> []


let rec drop_while fn l =
    match l with
    | x :: xs -> if fn x 
                    then drop_while fn xs
                    else xs
    | []      -> []


let rec take_while fn l =
    match l with
    | x :: xs -> if fn x 
                    then x :: take_while fn xs
                    else []
    | []      -> []

let rec take_while_string fn s =
    let chr = String.get s 0 in
    if fn chr
        then String.make 1 chr ^ take_while_string fn (String.sub s 1 (String.length s - 1))
        else ""

let rec drop_while_string fn s =
    let chr = String.get s 0 in
    if fn chr
        then drop_while_string fn (String.sub s 1 (String.length s - 1))
        else s


let eq x y = x = y

let neq x y = x <> y


let id x = x


let exists fu l = 
    try
        ignore (List.find fu l);
        true
    with
        Not_found -> false


let fst (x, y) = x
let snd (x, y) = y
