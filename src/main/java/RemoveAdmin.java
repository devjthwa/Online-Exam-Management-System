

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.admin_dao;

/**
 * Servlet implementation class RemoveAdmin
 */
public class RemoveAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RemoveAdmin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			 String email = request.getParameter("email");

		        admin_dao dao = new admin_dao();
		        HttpSession session = request.getSession();
		        if (dao.delete_admin(email)) {
		            session.setAttribute("delete", "deleted");
		        } else {
		            session.setAttribute("no_delete", "no_delete");
		        }

		        response.sendRedirect("./Admin jsp/admin_list.jsp");
		    }

      

}
