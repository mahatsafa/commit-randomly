// kotlin notes
fun greet(name: String): String {
    return "hello $name"
}

fun main() {
    println(greet("practice"))

    val nums = listOf(1, 2, 3)
    val doubled = nums.map { it * 2 }
    println(doubled)
}
// TODO: try coroutines next
