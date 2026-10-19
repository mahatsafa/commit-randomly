// Belajar Rust: trait (mirip interface) & generic

use std::fmt;

trait Hewan {
    fn nama(&self) -> String;
    fn suara(&self) -> String;

    // method default, boleh tidak di-override
    fn perkenalan(&self) -> String {
        format!("{} bilang {}", self.nama(), self.suara())
    }
}

struct Kucing;
struct Anjing {
    nama: String,
}

impl Hewan for Kucing {
    fn nama(&self) -> String {
        "Kucing".into()
    }
    fn suara(&self) -> String {
        "meong".into()
    }
}

impl Hewan for Anjing {
    fn nama(&self) -> String {
        self.nama.clone()
    }
    fn suara(&self) -> String {
        "guk guk".into()
    }
    fn perkenalan(&self) -> String {
        format!("Aku {}, anjing yang baik. {}!", self.nama, self.suara())
    }
}

// implementasi trait bawaan supaya bisa di-print pakai {}
impl fmt::Display for Anjing {
    fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
        write!(f, "Anjing({})", self.nama)
    }
}

// generic dengan trait bound
fn kenalkan<T: Hewan>(h: &T) {
    println!("{}", h.perkenalan());
}

fn main() {
    let k = Kucing;
    let a = Anjing { nama: "Bruno".into() };
    kenalkan(&k);
    kenalkan(&a);
    println!("display: {a}");

    // trait object: simpan tipe berbeda dalam satu Vec
    let kandang: Vec<Box<dyn Hewan>> = vec![Box::new(Kucing), Box::new(a)];
    for h in &kandang {
        println!("- {}", h.nama());
    }
}
