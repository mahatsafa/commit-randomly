// Belajar Go: web server sederhana dengan net/http
// Jalankan: go run 06_http_server.go  lalu buka http://localhost:8080
package main

import (
	"encoding/json"
	"log"
	"net/http"
	"sync"
	"time"
)

type Catatan struct {
	ID     int       `json:"id"`
	Isi    string    `json:"isi"`
	Dibuat time.Time `json:"dibuat"`
}

type Toko struct {
	mu     sync.Mutex
	data   []Catatan
	idBaru int
}

func (t *Toko) handleCatatan(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Content-Type", "application/json")

	switch r.Method {
	case http.MethodGet:
		t.mu.Lock()
		defer t.mu.Unlock()
		json.NewEncoder(w).Encode(t.data)

	case http.MethodPost:
		var input struct {
			Isi string `json:"isi"`
		}
		if err := json.NewDecoder(r.Body).Decode(&input); err != nil || input.Isi == "" {
			http.Error(w, `{"error":"isi wajib diisi"}`, http.StatusBadRequest)
			return
		}
		t.mu.Lock()
		t.idBaru++
		c := Catatan{ID: t.idBaru, Isi: input.Isi, Dibuat: time.Now()}
		t.data = append(t.data, c)
		t.mu.Unlock()
		w.WriteHeader(http.StatusCreated)
		json.NewEncoder(w).Encode(c)

	default:
		http.Error(w, `{"error":"method tidak didukung"}`, http.StatusMethodNotAllowed)
	}
}

func main() {
	toko := &Toko{}
	mux := http.NewServeMux()
	mux.HandleFunc("/catatan", toko.handleCatatan)
	mux.HandleFunc("/health", func(w http.ResponseWriter, r *http.Request) {
		w.Write([]byte("ok"))
	})

	log.Println("server jalan di :8080")
	// coba: curl -X POST -d '{"isi":"belajar go"}' localhost:8080/catatan
	log.Fatal(http.ListenAndServe(":8080", mux))
}
