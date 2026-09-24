// rust notes
fn greet(name: &str) -> String {
    format!("hello {}", name)
}

fn main() {
    println!("{}", greet("practice"));

    let nums = vec![1, 2, 3];
    for n in &nums {
        println!("{}", n * 2);
    }
}

// TODO: try ownership/borrowing deeper next
