package test.skenny.sql.c3p0;

import java.beans.PropertyVetoException;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mchange.v2.c3p0.ComboPooledDataSource;

/**
 * Servlet implementation class CreateConnection
 */
@WebServlet("/CreateC3p0Connection")
public class CreateC3p0Connection extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private String jdbcDriver;
	private String url;
	private String username;
	private String password;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CreateC3p0Connection() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public void init() {
		ServletContext application = this.getServletConfig().getServletContext();
		InputStream propStream = application.getResourceAsStream("conf/JafTestApp.properties");
		Properties prop = new Properties();
		try {
			prop.load(propStream);
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		jdbcDriver = prop.getProperty("c3p0.classname");
		url = prop.getProperty("c3p0.url");
		username = prop.getProperty("c3p0.username");
		password = prop.getProperty("c3p0.password");
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		setupConnectionPool(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		setupConnectionPool(request, response);
	}

	private void setupConnectionPool(HttpServletRequest request, HttpServletResponse response) throws IOException {
		HttpSession session = request.getSession();
		if(request.getParameter("connectionUrl") == null || request.getParameter("username") == null || request.getParameter("password") == null) {
			
		} else {
			url = request.getParameter("connectionUrl");
			username = request.getParameter("username");
			password = request.getParameter("password");
		}

		try {
			ComboPooledDataSource ds = createConnectionPool();

			ServletContext application = this.getServletConfig().getServletContext();
			application.setAttribute("connectionPool", ds);
			session.setAttribute("connectionData", ds.toString());
			response.sendRedirect("sql.jsp");
		} catch (PropertyVetoException e) {
			e.printStackTrace();
			session.setAttribute("error", e.getMessage());
			response.sendRedirect("sql.jsp");
		}
	}

	private ComboPooledDataSource createConnectionPool() throws PropertyVetoException {
		ComboPooledDataSource ds = new ComboPooledDataSource();

		ds.setDriverClass(jdbcDriver);
		ds.setJdbcUrl(url);
		ds.setUser(username);
		ds.setPassword(password);
		ds.setMinPoolSize(5);
		ds.setAcquireIncrement(5);
		ds.setMaxPoolSize(25);

		return ds;
	}
}
