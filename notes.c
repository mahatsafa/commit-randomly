// c notes
#include <stdio.h>

void greet(char *name) {
    printf("hello %s\n", name);
}

int main() {
    greet("practice");

    int nums[3] = {1, 2, 3};
    for (int i = 0; i < 3; i++) {
        printf("%d\n", nums[i] * 2);
    }
    return 0;
}
// TODO: try pointers deeper next
