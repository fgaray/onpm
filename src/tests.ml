open OUnit2
open Yojson.Basic


let json_test = "
{
  \"name\": \"browserify\",
  \"version\": \"13.0.0\",
  \"description\": \"browser-side require() the node way\",
  \"main\": \"index.js\",
  \"bin\": {
    \"browserify\": \"bin/cmd.js\"
  },
  \"repository\": {
    \"type\": \"git\",
    \"url\": \"http://github.com/substack/node-browserify.git\"
  },
  \"keywords\": [
    \"browser\",
    \"require\",
    \"commonjs\",
    \"commonj-esque\",
    \"bundle\",
    \"npm\",
    \"javascript\"
  ],
  \"dependencies\": {
    \"JSONStream\": \"^1.0.3\",
    \"assert\": \"~1.3.0\",
    \"browser-pack\": \"^6.0.1\",
    \"browser-resolve\": \"^1.11.0\",
    \"browserify-zlib\": \"~0.1.2\",
    \"buffer\": \"^4.1.0\",
    \"concat-stream\": \"~1.5.1\",
    \"console-browserify\": \"^1.1.0\",
    \"constants-browserify\": \"~1.0.0\",
    \"crypto-browserify\": \"^3.0.0\",
    \"defined\": \"^1.0.0\",
    \"deps-sort\": \"^2.0.0\",
    \"domain-browser\": \"~1.1.0\",
    \"duplexer2\": \"~0.1.2\",
    \"events\": \"~1.1.0\",
    \"glob\": \"^5.0.15\",
    \"has\": \"^1.0.0\",
    \"htmlescape\": \"^1.1.0\",
    \"stream-http\": \"^2.0.0\",
    \"https-browserify\": \"~0.0.0\",
    \"inherits\": \"~2.0.1\",
    \"insert-module-globals\": \"^7.0.0\",
    \"isarray\": \"0.0.1\",
    \"labeled-stream-splicer\": \"^2.0.0\",
    \"module-deps\": \"^4.0.2\",
    \"os-browserify\": \"~0.1.1\",
    \"parents\": \"^1.0.1\",
    \"path-browserify\": \"~0.0.0\",
    \"process\": \"~0.11.0\",
    \"punycode\": \"^1.3.2\",
    \"querystring-es3\": \"~0.2.0\",
    \"read-only-stream\": \"^2.0.0\",
    \"readable-stream\": \"^2.0.2\",
    \"resolve\": \"^1.1.4\",
    \"shasum\": \"^1.0.0\",
    \"shell-quote\": \"^1.4.3\",
    \"stream-browserify\": \"^2.0.0\",
    \"string_decoder\": \"~0.10.0\",
    \"subarg\": \"^1.0.0\",
    \"syntax-error\": \"^1.1.1\",
    \"through2\": \"^2.0.0\",
    \"timers-browserify\": \"^1.0.1\",
    \"tty-browserify\": \"~0.0.0\",
    \"url\": \"~0.11.0\",
    \"util\": \"~0.10.1\",
    \"vm-browserify\": \"~0.0.1\",
    \"xtend\": \"^4.0.0\"
  },
  \"devDependencies\": {
    \"backbone\": \"~0.9.2\",
    \"browser-unpack\": \"^1.1.1\",
    \"coffee-script\": \"~1.10.0\",
    \"coffeeify\": \"~1.1.0\",
    \"es6ify\": \"~0.4.8\",
    \"isstream\": \"^0.1.2\",
    \"seq\": \"0.3.5\",
    \"tap\": \"^2.2.0\",
    \"temp\": \"^0.8.1\",
    \"through\": \"^2.3.4\"
  },
  \"author\": {
    \"name\": \"James Halliday\",
    \"email\": \"mail@substack.net\",
    \"url\": \"http://substack.net\"
  },
  \"scripts\": {
    \"test\": \"tap test/*.js\"
  },
  \"license\": \"MIT\"
}
"


let test_json_name test_ctxt = 
    assert_equal
        (Package.parse_name_package (from_string json_test)) 
        "browserify"

let test_parse_install test_ctxt = 
    assert_equal
        (Arguments.parse_arguments [|"install";|])
        (Arguments.Install Arguments.default_install_opts)

let suite = 
    "suite" >:::
        [ "we can find the name of the package" >:: test_json_name;
          "correct parse of the install command" >:: test_parse_install;
        ]

(*let run_tests = run_test_tt_main suite*)
let run_tests = ()
