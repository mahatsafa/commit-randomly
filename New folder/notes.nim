# nim notes
proc greet(name: string): string =
    return "hello " & name

echo greet("practice")

let nums = @[1, 2, 3]
let doubled = nums.map(proc(n: int): int = n * 2)
echo doubled

# TODO: try macros next
