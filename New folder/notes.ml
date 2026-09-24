(* ocaml notes *)
let greet name = "hello " ^ name

let () =
  print_endline (greet "practice");
  let nums = [1; 2; 3] in
  let doubled = List.map (fun n -> n * 2) nums in
  List.iter (fun n -> print_int n; print_newline ()) doubled

(* TODO: try pattern matching next *)
