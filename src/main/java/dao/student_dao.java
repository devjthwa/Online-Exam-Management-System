package dao;



import java.util.ArrayList;
import java.util.List;

import org.bson.Document;

import com.mongodb.MongoClient;
import com.mongodb.MongoClientURI;
import com.mongodb.client.FindIterable;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;
import com.mongodb.client.model.Filters;
import com.mongodb.client.result.DeleteResult;

public class student_dao {
	
	private String database_url = "mongodb://localhost:27017";
	private String database_name = "online_exam";
	
	public boolean checkStudent(String prn,String password) {
		try (MongoClient mongoClient = new MongoClient(new MongoClientURI(database_url))) {
            MongoDatabase database = mongoClient.getDatabase(database_name); // Replace with your database name
            MongoCollection<Document> usersCollection = database.getCollection("students"); // Replace with your collection name

            Document user = usersCollection.find(Filters.eq("prn", prn)).first();

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
	

	
	public boolean delete_student(String prn) {
		try (MongoClient mongoClient = new MongoClient(new MongoClientURI(database_url))) {
        MongoDatabase database = mongoClient.getDatabase(database_name);
        MongoCollection<Document> collection = database.getCollection("students");

        Document query = new Document("prn", prn);
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
	
	 public List<Document> getStudentsByBatch(String department) {
	        List<Document> studentList = new ArrayList<>();
	        
	        try (MongoClient mongoClient = new MongoClient(new MongoClientURI(database_url))) {
	            MongoDatabase database = mongoClient.getDatabase(database_name);
	            MongoCollection<Document> collection = database.getCollection("students");

	            Document query = new Document("department", department);
	            FindIterable<Document> studentDocuments = collection.find(query);
	            
	            studentList.clear(); // Clear the list before populating
	            studentDocuments.into(studentList);

	        } catch (Exception e) {
	            e.printStackTrace();
	        }

	        return studentList;
	    }
	 

	 }


