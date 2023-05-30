package managerEventDate;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import manager.ManagerDAO;
import manager.ManagerVO;

public class EventDateInputCommand implements EventDateInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idx = request.getParameter("idx")== null ? 0 : Integer.parseInt(request.getParameter("idx"));
		
		ManagerDAO dao = new ManagerDAO();
		
		ManagerVO vo = dao.getEventContent(idx);
		
		request.setAttribute("eventName", vo.getEventName());
	}
}
