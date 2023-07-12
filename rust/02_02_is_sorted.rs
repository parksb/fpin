pub fn is_sorted<A, F>(l: &[A], f: F) -> bool
where
    A: Clone,
    F: Fn(A, A) -> bool,
{
    fn iterate<A, F>(n: usize, l: &[A], f: F) -> bool
    where
        A: Clone,
        F: Fn(A, A) -> bool,
    {
        if n >= l.len() - 1 {
            true
        } else if !f(l[n].clone(), l[n + 1].clone()) {
            false
        } else {
            iterate(n + 1, l, f)
        }
    }

    iterate(0, l, f)
}

fn main() {
    fn not_sorted() {
        let actual = is_sorted(&[3, 4, 2, 5, 1], |x, y| x < y);
        let expected = false;

        assert_eq!(actual, expected);
    }

    fn sorted() {
        let actual = is_sorted(&[1, 2, 3, 4, 5], |x, y| x < y);
        let expected = true;

        assert_eq!(actual, expected);
    }

    not_sorted();
    sorted();
}
