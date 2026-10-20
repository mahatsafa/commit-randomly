// Belajar JavaScript: class, getter, static, inheritance

class Perangkat {
  static jumlah = 0;
  #serial; // private field

  constructor(nama, watt) {
    this.nama = nama;
    this.watt = watt;
    this.#serial = Math.random().toString(36).slice(2, 8);
    Perangkat.jumlah++;
  }

  get serial() {
    return this.#serial.toUpperCase();
  }

  biayaListrikBulanan(jamPerHari, tarifPerKwh = 1444) {
    const kwh = (this.watt * jamPerHari * 30) / 1000;
    return Math.round(kwh * tarifPerKwh);
  }

  info() {
    return `${this.nama} (${this.watt}W)`;
  }
}

class Server extends Perangkat {
  constructor(nama, watt, layanan = []) {
    super(nama, watt);
    this.layanan = layanan;
  }

  info() {
    return `${super.info()} menjalankan ${this.layanan.join(", ")}`;
  }
}

const laptop = new Perangkat("Laptop", 45);
const homeServer = new Server("HP Stream", 15, ["nginx", "docker"]);

for (const p of [laptop, homeServer]) {
  console.log(p.info());
  console.log("  serial:", p.serial);
  console.log("  biaya/bulan 24 jam: Rp", p.biayaListrikBulanan(24).toLocaleString("id-ID"));
}
console.log("total perangkat:", Perangkat.jumlah);
