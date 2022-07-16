import org.mongodb.scala.model.Filters.equal
import org.mongodb.scala.{Document, MongoClient, MongoDatabase}

import java.lang.Thread.sleep

object DayTwelveMongoDB extends App {

  println("MongoDB")

  val userName = scala.util.Properties.envOrElse("MongoDBUserName", "")
  val pw = scala.util.Properties.envOrElse("MongoDBpw", "")

  val uri: String = s"mongodb+srv://$userName:$pw@cluster0.roca9mo.mongodb.net/?retryWrites=true&w=majority"
  val client: MongoClient = MongoClient(uri)
  val db: MongoDatabase = client.getDatabase("sample_restaurants")

  val collectionName = "restaurants"
  val collection = db.getCollection(collectionName)

  val wilken = collection.find(equal("name", "Wilken'S Fine Food"))
    .subscribe((doc: Document) => println(doc.toJson()),
      (e: Throwable) => println(s"Query error: $e"),
      () => println("Runs after query is complete"))

  val broadway = collection.find(equal("address.street", "Broadway"))
    .subscribe((doc: Document) => println(doc.toJson()),
      (e: Throwable) => println(s"Query error: $e"),
      () => println("Runs after query is complete"))

  sleep(5000)
  client.close()
}
