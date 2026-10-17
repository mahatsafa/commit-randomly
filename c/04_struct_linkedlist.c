/* Belajar C: struct, malloc/free, dan linked list */
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef struct Node {
    char tugas[64];
    int prioritas;
    struct Node *next;
} Node;

/* buat node baru di heap */
Node *node_baru(const char *tugas, int prioritas) {
    Node *n = malloc(sizeof(Node));
    if (!n) {
        perror("malloc");
        exit(1);
    }
    strncpy(n->tugas, tugas, sizeof(n->tugas) - 1);
    n->tugas[sizeof(n->tugas) - 1] = '\0';
    n->prioritas = prioritas;
    n->next = NULL;
    return n;
}

/* sisipkan terurut berdasarkan prioritas (kecil = penting) */
void sisipkan(Node **kepala, Node *baru) {
    while (*kepala && (*kepala)->prioritas <= baru->prioritas)
        kepala = &(*kepala)->next;
    baru->next = *kepala;
    *kepala = baru;
}

int hapus(Node **kepala, const char *tugas) {
    for (; *kepala; kepala = &(*kepala)->next) {
        if (strcmp((*kepala)->tugas, tugas) == 0) {
            Node *buang = *kepala;
            *kepala = buang->next;
            free(buang);
            return 1;
        }
    }
    return 0;
}

void cetak(const Node *n) {
    int i = 1;
    for (; n; n = n->next)
        printf("  %d. [P%d] %s\n", i++, n->prioritas, n->tugas);
}

void bebaskan(Node *n) {
    while (n) {
        Node *berikut = n->next;
        free(n);
        n = berikut;
    }
}

int main(void) {
    Node *daftar = NULL;
    sisipkan(&daftar, node_baru("update server", 2));
    sisipkan(&daftar, node_baru("backup database", 1));
    sisipkan(&daftar, node_baru("bersihkan log", 3));
    sisipkan(&daftar, node_baru("cek SMART disk", 1));

    puts("daftar tugas:");
    cetak(daftar);

    printf("hapus 'bersihkan log': %s\n", hapus(&daftar, "bersihkan log") ? "ok" : "tidak ada");
    printf("hapus 'main game'   : %s\n", hapus(&daftar, "main game") ? "ok" : "tidak ada");

    puts("setelah dihapus:");
    cetak(daftar);

    bebaskan(daftar);   /* jangan lupa: setiap malloc harus di-free */
    return 0;
}
