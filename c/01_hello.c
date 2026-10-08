/* Belajar C: program pertama */
#include <stdio.h>

int main(void) {
    char nama[] = "Gusto";
    int umur = 20;
    printf("Halo dari C, %s! Umur %d tahun.\n", nama, umur);
    printf("ukuran int di mesin ini: %zu byte\n", sizeof(int));
    return 0;
}
