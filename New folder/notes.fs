// fsharp notes
let greet name = sprintf "hello %s" name

[<EntryPoint>]
let main argv =
    printfn "%s" (greet "practice")
    let nums = [1; 2; 3]
    let doubled = nums |> List.map (fun n -> n * 2)
    printfn "%A" doubled
    0
// TODO: try discriminated unions next
