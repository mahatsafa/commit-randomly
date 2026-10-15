// Belajar Go: penanganan error (tanpa try/catch)
package main

import (
	"errors"
	"fmt"
	"strconv"
)

var ErrNegatif = errors.New("angka tidak boleh negatif")

func akar(n int) (int, error) {
	if n < 0 {
		return 0, ErrNegatif
	}
	i := 0
	for (i+1)*(i+1) <= n {
		i++
	}
	return i, nil
}

func main() {
	for _, teks := range []string{"16", "20", "-4", "abc"} {
		n, err := strconv.Atoi(teks)
		if err != nil {
			fmt.Printf("%q bukan angka: %v\n", teks, err)
			continue
		}
		hasil, err := akar(n)
		if errors.Is(err, ErrNegatif) {
			fmt.Println(n, "->", err)
			continue
		}
		fmt.Printf("akar bulat %d = %d\n", n, hasil)
	}
}
