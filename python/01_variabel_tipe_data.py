# Belajar Python: variabel & tipe data dasar

nama = "Gusto"          # str
umur = 20               # int
tinggi = 170.5          # float
mahasiswa = True        # bool

print(type(nama), type(umur), type(tinggi), type(mahasiswa))

# konversi tipe
umur_str = str(umur)
angka = int("42") + 8
print("umur sebagai teks:", umur_str + " tahun")
print("hasil konversi:", angka)

# f-string buat format output
print(f"{nama} umurnya {umur}, tinggi {tinggi:.1f} cm")
