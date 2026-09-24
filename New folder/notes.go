// go notes
package main

import "fmt"

func greet(name string) string {
	return "hello " + name
}

func main() {
	fmt.Println(greet("practice"))

	nums := []int{1, 2, 3}
	for _, n := range nums {
		fmt.Println(n * 2)
	}
}

// TODO: try goroutines next
