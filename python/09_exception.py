# Belajar Python: menangani error dengan try/except

def bagi(a, b):
    try:
        hasil = a / b
    except ZeroDivisionError:
        print("tidak bisa dibagi nol")
        return None
    except TypeError as e:
        print("tipe salah:", e)
        return None
    else:
        return hasil            # jalan kalau tidak ada error
    finally:
        print(f"selesai cek {a} / {b}")   # selalu jalan


print(bagi(10, 2))
print(bagi(1, 0))
print(bagi("10", 2))


# bikin exception sendiri
class UmurTidakValid(Exception):
    pass


def set_umur(umur):
    if not 0 < umur < 130:
        raise UmurTidakValid(f"umur {umur} tidak masuk akal")
    return umur


for u in [25, -3]:
    try:
        print("umur ok:", set_umur(u))
    except UmurTidakValid as e:
        print("error:", e)
