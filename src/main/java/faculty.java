

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.faculty_dao;








/**
 * Servlet implementation class admin
 */

public class faculty extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public faculty() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		
		/*String temail = "dev@gmail.com";
		String tpwd = "dev@123";*/
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		out.print("<head><link rel='stylesheet' type='text/css' href='./Faculty jsp/styles.css'><meta charset='UTF-8'></head>");
        faculty_dao dao = new faculty_dao();
		HttpSession session = request.getSession();
		
		if(dao.checkFaculty(email, password)) {
			response.sendRedirect("./Faculty jsp/faculty_homepage.jsp");
			
		}else {
			session.setAttribute("wrong", "wrerrong");
			response.sendRedirect("admin_login.jsp");
		}
		
		
		
		
	}
	

}
