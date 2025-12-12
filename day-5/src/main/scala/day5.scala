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
