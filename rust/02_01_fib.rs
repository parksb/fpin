pub fn fib(n: i32) -> i32 {
    if n < 2 {
        n
    } else {
        fib(n - 1) + fib(n - 2)
    }
}

fn main() {
    let actual = fib(10);
    let expected = 55;

    assert_eq!(actual, expected);
}
