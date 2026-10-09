// Belajar JavaScript: method array yang sering dipakai

const nilai = [78, 92, 65, 88, 54, 100];

const lulus = nilai.filter((n) => n >= 70);
const dikali = nilai.map((n) => n * 1.1);
const total = nilai.reduce((acc, n) => acc + n, 0);
const adaSempurna = nilai.some((n) => n === 100);
const semuaPositif = nilai.every((n) => n > 0);
const pertamaGagal = nilai.find((n) => n < 70);

console.log("lulus:", lulus);
console.log("dikali 1.1:", dikali.map((n) => n.toFixed(1)));
console.log("rata-rata:", (total / nilai.length).toFixed(2));
console.log("ada nilai 100?", adaSempurna);
console.log("semua positif?", semuaPositif);
console.log("gagal pertama:", pertamaGagal);

// sort angka harus pakai pembanding, kalau tidak diurutkan sebagai string
const urut = [...nilai].sort((a, b) => a - b);
console.log("urut:", urut);

// array of object
const siswa = [
  { nama: "Ani", skor: 90 },
  { nama: "Budi", skor: 72 },
  { nama: "Cici", skor: 85 },
];
siswa
  .sort((a, b) => b.skor - a.skor)
  .forEach((s, i) => console.log(`${i + 1}. ${s.nama} (${s.skor})`));
