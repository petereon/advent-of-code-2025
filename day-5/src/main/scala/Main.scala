import scala.io.Source

@main def main(): Unit =
  val lines = Source.fromFile("data/input.txt").getLines()
  val (stringRanges, stringIngredients) = lines.span(_.trim.nonEmpty)
  val ranges = parseRanges(stringRanges)
  val ingredients = parseIngredients(stringIngredients)

  val count = countFreshIngredients(ranges, ingredients)

  print(count)
