package managerEventDate;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class EventDateInputOkCommand implements EventDateInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String eDate = request.getParameter("eDate") == null ? "" : request.getParameter("eDate");
		String eventName = request.getParameter("eventName") == null ? "" : request.getParameter("eventName");
		
		EventDateDAO dao = new EventDateDAO();
		EventDateVO vo = new EventDateVO();
		
		vo.setEventName(eventName);
		vo.seteDate(eDate);
		
		int res = dao.setEventDateInputOk(vo);
		
		if(res == 1) {
			request.setAttribute("msg", "해당 프로그램에 날짜가 등록되었습니다!");
			request.setAttribute("url", request.getContextPath()+"/ManagerEventList.ma");
		}
		else {
			request.setAttribute("msg", "해당 프로그램에 날짜 등록이 실패했습니다!");
			request.setAttribute("url", request.getContextPath()+"/EventDateInput.mae");
		}
		
	}

}
