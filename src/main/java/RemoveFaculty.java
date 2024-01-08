

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.faculty_dao;

/**
 * Servlet implementation class RemoveStudent
 */
public class RemoveFaculty extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RemoveFaculty() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 String email = request.getParameter("email");

	        faculty_dao dao = new faculty_dao();
	        HttpSession session = request.getSession();
	        if (dao.delete_faculty(email)) {
	            session.setAttribute("delete", "deleted");
	        } else {
	            session.setAttribute("no_delete", "no_delete");
	        }

	        response.sendRedirect("./Admin jsp/faculty_list.jsp");
	        
	    }
	}