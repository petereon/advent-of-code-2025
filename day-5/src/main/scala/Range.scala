class Range(val lower: Long, val upper: Long){
    def contains(num: Long): Boolean = 
        num >= lower && num <= upper

    override def toString(): String = "[%d:%d]".format(lower, upper)

    
}
