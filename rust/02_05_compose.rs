pub fn compose<A, B, C>(f: impl Fn(B) -> C, g: impl Fn(A) -> B) -> impl Fn(A) -> C {
    move |x: A| f(g(x))
}

fn main() {
    fn inc_pow() {
        let inc = |x: i32| x + 1;
        let pow = |x: i32| x * x;
        let actual = compose(inc, pow)(2);
        let expected = 5;

        assert_eq!(actual, expected);
    }

    fn pow_inc() {
        let inc = |x: i32| x + 1;
        let pow = |x: i32| x * x;
        let actual = compose(pow, inc)(2);
        let expected = 9;

        assert_eq!(actual, expected);
    }

    inc_pow();
    pow_inc();
}
