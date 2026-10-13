// Belajar Rust: struct, enum, dan match

#[derive(Debug)]
enum Status {
    Aktif,
    Mati,
    Error(String), // enum bisa membawa data
}

#[derive(Debug)]
struct Layanan {
    nama: String,
    port: u16,
    status: Status,
}

impl Layanan {
    fn baru(nama: &str, port: u16) -> Self {
        Layanan {
            nama: nama.to_string(),
            port,
            status: Status::Mati,
        }
    }

    fn nyalakan(&mut self) {
        self.status = if self.port == 0 {
            Status::Error(String::from("port tidak valid"))
        } else {
            Status::Aktif
        };
    }

    fn laporan(&self) -> String {
        match &self.status {
            Status::Aktif => format!("{} jalan di port {}", self.nama, self.port),
            Status::Mati => format!("{} belum jalan", self.nama),
            Status::Error(pesan) => format!("{} error: {}", self.nama, pesan),
        }
    }
}

fn main() {
    let mut daftar = vec![
        Layanan::baru("nginx", 80),
        Layanan::baru("ssh", 22),
        Layanan::baru("rusak", 0),
    ];

    daftar[0].nyalakan();
    daftar[2].nyalakan();

    for l in &daftar {
        println!("{}", l.laporan());
    }
    println!("{:?}", daftar[1]);
}
