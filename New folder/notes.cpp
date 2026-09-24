// cpp notes
#include <iostream>
#include <vector>

std::string greet(std::string name) {
    return "hello " + name;
}

int main() {
    std::cout << greet("practice") << std::endl;

    std::vector<int> nums = {1, 2, 3};
    for (int n : nums) {
        std::cout << n * 2 << std::endl;
    }
    return 0;
}
// TODO: try templates next
