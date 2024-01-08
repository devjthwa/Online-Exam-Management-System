

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.bson.Document;

import dao.student_dao;

/**
 * Servlet implementation class StudentList
 */
public class StudentList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StudentList() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String department = request.getParameter("department");
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		out.print("<head><link rel='stylesheet' type='text/css' href='./Admin jsp/styles.css'><meta charset='UTF-8'></head>");
		

		if (department != null && !department.isEmpty()) {
            student_dao dao = new student_dao();
            List<Document> students = dao.getStudentsByBatch(department);

            request.setAttribute("department", department);
            request.setAttribute("students", students);
            request.getRequestDispatcher("./Admin jsp/student_list.jsp").forward(request, response);
        } else {
            response.sendRedirect("./Admin jsp/student_list.jsp"); // Redirect back if no batch is selected
        }
    }

}
