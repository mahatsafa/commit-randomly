// csharp notes
using System;
using System.Linq;

class Notes {
    static string Greet(string name) => $"hello {name}";

    static void Main() {
        Console.WriteLine(Greet("practice"));

        int[] nums = {1, 2, 3};
        var doubled = nums.Select(n => n * 2);
        Console.WriteLine(string.Join(",", doubled));
    }
}
// TODO: try LINQ deeper next
