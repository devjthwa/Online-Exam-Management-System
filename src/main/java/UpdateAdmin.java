import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.mongodb.MongoClient;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;
import org.bson.Document;
import org.bson.types.ObjectId; // Import ObjectId class for handling _id

@SuppressWarnings("serial")
@WebServlet("/UpdateAdmin")
public class UpdateAdmin extends HttpServlet {
    MongoClient mongoClient;
    MongoDatabase database;
    MongoCollection<Document> collection;

    @Override
    public void init() throws ServletException {
        super.init();
        // Initialize MongoDB client, database, and collection
        mongoClient = new MongoClient("localhost", 27017);
        database = mongoClient.getDatabase("online_exam"); // Replace with your database name
        collection = database.getCollection("adminlogin"); // Replace with your collection name
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        String adminId = request.getParameter("_id"); // Get the _id parameter

        try {
            // Convert the studentId to ObjectId
            ObjectId objectId = new ObjectId(adminId);

            // Retrieve data from MongoDB using the _id
            Document query = new Document("_id", objectId);
            Document document = collection.find(query).first();

            if (document != null) {
                // Extract data from the document
                String name = document.getString("name");
                String password = document.getString("password");
                String email = document.getString("email");

                // Generate HTML form to display/edit data
                RequestDispatcher dispatcher = request.getRequestDispatcher("./Admin jsp/navbar_admin.jsp");
                dispatcher.include(request, response);
                out.print("<head><link rel='stylesheet' type='text/css' href='./Admin jsp/style.css'><meta charset='UTF-8'></head>");
                out.print("<h2>Update Admin Details </h2>");
                out.print("<div class= 'managesubjects'><form action='UpdateAdmin' method='post'>");
                out.print("<label>Name: </label>");
                out.print("<input type='text' name='name' id='name' value='" + name + "'><br><br>");
                out.print("<label>Password: </label>");
                out.print("<input type='password' name='password' id='password' value='" + password + "'><br><br>");
                out.print("<label>Email: </label>");
                out.print("<input type='email' name='email' id='email' value='" + email + "'><br><br>");
                out.print("<label>Batch: </label>");
                out.println("<input type='hidden' name='adminId' value='" + adminId + "'>"); // Hidden field for _id
                out.println("<button type=\"submit\">Update Details</button>");
                out.println("</form></div>");
            }
        } catch (Exception ex) {
            out.println("<font color='red'>Failed to Record</font>");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        try {
            String facultyId = request.getParameter("adminId"); // Get the _id parameter
            String name = request.getParameter("name");
            String password = request.getParameter("password");
            String email = request.getParameter("email");

            // Convert the studentId to ObjectId
            ObjectId objectId = new ObjectId(facultyId);

            // Create a new Document with updated values
            Document updateDocument = new Document("$set", new Document("name", name)
                    .append("password", password)
                    .append("email", email));

            // Update the document in MongoDB using the _id
            Document query = new Document("_id", objectId);
            collection.updateOne(query, updateDocument);

            response.sendRedirect("./Admin jsp/admin_list.jsp"); // Redirect back to the display page
        } catch (Exception ex) {
            out.println("<font color='red'>Failed to Record</font>");
        }
    }

    @Override
    public void destroy() {
        // Close MongoDB connections when the servlet is destroyed
        if (mongoClient != null) {
            mongoClient.close();
        }
        super.destroy();
    }
}
