// Belajar JavaScript: object, destructuring, spread

const server = {
  host: "pc-a",
  os: "Debian 13",
  ram: "1.8GB",
  layanan: ["nginx", "docker", "cron"],
};

// destructuring + rename + nilai default
const { host, os: sistem, cpu = "Celeron" } = server;
console.log(host, sistem, cpu);

// destructuring array
const [pertama, ...sisanya] = server.layanan;
console.log("pertama:", pertama, "| sisanya:", sisanya);

// spread untuk menyalin & menggabung object
const upgrade = { ...server, ram: "8GB", ssd: true };
console.log(upgrade);
console.log("asli tidak berubah:", server.ram);

// loop key-value
for (const [k, v] of Object.entries(server)) {
  console.log(`${k.padEnd(8)}: ${v}`);
}

// optional chaining
console.log(server.jaringan?.ip ?? "ip belum diset");
