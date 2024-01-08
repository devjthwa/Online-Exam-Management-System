import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.mongodb.MongoClient;
import com.mongodb.client.MongoDatabase;

@WebServlet("/ManageSubject")
public class ManageSubject extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String collectionName = request.getParameter("collectionName");
        String collectionCode = request.getParameter("collectionCode");
        response.setContentType("text/html");
        try {
            // Connect to MongoDB
            MongoClient mongoClient = new MongoClient("localhost", 27017);
            MongoDatabase database = mongoClient.getDatabase("Subjects"); // Replace with your database name

            // Create a new collection
            database.createCollection(collectionName
            		+"("+collectionCode+")"
            		);

            mongoClient.close(); // Close the MongoDB client when done
            response.sendRedirect("./Admin jsp/subject_list.jsp");
        } catch (Exception ex) {
            response.getWriter().write("Failed to create collection: " + ex.getMessage());
        }
    }
    
    // remove subject
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String collectionName = request.getParameter("collectionName");
//        String collectionCode = request.getParameter("collectionCode");
        response.setContentType("text/html");
        try {
            // Connect to MongoDB
            MongoClient mongoClient = new MongoClient("localhost", 27017);
            MongoDatabase database = mongoClient.getDatabase("Subjects"); // Replace with your database name

            // Remove the specified collection
            database.getCollection(collectionName).drop();

            mongoClient.close(); // Close the MongoDB client when done
            response.sendRedirect("./Admin jsp/subject_list.jsp");
        } catch (Exception ex) {
            response.getWriter().write("Failed to remove collection: " + ex.getMessage());
        }
    }
}
