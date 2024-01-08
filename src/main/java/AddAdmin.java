

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.bson.Document;

import com.mongodb.MongoClient;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;
import com.mongodb.client.model.IndexOptions;

/**
 * Servlet implementation class AddStudent
 */
public class AddAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddAdmin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 try (MongoClient mongoClient = new MongoClient("localhost", 27017)) {
	            MongoDatabase database = mongoClient.getDatabase("online_exam"); // Replace with your database name
	            MongoCollection<Document> collection = database.getCollection("adminlogin"); // Replace with your collection name
	            
	            collection.createIndex(new Document("email", 1), new IndexOptions().unique(true));

	            String name = request.getParameter("name");
	            String email = request.getParameter("email");
	            String password = request.getParameter("password");
	            
	            // Create a new student document
	            Document newAdmin = new Document("name", name)
	                    .append("email", email)
	                    .append("password", password);
	                    
	            // Insert the new student document into the collection
	            collection.insertOne(newAdmin);
	            // Add more fields to the document
	            
	            response.sendRedirect("./Admin jsp/admin_list.jsp"); // Redirect back to the display page
	        }
	}

}
