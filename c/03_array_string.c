/* Belajar C: array & string (string = array of char diakhiri '\0') */
#include <stdio.h>
#include <string.h>
#include <ctype.h>

#define N 6

void cetak_array(const int *a, int n) {
    for (int i = 0; i < n; i++)
        printf("%d%s", a[i], i < n - 1 ? ", " : "\n");
}

/* bubble sort sederhana */
void urutkan(int *a, int n) {
    for (int i = 0; i < n - 1; i++)
        for (int j = 0; j < n - 1 - i; j++)
            if (a[j] > a[j + 1]) {
                int t = a[j]; a[j] = a[j + 1]; a[j + 1] = t;
            }
}

void huruf_besar(char *s) {
    for (; *s; s++)
        *s = (char)toupper((unsigned char)*s);
}

int main(void) {
    int nilai[N] = {42, 7, 19, 88, 3, 56};
    printf("awal : "); cetak_array(nilai, N);
    urutkan(nilai, N);
    printf("urut : "); cetak_array(nilai, N);

    int total = 0;
    for (int i = 0; i < N; i++) total += nilai[i];
    printf("rata-rata: %.2f\n", (double)total / N);

    char salam[32] = "halo";
    strcat(salam, " server");           /* sambung string */
    printf("'%s' panjangnya %zu\n", salam, strlen(salam));
    huruf_besar(salam);
    printf("kapital: %s\n", salam);

    printf("strcmp(\"abc\",\"abd\") = %d\n", strcmp("abc", "abd") < 0 ? -1 : 1);
    return 0;
}
