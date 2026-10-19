# Belajar Python: manipulasi string

kalimat = "  Belajar Python di Server Rumah  "

print(kalimat.strip())
print(kalimat.lower())
print(kalimat.upper())
print(kalimat.replace("Python", "Go"))
print(kalimat.strip().split(" "))

kata = ["satu", "dua", "tiga"]
print(" - ".join(kata))

email = "user@gmail.com"
print("valid?", "@" in email and email.endswith(".com"))
print("username:", email.split("@")[0])

# cek palindrom
def palindrom(teks: str) -> bool:
    bersih = "".join(c.lower() for c in teks if c.isalnum())
    return bersih == bersih[::-1]


for t in ["Kasur ini rusak", "katak", "python"]:
    print(f"{t!r} palindrom? {palindrom(t)}")

# hitung huruf vokal
vokal = sum(1 for c in "pemrograman" if c in "aiueo")
print("jumlah vokal:", vokal)
