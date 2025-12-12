def parseRanges(stringRanges: Iterator[String]): List[Range] = 
    stringRanges.filter(_.nonEmpty).map(parseRange).toList

def parseIngredients(stringIngredients: Iterator[String]): List[Long] = 
    stringIngredients.filter(_.nonEmpty).map(_.trim.toLong).toList

def parseRange(stringRange: String): Range = {
    val parts = stringRange.split("-")
    new Range(parts(0).trim.toLong, parts(1).trim.toLong)
}

def countFreshIngredients(freshRanges: List[Range], ingredients: List[Long]): Int = 
    ingredients.count(ing => freshRanges.exists(_.contains(ing)))


def mergeRanges(ranges: List[Range]): List[Range] =
  if ranges.isEmpty then ranges
  else
    ranges
      .sortBy(_.lower)
      .foldLeft(List.empty[Range]) { (acc, curr) =>
        acc match
          case Nil =>
            List(curr)

          case head :: tail =>
            head.join(curr) match
              case Some(merged) =>
                // replace head with merged
                merged :: tail

              case None =>
                // no overlap — append as new range
                curr :: acc
      }
      .reverse


def countUniqueFreshIds(ranges: List[Range]): Long =
    ranges.map(range => range.upper - range.lower + 1).sum