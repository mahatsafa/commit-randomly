#!/bin/bash
# Belajar Bash: if, for, while, case

angka=7
if (( angka % 2 == 0 )); then
    echo "$angka genap"
else
    echo "$angka ganjil"
fi

# cek file / folder
if [[ -d /etc ]]; then
    echo "/etc adalah folder"
fi

# for di daftar
for layanan in nginx docker cron; do
    if systemctl is-active --quiet "$layanan" 2>/dev/null; then
        echo "$layanan: jalan"
    else
        echo "$layanan: tidak jalan / tidak ada"
    fi
done

# for gaya C
for ((i = 1; i <= 3; i++)); do
    echo "putaran $i"
done

# while baca file baris per baris
while IFS=: read -r user _ uid _; do
    (( uid >= 1000 && uid < 65000 )) && echo "user biasa: $user"
done < /etc/passwd

# case
hari=$(date +%u)
case $hari in
    6|7) echo "akhir pekan" ;;
    *)   echo "hari kerja" ;;
esac
