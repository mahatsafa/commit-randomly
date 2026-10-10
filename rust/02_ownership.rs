// Belajar Rust: ownership & borrowing (konsep paling khas Rust)

fn panjang(s: &String) -> usize {
    // &String = meminjam, tidak mengambil kepemilikan
    s.len()
}

fn tambah_seru(s: &mut String) {
    // &mut = pinjaman yang boleh mengubah
    s.push_str("!");
}

fn ambil_alih(s: String) {
    println!("sekarang aku pemilik: {s}");
} // s di-drop (dibebaskan) di sini

fn main() {
    let a = String::from("halo");
    let b = a; // kepemilikan pindah dari a ke b
    // println!("{a}"); // error: a sudah tidak valid
    println!("b = {b}");

    let c = b.clone(); // salinan penuh, dua-duanya valid
    println!("b = {b}, c = {c}");

    let mut d = String::from("belajar rust");
    println!("panjang: {}", panjang(&d));
    tambah_seru(&mut d);
    println!("setelah diubah: {d}");

    ambil_alih(d);
    // d tidak bisa dipakai lagi setelah ini

    // tipe sederhana (i32, bool, dll) di-copy, bukan dipindah
    let x = 5;
    let y = x;
    println!("x = {x}, y = {y}");
}
