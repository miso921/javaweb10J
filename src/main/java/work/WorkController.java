package work;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("*.wo")
public class WorkController extends HttpServlet {
	@SuppressWarnings("unused")
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		WorkInterface command = null;
		String viewPage = "/WEB-INF/work";
		
		String uri = request.getRequestURI();
		String com = uri.substring(uri.lastIndexOf("/"),uri.lastIndexOf("."));
		
		if(com.equals("/WorkMain")) {
			viewPage += "/workMain.jsp";
		}
		else if(com.equals("/WorkVolun")) {
//			command = new VolunCommand();
			command.execute(request, response);
			viewPage += "/workVolun.jsp";
		}
		else if(com.equals("/WorkActiv")) {
//			command = new ActivCommand();
			command.execute(request, response);
			viewPage += "/workActiv.jsp";
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}
}
