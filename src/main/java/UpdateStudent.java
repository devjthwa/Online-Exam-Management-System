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
// Import ObjectId class for handling _id

@SuppressWarnings("serial")
@WebServlet("/UpdateStudent")
public class UpdateStudent extends HttpServlet {
    MongoClient mongoClient;
    MongoDatabase database;
    MongoCollection<Document> collection;

    @Override
    public void init() throws ServletException {
        super.init();
        // Initialize MongoDB client, database, and collection
        mongoClient = new MongoClient("localhost", 27017);
        database = mongoClient.getDatabase("online_exam"); // Replace with your database name
        collection = database.getCollection("students"); // Replace with your collection name
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        String studentprn = request.getParameter("prn"); // Get the _id parameter

        try {

            // Retrieve data from MongoDB using the _id
            Document query = new Document("prn", studentprn);
            Document document = collection.find(query).first();

            if (document != null) {
                // Extract data from the document
                String prn = document.getString("prn");
                String name = document.getString("name");
                String password = document.getString("password");
                String email = document.getString("email");
                String batch = document.getString("batch");
                String department = document.getString("department");

                // Generate HTML form to display/edit data
                RequestDispatcher dispatcher = request.getRequestDispatcher("./Faculty jsp/navbar_faculty.jsp");
                dispatcher.include(request, response);
                out.print("<head><link rel='stylesheet' type='text/css' href='./Faculty jsp/style.css'><meta charset='UTF-8'></head>");
                out.print("<h2>Update Student Details </h2>");
                out.print("<div class= 'managestudents'><form action='UpdateStudent' method='post'>");
                out.print("<label>Name: </label>");
                out.print("<input type='text' name='name' id='name' value='" + name + "'><br><br>");
                out.print("<label>PRN: </label>");
                out.print("<input type='number' name='prn' id='prn' value='" + prn + "'><br><br>");
                out.print("<label>Password: </label>");
                out.print("<input type='password' name='password' id='password' value='" + password + "'><br><br>");
                out.print("<label>Email: </label>");
                out.print("<input type='email' name='email' id='email' value='" + email + "'><br><br>");
                out.print("<label>Batch: </label>");
                out.print("<select name='batch' required>");
                out.print("<option value='" + batch + "'>" + batch + "</option>");
                out.print("<option value='1A'>1A</option>");
                out.print("<option value='1B'>1B</option>");
                out.print("<option value='2A'>2A</option>");
                out.print("<option value='2B'>2B</option>");
                out.print("<option value='3A'>3A</option>");
                out.print("<option value='3B'>3B</option>");
                out.print("</select><br><br>");// Hidden field for _id
                out.print("<label>Deparment: </label>");
                out.print("<select name='department' required>");
                out.print("<option value= '"+ department + "'>" + department + "</option>");
                out.print("<option value='bca'>bca</option>");
                out.print("<option value='maths'>maths</option>");
                out.print("<option value='chemistry'>chemistry</option>");
                out.print("<option value='physics'>physics</option>");
                out.print("<option value='botany'>botany</option>");
                out.print("<option value='environmental_science'>environmental_science</option>");
                out.print("</select><br><br>"); // Hidden field for _id
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
            String name = request.getParameter("name");
            String prn = request.getParameter("prn");
            String password = request.getParameter("password");
            String email = request.getParameter("email");
            String batch = request.getParameter("batch");
            String department = request.getParameter("department");

            // Convert the studentId to ObjectId
            // Create a new Document with updated values
            Document updateDocument = new Document("$set", new Document("name", name)
                    .append("prn", prn)
                    .append("password", password)
                    .append("email", email)
                    .append("batch", batch)
            		.append("department", department));

            // Update the document in MongoDB using the _id
            Document query = new Document("prn", prn);
            collection.updateOne(query, updateDocument);

            response.sendRedirect("./Faculty jsp/student_list.jsp"); // Redirect back to the display page
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
