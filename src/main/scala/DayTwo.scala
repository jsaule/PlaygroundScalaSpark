object DayTwo {
  def main(args:Array[String]): Unit = {
    println("Temporary views") //Views let us avoid creating data collections in memory when performing multiple operations
    // So this idea of Views is quite common across different data processing languages - we will see it again when we work with Spark

    val numbers = (0 to 12).toArray
    println(numbers.mkString(","))
  }
}
