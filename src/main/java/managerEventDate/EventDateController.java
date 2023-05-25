package managerEventDate;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("*.mae")
public class EventDateController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		EventDateInterface command = null;
		String viewPage = "WEB-INF/managerEventDate";
		
		String uri = request.getRequestURI();
		String com = uri.substring(uri.lastIndexOf("/"),uri.lastIndexOf("."));
		
		if(com.equals("/EventDateInput")) {
			command = new EventDateInputCommand();
			command.execute(request, response);
			viewPage += "/eventDateInput.jsp";
		}
		else if(com.equals("/EventDateInputOk")) {
			command = new EventDateInputOkCommand();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}
}
