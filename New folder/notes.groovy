// groovy notes
def greet(name) {
    return "hello ${name}"
}

println greet("practice")

def nums = [1, 2, 3]
def doubled = nums.collect { it * 2 }
println doubled

// TODO: try closures next
