# Belajar Python: list, tuple, set, dict

# ---- list ----
angka = [5, 3, 8, 1]
angka.append(10)
angka.insert(0, 7)
angka.remove(3)
print("list:", angka)
print("urut:", sorted(angka))
print("slice 1..3:", angka[1:3])
print("terbalik:", angka[::-1])

# ---- tuple (tidak bisa diubah) ----
koordinat = (-6.9, 107.6)
lat, lon = koordinat
print("lat", lat, "lon", lon)

# ---- set (tanpa duplikat) ----
bahasa = {"python", "go", "python", "rust"}
print("set:", bahasa)
print("irisan:", bahasa & {"go", "java"})

# ---- dict ----
mahasiswa = {"nama": "Gusto", "nim": "123", "ipk": 3.6}
mahasiswa["semester"] = 5
print(mahasiswa.get("nama"))
print(mahasiswa.get("alamat", "belum diisi"))

for k, v in mahasiswa.items():
    print(f"{k:>9} = {v}")

# dict comprehension
panjang_kata = {kata: len(kata) for kata in ["server", "cron", "docker"]}
print(panjang_kata)

# nested: list berisi dict
nilai = [
    {"mapel": "Matematika", "skor": 88},
    {"mapel": "Fisika", "skor": 75},
    {"mapel": "Kimia", "skor": 92},
]
terbaik = max(nilai, key=lambda n: n["skor"])
rata2 = sum(n["skor"] for n in nilai) / len(nilai)
print("terbaik:", terbaik["mapel"], "| rata-rata:", round(rata2, 2))
