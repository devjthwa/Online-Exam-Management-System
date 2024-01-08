

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
 * Servlet implementation class RemoveTime
 */
public class RemoveTime extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RemoveTime() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String openTime = request.getParameter("openTime");
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		
		try {
			MongoClient mongoClient = new MongoClient("localhost", 27017);
            MongoDatabase database = mongoClient.getDatabase("online_exam");
            MongoCollection<Document> collection = database.getCollection("schedulePaperTime");
            
            Document query = new Document("openTime", openTime);
            collection.deleteOne(query);
            System.out.println("Deleted");
            out.print("truehai");
            
		} catch (Exception e) {
			e.printStackTrace();
		}
		response.sendRedirect("./Admin jsp/schedulePaperTime.jsp");
	}

}
