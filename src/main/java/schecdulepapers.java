

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

/**
 * Servlet implementation class schecdulepapers
 */
public class schecdulepapers extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public schecdulepapers() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String subjectname = request.getParameter("subjectname");
		String opentime = request.getParameter("opentime");
		String closetime = request.getParameter("closetime");
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
	
		try (MongoClient mongoClient = new MongoClient("localhost", 27017)) {
	            MongoDatabase database = mongoClient.getDatabase("online_exam"); // Replace with your database name
	            MongoCollection<Document> collection = database.getCollection("schedulePaperTime"); // Replace with your collection name
	            
	            
	            // Create a new student document
	            Document newtime = new Document("subjectname", subjectname)
	                    .append("opentime", opentime)
	                    .append("closetime", closetime);

	            // Insert the new student document into the collection
	            collection.insertOne(newtime);
	            // Add more fields to the document
	            
	            out.println("<h1>Hello System will be run between");
	            out.print(opentime +"  "+ closetime + "</h1>");
	            out.print("<br>");
	            out.print("try later in scheduled time");
	            out.print("<br>");
	            out.print("Current time is :");
	            
	            out.flush();
	            //response.sendRedirect("CheckAccess"); // Redirect back to the display page
	        } catch (Exception e) {
				System.out.println(e);
			}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
