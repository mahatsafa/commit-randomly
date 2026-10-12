// Belajar Go: struct, method, dan interface
package main

import (
	"fmt"
	"math"
)

type Bentuk interface {
	Luas() float64
	Keliling() float64
}

type Persegi struct {
	Sisi float64
}

type Lingkaran struct {
	R float64
}

func (p Persegi) Luas() float64     { return p.Sisi * p.Sisi }
func (p Persegi) Keliling() float64 { return 4 * p.Sisi }

func (l Lingkaran) Luas() float64     { return math.Pi * l.R * l.R }
func (l Lingkaran) Keliling() float64 { return 2 * math.Pi * l.R }

// method dengan pointer receiver bisa mengubah isi struct
type Penghitung struct {
	nilai int
}

func (c *Penghitung) Tambah() { c.nilai++ }

func main() {
	bentuk := []Bentuk{Persegi{4}, Lingkaran{2}, Persegi{1.5}}
	total := 0.0
	for _, b := range bentuk {
		fmt.Printf("%-22T luas=%6.2f keliling=%6.2f\n", b, b.Luas(), b.Keliling())
		total += b.Luas()
	}
	fmt.Printf("total luas: %.2f\n", total)

	c := Penghitung{}
	for i := 0; i < 3; i++ {
		c.Tambah()
	}
	fmt.Println("penghitung:", c.nilai)
}
