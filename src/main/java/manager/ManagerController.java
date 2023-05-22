package manager;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("*.ma")
public class ManagerController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ManagerInterface command = null;
		String viewPage = "WEB-INF/manager";
		
		String uri = request.getRequestURI();
		String com = uri.substring(uri.lastIndexOf("/"),uri.lastIndexOf("."));
		
		if(com.equals("/ManagerMain")) {
			viewPage += "/managerMain.jsp";
		}
		else if(com.equals("/ManagerEventInput")) {
			viewPage += "/managerEventInput.jsp";
		}
		else if(com.equals("/ManagerEventInputOk")) {
			command = new ManagerEventInputOkCommand();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}
}
