

import java.io.IOException;
import java.io.PrintWriter;

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
public class AddFaculty extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddFaculty() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		try (MongoClient mongoClient = new MongoClient("localhost", 27017)) {
	            MongoDatabase database = mongoClient.getDatabase("online_exam"); // Replace with your database name
	            MongoCollection<Document> collection = database.getCollection("facultylogin"); // Replace with your collection name
	            
	            collection.createIndex(new Document("email", 1), new IndexOptions().unique(true));

	            String name = request.getParameter("name");
	            String email = request.getParameter("email");
	            String password = request.getParameter("password");
	            String batch = request.getParameter("batch");
	            String department = request.getParameter("department");
	            
	            // Create a new student document
	            Document newFaculty = new Document("name", name)
	                    .append("email", email)
	                    .append("password", password)
	                    .append("batch", batch)
	                    .append("department", department);

	            // Insert the new student document into the collection
	            collection.insertOne(newFaculty);
	            // Add more fields to the document
	            
	            response.sendRedirect("./Admin jsp/faculty_list.jsp"); // Redirect back to the display page
	           // response.sendRedirect("./Faculty jsp/faculty_list.jsp"); // Redirect back to the display page
	        } catch (Exception e) {
				out.print(e);
				out.print("<h1> It is duplication error<h1>");
			}
	}

}
