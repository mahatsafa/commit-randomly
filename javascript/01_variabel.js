// Belajar JavaScript: let, const, dan tipe data

const nama = "Gusto";      // tidak bisa diganti
let umur = 20;             // bisa diganti
umur += 1;

console.log(typeof nama, typeof umur, typeof true, typeof null, typeof undefined);
console.log(`${nama} sekarang umur ${umur}`);

// == vs ===
console.log("5" == 5);   // true  (dikonversi dulu)
console.log("5" === 5);  // false (tipe harus sama)
