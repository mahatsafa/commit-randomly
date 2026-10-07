#!/bin/bash
# Belajar Bash: variabel & substitusi perintah

nama="Gusto"            # tanpa spasi di sekitar "="
hari_ini=$(date +%A)
jumlah_file=$(ls | wc -l)

echo "Halo $nama, hari ini $hari_ini"
echo "Ada $jumlah_file file di folder ini"
echo "Panjang nama: ${#nama} huruf"
echo "Kernel: $(uname -r)"
