package managerEventDate;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class EventDateInputCommand implements EventDateInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		ManagerDAO dao = new ManagerDAO();
//		
//		ArrayList<String> eventNames = dao.getEventNameList(); 
//		
//		request.setAttribute("eventNames", eventNames);
		
		String eventName = request.getParameter("eventName")== null ? "" : request.getParameter("eventName");
		
		request.setAttribute("eventName", eventName);
		
		
		
		
	}

}
