package test.skenny.sql.servlet;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import test.skenny.sql.util.SelectUtil;

/**
 * Servlet implementation class Get_Union
 */
@WebServlet("/Get_Union")
public class Get_Union extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Get_Union() {
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

		String sql = "SELECT name, surname, TO_CHAR(dob) FROM users WHERE id = " + id + " UNION SELECT address_1, address_2, address_3 FROM address WHERE id = " + id;
		//String sql = "SELECT * FROM users, address WHERE users.id = " + id + " AND users.id = address.id";

		Boolean showErrors = true;
		Boolean allResults = true;
		Boolean showOutput = true;

		SelectUtil.executeQuery(sql, application, request, response, showErrors, allResults, showOutput);
	}

}