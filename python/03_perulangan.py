# Belajar Python: for & while

# for dengan range
for i in range(1, 6):
    print("perulangan ke-", i)

# for di list + enumerate
buah = ["apel", "jeruk", "mangga"]
for idx, b in enumerate(buah, start=1):
    print(idx, b)

# while: hitung mundur
n = 5
while n > 0:
    print("mundur", n)
    n -= 1

# break & continue
for angka in range(1, 20):
    if angka % 2 == 0:
        continue        # lewati angka genap
    if angka > 11:
        break           # berhenti kalau lewat 11
    print("ganjil:", angka)

# list comprehension (versi singkat loop)
kuadrat = [x * x for x in range(1, 6)]
print("kuadrat:", kuadrat)
