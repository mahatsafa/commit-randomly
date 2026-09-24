// vlang notes
fn greet(name string) string {
    return 'hello $name'
}

fn main() {
    println(greet('practice'))

    nums := [1, 2, 3]
    for n in nums {
        println(n * 2)
    }
}
// TODO: try structs next
