import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;
import com.mongodb.client.model.IndexOptions;

import org.bson.Document;

@WebServlet("/GetAnswers")
public class GetAnswers extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");

        // Get the student's answers from the request
        int questionNumber = 1; // Start with the first question number
        HttpSession session = request.getSession();
        String studentPRN = (String)session.getAttribute("prn");
        String subjectName = (String)session.getAttribute("subjectname");
        

     // ...

        try {
            com.mongodb.MongoClient mongoClient = new com.mongodb.MongoClient("localhost", 27017);
            MongoDatabase database = mongoClient.getDatabase("Answers_Collection");
            MongoCollection<Document> collection = database.getCollection(subjectName + "_answers");

            // Create a unique index on the "PRN" field
            collection.createIndex(new Document("PRN", 1), new IndexOptions().unique(true));

            // Create a document to represent the student's answers
            Document answersDoc = new Document();

            while (true) {
                String question = request.getParameter("question" + questionNumber);
                if (question == null) {
                    break; // No more questions
                }

                String answer = request.getParameter("answer" + questionNumber);

                // Add the answer to the document
                answersDoc.append("PRN", studentPRN);
                answersDoc.append("answer" + questionNumber, answer);

                questionNumber++;
            }

            // Insert the answers document into the collection
            collection.insertOne(answersDoc);

            mongoClient.close();
        } catch (com.mongodb.DuplicateKeyException dupEx) {
            // Handle duplicate PRN here, for example:
            // Display an error message to the student, redirect, or perform other actions
            response.sendRedirect("duplicate_prn_error.jsp");
        } catch (Exception ex) {
            ex.printStackTrace();
        }

        // ...


        // Redirect the student to a confirmation page or any other page as needed
        response.sendRedirect("conformation.jsp");
    }
}
