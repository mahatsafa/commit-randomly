// Belajar Go: goroutine, channel, dan WaitGroup
package main

import (
	"fmt"
	"sync"
	"time"
)

// worker mengambil tugas dari channel jobs, kirim hasil ke results
func worker(id int, jobs <-chan int, results chan<- string, wg *sync.WaitGroup) {
	defer wg.Done()
	for j := range jobs {
		time.Sleep(100 * time.Millisecond) // pura-pura kerja berat
		results <- fmt.Sprintf("worker %d selesai tugas %d (hasil %d)", id, j, j*j)
	}
}

func main() {
	jobs := make(chan int, 10)
	results := make(chan string, 10)
	var wg sync.WaitGroup

	mulai := time.Now()

	// 3 worker jalan bersamaan
	for w := 1; w <= 3; w++ {
		wg.Add(1)
		go worker(w, jobs, results, &wg)
	}

	for j := 1; j <= 9; j++ {
		jobs <- j
	}
	close(jobs)

	// tutup results setelah semua worker selesai
	go func() {
		wg.Wait()
		close(results)
	}()

	for r := range results {
		fmt.Println(r)
	}

	// 9 tugas x 100ms, tapi dibagi 3 worker -> sekitar 300ms
	fmt.Println("waktu total:", time.Since(mulai).Round(time.Millisecond))
}
