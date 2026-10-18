// Belajar JavaScript: Promise, async/await

// simulasi request yang butuh waktu
function ambilData(id, delay = 300) {
  return new Promise((resolve, reject) => {
    setTimeout(() => {
      if (id <= 0) reject(new Error(`id ${id} tidak valid`));
      else resolve({ id, judul: `Materi ke-${id}` });
    }, delay);
  });
}

// cara 1: then/catch
ambilData(1)
  .then((data) => console.log("then:", data))
  .catch((err) => console.error("catch:", err.message));

// cara 2: async/await (lebih mudah dibaca)
async function main() {
  try {
    const a = await ambilData(2);
    console.log("await:", a);

    // jalan paralel
    const semua = await Promise.all([ambilData(3), ambilData(4), ambilData(5)]);
    console.log("paralel:", semua.map((d) => d.judul));

    // ambil yang paling cepat selesai
    const tercepat = await Promise.race([ambilData(6, 500), ambilData(7, 100)]);
    console.log("tercepat:", tercepat.id);

    await ambilData(-1);
  } catch (err) {
    console.error("error tertangkap:", err.message);
  }

  // allSettled: tidak berhenti walau ada yang gagal
  const hasil = await Promise.allSettled([ambilData(8), ambilData(0)]);
  hasil.forEach((h) => console.log(h.status));
}

main();
