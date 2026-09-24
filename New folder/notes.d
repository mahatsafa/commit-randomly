// d notes
import std.stdio;
import std.algorithm;

string greet(string name) {
    return "hello " ~ name;
}

void main() {
    writeln(greet("practice"));

    int[] nums = [1, 2, 3];
    auto doubled = nums.map!(n => n * 2);
    writeln(doubled);
}
// TODO: try templates next
