// Belajar TypeScript: union type & type narrowing

type Hasil =
  | { ok: true; data: string[] }
  | { ok: false; error: string };

function prosesHasil(h: Hasil): void {
  if (h.ok) {
    // di sini TypeScript tahu h punya "data"
    console.log("berhasil, jumlah data:", h.data.length);
  } else {
    console.log("gagal:", h.error);
  }
}

prosesHasil({ ok: true, data: ["a", "b"] });
prosesHasil({ ok: false, error: "timeout" });

// narrowing pakai typeof
function format(nilai: string | number | boolean): string {
  if (typeof nilai === "number") return nilai.toFixed(2);
  if (typeof nilai === "boolean") return nilai ? "ya" : "tidak";
  return nilai.toUpperCase();
}
console.log(format(3.14159), format(true), format("server"));

// discriminated union + exhaustive check
type Bentuk =
  | { jenis: "lingkaran"; r: number }
  | { jenis: "persegi"; sisi: number }
  | { jenis: "segitiga"; alas: number; tinggi: number };

function luas(b: Bentuk): number {
  switch (b.jenis) {
    case "lingkaran":
      return Math.PI * b.r ** 2;
    case "persegi":
      return b.sisi ** 2;
    case "segitiga":
      return (b.alas * b.tinggi) / 2;
    default: {
      const _cek: never = b; // error compile kalau ada jenis yang lupa ditangani
      return _cek;
    }
  }
}

console.log(luas({ jenis: "lingkaran", r: 2 }).toFixed(2));
console.log(luas({ jenis: "segitiga", alas: 4, tinggi: 3 }));
