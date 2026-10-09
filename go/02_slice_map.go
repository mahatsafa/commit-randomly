// Belajar Go: array, slice, dan map
package main

import (
	"fmt"
	"sort"
)

func main() {
	// array: ukuran tetap
	hari := [3]string{"Senin", "Selasa", "Rabu"}
	fmt.Println(hari, len(hari))

	// slice: ukuran dinamis
	angka := []int{5, 2, 9}
	angka = append(angka, 1, 7)
	sort.Ints(angka)
	fmt.Println("slice:", angka, "len", len(angka), "cap", cap(angka))
	fmt.Println("potongan [1:3]:", angka[1:3])

	// map: pasangan key-value
	port := map[string]int{
		"ssh":   22,
		"http":  80,
		"mysql": 3306,
	}
	port["netdata"] = 19999
	delete(port, "mysql")

	if p, ada := port["http"]; ada {
		fmt.Println("http di port", p)
	}

	// urutan map acak, jadi urutkan key dulu
	keys := make([]string, 0, len(port))
	for k := range port {
		keys = append(keys, k)
	}
	sort.Strings(keys)
	for _, k := range keys {
		fmt.Printf("%-8s %d\n", k, port[k])
	}
}
