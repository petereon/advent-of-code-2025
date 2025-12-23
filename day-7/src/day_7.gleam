import gleam/dict.{type Dict}
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
  let width = string.length(head)

  // Part 1: Count splits
  let #(_, final_count_splits) = pass_laser(laser_position, rows, 0)
  io.println("Part 1: " <> int.to_string(final_count_splits))

  // Part 2: Count timelines
  let initial_timelines =
    list.fold(laser_position, dict.new(), fn(acc, pos) {
      dict.insert(acc, pos, 1)
    })
  let total_timelines = pass_laser_part2(initial_timelines, rows, width)
  io.println("Part 2: " <> int.to_string(total_timelines))

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
          |> list.filter(fn(num) { num >= 0 && num < 141 })
          |> list.unique,
        rest_rows,
        count_splits,
      )
    }
  }
}

fn pass_laser_part2(
  timelines: Dict(Int, Int),
  rows: List(List(Int)),
  width: Int,
) -> Int {
  case rows {
    [] -> dict.fold(timelines, 0, fn(acc, _pos, count) { acc + count })
    [current_row, ..rest_rows] -> {
      let new_timelines =
        dict.fold(timelines, dict.new(), fn(acc, pos, count) {
          case list.contains(current_row, pos) {
            True -> {
              acc
              |> add_timelines(pos - 1, count)
              |> add_timelines(pos + 1, count)
            }
            False -> add_timelines(acc, pos, count)
          }
        })

      let filtered =
        dict.filter(new_timelines, fn(pos, _count) { pos >= 0 && pos < width })

      pass_laser_part2(filtered, rest_rows, width)
    }
  }
}

fn add_timelines(d: Dict(Int, Int), pos: Int, count: Int) -> Dict(Int, Int) {
  case dict.get(d, pos) {
    Ok(existing) -> dict.insert(d, pos, existing + count)
    Error(_) -> dict.insert(d, pos, count)
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
  |> list.filter(fn(row) { list.contains(string.to_graphemes(row), "^") })
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
