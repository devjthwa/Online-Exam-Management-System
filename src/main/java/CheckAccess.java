import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
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

@SuppressWarnings("serial")
@WebServlet("/CheckAccessServlet")
public class CheckAccess extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get the current time

        // Get the allowed time from your storage system (e.g., database)
        // For simplicity, we assume it's stored as a string in "HH:mm" format
     // Get the allowed time (set to "26-09-2023 10:00" in this example)
        String openTimeString = request.getParameter("openTime"); // Set your allowed time here
        String closeTimeString = request.getParameter("closeTime"); // Set your allowed time here
        SimpleDateFormat sdf = new SimpleDateFormat("HH:mm");
        Date openTime, closeTime;
        
        // Connect to MongoDB and insert the user input
        MongoClient mongoClient = new MongoClient("localhost", 27017);
        MongoDatabase database = mongoClient.getDatabase("online_exam");
        MongoCollection<Document> collection = database.getCollection("schedulePaperTime");

        Document document = new Document("openTime", openTimeString)
                .append("closeTime", closeTimeString);

        collection.insertOne(document);

        mongoClient.close();
        
        //break code from here
        
        try {
            openTime = sdf.parse(openTimeString);
            closeTime = sdf.parse(closeTimeString);
            System.out.println("Hello");
            
         // Get the current date to construct full DateTime objects
            Date currentDate = new Date();
            @SuppressWarnings("deprecation")
			Date currentOpenTime = new Date(currentDate.getYear(), currentDate.getMonth(), currentDate.getDate(), openTime.getHours(), openTime.getMinutes(), 0);
            @SuppressWarnings("deprecation")
			Date currentCloseTime = new Date(currentDate.getYear(), currentDate.getMonth(), currentDate.getDate(), closeTime.getHours(), closeTime.getMinutes(), 0);
            
         // Compare the current time with the specified open and close times
            if (currentDate.after(currentOpenTime) && currentDate.before(currentCloseTime)) {
                // Access is allowed
                System.out.println("Allowed");
                response.sendRedirect("Student_login.jsp");
            } else {
                // Access is not allowed
                System.out.println("Not Allowed");
            }
        } catch (ParseException e) {
            // Handle parsing error (e.g., invalid time format)
            openTime = null;
            closeTime = null;
        }

        // Check if the current time is within the allowed time frame
//        boolean isAccessAllowed = false;
//        if (openTime != null && closeTime != null && currentTime.before(closeTime) && currentTime.after(openTime)) {
//      	isAccessAllowed = true;
//    	System.out.println("Allowed");
//  	response.sendRedirect("Student_login.jsp");
        	
            
//        } else {
//        	System.out.println("Not Allowed");
//		}

        // Send the response (true for access allowed, false for access denied)
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        out.println("<h1>Hello System will be run between");
        out.print(openTimeString+" and "+ closeTimeString+ "</h1>");
        out.print(openTimeString+" and "+ closeTimeString+ "</h1>");
        out.print("<br>");
        out.print("try later in scheduled time");
        out.print("<br>");
        out.print("Current time is :");

        out.flush();
    }
}
