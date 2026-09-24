// dart notes
String greet(String name) => "hello $name";

void main() {
  print(greet("practice"));

  var nums = [1, 2, 3];
  var doubled = nums.map((n) => n * 2).toList();
  print(doubled);
}
// TODO: try async streams next
