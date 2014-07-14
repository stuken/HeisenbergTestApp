package test.skenny.tailer;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

/**
 * Servlet implementation class GetTailContents
 */
@WebServlet("/GetTailContents")
public class GetTailContents extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetTailContents() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ServletContext application = this.getServletConfig().getServletContext();
		ServletOutputStream out = response.getOutputStream();
		Gson gson = new Gson();

		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");

		ArrayList<String> lst = (ArrayList<String>)application.getAttribute("lst");
		if(lst != null) {
			out.print(gson.toJson(lst));
			out.close();
		} else {
			out.print(gson.toJson(new ArrayList<String>()));
			out.close();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ServletContext application = this.getServletConfig().getServletContext();
		boolean clear = Boolean.parseBoolean(request.getParameter("clear"));
		if(clear) {
			ArrayList<String> lst = (ArrayList<String>)application.getAttribute("lst");
			lst.clear();
		}
	}
}
