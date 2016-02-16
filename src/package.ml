(*package.json parser*)

open Yojson.Basic
open Yojson.Basic.Util


type package = 
    {
        name : string;
        deps : (string * string) list;
    }


let parse_name_package json = json |> member "name" |> to_string

let parse_deps_package json = json 
    |> member "dependencies" 
    |> to_assoc
    |> (List.map (fun (x, y) -> (x, (to_string y))))

let parse_package_json package =
    let json = from_file package in
    { name = parse_name_package json;
      deps = [];
    }
