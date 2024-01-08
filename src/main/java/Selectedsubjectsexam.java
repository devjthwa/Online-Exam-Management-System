

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
 * Servlet implementation class Selectedsubjectsexam
 */
public class Selectedsubjectsexam extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String SubjecttoShow = request.getParameter("SubjectName");
		String Timer = request.getParameter("timer");
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		
		try {
			MongoClient mongoClient = new MongoClient("localhost", 27017);
            MongoDatabase database = mongoClient.getDatabase("online_exam");
            MongoCollection<Document> collection = database.getCollection("selectedSubject");
            
            Document subjectforexam = new Document("SubjectName", SubjecttoShow)
                    .append("timer", Timer);
            
            collection.insertOne(subjectforexam);
            response.sendRedirect("./Admin jsp/selectedsubjects.jsp");

            mongoClient.close();
		} catch (Exception e) {
			out.println("<font color='red'>Failed to add subject in a list</font>");
			// TODO: handle exception
		}
	}

}
