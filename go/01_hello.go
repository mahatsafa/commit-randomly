// Belajar Go: program pertama
package main

import "fmt"

func main() {
	nama := "Gusto" // deklarasi singkat, tipe ditebak otomatis
	var umur int = 20
	fmt.Println("Halo dari Go!")
	fmt.Printf("%s berumur %d tahun\n", nama, umur)
}
