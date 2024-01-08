

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
public class AddStudent extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddStudent() {
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
	            MongoCollection<Document> collection = database.getCollection("students"); // Replace with your collection name
	            
	            collection.createIndex(new Document("prn", 1), new IndexOptions().unique(true));

	            String name = request.getParameter("name");
	            String prn = request.getParameter("prn");
	            String email = request.getParameter("email");
	            String pwd = request.getParameter("pwd");
	            String batch = request.getParameter("batch");
	            String department = request.getParameter("department");
	            String faculty = request.getParameter("faculty");
	            
	            // Create a new student document
	            Document newStudent = new Document("name", name)
	                    .append("prn", prn)
	                    .append("email", email)
	                    .append("password", pwd)
	                    .append("batch", batch)
	                    .append("department", department)
	                    .append("faculty", faculty);

	            // Insert the new student document into the collection
	            collection.insertOne(newStudent);
	            // Add more fields to the document
	            
	            response.sendRedirect("./Faculty jsp/student_list.jsp"); // Redirect back to the display page
	        }catch (com.mongodb.DuplicateKeyException dupEx) {
	            // Handle duplicate PRN here, for example:
	            // Display an error message to the student, redirect, or perform other actions
	            response.getWriter().println("<p>Not allowed</p>");
	        } catch (Exception e) {
				// TODO: handle exception
	        	out.print("<h1>Ooops ! check prn ! It should not repeated again</h1> <br>");
	        	out.println(e);
	        	System.out.println(e);
			}
	}

}
