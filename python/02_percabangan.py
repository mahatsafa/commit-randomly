# Belajar Python: if / elif / else

def nilai_huruf(skor: int) -> str:
    if skor >= 85:
        return "A"
    elif skor >= 70:
        return "B"
    elif skor >= 55:
        return "C"
    elif skor >= 40:
        return "D"
    return "E"


for skor in [92, 78, 60, 45, 10]:
    print(skor, "->", nilai_huruf(skor))

# operator ternary
suhu = 31
status = "panas" if suhu > 30 else "normal"
print("cuaca:", status)

# cek beberapa kondisi sekaligus
umur, punya_ktp = 19, True
if umur >= 17 and punya_ktp:
    print("boleh bikin SIM")
