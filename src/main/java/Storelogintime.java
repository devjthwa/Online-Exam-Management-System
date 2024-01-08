

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.bson.Document;

import com.mongodb.MongoClient;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;

@WebServlet("/Storelogintime")
public class Storelogintime extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Storelogintime() {
        super();
    }

	@SuppressWarnings("unused")
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String openTimeString = request.getParameter("openTime"); // Set your allowed time here
        String closeTimeString = request.getParameter("closeTime"); // Set your allowed time here
        SimpleDateFormat sdf = new SimpleDateFormat("HH:mm");
        Date openTime, closeTime;
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        // Connect to MongoDB and insert the user input
        try {
        	MongoClient mongoClient = new MongoClient("localhost", 27017);
        	MongoDatabase database = mongoClient.getDatabase("online_exam");
        	MongoCollection<Document> collection = database.getCollection("schedulePaperTime");
        	
        	Document document = new Document("openTime", openTimeString)
        			.append("closeTime", closeTimeString);
        	
        	collection.insertOne(document);
        	out.print("Saved time succesfully. opentime" + openTimeString + "closetime" + closeTimeString);
        	mongoClient.close();
        } catch (Exception e) {
			// TODO: handle exception
        	System.out.println(e);
		}
        response.sendRedirect("./Admin jsp/schedulePaperTime.jsp");
	}

}
