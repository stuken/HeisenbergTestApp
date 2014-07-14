package test.skenny.tailer;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.input.Tailer;

/**
 * Servlet implementation class CreateTailer
 */
@WebServlet("/CreateTailer")
public class CreateTailer extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ArrayList<String> lst;
	private Tailer tailer;
	private Thread thread;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CreateTailer() {
		super();
		lst = new ArrayList<String>();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.checkOperation(request);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.checkOperation(request);		
	}

	private void checkOperation(HttpServletRequest request) {
		String operation = request.getParameter("operation");
		if(operation.equals("start")) {
			this.createTailer(request);
		} else if (operation.equals("stop")) {
			this.stopTailer();
		}
	}

	private void createTailer(HttpServletRequest request) {
		ServletContext application = this.getServletConfig().getServletContext();
		application.setAttribute("lst", lst);
		String filePath = (String)request.getParameter("filePath");
		File f = new File(filePath);
		tailer = new Tailer(f, new LogTailListener(lst));		
		thread = new Thread(tailer);
		thread.setDaemon(true);
		thread.start();
	}
	
	private void stopTailer() {
		ServletContext application = this.getServletConfig().getServletContext();
		application.setAttribute("lst", lst);
		tailer.stop();
		thread.stop();
		lst.clear();
	}
}
