// scala notes
object Notes {
  def greet(name: String): String = s"hello $name"

  def main(args: Array[String]): Unit = {
    println(greet("practice"))

    val nums = List(1, 2, 3)
    val doubled = nums.map(_ * 2)
    println(doubled)
  }
}
// TODO: try pattern matching next
