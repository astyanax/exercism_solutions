import gleam/int
import gleam/list
import gleam/order.{ type Order }
import gleam/string

/// implement missing https://hexdocs.pm/gleam_stdlib/gleam/order.html#lazy_break_tie
fn lazy_break_tie(
  in order: Order,
  with comparison: fn() -> Order,
) -> Order {
  case order {
    order.Eq -> comparison()
    _ -> order
  }
}

pub type Student {
  Student(name: String, grade: Int)
}

pub type School {
  School(students: List(Student))
}

pub fn create() -> School {
  School(list.new())
}

pub fn roster(school: School) -> List(String) {
  school.students
  |> list.sort(fn (a, b) {
    int.compare(a.grade, b.grade)
    |> lazy_break_tie(fn() { string.compare(a.name, b.name) })
  })
  |> list.map(fn (a) { a.name })
}

pub fn add(
  to school: School,
  student student: String,
  grade grade: Int,
) -> Result(School, Nil) {
  case list.find(school.students, fn (s) { s.name == student }) {
    Ok(_) -> Error(Nil)
    Error(_) -> Ok(School([Student(student, grade), ..school.students]))
  }
}

pub fn grade(school: School, desired_grade: Int) -> List(String) {
  school.students
  |> list.filter(fn (s) { s.grade == desired_grade })
  |> list.map(fn (s) { s.name })
  |> list.sort(string.compare)
}
