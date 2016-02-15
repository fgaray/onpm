(*package.json parser*)

open Yojson.Basic
open Yojson.Basic.Util

type package = 
    {
        name : string;
    }


let parse_name_package json = json |> member "name" |> to_string

let parse_package_json package =
    let json = from_file package in
    { name = parse_name_package json
    }
