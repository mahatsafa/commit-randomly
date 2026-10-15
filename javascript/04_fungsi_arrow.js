// Belajar JavaScript: function declaration vs arrow function

function luasPersegi(sisi) {
  return sisi * sisi;
}

const luasLingkaran = (r) => Math.PI * r ** 2;

const sapa = (nama = "teman") => `Halo, ${nama}!`;

console.log(luasPersegi(4));
console.log(luasLingkaran(7).toFixed(2));
console.log(sapa(), sapa("Gusto"));

// higher-order function: fungsi yang menerima / mengembalikan fungsi
const pengali = (x) => (y) => x * y;
const kaliTiga = pengali(3);
console.log(kaliTiga(5)); // 15

// rest parameter
const maks = (...angka) => Math.max(...angka);
console.log(maks(3, 9, 2));
