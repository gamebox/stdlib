import gleam/expect
import gleam/int
import gleam/order

pub fn to_string() {
  123
  |> int.to_string
  |> expect.equal(_, "123")

  -123
  |> int.to_string
  |> expect.equal(_, "-123")

  0123
  |> int.to_string
  |> expect.equal(_, "123")
}

pub fn parse() {
  "123"
  |> int.parse
  |> expect.equal(_, Ok(123))

  "-123"
  |> int.parse
  |> expect.equal(_, Ok(-123))

  "0123"
  |> int.parse
  |> expect.equal(_, Ok(123))

  ""
  |> int.parse
  |> expect.equal(_, Error(Nil))

  "what"
  |> int.parse
  |> expect.equal(_, Error(Nil))

  "1.23"
  |> int.parse
  |> expect.equal(_, Error(Nil))
}

pub fn to_base_string() {
  100
  |> int.to_base_string(_, 16)
  |> expect.equal(_, "64")

  -100
  |> int.to_base_string(_, 16)
  |> expect.equal(_, "-64")
}

pub fn compare_test() {
  int.compare(0, 0)
  |> expect.equal(_, order.Eq)

  int.compare(1, 1)
  |> expect.equal(_, order.Eq)

  int.compare(0, 1)
  |> expect.equal(_, order.Lt)

  int.compare(-2, -1)
  |> expect.equal(_, order.Lt)

  int.compare(2, 1)
  |> expect.equal(_, order.Gt)

  int.compare(-1, -2)
  |> expect.equal(_, order.Gt)
}

pub fn min_test() {
  int.min(0, 0)
  |> expect.equal(_, 0)

  int.min(0, 1)
  |> expect.equal(_, 0)

  int.min(1, 0)
  |> expect.equal(_, 0)

  int.min(-1, 2)
  |> expect.equal(_, -1)

  int.min(2, -2)
  |> expect.equal(_, -2)

  int.min(-1, -1)
  |> expect.equal(_, -1)
}

pub fn max_test() {
  int.max(0, 0)
  |> expect.equal(_, 0)

  int.max(0, 1)
  |> expect.equal(_, 1)

  int.max(1, 0)
  |> expect.equal(_, 1)

  int.max(-1, 2)
  |> expect.equal(_, 2)

  int.max(2, -2)
  |> expect.equal(_, 2)

  int.max(-1, -1)
  |> expect.equal(_, -1)
}

pub fn is_even_test() {
  int.is_even(0)
  |> expect.true

  int.is_even(2)
  |> expect.true

  int.is_even(-2)
  |> expect.true

  int.is_even(10006)
  |> expect.true

  int.is_even(1)
  |> expect.false

  int.is_even(-3)
  |> expect.false

  int.is_even(10005)
  |> expect.false
}

pub fn is_odd_test() {
  int.is_odd(0)
  |> expect.false

  int.is_odd(2)
  |> expect.false

  int.is_odd(-2)
  |> expect.false

  int.is_odd(10006)
  |> expect.false

  int.is_odd(1)
  |> expect.true

  int.is_odd(-3)
  |> expect.true

  int.is_odd(10005)
  |> expect.true
}
