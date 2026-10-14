// Belajar TypeScript: generic (tipe sebagai parameter)

function pertama<T>(arr: T[]): T | undefined {
  return arr[0];
}

console.log(pertama([1, 2, 3]));        // number
console.log(pertama(["a", "b"]));       // string

// class generic: antrean (queue) sederhana
class Antrean<T> {
  private isi: T[] = [];

  masuk(item: T): void {
    this.isi.push(item);
  }

  keluar(): T | undefined {
    return this.isi.shift();
  }

  get panjang(): number {
    return this.isi.length;
  }
}

const tugas = new Antrean<string>();
tugas.masuk("backup database");
tugas.masuk("update server");
console.log(tugas.keluar(), "| sisa:", tugas.panjang);

// generic dengan batasan (constraint)
function terpanjang<T extends { length: number }>(a: T, b: T): T {
  return a.length >= b.length ? a : b;
}
console.log(terpanjang("docker", "nginx"));
console.log(terpanjang([1, 2], [1, 2, 3]));
