import scala.io.Source
import scala.util.chaining.*

@main def main(): Unit =
  val lines = Source.fromFile("data/input.txt").getLines()
  val (stringRanges, stringIngredients) = lines.span(_.trim.nonEmpty)
  val ranges = stringRanges.pipe(parseRanges).pipe(mergeRanges)

  val uniqueFreshIdCount = countUniqueFreshIds(ranges)

  println(uniqueFreshIdCount)
