// Proyek kecil: kalkulator ekspresi sederhana (tanpa eval)
// Mendukung + - * / dan tanda kurung. Jalankan: node 08_proyek_kalkulator.js "2 * (3 + 4)"

function tokenize(teks) {
  const token = [];
  let i = 0;
  while (i < teks.length) {
    const c = teks[i];
    if (c === " ") {
      i++;
    } else if ("+-*/()".includes(c)) {
      token.push(c);
      i++;
    } else if (/[0-9.]/.test(c)) {
      let angka = "";
      while (i < teks.length && /[0-9.]/.test(teks[i])) angka += teks[i++];
      token.push(parseFloat(angka));
    } else {
      throw new Error(`karakter tidak dikenal: '${c}'`);
    }
  }
  return token;
}

// Recursive descent parser:
//   ekspresi := suku (('+' | '-') suku)*
//   suku     := faktor (('*' | '/') faktor)*
//   faktor   := angka | '(' ekspresi ')' | '-' faktor
function hitung(teks) {
  const token = tokenize(teks);
  let pos = 0;

  const lihat = () => token[pos];
  const ambil = () => token[pos++];

  function faktor() {
    const t = ambil();
    if (typeof t === "number") return t;
    if (t === "-") return -faktor();
    if (t === "(") {
      const nilai = ekspresi();
      if (ambil() !== ")") throw new Error("kurung tutup hilang");
      return nilai;
    }
    throw new Error(`token tidak terduga: ${t}`);
  }

  function suku() {
    let nilai = faktor();
    while (lihat() === "*" || lihat() === "/") {
      const op = ambil();
      const kanan = faktor();
      if (op === "/" && kanan === 0) throw new Error("pembagian dengan nol");
      nilai = op === "*" ? nilai * kanan : nilai / kanan;
    }
    return nilai;
  }

  function ekspresi() {
    let nilai = suku();
    while (lihat() === "+" || lihat() === "-") {
      nilai = ambil() === "+" ? nilai + suku() : nilai - suku();
    }
    return nilai;
  }

  const hasil = ekspresi();
  if (pos < token.length) throw new Error("ekspresi tidak lengkap");
  return hasil;
}

const input = process.argv[2];
const contoh = input ? [input] : ["1 + 2 * 3", "(1 + 2) * 3", "10 / 4 - 1", "-(3 + 2) * 2", "5 / 0"];
for (const e of contoh) {
  try {
    console.log(`${e} = ${hitung(e)}`);
  } catch (err) {
    console.log(`${e} -> error: ${err.message}`);
  }
}
