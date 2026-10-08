// Belajar TypeScript: anotasi tipe dasar

let nama: string = "Gusto";
let umur: number = 20;
let aktif: boolean = true;
let hobi: string[] = ["ngoding", "main gitar"];
let koordinat: [number, number] = [-6.9, 107.6]; // tuple

// tipe bisa ditebak otomatis (type inference)
let kota = "Bandung"; // otomatis string

function luas(p: number, l: number): number {
  return p * l;
}

// parameter opsional pakai "?"
function sapa(nama: string, gelar?: string): string {
  return gelar ? `Halo ${gelar} ${nama}` : `Halo ${nama}`;
}

console.log(nama, umur, aktif, hobi, koordinat, kota);
console.log(luas(4, 5), sapa("Gusto"), sapa("Budi", "Pak"));
