# Belajar Python: OOP - class, inheritance, property

class Akun:
    jumlah_akun = 0  # atribut milik class, dipakai bersama

    def __init__(self, pemilik: str, saldo: float = 0):
        self.pemilik = pemilik
        self._saldo = saldo          # "_" = tanda atribut internal
        Akun.jumlah_akun += 1

    @property
    def saldo(self):
        return self._saldo

    def setor(self, jumlah: float):
        if jumlah <= 0:
            raise ValueError("jumlah setor harus positif")
        self._saldo += jumlah

    def tarik(self, jumlah: float):
        if jumlah > self._saldo:
            raise ValueError("saldo tidak cukup")
        self._saldo -= jumlah

    def __str__(self):
        return f"Akun({self.pemilik}, saldo={self._saldo:,.0f})"


class Tabungan(Akun):
    """Turunan Akun yang punya bunga."""

    def __init__(self, pemilik, saldo=0, bunga=0.02):
        super().__init__(pemilik, saldo)
        self.bunga = bunga

    def tambah_bunga(self):
        self._saldo += self._saldo * self.bunga

    def __str__(self):
        return f"Tabungan({self.pemilik}, saldo={self._saldo:,.0f}, bunga={self.bunga:.0%})"


a = Akun("Gusto", 100_000)
a.setor(50_000)
a.tarik(30_000)
print(a)

t = Tabungan("Budi", 1_000_000, bunga=0.05)
t.tambah_bunga()
print(t)

try:
    a.tarik(10_000_000)
except ValueError as e:
    print("gagal tarik:", e)

print("total akun dibuat:", Akun.jumlah_akun)
print("Tabungan turunan Akun?", isinstance(t, Akun))

# polimorfisme: method yang sama, perilaku beda
for akun in [a, t]:
    print(str(akun))
