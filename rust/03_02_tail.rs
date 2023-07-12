#[derive(PartialEq, Debug, Clone)]
enum List<T> {
    Cons(T, Box<List<T>>),
    Nil,
}

use List::{Cons, Nil};

impl<T> List<T>
where
    T: Clone,
{
    pub fn tail(&self) -> List<T> {
        match &self {
            Nil => Nil,
            Cons(_, xs) => (**xs).clone(),
        }
    }
}

fn main() {
    let actual = Cons(1, Box::new(Cons(2, Box::new(Cons(3, Box::new(Nil)))))).tail();
    let expected = Cons(2, Box::new(Cons(3, Box::new(Nil))));

    assert_eq!(actual, expected);
}
