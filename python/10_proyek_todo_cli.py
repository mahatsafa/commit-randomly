# Proyek kecil: aplikasi to-do di terminal (simpan ke JSON)
# Cara pakai:
#   python 10_proyek_todo_cli.py tambah "belajar docker"
#   python 10_proyek_todo_cli.py daftar
#   python 10_proyek_todo_cli.py selesai 1
#   python 10_proyek_todo_cli.py hapus 1

import json
import sys
from datetime import datetime
from pathlib import Path

FILE = Path.home() / ".todo_belajar.json"


def muat() -> list:
    if FILE.exists():
        return json.loads(FILE.read_text(encoding="utf-8"))
    return []


def simpan(todo: list) -> None:
    FILE.write_text(json.dumps(todo, indent=2, ensure_ascii=False), encoding="utf-8")


def tambah(todo: list, judul: str) -> None:
    todo.append({
        "judul": judul,
        "selesai": False,
        "dibuat": datetime.now().strftime("%Y-%m-%d %H:%M"),
    })
    print(f"ditambahkan: {judul}")


def daftar(todo: list) -> None:
    if not todo:
        print("(belum ada tugas)")
        return
    for i, t in enumerate(todo, start=1):
        tanda = "x" if t["selesai"] else " "
        print(f"{i:>2}. [{tanda}] {t['judul']}  ({t['dibuat']})")
    sisa = sum(not t["selesai"] for t in todo)
    print(f"-- {sisa} tugas belum selesai")


def ambil_index(todo: list, arg: str) -> int:
    idx = int(arg) - 1
    if not 0 <= idx < len(todo):
        raise IndexError(f"tidak ada tugas nomor {arg}")
    return idx


def main(argv: list) -> int:
    if len(argv) < 2:
        print(__doc__ or "perintah: tambah | daftar | selesai N | hapus N")
        return 1

    todo = muat()
    perintah = argv[1]
    try:
        if perintah == "tambah" and len(argv) >= 3:
            tambah(todo, " ".join(argv[2:]))
        elif perintah == "daftar":
            daftar(todo)
        elif perintah == "selesai" and len(argv) == 3:
            todo[ambil_index(todo, argv[2])]["selesai"] = True
            print("ditandai selesai")
        elif perintah == "hapus" and len(argv) == 3:
            dihapus = todo.pop(ambil_index(todo, argv[2]))
            print(f"dihapus: {dihapus['judul']}")
        else:
            print("perintah tidak dikenal")
            return 1
    except (ValueError, IndexError) as e:
        print("error:", e)
        return 1

    simpan(todo)
    return 0


if __name__ == "__main__":
    sys.exit(main(sys.argv))
