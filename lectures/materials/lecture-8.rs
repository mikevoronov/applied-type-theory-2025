fn change(s: &mut String) {
    s.push('1');
}

fn multiple_shared_ownership_test() {
    let s = String::from("");
    let r1 = &s;
    let r2 = &s;
    let r3 = &s;
    let r4 = &s;
}

fn multiple_exclusive_ownership_test() {
    let mut s = String::from("");
    let mut r1 = &mut s;
    // Non-lexical lifetimes
    change(r1);
    let mut r2 = &mut s;
}

fn multiple_shared_exclusive_ownership_test() {
    let mut s = String::from("");
    let mut r1 = &mut s;
    change(r1);
    let r2 = &s;
}

// средство борьбы с висячими указателями
// с помощью расширения типов дополнительнными аннотациями
mod lifetimes {
    /*
    fn nonstatic_lifetime<'a>() -> &'a str {
        let s = String::from("managed string");
        &s
    }
    */

    fn static_lifetime() -> &'static str {
        let s: &'static str = "static string";
        print!("{}", s);

        s
    }

    fn print(s: &str) {
        println!("{}", s);
    }

    fn longest_lifetime<'a, 'b: 'a>(x: &'a str, y: &'b str) -> &'b str {
        y
    }
    
    fn use_vector(v: Vec<i32>) {

    }

    fn foo<'a, 'b>() {
        let s = static_lifetime();
        print(s);

        let s = longest_lifetime::<'a, 'static>(s, s);

        let v = vec![1];
        let x = &v[0];
        let v2 = v;
        use_vector(v2);
        //println!("{}", x);

    }
}

// Send - тип можно отправить в другой поток
// Sync - тип можно использовать для потоковой синхронизации

// interior mutability
// паттерн, который позволяет изменять данные через иммутабельную ссылку
// Cell<T>:
//   - работает только с Copy типами
//   - не потокобезопасен (не реализует Sync)
//   - нулевой оверхэд во время выполнения
//
// RefCell<T>:
//   - T не обязательно реализует Copy
//   - правила заимствования (borrow check) проверяются во время выполнения программы
//   - не потокобезопасен
mod interior_mutability {
    use std::cell::Cell;
    use std::cell::RefCell;

    fn basic_cell_example() {
        let mut x = Cell::new(1);

        let mut s1 = &mut x;

        let t = x.get();
        x.set(100);
        let t = x.get();
        x.set(100);

        s1.set(200);
    }

    fn basic_refcell_example() {
        let x = RefCell::new(vec![1,2,3]);

        {
            let borrow1 = x.borrow();
            let borrow2 = x.borrow();
        }
        let borrow_mut = x.borrow_mut();
    }
}


fn main() {
    println!("Hello, world!");
}
