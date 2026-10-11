/* Belajar C: pointer (alamat memori) */
#include <stdio.h>

/* tanpa pointer, fungsi hanya dapat salinan nilai */
void tukar_salah(int a, int b) {
    int t = a; a = b; b = t;
}

/* dengan pointer, fungsi bisa mengubah variabel aslinya */
void tukar(int *a, int *b) {
    int t = *a;
    *a = *b;
    *b = t;
}

int main(void) {
    int x = 10;
    int *p = &x;          /* p menyimpan alamat x */

    printf("nilai x      : %d\n", x);
    printf("alamat x     : %p\n", (void *)&x);
    printf("isi p        : %p\n", (void *)p);
    printf("nilai via *p : %d\n", *p);

    *p = 25;              /* ubah x lewat pointer */
    printf("x sekarang   : %d\n", x);

    int a = 1, b = 2;
    tukar_salah(a, b);
    printf("tukar_salah  : a=%d b=%d\n", a, b);
    tukar(&a, &b);
    printf("tukar        : a=%d b=%d\n", a, b);

    /* pointer & array */
    int arr[] = {3, 6, 9};
    for (int i = 0; i < 3; i++)
        printf("arr[%d] = %d = *(arr+%d) = %d\n", i, arr[i], i, *(arr + i));
    return 0;
}
