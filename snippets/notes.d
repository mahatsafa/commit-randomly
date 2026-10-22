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
// d notes - 2026-10-13 18:55:33
// import std.stdio;
// d notes - 2026-10-14 13:07:32
// import std.stdio;
// d notes - 2026-10-22 09:44:09
// import std.stdio;
