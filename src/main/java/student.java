

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.student_dao;








/**
 * Servlet implementation class admin
 */

public class student extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public student() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		String prn = request.getParameter("prn");
		String password = request.getParameter("password");

		
		
		response.setContentType("text/html");
		student_dao dao = new student_dao();
		HttpSession session = request.getSession();
		
		if(dao.checkStudent(prn, password)) {
			RequestDispatcher rd = request.getRequestDispatcher("student_homepage.jsp");
			rd.forward(request, response);
			
		}else {
			session.setAttribute("wrong", "wrerrong");
			response.sendRedirect("Student_login.jsp");
		}
		
		
		
		
	}
	

}
