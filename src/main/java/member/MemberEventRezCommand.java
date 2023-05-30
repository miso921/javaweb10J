package member;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import manager.ManagerDAO;
import manager.ManagerVO;
import memberRez.MemberRezInterface;

public class MemberEventRezCommand implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idx = request.getParameter("idx") == null ? 0 : Integer.parseInt(request.getParameter("idx"));
		
		ManagerDAO dao = new ManagerDAO();
		
		ArrayList<ManagerVO> vos = dao.getEventNameList(idx);
		
		
		request.setAttribute("vos", vos);
	}
}
