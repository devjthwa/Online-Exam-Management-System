import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("/SelectSubject")
public class SelectSubject extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String selectedCollection = request.getParameter("selectedCollection");

        if (selectedCollection != null && !selectedCollection.isEmpty()) {
            // Store the selected collection in a session attribute
            request.getSession().setAttribute("selectedCollection", selectedCollection);

            // Redirect to the next page where values can be inserted
            response.sendRedirect("InsertValuesPage.jsp");
        } else {
            // Handle the case where no collection is selected
            response.getWriter().println("Please select a collection.");
        }
    }
}
