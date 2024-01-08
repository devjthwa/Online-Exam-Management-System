package dao;



import org.bson.Document;

import com.mongodb.MongoClient;
import com.mongodb.MongoClientURI;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;
import com.mongodb.client.model.Filters;
import com.mongodb.client.result.DeleteResult;

public class admin_dao {
	
	private String database_url = "mongodb://localhost:27017";
	private String database_name = "online_exam";
	
	public boolean checkAdmin(String useername,String password) {
		try (MongoClient mongoClient = new MongoClient(new MongoClientURI(database_url))) {
            MongoDatabase database = mongoClient.getDatabase(database_name); // Replace with your database name
            MongoCollection<Document> usersCollection = database.getCollection("adminlogin"); // Replace with your collection name

            Document user = usersCollection.find(Filters.eq("email", useername)).first();

            if (user != null && user.getString("password").equals(password)) {
                return true;
            } else {
                return false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
		return false;
	}
	
	public boolean delete_admin(String email) {
		try (MongoClient mongoClient = new MongoClient(new MongoClientURI(database_url))) {
        MongoDatabase database = mongoClient.getDatabase(database_name);
        MongoCollection<Document> collection = database.getCollection("adminlogin");

        Document query = new Document("email", email);
        collection.deleteOne(query);
        DeleteResult result = collection.deleteOne(query);

        // Close the connection
        mongoClient.close();
        if (result.getDeletedCount() > 0) {
            return true;
        } else {
            return false;
        }
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return false;
	}
	
}


