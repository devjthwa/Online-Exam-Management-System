import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mongodb.MongoClient;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;
import org.bson.Document;

@WebServlet("/ManageQuestions")
public class ManageQuestions extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        MongoClient mongoClient = null;
        //String subjectName = request.getParameter("subjectName");
        HttpSession session = request.getSession();
        //session.setAttribute("subjectName", subjectName);
        String subjectName = (String)session.getAttribute("subjectname");
        try {
            // Connect to MongoDB
            mongoClient = new MongoClient("localhost", 27017);
            MongoDatabase database = mongoClient.getDatabase("Subjects"); // Replace with your MongoDB database name
            MongoCollection<Document> collection = database.getCollection(subjectName);

            // Extract form data
            String question = request.getParameter("question");
            String optionA = request.getParameter("optionA");
            String optionB = request.getParameter("optionB");
            String optionC = request.getParameter("optionC");
            String optionD = request.getParameter("optionD");
            String correctAnswer = request.getParameter("correctAnswer");

            // Create a new Document for the question
            Document questionDoc = new Document("question", question)
                    .append("optionA", optionA)
                    .append("optionB", optionB)
                    .append("optionC", optionC)
                    .append("optionD", optionD)
                    .append("correctAnswer", correctAnswer);

            collection.insertOne(questionDoc);

            response.sendRedirect("./Faculty jsp/AddQuestions.jsp");
        } catch (Exception ex) {
            out.println("<font color='red'>Failed to add question</font>");
        } finally {
            if (mongoClient != null) {
                mongoClient.close();
            }
        }
    }

protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    response.setContentType("text/html");
    PrintWriter out = response.getWriter();
    MongoClient mongoClient = null;
    HttpSession session = request.getSession();
    String subjectName = (String)session.getAttribute("subjectname");
    try {
        // Connect to MongoDB
        mongoClient = new MongoClient("localhost", 27017);
        MongoDatabase database = mongoClient.getDatabase("Subjects"); 
        String questionToRemove = request.getParameter("question"); 

        // Remove the question from the subject's collection using the "question" key
        MongoCollection<Document> collection = database.getCollection(subjectName);
        Document query = new Document("question",questionToRemove);
        collection.deleteOne(query);
        response.sendRedirect("./Faculty jsp/AddQuestions.jsp");
        out.println("<font color='green'>Question removed successfully</font>");
    } catch (Exception ex) {
        out.println("<font color='red'>Failed to remove question</font>");
    } finally {
        if (mongoClient != null) {
            mongoClient.close(); // Close the MongoDB client when done
        }
    }
}
}
