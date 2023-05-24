package manager;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ManagerMemeberLevelChangeCommand implements ManagerInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int level = request.getParameter("level") == null ? 1 : Integer.parseInt(request.getParameter("level"));
		int idx = request.getParameter("idx") == null ? 0 : Integer.parseInt(request.getParameter("idx"));
		
		ManagerDAO dao = new ManagerDAO();
		
		String res = dao.setMemberLevelChange(level,idx);
		
		response.getWriter().write(res); // Ajax 요청을 처리할 때 사용하는 방법
	}
}
