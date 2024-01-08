

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.student_dao;

/**
 * Servlet implementation class RemoveStudent
 */
public class RemoveStudent extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RemoveStudent() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 String prn = request.getParameter("prn");

	        student_dao dao = new student_dao();
	        HttpSession session = request.getSession();
	        if (dao.delete_student(prn)) {
	            session.setAttribute("delete", "deleted");
	        } else {
	            session.setAttribute("no_delete", "no_delete");
	        }

	        response.sendRedirect("./Faculty jsp/student_list.jsp");
	    }
	}