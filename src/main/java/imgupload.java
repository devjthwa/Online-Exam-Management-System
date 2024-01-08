import java.io.IOException;
import java.util.Base64;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("/imgupload")
public class imgupload extends HttpServlet {
    @SuppressWarnings("unused")
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Retrieve the image data from the request
        String imageData = request.getParameter("imageData");

        // Convert base64 data to binary
        byte[] imageBytes = Base64.getDecoder().decode(imageData);

        // Store the image in MongoDB
        //MongoDBUtil util =  MongoDBUtil.saveImageToMongoDB(imageBytes, "images");

        // You may want to store additional metadata in the database, e.g., user ID, timestamp, etc.
    }
}


