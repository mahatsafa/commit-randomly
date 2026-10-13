#!/bin/bash
# Belajar Bash: fungsi, argumen, return value

sapa() {
    local nama="${1:-teman}"   # argumen pertama, default "teman"
    echo "Halo, $nama!"
}

# "return" di bash hanya untuk kode status (0 = sukses)
ada_perintah() {
    command -v "$1" >/dev/null 2>&1
}

# mengembalikan nilai lewat echo
kuadrat() {
    echo $(( $1 * $1 ))
}

sapa
sapa "Gusto"

for p in git docker python3 perintah_ngawur; do
    if ada_perintah "$p"; then
        echo "✓ $p terpasang"
    else
        echo "✗ $p tidak ada"
    fi
done

hasil=$(kuadrat 12)
echo "12 kuadrat = $hasil"
