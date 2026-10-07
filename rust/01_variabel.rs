// Belajar Rust: variabel immutable & mutable

fn main() {
    let nama = "Gusto"; // immutable secara default
    let mut umur = 20; // pakai "mut" supaya bisa diubah
    umur += 1;

    // shadowing: bikin variabel baru dengan nama yang sama
    let tinggi = "170";
    let tinggi: u32 = tinggi.parse().unwrap();

    const MAKS_RETRY: u8 = 3;
    println!("{nama} umur {umur}, tinggi {tinggi} cm, retry {MAKS_RETRY}");
}
