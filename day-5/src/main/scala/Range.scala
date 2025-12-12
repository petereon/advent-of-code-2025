class Range(val lower: Long, val upper: Long){
    def contains(num: Long): Boolean = 
        num >= lower && num <= upper

    def overlaps(other: Range): Boolean =
        !(upper < other.lower || lower > other.upper)

    def join(other: Range): Option[Range] =
        if (overlaps(other)) then 
            Some(new Range(math.min(lower, other.lower), math.max(upper, other.upper)))
        else 
            None

    override def toString(): String = "[%d:%d]".format(lower, upper)
    
}
