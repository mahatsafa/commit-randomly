#!/bin/bash
# Latihan Bash: script backup folder dengan rotasi
# Pemakaian: ./05_backup_sederhana.sh <folder_sumber> <folder_tujuan> [jumlah_simpan]

set -euo pipefail   # berhenti kalau ada error / variabel kosong

SUMBER=${1:-}
TUJUAN=${2:-}
SIMPAN=${3:-5}

pakai() {
    echo "Pemakaian: $0 <folder_sumber> <folder_tujuan> [jumlah_simpan]" >&2
    exit 1
}

log() { echo "[$(date '+%H:%M:%S')] $*"; }

[[ -z "$SUMBER" || -z "$TUJUAN" ]] && pakai
[[ -d "$SUMBER" ]] || { echo "folder sumber tidak ada: $SUMBER" >&2; exit 1; }
mkdir -p "$TUJUAN"

nama=$(basename "$SUMBER")
stempel=$(date +%Y%m%d-%H%M%S)
arsip="$TUJUAN/${nama}-${stempel}.tar.gz"

log "membackup $SUMBER -> $arsip"
tar -czf "$arsip" -C "$(dirname "$SUMBER")" "$nama"

ukuran=$(du -h "$arsip" | cut -f1)
log "selesai, ukuran $ukuran"

# cek integritas arsip
if tar -tzf "$arsip" >/dev/null; then
    log "arsip valid"
else
    log "ARSIP RUSAK!"
    exit 1
fi

# rotasi: simpan N backup terbaru saja
mapfile -t semua < <(ls -1t "$TUJUAN"/"${nama}"-*.tar.gz)
if (( ${#semua[@]} > SIMPAN )); then
    for lama in "${semua[@]:SIMPAN}"; do
        log "hapus backup lama: $(basename "$lama")"
        rm -f -- "$lama"
    done
fi

log "total backup tersimpan: $(ls -1 "$TUJUAN"/"${nama}"-*.tar.gz | wc -l)"
