# Belajar Python: fungsi, parameter default, *args, **kwargs

def sapa(nama, salam="Halo"):
    return f"{salam}, {nama}!"


print(sapa("Gusto"))
print(sapa("Budi", salam="Selamat pagi"))


def jumlahkan(*angka):
    """Menerima banyak angka sekaligus."""
    total = 0
    for a in angka:
        total += a
    return total


print("jumlah:", jumlahkan(1, 2, 3, 4))


def profil(**data):
    for kunci, nilai in data.items():
        print(f"  {kunci}: {nilai}")


profil(nama="Gusto", kota="Bandung", hobi="ngoding")

# lambda: fungsi satu baris
kali_dua = lambda x: x * 2
print(list(map(kali_dua, [1, 2, 3])))

# fungsi rekursif
def faktorial(n):
    return 1 if n <= 1 else n * faktorial(n - 1)


print("5! =", faktorial(5))
