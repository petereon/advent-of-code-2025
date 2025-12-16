import gleam/int
import gleam/io
import gleam/list
import gleam/string
import simplifile

pub fn main() -> Nil {
  let assert Ok(contents) = simplifile.read("data/input.txt")
  let assert [head, ..rest] = string.split(contents, "\n")

  let laser_position = get_starting_laser_position(head)
  let rows = preprocess_rows(rest)

  let #(_, final_count_splits) = pass_laser(laser_position, rows, 0)
  io.println(int.to_string(final_count_splits))
  Nil
}

fn pass_laser(
  laser_position: List(Int),
  rows: List(List(Int)),
  count_splits: Int,
) -> #(List(Int), Int) {
  case rows {
    [] -> #(laser_position, count_splits)
    [current_row, ..rest_rows] -> {
      let #(count_splits, laser_position) =
        list.map_fold(laser_position, count_splits, fn(count, ele) {
          case list.contains(current_row, ele) {
            True -> #(count + 1, [ele - 1, ele + 1])
            False -> #(count, [ele])
          }
        })

      pass_laser(
        laser_position
          |> list.flatten
          |> list.filter(fn(num) { num >= 0 && num < 15 })
          |> list.unique,
        rest_rows,
        count_splits,
      )
    }
  }
}

fn get_starting_laser_position(head: String) -> List(Int) {
  head
  |> string.to_graphemes()
  |> list.index_fold([], fn(acc, c, index) {
    case c {
      "S" -> [index, ..acc]
      _ -> acc
    }
  })
}

fn preprocess_rows(rows: List(String)) -> List(List(Int)) {
  rows
  |> list.map(fn(row) {
    row
    |> string.to_graphemes()
    |> list.index_fold([], fn(acc, c, index) {
      case c {
        "^" -> [index, ..acc]
        _ -> acc
      }
    })
  })
}
