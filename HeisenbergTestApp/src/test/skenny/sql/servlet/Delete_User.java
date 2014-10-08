package test.skenny.sql.servlet;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import test.skenny.sql.util.UpdateUtil;

/**
 * Servlet implementation class Delete_User
 */
@WebServlet("/Delete_User")
public class Delete_User extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Delete_User() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		executeRequest(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		executeRequest(request, response);
	}

	private void executeRequest(HttpServletRequest request, HttpServletResponse response) throws IOException {			
		ServletContext application = this.getServletConfig().getServletContext();
		String id = request.getParameter("id");
		String name = request.getParameter("name");

		String sql = "DELETE FROM users WHERE id = " + id  + " OR name = '" + name + "'";

		UpdateUtil.executeUpdate(sql, application, request, response);
	}

}
