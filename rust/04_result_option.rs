// Belajar Rust: Option & Result (pengganti null dan exception)

use std::num::ParseIntError;

fn cari_index(daftar: &[&str], target: &str) -> Option<usize> {
    for (i, item) in daftar.iter().enumerate() {
        if *item == target {
            return Some(i);
        }
    }
    None
}

fn jumlahkan(a: &str, b: &str) -> Result<i32, ParseIntError> {
    let x: i32 = a.parse()?; // "?" = kalau error, langsung kembalikan error
    let y: i32 = b.parse()?;
    Ok(x + y)
}

fn main() {
    let bahasa = ["python", "go", "rust"];

    match cari_index(&bahasa, "rust") {
        Some(i) => println!("rust ada di index {i}"),
        None => println!("tidak ketemu"),
    }

    // unwrap_or: nilai cadangan kalau None
    let idx = cari_index(&bahasa, "java").unwrap_or(999);
    println!("java index: {idx}");

    for (a, b) in [("10", "20"), ("7", "x")] {
        match jumlahkan(a, b) {
            Ok(total) => println!("{a} + {b} = {total}"),
            Err(e) => println!("gagal menjumlah {a} + {b}: {e}"),
        }
    }

    // if let: kalau cuma peduli satu kasus
    if let Ok(n) = "42".parse::<u8>() {
        println!("berhasil parse: {n}");
    }
}
