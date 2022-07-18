import org.apache.spark.sql.SparkSession

object DaySeventeenSparkConnect extends App {
  println(s"Scala version: ${util.Properties.versionString}")

  val spark = SparkSession.builder().appName("test").master("local").getOrCreate()
  println(s"Session started on Spark version ${spark.version}")

  val myRange = spark.range(100).toDF("number")
  val divisibleBy5 = myRange.where("number % 10 = 0")
  divisibleBy5.show(10)

  spark.stop()
}
