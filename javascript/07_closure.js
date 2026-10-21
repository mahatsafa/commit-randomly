// Belajar JavaScript: closure (fungsi yang "ingat" variabel luarnya)

function buatPenghitung(mulai = 0) {
  let hitung = mulai;
  return {
    tambah: () => ++hitung,
    kurang: () => --hitung,
    nilai: () => hitung,
  };
}

const c1 = buatPenghitung();
const c2 = buatPenghitung(10);
c1.tambah();
c1.tambah();
c2.kurang();
console.log("c1:", c1.nilai(), "| c2:", c2.nilai()); // tiap closure punya state sendiri

// contoh praktis: fungsi yang cuma boleh jalan sekali
const sekali = (fn) => {
  let sudah = false;
  return (...args) => (sudah ? undefined : ((sudah = true), fn(...args)));
};
const init = sekali(() => "inisialisasi!");
console.log(init(), init());
