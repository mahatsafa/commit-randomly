# Belajar Python: baca & tulis file

from pathlib import Path

catatan = Path("catatan_belajar.txt")

# tulis (mode "w" menimpa isi lama)
with catatan.open("w", encoding="utf-8") as f:
    f.write("Hari 1: variabel\n")
    f.write("Hari 2: perulangan\n")

# tambah di akhir file (mode "a")
with catatan.open("a", encoding="utf-8") as f:
    f.write("Hari 3: file I/O\n")

# baca per baris
with catatan.open(encoding="utf-8") as f:
    for nomor, baris in enumerate(f, start=1):
        print(nomor, baris.strip())

# baca sekaligus
isi = catatan.read_text(encoding="utf-8")
print("jumlah baris:", len(isi.splitlines()))

# file CSV sederhana
import csv

with open("nilai.csv", "w", newline="") as f:
    tulis = csv.writer(f)
    tulis.writerow(["nama", "skor"])
    tulis.writerows([["Gusto", 90], ["Budi", 78]])

with open("nilai.csv") as f:
    for row in csv.DictReader(f):
        print(row["nama"], "->", row["skor"])

# bersihkan file latihan
catatan.unlink()
Path("nilai.csv").unlink()
