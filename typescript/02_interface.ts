// Belajar TypeScript: interface & type alias

interface Layanan {
  nama: string;
  port: number;
  aktif: boolean;
  deskripsi?: string;          // opsional
  readonly dibuat: Date;       // tidak boleh diubah
}

type Status = "running" | "stopped" | "failed";

interface Container extends Layanan {
  image: string;
  status: Status;
}

const nginx: Layanan = {
  nama: "nginx",
  port: 80,
  aktif: true,
  dibuat: new Date("2026-08-31"),
};

const db: Container = {
  nama: "portfolio-db",
  port: 3306,
  aktif: true,
  image: "mariadb:11",
  status: "running",
  dibuat: new Date(),
};

function ringkas(l: Layanan): string {
  const ket = l.deskripsi ?? "tanpa deskripsi";
  return `${l.nama}:${l.port} [${l.aktif ? "ON" : "OFF"}] - ${ket}`;
}

// fungsi juga bisa didefinisikan lewat interface
interface Validator {
  (port: number): boolean;
}
const portValid: Validator = (p) => p > 0 && p < 65536;

console.log(ringkas(nginx));
console.log(ringkas(db), db.status);
console.log("port 3000 valid?", portValid(3000));
