#!/bin/bash
# Latihan Bash: laporan kesehatan server sederhana
# Contoh pemakaian:  ./04_cek_disk.sh 80   (batas peringatan disk 80%)

BATAS=${1:-85}
merah=$'\e[31m'; hijau=$'\e[32m'; kuning=$'\e[33m'; reset=$'\e[0m'

judul() { printf '\n== %s ==\n' "$1"; }

judul "Disk (batas ${BATAS}%)"
df -hP -x tmpfs -x devtmpfs | tail -n +2 | while read -r fs size used avail pakai mount; do
    persen=${pakai%\%}
    if (( persen >= BATAS )); then
        warna=$merah
    elif (( persen >= BATAS - 15 )); then
        warna=$kuning
    else
        warna=$hijau
    fi
    printf '%s%-20s %5s dipakai dari %5s (%s)%s\n' "$warna" "$mount" "$used" "$size" "$pakai" "$reset"
done

judul "Memori"
free -h | awk 'NR==2 {printf "RAM  : %s dari %s (tersedia %s)\n", $3, $2, $7}'
free -h | awk 'NR==3 {printf "Swap : %s dari %s\n", $3, $2}'

judul "Beban CPU"
read -r l1 l5 l15 _ < /proc/loadavg
echo "load 1/5/15 menit: $l1 / $l5 / $l15 (core: $(nproc))"

judul "5 proses paling boros RAM"
ps -eo rss,comm --sort=-rss | head -6 | tail -5 | awk '{printf "%6.0f MB  %s\n", $1/1024, $2}'

judul "Uptime"
uptime -p
